Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBF8C4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:41:55 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.2736.1633977714910365016
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C7cQ1J9o;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id r10so59183747wra.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2ecG+JEj1PBe4yqaazcU2hCHao9Am4NsMFB4veYKFi4=;
        b=C7cQ1J9oAD2WrN4GQFcjaCAZWEFaMt7wPbKX74+563F7gi/wJJl5FuSN25AMf5e3Bu
         kKoifrPxvjg/jeQ7FXcKY/De0Mo6ftCpXPOM5AwLzDsjVR5z5HXL+KMekwJy+PU9GMYX
         ctBnc7lkqOIoNA9U/fm2Grsw3ChCjMSG3ZMurwMbZUKvhPkkFqWTNiCTGS46/9Ednimv
         EfLMCzgK/vJSLjsernAOzCQamRwQ3wi28bMVx8BDtHtHSpbq4A2loGkyfv3DWzVI6s7r
         kyMY3y17VMEWb/VQDf1woPlgKY+nvM/IhwvbpGsHvGM9kS+zSU+ZWw92R+2o13FOnNiz
         UN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ecG+JEj1PBe4yqaazcU2hCHao9Am4NsMFB4veYKFi4=;
        b=sC+zfwKWAsUrbvE9ohRqYgp+Jw/aHIFoN6030B5EnMNnUTWdIVQKn1zSv1cprlze0g
         E4EGUqtS5K7l0PMZYS3UOBmQzca7VOfb9lM3/KGTYYASMfAREGPasHjL46ZcHgDx/F+s
         vT1OHn2IrlWpd/6DLU97SJ3aUPKm8yeryyirn9fphSDyNLGaWR9DslQ9X+4z1qVr9t/d
         3C7A2XfeJQqA1nuEdFYO+3pAaLAz12wzqp/t/aY0UtjrwbMS00pJ7kmYC7HYv6UgSssu
         +jFHuX8OecwgwenPlQsfbHylouqZ/RbIpi0W3Typ0S7acqez+qOP6toqFUDkznf7l2IS
         sxPw==
X-Gm-Message-State: AOAM533vZ3fBNy3tjU+kzNPyPhiko5/QbXrQfskxv7/8VjmcLovl8Z9w
	280vFhT08/oKRzPVz7j2bRnHkvzpPFCzPQ==
X-Google-Smtp-Source: 
 ABdhPJwuLJJ/nPl3YZNL3hJzqKh3YyoYKmeBRAbOXdMxJ2a8+FDP39mdY1MBCwH4ftjnt4y0fvtC8A==
X-Received: by 2002:adf:a550:: with SMTP id
 j16mr27184712wrb.180.1633977713517;
        Mon, 11 Oct 2021 11:41:53 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:41:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/24] openipmi: add a python 3.10 compatibility patch
Date: Mon, 11 Oct 2021 20:41:26 +0200
Message-Id: <20211011184140.653609-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:41:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93224

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ..._devel.m4-do-not-check-for-distutils.patch | 41 +++++++++++++++++++
 .../openipmi/openipmi_2.0.31.bb               |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-support/openipmi/files/0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch

diff --git a/meta-networking/recipes-support/openipmi/files/0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch b/meta-networking/recipes-support/openipmi/files/0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch
new file mode 100644
index 000000000..00956fb11
--- /dev/null
+++ b/meta-networking/recipes-support/openipmi/files/0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch
@@ -0,0 +1,41 @@
+From 3a35611687864cf3599712d0d2ff54532b0118ac Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sun, 3 Oct 2021 21:42:32 +0200
+Subject: [PATCH] m4/ax_python_devel.m4: do not check for distutils
+
+With py 3.10 this prints a deprecation warning which is
+taken as an error. Upstream should rework the code to not
+use distuils.
+
+Upstream-Status: Inappropriate [needs a proper fix upstream]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ m4/ax_python_devel.m4 | 15 ---------------
+ 1 file changed, 15 deletions(-)
+
+diff --git a/m4/ax_python_devel.m4 b/m4/ax_python_devel.m4
+index e0804c5..cfc0b24 100644
+--- a/m4/ax_python_devel.m4
++++ b/m4/ax_python_devel.m4
+@@ -138,21 +138,6 @@ variable to configure. See ``configure --help'' for reference.
+ 		fi
+ 	fi
+ 
+-	#
+-	# Check if you have distutils, else fail
+-	#
+-	AC_MSG_CHECKING([for the distutils Python package])
+-	ac_distutils_result=`$PYTHON -c "import distutils" 2>&1`
+-	if test -z "$ac_distutils_result"; then
+-		AC_MSG_RESULT([yes])
+-	else
+-		AC_MSG_RESULT([no])
+-		AC_MSG_ERROR([cannot import Python module "distutils".
+-Please check your Python installation. The error was:
+-$ac_distutils_result])
+-		PYTHON_VERSION=""
+-	fi
+-
+ 	#
+ 	# Check for Python include path
+ 	#
diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.31.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.31.bb
index ecc98dd8b..4b85d9427 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.31.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.31.bb
@@ -31,6 +31,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
            file://include_sys_types.patch \
            file://openipmi-helper \
            file://ipmi.service \
+           file://0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch \
            "
 
 S = "${WORKDIR}/OpenIPMI-${PV}"
-- 
2.20.1


