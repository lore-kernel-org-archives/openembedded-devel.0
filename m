Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 20BD86F391
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:20:46 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so1296581wes.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b6A8KZyhgycQAfuNa/jMldAwy2OCtwTkMimUh9IJwh4=;
	b=PxlIoh4YLfwH2GAON4KrjynazShT24FrH2ExffXwdlxvB2vWatth36g7Lgw6srf0OQ
	m06CR6SEy+3CbRJSxbI++XSLeQ73XKSQbhqAXdhuREZrtjPcKxaKMVckx6TJChNjQ3fj
	QDqUdU4rme+ZH/3mknxKwuW7/BZGtkQPtHIC6DNyJEjwSesHvaur8QWEFKQvk9qeKkJW
	pQa72El48ste6o5rJ/PMxdiYLdoaMHZZay7TH4klTj2bHDIr7i5sVXgY5QestEBPWRtH
	BoxCpqgH9Lqvfn65MZ+tfKSvB4Alkzs+aBHwI4I8WlYSyT26hDRZipVmtLOj+182GXZU
	WYLw==
X-Gm-Message-State: ALoCoQlzrG6X3owJXpeZW7Pe1NVNlU6xM3VStCcOJyiOfVEF6D6PjT6Hl7Wq8F2m1Os65ISMsK42
X-Received: by 10.194.143.40 with SMTP id sb8mr10369595wjb.15.1393539647312;
	Thu, 27 Feb 2014 14:20:47 -0800 (PST)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPSA id ju6sm14526019wjc.1.2014.02.27.14.20.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Feb 2014 14:20:46 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 23:20:37 +0100
Message-Id: <1393539638-18126-3-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393539638-18126-2-git-send-email-nicolas.dechesne@linaro.org>
References: <1393539638-18126-1-git-send-email-nicolas.dechesne@linaro.org>
	<1393539638-18126-2-git-send-email-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-qt5][PATCH dora v2 2/3] qtbase: configure with -openssl-linked instead of -openssl
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
X-List-Received-Date: Thu, 27 Feb 2014 22:20:47 -0000

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


