Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E1635719CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 09:19:32 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id f193so1972570wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2016 02:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=UQtN6e+qYOm7vTKP3zB+IcXXWudgrykwtMKmkpdpvJE=;
	b=invP7HthR/FiaDPYvYtF39Pkw8SEXoOY+thwFSgEzj20gqmkZGWCRW7/sluk5VD88+
	7HF7WEc3UeimIV8jqTgW0VnpKch5X+DEXY2e8CB8cFbQ/xX1RKlSrZK+mcGwIaIuXCiP
	WoVHSkS28pkAgUHnfJDpDdQLw9gHZZW6Cj5IUOUecWWrBWKDqgTa6D4nA/4o8uP1GTqo
	YLRc0Ve9o/YTT9mFdxeTJY3vzGWoHDPNwzo1lDfXSCmZqYNYm9g48rKwrJjCKNk4mk+a
	/m7gMgO1xflYcXq9wwkiKbCIG8T2GL9D7eViW3nJm5cx5z5/dJbPYkfhy73/Dsy1jbSR
	Unzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UQtN6e+qYOm7vTKP3zB+IcXXWudgrykwtMKmkpdpvJE=;
	b=aGTrYIckwBZ8nO7a8TlZPpvWiwtcrNb5LkYL5o158LW3V8IBn072AJ0WPRmjq9yCa2
	dLZs3eRQIDR6/3af3+hMK5DxoiKTw+a9+LTy97/XyljsyoGQO4rZ+edPoz7jXlU23Ter
	16ZOM8TqeVscNTWTnuFrcmwhp86TNtr+sak6D3GIE5agnU13GmVUpes9rzuKSzs+mNB5
	TKb51/G21r261lrt6QpGPwFaA75gAqZxvKjhLCNDJGqFo6ZeoD9X9LRvO0UZk1JZaZgA
	yY8XXPZskrUT859OijvWhgefZnOxmbgfeBZesCMBY3voHJbRfVIYghpgxCMR0L4EiYRF
	RQrg==
X-Gm-Message-State: AA6/9RnwWfcCafQwb0KzbnE9qbWLw85bR11cMdCyT278La4N8aVoWSiwCBtj3FWQayDp7g==
X-Received: by 10.194.57.180 with SMTP id j20mr15990011wjq.203.1475831973496; 
	Fri, 07 Oct 2016 02:19:33 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-95-222-156-64.hsi15.unitymediagroup.de. [95.222.156.64])
	by smtp.googlemail.com with ESMTPSA id
	jn7sm18657184wjb.5.2016.10.07.02.19.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Oct 2016 02:19:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Oct 2016 11:19:21 +0200
Message-Id: <1475831964-1993-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475831964-1993-1-git-send-email-schnitzeltony@googlemail.com>
References: <1475831964-1993-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] jack: remove portaudio PACKAGECONFIG
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
X-List-Received-Date: Fri, 07 Oct 2016 09:19:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

portaudio backend is only available for windows builds - see README (and if set
it would cause a cyclic dependency with portaudio's jack PACKAGECONFIG)

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/jack/jack_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_git.bb
index 34615b4..06e0322 100644
--- a/meta-oe/recipes-multimedia/jack/jack_git.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
@@ -23,7 +23,6 @@ inherit waf pkgconfig
 
 PACKAGECONFIG ??= "alsa"
 PACKAGECONFIG[alsa] = "--alsa=yes,alsa=no,alsa-lib"
-PACKAGECONFIG[portaudio] = "--portaudio=yes,--portaudio=no,portaudio"
 
 PACKAGES =+ "libjack jack-server jack-utils"
 
-- 
2.7.4


