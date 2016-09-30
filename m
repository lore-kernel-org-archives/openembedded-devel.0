Return-Path: <dev@codyps.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C39560190
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 18:48:54 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id j69so3412502itb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 11:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=Y/FphB5zYS1JdrIkWON5OxnUZAiodQj0AxRXT/nILUY=;
	b=AoMhntK01VoXXwA2w7vFLg+pXSKJVrIaDCNBFIY13a4N3+UAGNVymLfdHPEixdeAy9
	pmkZGzjflws8WHDxmEXELjEpN5560ow3NhDcVUmAvEXgIVBuQgVE8MHW7RUQ58IUtE0n
	B3xZ1Cb6HopfRI4u4uEbkHUqkWVd2WKU2dGBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y/FphB5zYS1JdrIkWON5OxnUZAiodQj0AxRXT/nILUY=;
	b=hOKWrLeGBp5BTAkYDKPCESM20sOlCdP3juSa72lRyjXbHpVV6brZPh4keskjLMXnbE
	GttDBRvw7H9I+j/YIO1TaK0jpNE2cPN+hhcmsqbW8PyKOOq5D+yuohrq18gPULDPWpnW
	L5RS1ha7e+z1rgTHZfZxzGDUAjX3EgZPSmpVw63t+rWVcF3CEi/FvvqPUczqOZ2/eiCT
	71BuTvQUrASf2U7ANbtuvVhLwmemJmropAtt4cXcKb+GSoTo3avZlVExhr2++X5IXOAg
	ofHZLbrLeKxfu3Z0ZnQI+Lv/v02+ld7xL94BHAIkqbie9oFyrdpBpz/BdW9JH+v6EXgW
	Boxg==
X-Gm-Message-State: AA6/9RlYAXAVGU3oc6KRNYxbzC1cFWfrejR+5WTOQdbUuZMk2RKYxeWiro5kpomxR2wsrA==
X-Received: by 10.36.204.68 with SMTP id x65mr6396221itf.54.1475261335513;
	Fri, 30 Sep 2016 11:48:55 -0700 (PDT)
Received: from localhost (static-96-237-165-28.bstnma.fios.verizon.net.
	[96.237.165.28]) by smtp.gmail.com with ESMTPSA id
	e124sm8132411ioe.15.2016.09.30.11.48.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Sep 2016 11:48:55 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2016 14:48:51 -0400
Message-Id: <20160930184851.4866-1-dev@codyps.com>
X-Mailer: git-send-email 2.10.0
Subject: [meta-oe][PATCH v2] meta-oe/recipes-connectivity/thrift: disable java
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
X-List-Received-Date: Fri, 30 Sep 2016 18:48:54 -0000

Without this, thrift will try to use system java to build it's java
bindings, which is both unexpected and may fail depending on the
version of system java.

Signed-off-by: Cody P Schafer <dev@codyps.com>
---

Since v1:

 - ensure java is disabled in native & nativesdk too by reworking EXTRA_OECMAKE
   formation to use appends.

 meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
index fdea7f1..905e561 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
@@ -25,10 +25,10 @@ export STAGING_LIBDIR
 export BUILD_SYS
 export HOST_SYS
 
-EXTRA_OECMAKE = "-DWITH_QT4=OFF -DWITH_QT5=OFF"
-EXTRA_OECMAKE_class-native = "-DWITH_QT4=OFF -DWITH_QT5=OFF \
+EXTRA_OECMAKE = "-DWITH_QT4=OFF -DWITH_QT5=OFF -DBUILD_JAVA=OFF"
+EXTRA_OECMAKE_append_class-native = "\
              -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DWITH_CPP=OFF"
-EXTRA_OECMAKE_class-nativesdk = "-DWITH_QT4=OFF -DWITH_QT5=OFF \
+EXTRA_OECMAKE_append_class-nativesdk = "\
              -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DWITH_PYTHON=OFF"
 
 do_install_append () {
-- 
2.10.0


