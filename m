Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P12C5-00074m-Oj
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 21:19:59 +0200
Received: by iwn2 with SMTP id 2so1421850iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 12:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=zZqSgehT4kuCwcYXyYUNvrs5NxDSkCGaxixhlL/isLM=;
	b=Ds7RcMJ1K8WVrjWN/fvsRFFqe43R2n4RR+Q8VAxApEbSU17DcVb0e3hN9qnbHN5HQn
	znhzR55xhwTLbUs3MTF5wWlSbmVBfyQIpTqVLB9Z5J0jJ1O13AAhLZmYYbu1DkXRKSt2
	8Uf76gtv5RRL6gJ8O8mibpKsVVIgvzuOnxTkY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=alsla5QtTMynttYZM73vJwdm3xrS85vA4/hJ1zyv8x5zxS/N311hRyg/XH02f90ZwT
	KIg5+gVBqFo+Ga7a5NssZZnqBTRHUVI5K2zqxsbpqdn4VBx2wDxfBsYc790wu46cgBsp
	OnaZv9oFzS7E/1104XcXD2g9pz/q49Ug9QN7M=
MIME-Version: 1.0
Received: by 10.231.146.136 with SMTP id h8mr2330248ibv.0.1285787982993; Wed,
	29 Sep 2010 12:19:42 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 29 Sep 2010 12:19:42 -0700 (PDT)
In-Reply-To: <20100929174732.GA27217@denix.org>
References: <AANLkTikjs7DrdBxNpo0GpGy-FkbG3MEQe=+aT8if_a_C@mail.gmail.com>
	<AANLkTimxud8X-EdsRC1FrJg8Xpya7S_BM5vKSs3K7Vi5@mail.gmail.com>
	<AANLkTikFQaRG3S8tJDGCFvWpad51Ac9X8f4DgHS-Rrvv@mail.gmail.com>
	<20100929174732.GA27217@denix.org>
Date: Wed, 29 Sep 2010 21:19:42 +0200
Message-ID: <AANLkTimOsS-KsxSGruX+L90w=myGS3XGK0e-mrJKzGvG@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: generate a named kernel in ${DEPLOY_DIR_IMAGE}
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Sep 2010 19:19:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/29 Denys Dmytriyenko <denis@denix.org>:
> On Wed, Sep 29, 2010 at 08:28:37AM +0200, Frans Meulenbroeks wrote:
>> 2010/9/29 Andrea Adami <andrea.adami@gmail.com>:
>> > On Tue, Sep 28, 2010 at 6:54 PM, Frans Meulenbroeks
>> >> As I needed to generate two different kernels for the same machine I
>> >> had some kind of problem (as emailed yesterday).
>> >> For now I've solved it as follows:
>> >>
>> >> I created a 2nd recipe (in an overlay):
>> >> linux-small_2.6.34.bb
>> >> this one essentially only requires linux_2.6.34.bb and sets S to the linux_${PN}
>> >> Then I can just add a dir linux-small and add the small defconfig in it.
>> >>
>> >> That way bitbake linux-small should give me the 2nd kernel.
>> >> And actually it builds the kernel but this one is also packaged in a
>> >> kernel-*.ipk.
>> >> I could have made two different machines, but that seemed somewhat
>> >> overkill, so in the end I decided to modify do_install_append in
>> >> linux.inc.
>>
>> PS: referring to Denys' message about multi-linux.inc: still haven't
>> tested it, but what isslightly nasty about it is that it does not
>> package, so I cannot easily include modules in an image
>> (as my kernels are from the same recipe the modules are compatible,
>> and it helps to be able to say in an image recipe that you want to add
>> kernel-module-xyz)
>
> Frans,
>
> It packages only the main kernel and all the related modules, configured by
> the usual defconfig file. But it doesn't do it for the additional kernels that
> were built using configuration files from configs/ directory...
>
> --

Ah ok, had to spent too much time on another issue today, but it is
still on my todo list to dive into this.

Frans.


