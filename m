Received: from [209.85.210.185] (helo=mail-yx0-f185.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MmYoy-0008AC-M9
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Sep 2009 22:03:47 +0200
Received: by yxe15 with SMTP id 15so2519689yxe.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Sep 2009 13:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=unM+YTju0MGHJjyKZGK3coW4uy9oy4AYly/tVNvsNoY=;
	b=DqJ1HgS4lejtqvXvAQI27SImBCUCdtqItqIwHA4lwVuT2ipQ1fety0xNtqzOIh1/zQ
	t4EPhs8lZuyPHnjvJlL+DcGQ9CyDUGauf4WmYDPPyLgiZTA29B5TJM877XYMQ/uO9d0F
	L5uMC38R2RVAymDHN/2z0hg/sRuMzBii8F9gU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=gDTzcPz1z/BL3znWyikBSfNy3JYz4DpXJUWrSBM8+cMIK+GIGpLy6p4WCWNwu83z3E
	xUigLCo38lB86BNEkcObqzm7x50Q0oHQ0tr8uQkh/TzFXVDs/gsdzoviqJG0ltSc7UwC
	SFS9UHHuq+iNQ5SNMke1U92FqXoPAyonQWD5M=
Received: by 10.90.220.4 with SMTP id s4mr2633096agg.3.1252785794676;
	Sat, 12 Sep 2009 13:03:14 -0700 (PDT)
Received: from gmail.com (adsl-71-146-28-171.dsl.pltn13.sbcglobal.net
	[71.146.28.171])
	by mx.google.com with ESMTPS id 26sm5982471aga.12.2009.09.12.13.03.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 12 Sep 2009 13:03:14 -0700 (PDT)
Date: Sat, 12 Sep 2009 13:03:08 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090912200308.GA10819@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.185
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] mysterious armv5te-linux dir under staging
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
X-List-Received-Date: Sat, 12 Sep 2009 20:03:47 -0000
X-Groupsio-MsgNum: 13078
Content-Type: multipart/mixed; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

On hrw's suggestion I looked into the mysterious directory armv5te-linux
creation on my omap5912osk build.

This directory is created by staging tasks for cross packages like
gcc-cross, binutils-cross gdb-cross etc. 

This is because in bitbake.conf we set 

BASEPKG_HOST_SYS = "${BASE_PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"

which is ok for target recipes but its not ok for native or cross
recipes.

It works for native because native.bbclass redefines it. I decided
to change it to 


BASEPKG_HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"

HOST_ARCH is defined based on -native -target or -cross package
so it works in all cases. Overriding in native.bbclass would not
be needed but I left it in there

Does anyone sees problem with this little patchlet ?

Thanks

-Khem


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=diff

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index c2f7666..24684e5 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -114,7 +114,7 @@ PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE}
 MULTIMACH_ARCH = "${PACKAGE_ARCH}"
 MULTIMACH_TARGET_SYS = "${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 MULTIMACH_HOST_SYS = "${MULTIMACH_ARCH}${HOST_VENDOR}-${HOST_OS}"
-BASEPKG_HOST_SYS = "${BASE_PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
+BASEPKG_HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
 BASEPKG_TARGET_SYS = "${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 # select proper CPU to get binary locales generated

--pf9I7BMVVzbSWLtt--
