Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsN-0000ZO-VA
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:46:51 +0100
Received: by mail-ew0-f224.google.com with SMTP id 24so4866247ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=My7Ep70PcrIpyE0DAnaJRQyRm+qV9IpPGpCbkj894u8=;
	b=PXvMAfzYSNnq1sNcIwmF0QGKhtrEk4qXpmj+HK213bVpsQZiPt7/mMIMorNVFT1f/r
	pSrqBWgqimjtNkoqhssHZJ1rwIZKKVTQItcLa5QtU4Wj4toy5uB2emeCtUBBNKDC2Jwd
	186c7F8e9cTxcJVXSzAHdvL0/W/32/UuKAaMM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=YnkL47MlP80g4BMTWIEtNLB/jWrzCZKLPcIt0iqUxcm4TBepYJGChiHX123VTprYP6
	uIa0n31eXbb8iQznwzrp3hy9PxvI4o438ei58/ZA51W/SZBVnGQ5XL44BYItjpBU/skV
	wabEeAwSrcQVj7xgLKXXDi5n+kaVg0S3tLA3c=
Received: by 10.213.8.28 with SMTP id f28mr6007377ebf.39.1260139511306;
	Sun, 06 Dec 2009 14:45:11 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:11 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:48 +0100
Message-Id: <1260139496-21442-13-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-12-git-send-email-leon@sidebranch.com>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
	<1260139496-21442-7-git-send-email-leon@sidebranch.com>
	<1260139496-21442-8-git-send-email-leon@sidebranch.com>
	<1260139496-21442-9-git-send-email-leon@sidebranch.com>
	<1260139496-21442-10-git-send-email-leon@sidebranch.com>
	<1260139496-21442-11-git-send-email-leon@sidebranch.com>
	<1260139496-21442-12-git-send-email-leon@sidebranch.com>
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] sane-srcrevs.inc: Add PREFERRED_VERSION_linux-libc-headers for nios2.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:46:52 -0000

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 conf/distro/include/sane-srcrevs.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 22fa976..e6a8ad3 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -150,6 +150,7 @@ SRCREV_pn-linux-bfin ?= "3758"
 SRCREV_pn-linux-eten ?= "ab2d414f4f13816af0ec0401b608133ca946624a"
 SRCREV_pn-linux-hackndev-2.6 ?= "1308"
 SRCREV_pn-linux-ixp4xx ?= "1089"
+SRCREV_pn-linux-libs-headers_nios2 = "d01303a1035a39e445007c7522d89ad985c4153c"
 SRCREV_pn-linux-openmoko-2.6.24 ?= "fb42ce6724576fc173faf8abfb04aa2c36d213b7"
 SRCREV_pn-linux-openmoko-2.6.28 ?= "8c65792a5c83c76d662a617a7c4e1ae8104bb6a5"
 SRCREV_pn-linux-openmoko-2.6.31 ?= "4331f6c95fadc37ea89359d6afb915be838790f9"
-- 
1.6.0.4



