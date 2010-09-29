Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P0wQI-0003uN-12
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 15:10:18 +0200
Received: by iwn2 with SMTP id 2so1031230iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 06:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=If6scieJyj3QQvZYa312iEI1a13FrXppdfpXVN+O6A8=;
	b=UwKi/bDeSFUk6jQiH9SDUpxbeDfzdl+kOCWXR9SzYJDD4wq46lf1WRaZVLqIHGVWna
	Ms9BRNZelCUMv4VEHtkJptJUl8fIecV/csPhnkdjEyylBKCMYQivLWEI7LiBYUg2KAQv
	RNP6+k9WiPqadHbVKpNZzFhSROUiSmp1gQCNY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=USqmHbNGfqC9B3JzwxsFkf0dQ6bbkO3lFLLnRTfrOkB8e/68k4S7d3zEDpT+XDpbBE
	KyeU4Rz+yx6Etl1jdkPLenxVn5axumHzXcWe93z0/Uf2rIm031i3/sVrbt+uc4PUSdk8
	tcV1JCzeXbXN2fkM1YN9+dM8aN5hqJmUYnuoo=
MIME-Version: 1.0
Received: by 10.231.183.10 with SMTP id ce10mr1772108ibb.96.1285765802802;
	Wed, 29 Sep 2010 06:10:02 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 29 Sep 2010 06:10:02 -0700 (PDT)
In-Reply-To: <AANLkTimeg=+6VEvgd8k1sJk0KQ6Y+po6qcCZSW8C3A3f@mail.gmail.com>
References: <AANLkTikjs7DrdBxNpo0GpGy-FkbG3MEQe=+aT8if_a_C@mail.gmail.com>
	<AANLkTimxud8X-EdsRC1FrJg8Xpya7S_BM5vKSs3K7Vi5@mail.gmail.com>
	<AANLkTikDLYVEa=X5eHj7kB+9O3Hu=a_Our7iAimyW0-c@mail.gmail.com>
	<AANLkTimeg=+6VEvgd8k1sJk0KQ6Y+po6qcCZSW8C3A3f@mail.gmail.com>
Date: Wed, 29 Sep 2010 15:10:02 +0200
Message-ID: <AANLkTi=v6tbd+iS3cf5xM+Cm0fjtsENLaXpmd8iUC0xz@mail.gmail.com>
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
X-List-Received-Date: Wed, 29 Sep 2010 13:10:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/29 Andrea Adami <andrea.adami@gmail.com>:
> On Wed, Sep 29, 2010 at 8:54 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2010/9/29 Andrea Adami <andrea.adami@gmail.com>:

>> I would have expected you had to add something like:
>> FILESPATHPKG_append = ":linux-${PV}"
>> I had to add this to get access to the linux patches.
>
> No need to extend FILESPATHPKG being we keep the patches in the
> kernel-specific dirs: e.g. /linux-2.6.34 and /linux-kexecboot-2.6.34

Ah ok, I understand. As I am building different versions of the
standard kernel, I am using those patches
I assumed kexecboot also used the same patches as the kernel does.
I expected these would apply to the kexecboot kernel with the same name.

>
>>
>> And this:
>> S = "${WORKDIR}/linux-${PV}"
>> might perhaps better end up in the base recipe (in my case linux_2.6.34.bb)
>
> I misunderstand perhaps: this is in each recipe (e.g.
> linux-kexecboot_2.6.34.bb). Do you mean moving it in
> linux-kexecboot.inc?

No. My recipe is slightly different and does a require linux_${PV} but
as the requiring recipe is named differently ${PN} and hence ${S} is
differently from the required recipe.
I had to define S in my recipe, and I was wondering whether it would
be better to move that line to the base linux_${PN}} recipe
>
>
>> (actually thinking of it the FILESPATHPKG might also be moved into there).
>>
>> Should I prepare a patch for that ?
> Sorry, not sure about the question.
>
The question was whether it would be better to explicitly say
 S = "${WORKDIR}/linux-${PV}"
in linux_${PN}.bb
then S is always automatically ok for everyone who includes it.

not a big change and not very important either.

Frans


