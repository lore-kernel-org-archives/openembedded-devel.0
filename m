Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id A65277ECDF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:18:48 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id w20so7952517edd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=52MIDCIffKNe1cFDA5UZnoMJ0r/FiqRzJHHGmJE3HgU=;
	b=ugmG+1iyjFV10624EeLFcAW+LnqE5DFKYVcK8yH04AqyUsdMIRSKTK0w9+q1fX+DSP
	zFx02DnIV9sanExG5mQw9H8WA3Y+T/ZWYTXEvj+oZJfc4u3a+/O2XIRKaqltmVnWuiqh
	X3KFv44ztDPGQ1Ll/kmSJDuO2FU/jZveDb26WAbftVQMwyhuh/tAyWwNxJvznNuuTyIh
	XfYZ34KwEG0Gx/1jSj0fzq7em/raGuFRgrgcwTFHI5rPcpgjfiVQ1Sf0PfrsriXXadML
	iSarwGc0PF5qt1kAo2QI9Xl7wJgLImhL6unhfzoIkFBpJmN9xjCeyPspZNohgEipYMHO
	Y73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=52MIDCIffKNe1cFDA5UZnoMJ0r/FiqRzJHHGmJE3HgU=;
	b=sLGQ7qP05Su9rmuRxWbE5SUrWRC5cpiv/nn7+UgWImU0SIRfUbknB53CcZl4JWVMbw
	li2GMqtmiqBJdejxOV8Q7+i69HUsIUROHtzp1/RXXR49luAtL+0Ti7JN3OHzG3hiS+ua
	UAAnGz5vKLKFc4km96liw/8dllcv3b2Rja9mk9J21Xd3hfDS8k2msqLYV/O4AwBgBhxE
	D1nhTR6eX+8qTWSNMA+Xziuq8zzXAfTiWbyS9cG7Cf2Y3LlqflOoXTf3KD+aXNTuhTyB
	dKgoHN/p8BtpI/EgHl4/Ge0vwG/Dw3Est0jAAosC6mUgcxXcjz62Ok19zockv4OH0s79
	qnYA==
X-Gm-Message-State: APjAAAVPYrphMuJpfLFf/w8N4QBwSwEQWoYsue4CHAHqTrbhRr2njSp+
	jcW1pn0IrR/Qyw6we2tiSMskU5hzkE8=
X-Google-Smtp-Source: APXvYqy3rqAjHdZjuWmZRdsNzb8Sae7e541JV0zIudiwT0NH3+IhVPlUMzwEkLmR8RZ309UXgf0CnQ==
X-Received: by 2002:a50:b6ce:: with SMTP id f14mr3720501ede.236.1562325529046; 
	Fri, 05 Jul 2019 04:18:49 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.18.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:18:47 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:04 +0200
Message-Id: <20190705111824.22255-4-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 03/23] openjdk8: Make kerberos optional through PACKAGECONFIG
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
X-List-Received-Date: Fri, 05 Jul 2019 11:18:49 -0000
Content-Transfer-Encoding: 8bit

It triggers a lot of dependencies, and it is no clear that
is needed.

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index d04b0d3..7552930 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -3,7 +3,7 @@ JRE_HOME = "${libdir_jvm}/openjre-8"
 
 DEPENDS = "\
     openjdk-8-native zip-native ant-native libxslt \
-    krb5 libffi fontconfig freetype \
+    libffi fontconfig freetype \
 "
 
 PRIVATE_LIBS = "\
@@ -40,6 +40,8 @@ PACKAGECONFIG[shark] = "--with-jvm-variants=zeroshark,,llvm3.5,"
 
 PACKAGECONFIG[repack] = ",,,"
 
+PACKAGECONFIG[kerberos] = ",,krb5"
+
 CACHED_CONFIGUREVARS = " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'ac_x_includes=${STAGING_INCDIR}', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'ac_x_libraries=${STAGING_LIBDIR}', '', d)} \
-- 
2.20.1


