Received: from [209.85.211.183] (helo=mail-yw0-f183.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MnRjn-0006KK-Sl
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Sep 2009 08:42:07 +0200
Received: by ywh13 with SMTP id 13so5735549ywh.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2009 23:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=qZTzrl0h2FtokyCmsQGQrcLzdW8qRm0PQIZ7NvGP994=;
	b=pSzKyccmICLDDNtls+yoio5iyK5BqL8VrkOjc/o77e+6BuWZUlu0+3HSQaalk8Mtoc
	VXp9aCElg6+7I/CXi1ltTvHCPBUbZCgtuKk2ksf1+73f5hYNvIoadM4Zvn9StJXjTEuw
	jYZybeH+XbhNYVhCn/9WxCe8XRcTwwUHX0+KI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EceejgHxn3UP+EGpk0hvmadGcl+OnsnhGFC2FHh+6bAqyI4WYEhjArcFFkGCNgtrBs
	FBxvUP4FuwVY5vsGmtrB+DiFg1BWJdX1+1GXwIE2fGTi6CV00bABGQimB/gCMcpaXn/7
	+Exq7DwoWnl4y0Ck/yyjnH/CMyOQzQsEZQMOw=
Received: by 10.101.141.12 with SMTP id t12mr7142343ann.14.1252996892167;
	Mon, 14 Sep 2009 23:41:32 -0700 (PDT)
Received: from localhost (adsl-71-146-28-171.dsl.pltn13.sbcglobal.net
	[71.146.28.171])
	by mx.google.com with ESMTPS id d24sm420075and.8.2009.09.14.23.41.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 14 Sep 2009 23:41:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Sep 2009 23:41:16 -0700
Message-Id: <1252996876-782-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1252996876-782-2-git-send-email-raj.khem@gmail.com>
References: <1252996876-782-1-git-send-email-raj.khem@gmail.com>
	<1252996876-782-2-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.211.183
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 3/3] minimal.conf: Set PREFERRED_VERSION of glib to 2.21.4
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
X-List-Received-Date: Tue, 15 Sep 2009 06:42:07 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/minimal.conf |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index ecf6649..4bb2738 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -106,7 +106,8 @@ require conf/distro/include/preferred-e-versions.inc
 require conf/distro/include/preferred-opie-versions-1.2.4.inc
 require conf/distro/include/preferred-xorg-versions-X11R7.4-updates.inc
 require conf/distro/include/preferred-xorg-versions-X11R7.4.inc
-
+PREFERRED_VERSION_glib-2.0-native ?= "2.21.4"
+PREFERRED_VERSION_glib-2.0 ?= "2.21.4"
 #############################################################################
 # CONTENTS
 #############################################################################
-- 
1.6.3.3



