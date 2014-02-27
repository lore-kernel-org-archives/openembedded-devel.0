Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 89DC06F348
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:16:09 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id t61so3300622wes.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:16:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b6A8KZyhgycQAfuNa/jMldAwy2OCtwTkMimUh9IJwh4=;
	b=VsaZtWD7Tcn6Ub5FhC0GMcko35iTPRPF9YkIWo//yNsoP+C6W7fPfKcWeGUuDUSuE4
	zGacdUrOl59O0UOwsKb8p2HpbI9C35FciAaWHFOW6XnULKxdnmMLrnANTFSzhSkdo6XF
	NXMT3ukD33GiJAeHJEp8FyU0yiN7NOZgT3hAUv7vJhEZOJAH/UxTaK9+YcoB/X9eWfDv
	sPs0o6/l2KCWKbACtrboMpekaEddHXeuuC4zNhnM4clZkPVFF8YWLbNRH/XhZNyZ7Mzh
	5wZVb+ZPvu1O7x9MdV4xRN7NT5xqirbWXw29mVoSr3LW5BO7k9C4B0H6C1udd4omTq/d
	C13g==
X-Gm-Message-State: ALoCoQk1DvYVcvCZkT7qBPz6CjpZduWUqtPAXHm5aYd3fQAJBK2wXrylCZdOzaXQEdgC3VBgVwj1
X-Received: by 10.194.62.243 with SMTP id b19mr5098315wjs.63.1393539370328;
	Thu, 27 Feb 2014 14:16:10 -0800 (PST)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63]) by mx.google.com with ESMTPSA id
	bj3sm14499950wjb.14.2014.02.27.14.16.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Feb 2014 14:16:09 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 23:15:59 +0100
Message-Id: <1393539360-17923-3-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393539360-17923-2-git-send-email-nicolas.dechesne@linaro.org>
References: <1393539360-17923-1-git-send-email-nicolas.dechesne@linaro.org>
	<1393539360-17923-2-git-send-email-nicolas.dechesne@linaro.org>
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
X-List-Received-Date: Thu, 27 Feb 2014 22:16:13 -0000

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


