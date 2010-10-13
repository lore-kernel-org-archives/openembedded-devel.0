Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tasskjapp@gmail.com>) id 1P60EL-0005ve-2Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 14:14:50 +0200
Received: by ewy1 with SMTP id 1so1562859ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 05:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=qB9ba8LVMAXAqNu/vNM17Oex1NE7Q5y+DpbXgSEDyk4=;
	b=MP1/kcmjutStsRnKKNKtwQQ95/PeOcXS/s/rcd0hrZeNzwfguQof4i5pv0wC7vr+9d
	kwszjlNpXpYA4GQsGVOKTYoHLfp+VxGHyTe4bbY/dN1TPAE5JJ7NDJSJkUQEzot1efcr
	n9Sw+D1rOX6S5wB1VZez6coT/pfnT4RuSXbR8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=u83YRRNSU6ztD9V8djKILasMmv3eVvAOPcwHuTHZSGbYI15AMw3BZa9hizQvCqHtNp
	pKN15LB8JiKT3TWmjjmJ62JJg+lTUR0vj+8m7O+UAxZ3IfPMCQAeU2/5Dr9MDnW6fxh1
	TnE5By77HvRaDljQdd+EDoLc6Oa7k6J7VxCtE=
Received: by 10.14.53.65 with SMTP id f41mr5209361eec.18.1286972062419;
	Wed, 13 Oct 2010 05:14:22 -0700 (PDT)
Received: from [192.168.0.40] (147.84-49-231.nextgentel.com [84.49.231.147])
	by mx.google.com with ESMTPS id q51sm872378eeh.16.2010.10.13.05.14.20
	(version=SSLv3 cipher=RC4-MD5); Wed, 13 Oct 2010 05:14:21 -0700 (PDT)
Message-ID: <4CB5A2D2.4050702@gmail.com>
Date: Wed, 13 Oct 2010 14:15:14 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CB591B3.6080805@gmail.com>
In-Reply-To: <4CB591B3.6080805@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: tasskjapp@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libusb-1.0-0, Required build target 'myrootfs' has no buildable providers.
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
X-List-Received-Date: Wed, 13 Oct 2010 12:14:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/2010 01:02 PM, Tasslehoff Kjappfot wrote:
> I'm compiling myrootfs for the beagleboard, and have IMAGE_INSTALL += 
> "libusb1" in my recipe. This has worked fine until a recent update, 
> but now it fails with the following:
>
> NOTE: Handling BitBake files: | (7156/7156) [100 %]
> Parsing of 7156 .bb files complete (6694 cached, 462 parsed). 7374 
> targets, 305 skipped, 0 masked, 0 errors.
> ERROR: 
> '['/home/tassloe/src/openembedded/pd-recipes/images/myrootfs.bb']' 
> RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 
> 'libusb-1.0-0' but it wasn't found in any PACKAGE or RPROVIDES variables
> ERROR: Required build target 'myrootfs' has no buildable providers.
> Missing or unbuildable dependency chain was: ['myrootfs', 'libusb-1.0-0']
> NOTE: Resolving any missing task queue dependencies
> ERROR: 
> '['/home/tassle/src/openembedded/pd-recipes/images/myrootfs.bb']' 
> RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 
> 'libusb-1.0-0' but it wasn't found in any PACKAGE or RPROVIDES variables
> Unknown Event: <bb.event.NoProvider instance at 0xfaae5ec>
> NOTE: Runtime target 'libusb-1.0-0' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['libusb-1.0-0']
> ERROR: Required build target 'myrootfs' has no buildable providers.
> Missing or unbuildable dependency chain was: ['myrootfs', 'libusb-1.0-0']
>
> I deleted my TMPDIR and then it compiled ok, but when I tried to 
> compile again, I got the same message. Neither myrootfs.bb nor 
> recipes/libusb have been changed since the last time this worked for 
> me, so I suspect something else is causing this.
>
> Any ideas?
>
> - Tasslehoff

To add some info / reply to myself.

koen told me this is because I try to force libs into my rootfs that I 
don't use directly, and removing libusb1 and libqt* from myrootfs.bb 
indeed makes it build. May have worked only be accident before, I'm not 
sure.

But, it makes me wonder if I use SDK's right.

To avoid everyone having to compile our rootfs with OE, I have created 
an SDK. Using this SDK I compile and link an application that needs 
libusb1, and that's why I had to force my rootfs to include it. The same 
for my Qt-application. I compile and link that one outside OE, and add 
libs to IMAGE_INSTALL in myrootfs.bb to make sure it has what it needs.

Is this the wrong way to go about it? If so, how *should* I do it?

Regards,
Tasslehoff







