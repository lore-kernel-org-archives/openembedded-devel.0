Return-Path: <philip.balister@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5AA786C18F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 18:07:00 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l11so18681473qtp.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 10:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=U043MUTVa427WuS5rJty37GWsJEG0nftR4l39wH3W+E=;
	b=i/AnQSWLrb8+UNBDKtGV5PUHHoORifY5C/0wHoaCpeGLmJvKzGRqcRUgeyh/+seW6F
	D8XeUeFXK3q91C1HjrOM9m4jSp53NHwXFrJCUr/78chCvLYKxpamTRaeKruc9t1bzPtT
	4bnUrHnyr7ikCW8QQytiT/iqukcxiPqU4UsXF1QOk6H6R4WxgSkw6JOn0SvV4uov/aVJ
	+2TYSk6DjTWuS7+KGZ1gY66wtYoCd8Z6uJffBock3f4eTUYfnfXaK3rJMc903pm0PKDZ
	oiBr2OVtHKqTjXou41KMnYPri7nn/GrH2NihhfJQ61cKcugrL4udtEQhb/75VolBOjra
	YEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=U043MUTVa427WuS5rJty37GWsJEG0nftR4l39wH3W+E=;
	b=k96DFs66m8kGvucNUOjW6pNaJ2goTphpxvvwdK45P4ihl0E6v62VE8Vq5lLigaBvHC
	vuMIky7uMj0/mhs/SlCoTs87A7NQA31UliLPX/hsF4OzyltPyeLnwGrP0ugIOmyB55RO
	qfG+8D8SZj/MK688FKcyZtBq4/jCd1zEQvFbdhdJvRJ5jxlESJlKCdm4QKNOxSMjLfBB
	mE1UGWtqXHJgFxNNRAHJQG/AOKVnpfcJof6VwGyrGzBYUmOmlpbPIvdrFyvNRb5Ybw9I
	wxzjfjW9QN0fo59dOm9gyplfOsMZAkHtKpT1TCLrSiWIGDHikD33A5qYvcxEHmsTdDz2
	U57g==
X-Gm-Message-State: AGRZ1gKcehqhCQ3UoPMPB/jX/4yOaEXxIdcF4QiTbyRvE0kJVCLnsJeW
	dYzc+lKE1l/arhvHDnZa78L9pQG3QyA=
X-Google-Smtp-Source: AJdET5fw7Aatr6mha33Mfklw+9wDabxC7JSc1SERgBoqUsh/0PMD8lnSP6lRm86UnhgJhY8ZP/t8jA==
X-Received: by 2002:ac8:2d9d:: with SMTP id p29mr26163830qta.238.1543255620683;
	Mon, 26 Nov 2018 10:07:00 -0800 (PST)
Received: from prague.hsd1.va.comcast.net
	([2601:5c0:c100:b84:c110:9e9e:8241:dfa])
	by smtp.gmail.com with ESMTPSA id l30sm473533qte.44.2018.11.26.10.06.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 26 Nov 2018 10:06:59 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Nov 2018 13:06:53 -0500
Message-Id: <20181126180653.11171-1-philip@balister.org>
X-Mailer: git-send-email 2.13.6
Subject: [meta-python][PATCH] python-tzlocal: Add new recipe.
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
X-List-Received-Date: Mon, 26 Nov 2018 18:07:00 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-python/recipes-devtools/python/python-tzlocal.inc       | 8 ++++++++
 meta-python/recipes-devtools/python/python-tzlocal_1.5.1.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-tzlocal_1.5.1.bb | 2 ++
 3 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-tzlocal.inc
 create mode 100644 meta-python/recipes-devtools/python/python-tzlocal_1.5.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-tzlocal_1.5.1.bb

diff --git a/meta-python/recipes-devtools/python/python-tzlocal.inc b/meta-python/recipes-devtools/python/python-tzlocal.inc
new file mode 100644
index 000000000..42f93e6a5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-tzlocal.inc
@@ -0,0 +1,8 @@
+SUMMARY = "Library to return tzinfo with the local timezone information"
+HOMEPAGE = "https://pypi.org/project/tzlocal/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
+
+SRC_URI[md5sum] = "4553be891efa0812c4adfb0c6e818eec"                            
+SRC_URI[sha256sum] = "4ebeb848845ac898da6519b9b31879cf13b6626f7184c496037b818e238f2c4e" 
+
diff --git a/meta-python/recipes-devtools/python/python-tzlocal_1.5.1.bb b/meta-python/recipes-devtools/python/python-tzlocal_1.5.1.bb
new file mode 100644
index 000000000..b7980dd55
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-tzlocal_1.5.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-tzlocal.inc
diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_1.5.1.bb b/meta-python/recipes-devtools/python/python3-tzlocal_1.5.1.bb
new file mode 100644
index 000000000..813934c81
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_1.5.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-tzlocal.inc
-- 
2.13.6


