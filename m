Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 90DD4770F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:29 +0000 (UTC)
Received: by wimw2 with SMTP id w2so4186232wim.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=MKvJ1FNxSWz9z/xx6vdYl8iYctrdm94BJMFEE3t8WYI=;
	b=dGq9rjuwZ6vRqzIRXW3UoGSXo6jaOTXBKFUSa/Oj5BAGCR25MrVw/N6giKWLsH0Gwv
	hnmXOdijBNko5oBf3OaPbJzdaFcooT3MJaSQ+ZBx9ocpbomBkDduwvwWTdedx8e10Xls
	PrnwFEONcHNMYeFtDIzxxvpQzuY4Ue/wTHWUd28kS2c4dxxZBy+BJGXkRzQFJCE3xgLf
	nQWXbEZiQID2ktgrmAOFDDPQA2Gx7aJwUF5UDJVOBJ0gW1bO6d/4ZP4pKbOkJ84ztpQZ
	6fTu1zH6094UxRQHWREeHnqCrSQasLNneTewekX2uddRWjEbQB+I9Hte+8a8EiIV+/yj
	Dghg==
X-Received: by 10.194.189.49 with SMTP id gf17mr5490423wjc.158.1446680668979; 
	Wed, 04 Nov 2015 15:44:28 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:54 +0100
Message-Id: <1446680640-31722-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 12/18] uthash: add native extend
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
X-List-Received-Date: Wed, 04 Nov 2015 23:44:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fontforge-native will require it

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/uthash/uthash_1.9.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/uthash/uthash_1.9.7.bb b/meta-oe/recipes-support/uthash/uthash_1.9.7.bb
index e5dde1a..82a9f2a 100644
--- a/meta-oe/recipes-support/uthash/uthash_1.9.7.bb
+++ b/meta-oe/recipes-support/uthash/uthash_1.9.7.bb
@@ -12,3 +12,5 @@ do_install () {
     install -dm755 ${D}${includedir}
     install -m 0644 ${S}/src/*.h ${D}${includedir}
 }
+
+BBCLASSEXTEND = "native"
-- 
2.1.0


