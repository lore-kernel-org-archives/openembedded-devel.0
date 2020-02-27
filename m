Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBBF60FEC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 06:51:21 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id m3so2075785wmi.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 22:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=sBoCSBPdLu/hjhKDokYCOCnZDldJtpohMThm6BhrQKo=;
	b=DUoiwsYa3PlyjSG6eya+ZwP5m+yuRtygs6400tWDCt0cDFcpCxW8a7a63/xPXoX86A
	I0jEIaETQ/D/pM5/8IFQtoDxCQoGhbPbSjxOCaTGUkEFLXhdaq6r3xujG7Xa0pItMIdf
	UthpPCLa024Y3A7iS/Jcntrs6UAKHqGYHxa6rlXp4KDNRJW5lqz7FxgCTiRBrTfau9Hi
	Sa12W/SHyJD7RPrZVEglXx4XzI7M57uFjN+wnYWjifLS2sOY4Sfk4UytkN+KHhWx9Mpd
	Q2D7Rj9hVHFeKoDk129i/gaewvRgE4R9hx0jnwFA7SlM2ADahIyGEQNxpOvZJSv1u7Qp
	QRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sBoCSBPdLu/hjhKDokYCOCnZDldJtpohMThm6BhrQKo=;
	b=cxuh1t3zNvrrsBDVACHXSXWNPp0AIJu5yeHDcKh8YsqvjpiCZmMI4xJ7yQFCyna9l2
	tIvoZdQNx2BuOlMnZdnJspOLJfjZNXA3QFekzYelvYIKoWeK2srmYAchxDV6KQy1Pbvw
	lI6fqWJOuu8Kt7ikjEwU2JU4fhbfZd9gAFU5esdZwxYC3/Zt8t7nxLQBZiu6wWIMAgbC
	qBa4RPvHJ9VYJ6ExZ1mYmznCyrhjUjEhzAFaOznn5t6c0HDPitmvsxQwnp1hi94jR352
	Fbn3S7wzDfgPACFyeSw5KAhAVC2FRRfejjlVWUGINHcO3G06X2KVvRb0QAGuQjpW0vMl
	5u9Q==
X-Gm-Message-State: APjAAAXGr+y9fNG/y5NxJzaQBi+h2K9ifW+QFBTTiWrQOkhIsH3F9jBB
	HV2Ja7igcvONctEt7bRqEFHTGPUt
X-Google-Smtp-Source: APXvYqzxs67TzDPF6M51TKPEpslO35MEAM95vsCI63MNxv7UXV8la3Scbsa7hmCYO5P/8WtR+Ut73w==
X-Received: by 2002:a05:600c:290e:: with SMTP id
	i14mr3352579wmd.139.1582786282461; 
	Wed, 26 Feb 2020 22:51:22 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F102C9262505CD5EB98F253.dip0.t-ipconnect.de.
	[2003:f0:7f10:2c92:6250:5cd5:eb98:f253])
	by smtp.gmail.com with ESMTPSA id u8sm6470066wmm.15.2020.02.26.22.51.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 26 Feb 2020 22:51:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 07:51:05 +0100
Message-Id: <20200227065105.29865-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200227065105.29865-1-schnitzeltony@gmail.com>
References: <20200227065105.29865-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] gimp: upgrade 2.10.14 -> 2.10.18
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
X-List-Received-Date: Thu, 27 Feb 2020 06:51:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release information can be found at [1]

[1] https://www.gimp.org/news/2020/02/24/gimp-2-10-18-released/

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gimp/gimp/{gimp_2.10.14.bb => gimp_2.10.18.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gimp/gimp/{gimp_2.10.14.bb => gimp_2.10.18.bb} (91%)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb
similarity index 91%
rename from meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb
rename to meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb
index 30f0579e2..838bd374a 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb
@@ -38,8 +38,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "a64f2be299755a2da130306cad9b1d26"
-SRC_URI[sha256sum] = "df9b0f11c2078eea1de3ebc66529a5d3854c5e28636cd25a8dd077bd9d6ddc54"
+SRC_URI[md5sum] = "096d04ffb2c4559cb2152f507ff31c9c"
+SRC_URI[sha256sum] = "65bfe111e8eebffd3dde3016ccb507f9948d2663d9497cb438d9bb609e11d716"
 
 EXTRA_OECONF = "--disable-python \
                 --without-webkit \
-- 
2.21.0


