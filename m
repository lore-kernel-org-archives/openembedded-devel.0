Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1F8487ECD0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:18:46 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id k21so7946064edq.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GURssCkClYzELUeYP9pefa9SS2XSii84wQU+bNNwaio=;
	b=bu2Zi6dGSfPOjWP4ky5G/5kZggxszr6LmFcbibSC+yGj9t5W+W8he2SQmfP3OO4WoO
	rG4UPf1MeKdtglvwB+HntcxKH/pnFDUme9cPopUGrmQJn7wUNH1WfPlV0jvC+vmz0idw
	O7T9c/m5G+HQO+nBTxkmRzRXJ1dSMX0zMFN6I+XCwVXNpMCLeNZxXwZHaMngZF8gg+pH
	csYQiuzsvqZ6beST5XUIowJOry4A4pOH8SpRHyHV1bBr5CJw5amHwrNUt11cUX3B7fm4
	elLffBONjL22iCUlSELWs028EMfed7TY4qfX16a/DUP6r6IMQC5yuKJl/nDXdXKHjCpb
	9c6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=GURssCkClYzELUeYP9pefa9SS2XSii84wQU+bNNwaio=;
	b=audr9e9ygg5pSKWB04SdPD5y5zMH++hrxmfEYs1e9OJ+O9/G9hIwbW/XDspBp00UD1
	+gHOvSrPrLkfWClci7sa6kSUB6T0mHwZhECeWC2bQMHO0nsCAXE0EtlT6MAThi14UM5Q
	rUfLRWf6MM99hMBg1sWmOFN7Yf9EI+6VJbuXNIUGHhhJIWHEm3hd+enLD1ahNfzuL8WD
	6ZGL9L5otScz9sk+/yT0ocO47j79nhc6YQeYMS1HSi2OXPefqwVWUflnI4HZiDLlYUZt
	Qn0WIIXpSV1Pnm8nHj5QmEbcptIyWEkpRl/hS1u/xAd3cy+RVHKvh/r+Vxp5X0O0Vn/j
	BGgQ==
X-Gm-Message-State: APjAAAVEMf8O6YkJBjlcPQASLd4X2hGEbCrxwvaPJsKxMlpNACn/Fe6j
	qttt/opTsDVl7kGFSxfuJyd03XtBS3g=
X-Google-Smtp-Source: APXvYqy6fDpid7xEGYufreqoPfvlouxNeYSkgmxuJjcV9lWiU0QCCe/4NPrvIoVGpAJ/1T+r7t8/+g==
X-Received: by 2002:aa7:d845:: with SMTP id f5mr3893605eds.78.1562325527577;
	Fri, 05 Jul 2019 04:18:47 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.18.46
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:18:46 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:03 +0200
Message-Id: <20190705111824.22255-3-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 02/23] openjdk7: Make kerberos optional through PACKAGECONFIG
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
X-List-Received-Date: Fri, 05 Jul 2019 11:18:47 -0000
Content-Transfer-Encoding: 8bit

It triggers a lot of dependencies, and it is no clear that
is needed.

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 794bf58..9d2dd8f 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -67,7 +67,7 @@ DEPENDS = " \
     jpeg libpng giflib \
     gtk+ glib-2.0 \
     cups fontconfig \
-    rhino krb5 \
+    rhino \
     libxt libxinerama libxrender libxtst libxi \
     freetype alsa-lib libffi \
     attr \
@@ -97,6 +97,8 @@ export CACAO_CONFIGURE_ARGS = " \
 
 JAVA_HOME[unexport] = "1"
 
+PACKAGECONFIG[kerberos] = "--enable-system-kerberos,--disable-system-kerberos,krb5"
+
 EXTRA_OECONF = " \
     --enable-downloading=no \
     \
-- 
2.20.1


