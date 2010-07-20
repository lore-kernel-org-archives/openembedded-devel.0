Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1ObK4S-0006vd-BZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 23:09:49 +0200
Received: by bwz10 with SMTP id 10so3477314bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 14:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=8+cfKkqU01+jnQMB02D6WgVyaM9haBslWr6jL5Bp5jQ=;
	b=H8NB1xmzpVOj46Jeewhp1A99aOesboN3VfdfhjuHv3ubGP0ouer6hiRToh+O/EIsE8
	vDOvSMryx9uv0pykX6T213Gn/GqyacHrU/ihI3AKnv8cvwLy5tPNJhHK8iSRjVu46Tcr
	Ts26v64ZV9a0uDK7Zlaj8XOn8lOg+uNoqVG9M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=phUvNhqdMvOJdtiqtVD2d1Sli7jJled0ywVMvGVN+v6BonFMAMd6BXwtQeesnzqtj3
	02o+sq7OujwxFelYVy0MYlms93zTptH8PTmwa4G2+/GUUO6qOS7dQLLxEi/OVARkINhB
	H1skhfSVgGob2GasVAx9QhXsTFGiwV0Xmr6LU=
MIME-Version: 1.0
Received: by 10.204.71.82 with SMTP id g18mr5584650bkj.82.1279660180091; Tue, 
	20 Jul 2010 14:09:40 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 20 Jul 2010 14:09:40 -0700 (PDT)
In-Reply-To: <AANLkTikGUfcnu1X5N104c3LTBZKsZiwPhk-DYw9N8Hn3@mail.gmail.com>
References: <AANLkTikGUfcnu1X5N104c3LTBZKsZiwPhk-DYw9N8Hn3@mail.gmail.com>
Date: Tue, 20 Jul 2010 23:09:40 +0200
Message-ID: <AANLkTimdTgqwJUp6MRiwDwwCcY1WyBoUakJHyElQ5F1r@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Looking for some help on making a recipe -- newbie needing help
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
X-List-Received-Date: Tue, 20 Jul 2010 21:09:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/20 J. L. <vwyodapink@gmail.com>

> First sorry for the basic questions here,
> I am in the process of trying to figure out how to make my own recipe
> for a new version of a program than what exists. I am trying to write
> a recipe for aircrack-ng 1.1, Where I am now is its failing unable to
> find some files. I think this is because i am missing something in my
> recipe. I tried looking at the previous versions and patch files but I
> do not understand how to put whats in the patch file into my new
> recipe so it would build in a similar manner. Is there a way I can
> take what they patched to the original recipe and incorporate it into
> my recipe? Or is there an easy way to read whats in the patch file and
> incorporate it into a new recipe? I have posted both the recipe I
> wrote and the patch from the original recipe. I am not looking to get
> spoon fed but I am at a total loss here and would really like to get a
> grasp on this as there a bunch of existing recipes that I would like
> to update to more current versions, and I am sure once I get through
> one or two of making my own I will get it better. I have read the OE
> manual and also the examples from gumstix. I am running my OE on the
> overo branch if that makes any difference. Thanks for your time and
> any help you can share with me. Hope to be more useful to the cause
> soon. Lastly if any of this didn't make sense let me know so I can try
> and clarify it better for everyone.
>

Basically you can always try to see if the patch applies properly.
If not you need to verify if the patch does not apply because it is already
merged upstream and not needed any more.
If the code hasn't changed much you could create your own patch.
I like to use quilt for that but you can also copy the file to (in your
case) Makefile.sav (or copy the whole tree) then make the change manually
then make a diff (in the top level dir otherwise the patch will not apply).
make sure to use the proper diff options (-urN springs to mind).
The add the patch to the dir for the recipe and add a reference to it in the
recipe.

Btw you might also visit #oe on freenode for advise.

>
> my aircrack-ng recipe:
> DESCRIPTION = "Aircrack-ng is a set of tools for wep key statistical
> cracking"
> HOMEPAGE = "http://www.aircrack-ng.org/"
> SECTION = "console/network"
> LICENSE = "GPLv2"
> DEPENDS = "openssl zlib sqlite3"
> PR = "r0"
> PN = "aircrack-ngtest"
>
> SRC_URI = "http://download.aircrack-ng.org/aircrack-ng-1.1.tar.gz"
>
you can use things like ${PV} in file specifications. See the 0.9.3 recipe.

>
> S = "${WORKDIR}"
>
I don't think this is needed. suggest to try without

> OETMP = ${OVEROTOP}/tmp
>

This OETMP is something that definitely does not belong in a recipe. You do
not even use it.

>
> SBINFILES = "airodump-ng aireplay-ng airmon-ng airtun-ng"
> BINFILES = "aircrack-ng airdecap-ng packetforge-ng ivstools kstats makeivs"
>
> do_install() {
>        install -d ${D}/${sbindir}
>        for i in ${SBINFILES}; do
>                install -m 0755 $i ${D}/${sbindir}
>        done
>
>        install -d ${D}/${bindir}
>        for i in ${BINFILES}; do
>                install -m 0755 $i ${D}/${bindir}
>        done
> }
>
And not sure if the install is needed; please give it a try without it.

Good luck! Frans

>
>
> SRC_URI[md5sum] = "f7a24ed8fad122c4187d06bfd6f998b4"
> SRC_URI[sha256sum] =
> "b136b549b7d2a2751c21793100075ea43b28de9af4c1969508bb95bcc92224ad"
>
>
>
> Here is the patch from the original .9.3  aircrack-ng recipe:
> diff -urN aircrack-ng-0.9.3.orig/Makefile aircrack-ng-0.9.3/Makefile
> --- aircrack-ng-0.9.3.orig/Makefile     2008-02-24 20:22:35.000000000 +0100
> +++ aircrack-ng-0.9.3/Makefile  2009-04-09 07:53:12.000000000 +0200
> @@ -3,7 +3,7 @@
>
>  CC              = gcc
>  CFLAGS          ?= -g -W -Wall -O3
> -OPTFLAGS        = -D_FILE_OFFSET_BITS=64
> +OPTFLAGS        = -D_FILE_OFFSET_BITS=64 $(LDFLAGS)
>
>  iCC             = /opt/intel/cc/9.0/bin/icc
>  iCFLAGS         = -w -mcpu=pentiumpro -march=pentiumpro
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

