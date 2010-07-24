Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OcmDl-00089C-7f
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 23:25:26 +0200
Received: by pzk2 with SMTP id 2so641484pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 14:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=0iiWl/lTNkdAlMj0CUp7FuwobjHmznZXVdpHYohv474=;
	b=sE7sLxeG+RCiuNVHMWpwIkQ3wBlmsR6vfF4DLeESLMmXQ9f5E15xxLVq7qgi+auKJI
	y0OWhFIddFOK/sZ0xI+0yxA+a9VQ6o0G6Fna5HKFb0YLQLHJ2Nw0k7D9KTWtbudj/gZ0
	5Ns5Z4b7+8vBSH7jnAkiEDhcBAo5AvfRiydDQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=K4g/StChv18QLmLMDDfR2+mg4LYIQk2MNt4T+D9RXTTv2mgeiGViE1rxoYkRrMReg5
	x9jnMj/jl8O94xYrPmWvETDOVrhVGSM9sx/wq/1Ol0UaluCTBEY749Z0B09peyVHdMe+
	QpNqF9/EAptMsp2J/HAD5XMtSUH+KfqWogUfM=
Received: by 10.114.109.1 with SMTP id h1mr8026427wac.203.1280006709699;
	Sat, 24 Jul 2010 14:25:09 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d39sm3152796wam.16.2010.07.24.14.25.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 24 Jul 2010 14:25:08 -0700 (PDT)
Date: Sat, 24 Jul 2010 14:25:02 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100724212502.GA4218@gmail.com>
References: <1279963975-3736-1-git-send-email-raj.khem@gmail.com>
	<i2fjoo$iiu$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i2fjoo$iiu$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] Make multi-machine toolchains to co-exist.
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
X-List-Received-Date: Sat, 24 Jul 2010 21:25:26 -0000
X-Groupsio-MsgNum: 21383
Content-Type: multipart/mixed; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/07/10 22:51), Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 24-07-10 11:32, Khem Raj wrote:
> > Hi
> > 
> > Following three patches are for making multi-machine toolchains co-exist with
> > new cross staging for toolchain.
> > 
> > It changes the toolchain triplet from TARGET_ARCH-VENDOR-OS to TARGET_SUB_ARCH-VENDOR-OS
> > 
> > which means that a toolchain for armv7 is called armv7-oe-linux-gnueabi-*
> > and for armv5te its called armv5te-oe-linux-gnueabi-*
> > 
> > They can coexist in same native sysroot. The symlinks would mean that
> > gcc will not accidently mix the assemblers or linkers.
> > 
> > I have booted a minimal-image on qemuarm successfully. The build for 
> > beagleboard in same sysroot is underway.
> > 
> > Please give it a shot in your environments (especially Koen's env)
> 
> MACHINE=beagleboard bitbake nano ; MACHINE=hawkboard bitbake nano work,
> going to try a bigger build now.

You will need 4th patch which is attached here, for the sdk recipes.

Thanks
-Khem

--9amGYk9869ThD9tj
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-sdk.bbclass-override-BASEPKG_HOST_SYS-as-it-is-used-.patch"

From 0998a5a7305bc92509aee13f0103b05f1965022b Mon Sep 17 00:00:00 2001
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Jul 2010 14:21:42 -0700
Subject: [PATCH] sdk.bbclass: override BASEPKG_HOST_SYS as it is used to make TARGET_SYS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/sdk.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/sdk.bbclass b/classes/sdk.bbclass
index 198d147..049fda1 100644
--- a/classes/sdk.bbclass
+++ b/classes/sdk.bbclass
@@ -15,6 +15,7 @@ PACKAGE_ARCH = "${BUILD_ARCH}-${OLD_PACKAGE_ARCH}-sdk"
 # Also save BASE_PACKAGE_ARCH since HOST_ARCH can influence it
 OLD_BASE_PACKAGE_ARCH := "${BASE_PACKAGE_ARCH}"
 BASE_PACKAGE_ARCH = "${OLD_BASE_PACKAGE_ARCH}"
+BASEPKG_HOST_SYS = "${BUILD_ARCH}-${HOST_OS}"
 
 STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_SYS}-sdk"
 STAGING_DIR_TARGET = "${STAGING_DIR}/${OLD_MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
-- 
1.7.1


--9amGYk9869ThD9tj--
