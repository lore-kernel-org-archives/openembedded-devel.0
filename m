Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 66B8F6080F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 20:23:38 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id a186so17702567qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 13:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YHYBk7zI/v8ZcBcMffCkmq7l2o1Xfntjh6a6JdqW78Q=;
	b=QvOKlPNe+aBdQrrubu3yvUEmEbSmZarHJeb7/WN+9Ojtf2BDWteTcgxuE2pJ51cp6h
	o6Q1UK02va9k9k9yGrYE6lPChMopFimISM4g633nIn+qSCZCl205w6eNEuySAOrAo6NK
	n+CSDv7WpkLm0nor9ngzDMBGF4D8KAq//BIM/VgXe9MBKtyJDoaNZmeTa5GPBRGUppKg
	6dau9oxkYL57u3ZUoQCOYafLHImG3l976xmaZyUuDmEOe1d8sLGmHF8Gp4pbFC8VseL2
	eTRgPkYzaJy+cenMGbl/8saAK8262q600TMTwVbB3MtjjOEU5p+VVtJJIABcHEKrjW8M
	ws8A==
X-Gm-Message-State: ALyK8tIrjmDJcyQtmwzefhwUBUtwHotU8tA6nh8DD++pK/wXxczENUyB5A7rqKt5cMA/0g==
X-Received: by 10.55.179.195 with SMTP id c186mr559710qkf.28.1466713418797;
	Thu, 23 Jun 2016 13:23:38 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id s6sm726580qtc.11.2016.06.23.13.23.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jun 2016 13:23:38 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jun 2016 16:23:21 -0400
Message-Id: <1466713401-408-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-decorator: update to version 4.0.10
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
X-List-Received-Date: Thu, 23 Jun 2016 20:23:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-decorator.inc              | 4 ++--
 .../python/{python-decorator_4.0.9.bb => python-decorator_4.0.10.bb}  | 0
 .../{python3-decorator_4.0.9.bb => python3-decorator_4.0.10.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-decorator_4.0.9.bb => python-decorator_4.0.10.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-decorator_4.0.9.bb => python3-decorator_4.0.10.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-decorator.inc b/meta-python/recipes-devtools/python/python-decorator.inc
index 5710012..c1fdfac 100644
--- a/meta-python/recipes-devtools/python/python-decorator.inc
+++ b/meta-python/recipes-devtools/python/python-decorator.inc
@@ -9,7 +9,7 @@ decorator, just because you can."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=41e24e0e235a97e60cdb5c4137fa2cd0"
 
-SRC_URI[md5sum] = "f12c5651ccd707e12a0abaa4f76cd69a"
-SRC_URI[sha256sum] = "90022e83316363788a55352fe39cfbed357aa3a71d90e5f2803a35471de4bba8"
+SRC_URI[md5sum] = "434b57fdc3230c500716c5aff8896100"
+SRC_URI[sha256sum] = "9c6e98edcb33499881b86ede07d9968c81ab7c769e28e9af24075f0a5379f070"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-decorator_4.0.9.bb b/meta-python/recipes-devtools/python/python-decorator_4.0.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-decorator_4.0.9.bb
rename to meta-python/recipes-devtools/python/python-decorator_4.0.10.bb
diff --git a/meta-python/recipes-devtools/python/python3-decorator_4.0.9.bb b/meta-python/recipes-devtools/python/python3-decorator_4.0.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-decorator_4.0.9.bb
rename to meta-python/recipes-devtools/python/python3-decorator_4.0.10.bb
-- 
1.9.1


