Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1OpSIQ-0001Hn-6z
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:46:38 +0200
Received: by fxm6 with SMTP id 6so2791293fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=hOAE6bZyJEDQyw5GFb0wVWuTDZZ55GIgkOoTAthyLfo=;
	b=Nz70TdzTv/m6c8fVgJQZbrhwZodO43G3YjdHqAy5yI9HWtWQr5Dqw95r3bAWceyQ9z
	YRtt3uMfjRGK7pxttT6/9bsWyKTUsiDCVbB/jHjoKBUC1wwXk3gzQ4cdVWopflftOCOd
	UtsXNFu/BDiycbWpNuzeHl2g5mBwQ2HBSFsN8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=YSA74HV4XrgN75gjrGMF9j6DGZ99ZSLuUNnGxQpCDUdaXHyH0Fmx7TTl6IKmlraHvK
	cddii0AHbA//tX4TLng7IFynegHmrNG5VDtW26ZwfJMgZJ2wI3IFk3c4F47b5Kvs0MRV
	OnBjNF7ljDPQcesBhbwWuhPlABvs3cTCMknOs=
MIME-Version: 1.0
Received: by 10.239.189.72 with SMTP id s8mr116759hbh.46.1283028368231; Sat,
	28 Aug 2010 13:46:08 -0700 (PDT)
Received: by 10.239.152.71 with HTTP; Sat, 28 Aug 2010 13:46:08 -0700 (PDT)
Date: Sat, 28 Aug 2010 22:46:08 +0200
Message-ID: <AANLkTinvhMiZhHC4GrR8Muf-7oPa-j3zBeDWCZrkTd-z@mail.gmail.com>
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
Subject: Simple srctree example seems not depend on toolchain
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
X-List-Received-Date: Sat, 28 Aug 2010 20:46:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

in an attempt to learn how to use srctree I am hitting either 1) an
oversight on my behalf or 2) a bug in srctree.bbclass 3) something
else

my src/ contains a helloworld.c and Makefile

However, when I bitbake build this recipe, bitbake directly tries to
cross-compile it, without building the cross-compiler first.

Don't have all recipes a host build-time dependency on the toolchain?


DESCRIPTION = "Minimal statically compiled Hello world!"
LICENSE = "GPL"
PR = "r1"

inherit srctree

# build in the src/ subdirectory in the recipe directory
S = "${FILE_DIRNAME}/src"

FILES_${PN}-dbg += "${bindir}/.debug"

do_install() {
	export INSTALL_ROOT=${D}
	make install
}


Regards,
-- 
Leon


