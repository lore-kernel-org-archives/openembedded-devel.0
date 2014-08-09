Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 10CA470A10
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:09:05 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id b13so6876604wgh.30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IlOVPOgmLdnKhGk2DJEPev9MSZl3HRjT7nGAXw/zdPA=;
	b=Knsf+R0EYijjQ5hNqoRB6mqMzBGVF8cy/UGIKuMy2fcDwgIypBza2mO+u2c/2X85pI
	15njfGHaAfcxhl68ZUCAtl3rWUG/3eZYnRXD83uOA1GBiiU1VekzCG3xPE9WcAugbZZW
	FiZXg2HXYhuJcwZTjkuEfMdcFuzLR6O9d8jT6DRrrl/s8oyNOoUZXP1FeWv2fingi2KN
	X5Aq1inUYXuV4prhU6rqtqkZKG8yV4Xqw9cuRg58UzXaitu9qRWSxKDGtyUE7V3ez7De
	6RDToT4fPWzNUvOXfjwcxDlXlwKgOUdrPmHM0UYEFbVr2uWC45GSvfVHfpnSqHnEX5oK
	7N3g==
X-Received: by 10.180.210.172 with SMTP id mv12mr4944822wic.45.1407600546713; 
	Sat, 09 Aug 2014 09:09:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wd7sm25520053wjc.36.2014.08.09.09.09.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:09:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:53 +0200
Message-Id: <1407600537-10857-32-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 32/36] stunnel: add dependency on zlib and tcp-wrappers
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
X-List-Received-Date: Sat, 09 Aug 2014 16:09:06 -0000

* fixes floating dependency:
  stunnel/stunnel/latest lost dependency on  libwrap zlib

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
index 938f043..8671193 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-sta
 SECTION = "net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f41ebed8571077706fee0b860c4d6666"
-DEPENDS = "openssl"
+DEPENDS = "openssl zlib tcp-wrappers"
 
 SRC_URI = "https://www.stunnel.org/downloads/archive/4.x/${BP}.tar.gz"
 
-- 
2.0.4


