Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O1eKv-0005zh-CE
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 13:31:22 +0200
Received: by mail-ew0-f211.google.com with SMTP id 3so223119ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 04:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=SsqxutBFvrz3txnuxCLQsWOwdzwn12zcmXCuRPlwD7Q=;
	b=eqGl8ua9rRHrA5XcKkBXDPaNXBBO/oWjAnCGaWCy7Gk3iUVD8ZLV1DW3niwPlQpXiC
	hh9JFlne51z68/0lHBZOjkbrriyW0grifL3ejr9VxjSyFTYdeUj11y6vX3b27XaYcVsm
	dtFubNbplKBArzypXF4pOjfMhp8GM+GN1f6io=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RSq4wropUHKAzRTSpnX4o786dhIDeHKJdr2IO3V6Dlf0PQ+hIoXPAJxX7jCfzz2nfQ
	BdlXmh4zFdGoVhzzg+4Zg/oDZAo5L02Z1j/m/g9HtLTcbWXbwq+zK8q+Gd6aFwaWJqvg
	v25ek9iQD+hRIb5akUP4AziKqlUone/6Trm2w=
Received: by 10.103.209.9 with SMTP id l9mr2981958muq.64.1271158076312;
	Tue, 13 Apr 2010 04:27:56 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm22435060muo.2.2010.04.13.04.27.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 13 Apr 2010 04:27:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Apr 2010 13:23:51 +0200
Message-Id: <1271157835-27308-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1271157835-27308-1-git-send-email-Martin.Jansa@gmail.com>
References: <1271157835-27308-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/6] SHR: disable BB_LOCALCOUNT_OVERRIDE as we're using autoincremented SRCPV and AUTOREV in git recipes
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
X-List-Received-Date: Tue, 13 Apr 2010 11:31:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/shr.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
index db15a4d..7edc6af 100644
--- a/conf/distro/shr.conf
+++ b/conf/distro/shr.conf
@@ -15,6 +15,7 @@ TOOLCHAIN_BRAND ?= ""
 
 #LIBC = "glibc"
 
+BB_LOCALCOUNT_OVERRIDE = ""
 require conf/distro/include/preferred-shr-versions.inc
 require conf/distro/include/shr-autorev.inc
 
-- 
1.7.0.4



