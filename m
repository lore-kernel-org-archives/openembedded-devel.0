Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8717D7713F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 07:47:22 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l66so8232071wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 23:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=UsvFdWXMn8uB6HD8ZfpdRZjRpbbThBOFZRSPUlngPaU=;
	b=qhCyCFRe/nJco4Au9CkgxCOA+WanJ7s6PVvDlHhHSckxJP9Xy0fVCcXtE/0JXC5Gr8
	2ve4ovglRb90fFtL9Y9iCXn/GIuCl+o5qrE93lYdebvFVKRrvzIuOOe/Uvezhcp4E5yW
	twW52WYNM9QjX8Zb0gZTLpF+Lg3b8PoXV4GLe9/k9LNkf94eUl+tfIdo6EJp2ereuIWK
	FQKi2CnHWAamEYtN7CwiqZm4BTWtlX2v3omBJ7hXf7QC/Z3ByXsr4Rm4vz4oF1TfCd4s
	8kKOGCHvUrlQ5Kc+oGo1GaAOPw83mmXVLqlWO+YygdRDBEPPYvzwQE8+BKHKfqqWeC3k
	0NWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=UsvFdWXMn8uB6HD8ZfpdRZjRpbbThBOFZRSPUlngPaU=;
	b=YsJvUR9F0xaCKnFeDSSGb0uCgTX8CFes9+eLczDJKV+FKzcrVdCnAp/ySZpqr9E6Hw
	DzAEXlqu3lmQhJevqtjw1seEkU5gFno8tkdOefiuwpTkCuTbYYEnLKgEG/lBXDhip9f5
	J6EJ8QvdA3Todrdxtu6WnJKlk8r+3rr72h9LWCkFT5N9EFBv6w6i4ayoIUcE2wKfGVqy
	N9giZijv2g5oue6hHza7KvIqdO+wo0lhRHkbafeh9txupNo8NmUKO/9monMotiwHkQIU
	xVZXDjG3vXh4X4CXhywaEW36GI353IZcJzcHazxcN+LGx70GhnPXarp90dhH4Jo+aqSj
	lutg==
X-Gm-Message-State: AG10YORPfApJdyEU4YEIDxJdlrwfppQKzPz3ImzVDkR1nmOqJf4ckmZ7kgybc3FIbjacWw==
X-Received: by 10.194.176.170 with SMTP id cj10mr7195673wjc.165.1454053642837; 
	Thu, 28 Jan 2016 23:47:22 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-253-155.hsi05.unitymediagroup.de. [176.198.253.155])
	by smtp.googlemail.com with ESMTPSA id
	i63sm6199401wmf.24.2016.01.28.23.47.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jan 2016 23:47:22 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jan 2016 08:46:53 +0100
Message-Id: <1454053613-27842-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1454053613-27842-1-git-send-email-schnitzeltony@googlemail.com>
References: <1454053613-27842-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] packagegroup-xfce-extended: add xfce4-calculator-plugin
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
X-List-Received-Date: Fri, 29 Jan 2016 07:47:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index f0126e3..d8b67f2 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -50,6 +50,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-hotcorner-plugin \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'xfce4-pulseaudio-plugin', '', d)} \
     xfce4-sensors-plugin \
+    xfce4-calculator-plugin \
     \
     xfce-polkit \
     \
-- 
2.5.0


