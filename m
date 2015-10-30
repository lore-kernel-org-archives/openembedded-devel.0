Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7D3D577129
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:14:27 +0000 (UTC)
Received: by wikq8 with SMTP id q8so9670174wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=MKvJ1FNxSWz9z/xx6vdYl8iYctrdm94BJMFEE3t8WYI=;
	b=WfJ6RTPFmnO8Gm5A/87n6B7Vn2DYN9KY3rusQuHRNJ4UOqflqoxpLeBgU+i4/r9Y5H
	WqeR8w81vn5gHAxEe5M4R3bcQgPGO3d+hCnCs8E/72dNuVU3zF/y9InbJ3ACp4A4XrMX
	3pqo7Xqxk6KBKQjZWDMuLrn8BigfPuXr3Wg9Y99pvUVBBeZh1tbMVsRDTAcFawaSuMvf
	SQjsPPEbImHcFLyKH7hzUekcjG2JfN8fMVmFvHCaGl81T3GmVw+/QDmPvnlHOeGBGbos
	Grv01arBX+By4jVo/l6wSU8PK7O3US/B1XR5XpA1AMqF+ZwhuyZAOSLdBGrqEaIr7i3M
	pgUg==
X-Received: by 10.194.90.169 with SMTP id bx9mr9194474wjb.1.1446207266992;
	Fri, 30 Oct 2015 05:14:26 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-185.hsi15.unitymediagroup.de. [95.222.156.185])
	by smtp.googlemail.com with ESMTPSA id
	184sm2636122wmk.10.2015.10.30.05.14.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 05:14:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 13:13:44 +0100
Message-Id: <1446207225-15386-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 12/13] uthash: add native extend
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
X-List-Received-Date: Fri, 30 Oct 2015 12:14:27 -0000
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


