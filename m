Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 186B46FD64
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:04 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id r20so9047441wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OR0xYSH5xXlyoAvfOO6Qjg7Fv2NBtpFzZpuZwvjij0o=;
	b=awILXyw3+ywbnatyw3wheRZwMyR0ueuSmU9QIkGDo6/YqLR8Ccmx1BpOQiawRqChn6
	WTMpGP7On45wdC39QBRSwsBeuzV/cdhB67XiCqW6aL0dMojj1iu2in2tk+K7EdeFniOC
	mThwmMMMKj2R/6NndPltn8JRfiPuag/lewO4Zmnh3pi8CQc+jzdwUm4RgLhLNhZqynyH
	ePB+tD8m9Q6c08ITOB8Yuii8jhWYy36bhYMRXQnF7RsjUFJm4bt7nEhLcIPy/LtQNAuQ
	Z2Hb6qqIV7aXkFTrQzLd0tY9JjkUSjl4R3JsMctqmkTQlUlInLN+KNhdXcfWYihMwcrI
	NrCQ==
X-Received: by 10.180.211.144 with SMTP id nc16mr3004751wic.43.1403172005701; 
	Thu, 19 Jun 2014 03:00:05 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ey16sm31881455wid.14.2014.06.19.03.00.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:38 +0200
Message-Id: <1403171993-26208-10-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 10/25] omgps: Blacklist because it's broken since gcc upgrade to 4.9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jun 2014 10:00:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/omgps/omgps_svn.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-navigation/omgps/omgps_svn.bb b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
index a56a51b..adcc749 100644
--- a/meta-oe/recipes-navigation/omgps/omgps_svn.bb
+++ b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
@@ -9,6 +9,8 @@ PV = "0.1+svnr${SRCPV}"
 PR = "r2"
 S = "${WORKDIR}/${PN}"
 
+PNBLACKLIST[omgps] = "BROKEN: sound.c:61:35: error: 'saveptr' may be used uninitialized in this function [-Werror=maybe-uninitialized]"
+
 do_configure_prepend() {
     sed -i "s#PY_VERSION = 2.6#PY_VERSION = ${PYTHON_BASEVERSION}#g" ${S}/Makefile.am
     sed -i "s#PY_INC_DIR = \$(OPIEDIR)#PY_INC_DIR = ${STAGING_DIR_HOST}#g" ${S}/Makefile.am
-- 
2.0.0


