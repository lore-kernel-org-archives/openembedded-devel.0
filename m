Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1OpTsP-0001w9-E4
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 00:27:54 +0200
Received: by fxm6 with SMTP id 6so2813769fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 15:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=pbNOhuKueJR9qM/W8DbxFbLga2WwlKxF0nojGcoWCd0=;
	b=aRGYftlx5JTTvdjlr2NIBQfEPxbLJhAsPbJMd8Kz7+wfQ3UWwmb2V13R0GQ9jmCOYw
	UO+LQSH3XTsqyrDKnTndhUdtVcTupUi5OhCOG4iCT7UGfYWjVx0yQ4SE6N6s6JU1cODk
	4g6TZ5mNdavZxOtCsvqoRhwzZYr8uybraCHnU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=EYxss4VS0a5GtvcFwEW0V9kRbsLO32O1mDFCajK+SCI33dKncdREh0WnRpBx+MtKTu
	jVTbvBiORTgJ6/+cmFO4g2AW4v1H9wN6VGIQMMO0ttMrVr7jRbutvcRYUnPaeOiKBHl7
	KQKKR0OOZXnr6J1vGjnrcC/MyxnKMDSB5GD70=
MIME-Version: 1.0
Received: by 10.239.183.212 with SMTP id v20mr146152hbg.25.1283034441164; Sat,
	28 Aug 2010 15:27:21 -0700 (PDT)
Received: by 10.239.152.71 with HTTP; Sat, 28 Aug 2010 15:27:21 -0700 (PDT)
In-Reply-To: <AANLkTinvhMiZhHC4GrR8Muf-7oPa-j3zBeDWCZrkTd-z@mail.gmail.com>
References: <AANLkTinvhMiZhHC4GrR8Muf-7oPa-j3zBeDWCZrkTd-z@mail.gmail.com>
Date: Sun, 29 Aug 2010 00:27:21 +0200
Message-ID: <AANLkTimH2YnW3CnLFxa6NyNCeC0-jNqy0dhDXS_ddWX_@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Simple srctree example seems not depend on toolchain
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
X-List-Received-Date: Sat, 28 Aug 2010 22:27:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Sat, Aug 28, 2010 at 10:46 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> in an attempt to learn how to use srctree I am hitting either 1) an
> oversight on my behalf or 2) a bug in srctree.bbclass 3) something
> else
>
After further debugging I am more sure I'm seeing wrong behaviour from
srctree.bbclass.

If I change "inherit srctree" into "inherit autotools" (just for
testing, there is no real dependency on autotools) the toolchain gets
built first.
Also, if I remote "inherit srctree" the toolchain gets built first.
If I use "inherit srctree" the toolchain does not get built.
As a workaround I tried to add DEPENDS = "helloworld" and was
surprised that this dependency was not effective.

In all faulty cases, bitbake tries to build my recipe right away,
failing on the toolchain not being built yet.

I suspect the dependency mangling in srctree.bbclass to be faulty.

I'll go from here. A minimal test case is online at
http://www.sidebranch.com/openembedded/helloworld2.tar.bz2.
Extract inside openembedded.git/

Copy of the latest test bb below:

Regards,

Leon.


DESCRIPTION = "Minimal statically compiled Hello world!"
LICENSE = "GPL"
PR = "r0"

inherit srctree

# workaround for the facts that srctree seems to ignore
# run-time dependency on the toolchain
DEPENDS = "helloworld"

# build in the src/ subdirectory in the recipe directory
S = "${FILE_DIRNAME}/src"

FILES_${PN}-dbg += "${bindir}/.debug"

do_compile() {
        oe_runmake
}

do_install() {
        export INSTALL_ROOT=${D}
        make install
}





-- 
Leon


