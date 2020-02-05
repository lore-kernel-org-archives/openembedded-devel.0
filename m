Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 44EA060451
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 09:25:07 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z9so1703587wrs.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2020 01:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XGQXERF9xoa9dVD24uaFYEQ75s2GL/6vo6BzU4UlsbU=;
	b=YQsv4esTmoEgHiQtKSVgE0PeP6Gg2B4+X++U6iwru++PfcUB3snU1l6Ckh2Z5DOrQR
	XKj2s3HCUefVexBqa7xYTByZSe9mN23MvQ9KOFSQMzCI2WgAmKzFoTp0q5X8iJUn0K9v
	t+wO2ZUnDTFxcyM+xeXytYpnKiUAYq7WNHt9gLg+NZTi0j/JDcIR7a/l9YwVXN41DRhx
	xCs/8ZAtldifaRLcrdX/hjYxyoEArdmWTwz8lTJIk6J6ak2N0n+kqtg3KLNw9WkUjc0F
	kN0Bl7EA7faL9nH7zRwQt2KuBGbk+cFxATtXed2nJQIy4ehaGvTPhlL3BjWCN7A0K7Aa
	Humg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XGQXERF9xoa9dVD24uaFYEQ75s2GL/6vo6BzU4UlsbU=;
	b=RkY+3+ppi25SabS1yIbui4uqAAn51R6gDIMXKMkwJpB08H1XsdrcRg3H/BeeOtbrhX
	2gjVTOryT7kSdPC3gBXHQ6Jiw1Ga442qj3xh8cSSU0a2ISCU9k2CdV/aBFIC9oLk/7uN
	Cd3oG0yVvXsmEclm06BWtToVQkPXoaoMqWEx6Y3XKrpXx4EPB6lFex42Uy2yIsow1jIw
	RJfn4+qI3VFq/0+MhLgGTHO4JWABKDYwi76+D9ELdp0ydZE7+v90YxkARvq5/rmH3Xdn
	hyr6WqI6h4upHY6JFafWbjVX+t9+gMA3B7WDJND0xbICFPvOUlHcun4dRVkxYlaZF4E4
	+w7w==
X-Gm-Message-State: APjAAAXaRnj1jrAVtoR/CN334P/CMtf9aGZnEDP5ny6CqMudEROxXU16
	MJWHsCdQ7V4UKTcXHBtXOnyR59q2
X-Google-Smtp-Source: APXvYqxD/kozYgH0P92AhLJ5fDr4dMbfLuNnWPsTPYP5A4aAtI6SGGtsiYZokMvAp/392HT+7J86bg==
X-Received: by 2002:a5d:5183:: with SMTP id k3mr26933398wrv.414.1580894707585; 
	Wed, 05 Feb 2020 01:25:07 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local ([195.50.169.54])
	by smtp.gmail.com with ESMTPSA id
	h17sm35081024wrs.18.2020.02.05.01.25.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 01:25:06 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Feb 2020 10:25:00 +0100
Message-Id: <20200205092500.23165-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH][zeus] libldb: upgrade 1.5.5 -> 1.5.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2020 09:25:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Yi Zhao <yi.zhao@windriver.com>

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(cherry picked from commit 2b3fd534874aee125a6c79c70c93b1aa498fda3f)

This is necessary for zeus to fix samba build as reported in [1]

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2020-January/204168.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libldb/{libldb_1.5.5.bb => libldb_1.5.6.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_1.5.5.bb => libldb_1.5.6.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.5.bb b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_1.5.5.bb
rename to meta-networking/recipes-support/libldb/libldb_1.5.6.bb
index b19c964d8..99eb6f9ce 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.5.5.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
@@ -33,8 +33,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "339a41ac9efaec680e6d1469dd9aa35b"
-SRC_URI[sha256sum] = "199f5861aa863f538ec66d5fa95ecc13254a2030c53daf0e47363fa9ba235c68"
+SRC_URI[md5sum] = "fc58ef432c1fcb03fc3bb6cccce08977"
+SRC_URI[sha256sum] = "ff82474d0bf109e415a2d50334bde5715f486a53ff4bb8c7f74459dd229e975b"
 
 inherit waf-samba distro_features_check
 REQUIRED_DISTRO_FEATURES = "pam"
-- 
2.21.0


