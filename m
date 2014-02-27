Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id EC8CE6F39A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 16:36:22 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id x48so3125766wes.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 08:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b6A8KZyhgycQAfuNa/jMldAwy2OCtwTkMimUh9IJwh4=;
	b=mbzTYBglMTrXq2ryNHfya50LwCu1piyUu87WBEcYhiY3iExSmAy4dWF22/7rwI5Wm/
	o30bBiv/SqiLWKGdV1TWJuijyz4JdfleB4G5O5gHn3I6CrxD4FFC8bnLgAbslHz8qDR0
	qc+n+tNii1cxfvt/Ff+ibYF0WzH+x4kWhhfTWc1WIl/1Dk/MAjC+wkc1QsXjC5ztNzKm
	71vL/RlO/1+xK0gXqLE8bBYvF9EIUkT+F5K0CfRejWpydSH+IqcHilXjsf4UZEC+y+ki
	rcBeMI1sSv2cWTOvXeLbLnU8PJGr8vHh98KqGGoyFaERqIMseC9t7AZRixzWrAunBMzh
	nvjA==
X-Gm-Message-State: ALoCoQlJOHbPjxk6NX4JvqIn8d8BvXzUTP+Ial7iv3OmtJopmaXPM5e2pmjDQDTgEIH7Q5FSFafX
X-Received: by 10.180.19.35 with SMTP id b3mr10869468wie.20.1393518982888;
	Thu, 27 Feb 2014 08:36:22 -0800 (PST)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPSA id 12sm12452107wjm.10.2014.02.27.08.36.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Feb 2014 08:36:22 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 17:35:53 +0100
Message-Id: <1393518954-15100-3-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393518954-15100-2-git-send-email-nicolas.dechesne@linaro.org>
References: <1393518954-15100-1-git-send-email-nicolas.dechesne@linaro.org>
	<1393518954-15100-2-git-send-email-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-qt5][PATCH dora 2/3] qtbase: configure with -openssl-linked instead of -openssl
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
X-List-Received-Date: Thu, 27 Feb 2014 16:36:23 -0000

From: Andre McCurdy <armccurdy@gmail.com>

Configure qtbase with -openssl-linked (instead of -openssl) to ensure
that run-time dependencies on libcryto and libssl are detected.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 recipes-qt/qt5/qtbase.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index e4beafd..4f81f8e 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -114,7 +114,8 @@ PACKAGECONFIG[kms] = "-kms,-no-kms,kms"
 # needed for qtdeclarative (qtdeclarative.do_configure fails to find quick module without)
 PACKAGECONFIG[icu] = "-icu,-no-icu,${ICU}"
 PACKAGECONFIG[udev] = "-libudev,-no-libudev,udev"
-PACKAGECONFIG[openssl] = "-openssl,-no-openssl,openssl"
+# use -openssl-linked here to ensure that RDEPENDS for libcrypto and libssl are detected
+PACKAGECONFIG[openssl] = "-openssl-linked,-no-openssl,openssl"
 PACKAGECONFIG[alsa] = "-alsa,-no-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "-pulseaudio,-no-pulseaudio,pulseaudio"
 PACKAGECONFIG[nis] = "-nis,-no-nis"
-- 
1.9.0


