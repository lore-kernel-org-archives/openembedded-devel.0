Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 400FF6C806
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 15:39:51 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id k198so12416208wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 07:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sNqzNYPLFWRxW6EP1jygByoxjBYPOLih/6/RAnvqYcY=;
	b=YQG4WgyTbBH0kjxt6pCFTxulNrBcz2C8QDl4AUfxVowBod8ZrOTbzGJ+8gsaywPesT
	t5TCsS+ja59MbocTNiBcez/4oJHNBO3pNisOxpxsSzKXVKYKQNpkrCYsCr3dRiH+5VUG
	HSCtzCoDPWtpoP9TNniAYhgIIwQLbWDIaWBmThQH1EpaT0rLKZpJBUee3/rt1BbU6eI1
	gcvSZp+EFwUEFlHTJcuQWpONkOeI7g7+7F14KABzUufQ1h6wXHxD2APoajWj09ltPwrG
	997BFXJKrOVGO94M3VOCb6eihnD5PH/Rq3dQCyG8KCCoGVXTMd+7zjLVxVXoaHkwPIbi
	cCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sNqzNYPLFWRxW6EP1jygByoxjBYPOLih/6/RAnvqYcY=;
	b=oWfhuV0icaiRDHnA4bEuB+ovD/IvBGiQLG1cJEvLrkEPtL9ezBHkrWaVGVKUzKdHyC
	H1z90mFMfy5tv8ZJ86rc6aAUPn28re1V39PHcZPIp97EdgDQF5qW7Zgy4q7DNs1sD8Ls
	rgWfBKg6g9MKg48VGV0KBgYgfbgeJ9k6sAnjT6W4B41WD6HF6O4ppyYX4WsRqPyzGksZ
	MlRm1F9dG5LAZkUTCIgFYleMgS/91CXSkLduuN+ukMpTtVOXe2pZLGLz3AWRK5eGqdOV
	FokQojVcS4xjGXkMi2DcLP5h/Zdu5QkKDOkZaW/AbpZfeeH5XejboeBY4++cNadyxhv6
	p5Hg==
X-Gm-Message-State: AGRZ1gKKAJgD2ukrpL0RXRpqXDLxtEYRoPv4e+HOdK3rXwtbT6LazM/A
	30GGE42udze3YGUQEtzabd711jpGLzk=
X-Google-Smtp-Source: AFSGD/WLAkPr7bQLDPjJSEKysJwmAfcn+eaXtoasfp1YFIt4oJNw+kdW5qVBApn7dFwwNz2wi0pNWQ==
X-Received: by 2002:a7b:c397:: with SMTP id s23mr13741589wmj.127.1542987592532;
	Fri, 23 Nov 2018 07:39:52 -0800 (PST)
Received: from debian-brgl.home (lfbn-mar-1-609-89.w90-118.abo.wanadoo.fr.
	[90.118.185.89]) by smtp.gmail.com with ESMTPSA id
	u10sm9983953wrr.33.2018.11.23.07.39.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 07:39:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Nov 2018 16:39:40 +0100
Message-Id: <20181123153941.10186-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123153941.10186-1-brgl@bgdev.pl>
References: <20181123153941.10186-1-brgl@bgdev.pl>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/6] libsigrokdecode: new package
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
X-List-Received-Date: Fri, 23 Nov 2018 15:39:52 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../sigrok/libsigrokdecode_0.5.2.bb                | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.2.bb

diff --git a/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.2.bb b/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.2.bb
new file mode 100644
index 000000000..b8e1e4705
--- /dev/null
+++ b/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.2.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "libsigrokdecode is a shared library written in C, which provides (streaming) protocol decoding functionality."
+HOMEPAGE = "http://sigrok.org/wiki/Main_Page"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "glib-2.0 python3"
+
+inherit autotools pkgconfig
+
+SRC_URI = "http://sigrok.org/download/source/libsigrokdecode/libsigrokdecode-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b9033bc7e68bc17fffffd4fdd793f5a1"
+SRC_URI[sha256sum] = "e08d9e797c54eccf3144da631b6e5f1498ac531e51520428df537a1da82583f0"
-- 
2.19.1


