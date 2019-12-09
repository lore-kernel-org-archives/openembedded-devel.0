Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 76D9B7FC37
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:37 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id q9so14451224wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Gfa2rxgKlKvYMpAahWKRe2oX5dqrBn+SRbs81Eawe9c=;
	b=BNxcQeeBs+Jsz3QpEFVmseSB2yZCePr5vAEfHN0ZR5JIPbhcSaxRuuBTH+MfXTt0mM
	mgBx+WbscEupZEtShsTcEtxQ1oNmThwlKmXVXclL/HHEh7JfHqd89mUa1ioVTefINrrH
	KRZmXm4hkqwM1SAGWScZ5lKDDlXtm4tXFhNyj/Cv5jQqxCwNZHf9uCWAbm6TBvmEMvdW
	QbR1V9e5keH8lR5DCiSIie28hYYmp1tg5/zhmeWqBU7QqPOBtvoXNfAYBitXbyXB7Ubx
	9uTttuywrks+Y2RAPKXSbNrcyIQZNOscGeH4vIiZuo5dB7u5bMwXKuWwmCE5O+xagMkF
	fm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Gfa2rxgKlKvYMpAahWKRe2oX5dqrBn+SRbs81Eawe9c=;
	b=HW35JhU0J9NfFcwGtGemnPiHtz6kfANiNlSxirQ9qTLaY8R03CjGaJzBxhjGZo3F5V
	O4qUMbiaICzTcE/N9NIkyu6xVNK/arZfAFvvoODhKm5+/UCcAIxr7GULHDiYeVyfAQVj
	/BJo8O3NycVEXWmEzLRV/sApZEcwapZdIgowRVg7BJnjsRPBVIwHctXHEnnyPPJPuOqb
	CZxioYjfmMsO6uwLLgAt5YivKpxWeM8Fzdqk15d0X1KV1oYL0jm0K9EuTG0BWIqm2eHG
	3nkLgf8J/josEd8E3N9EX5ZlILcjTqQMvFBM3PvU6pHchsHO/mjkYw/JeSCd8bi/3ovY
	EgfA==
X-Gm-Message-State: APjAAAX+kElrFncQo5qDTszNl0BoQ2DSJL+1nNfs8qH+65vT18pBmsBd
	1fTFSvb2rg7b0JDOAa0I6lUAUhRt
X-Google-Smtp-Source: APXvYqzbJVaBtrgej0lD0S4XTou8AN906ZP376sf5hhjVaLXSYUEaUaXMRgFr6Rsg6Xhxx2L441VXA==
X-Received: by 2002:a1c:2186:: with SMTP id h128mr24003428wmh.14.1575880598049;
	Mon, 09 Dec 2019 00:36:38 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:36:07 +0100
Message-Id: <20191209083612.23922-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 15/20] projucer: add x11 to required distro features
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It depends on many X11-libs

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/juce/projucer.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/juce/projucer.inc b/meta-multimedia/recipes-multimedia/juce/projucer.inc
index 60bd0e24b..fc8baa45b 100644
--- a/meta-multimedia/recipes-multimedia/juce/projucer.inc
+++ b/meta-multimedia/recipes-multimedia/juce/projucer.inc
@@ -6,7 +6,9 @@ HOMEPAGE = "http://juce.com/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a20f91622a47d4e4af9340d5d3f1a2d8"
 
-inherit pkgconfig
+inherit pkgconfig features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS = "libx11 libxext libxinerama libxrandr libxcursor freetype alsa-lib curl bzip2 libpng harfbuzz glib-2.0 libpcre"
 DEPENDS_append_libc-musl = " libexecinfo"
-- 
2.21.0


