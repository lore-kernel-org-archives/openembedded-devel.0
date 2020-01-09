Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7B0B77EC64
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 21:05:26 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id y11so8925285wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 13:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=AS09nT9h0qwIcuXexdM8ACuXaZDgOB+Bl2T+a5zWS5w=;
	b=m2vbpbgFYfjljIz08voTpslQLdk2Rj2+2pcAzUC3u75QtUybcfTgMkk0U4WvHvBr//
	dvZAgVYJwFwBJh5egPvV7Os22PdyQ2dusfMZf5qAfTagXBdaXdtvVk8/ERJv7LPF16R/
	2bNEFisRItJ/arpZItA0tsF3pejzrIRC/eWcPQcOCyWgb6l0ot7hwIm2A5iCeeDmVujV
	rZ2v/5s1/pvnO3w/mDdB2TzZcU7B6IaHrUAat1hiyGchlBfm8XD/sQO/1G/C8dU01XzZ
	yBaTMmqTg70MzsG1iTTMNTUqnYwrRkGl3EK/LmGg6gJ9c3TQdM1NpsKSTXNfLsQxZEH6
	yTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AS09nT9h0qwIcuXexdM8ACuXaZDgOB+Bl2T+a5zWS5w=;
	b=Tlfyq0tGGhR1tih2JWED+ltyrQuMflk+avNhM7t9Rfh3FZ+lwbLiM6jNjHhPulkq8F
	Ezeh2YhIJTBaEAY3uotsQgBs8tm6Uf8Rv3dHCsSnzykgsFoxNZRoc+qaNQv8SX7Oy2Hl
	josBLgTHWIaUnxA6DDUnAIKQqB/3WPmltpVZS+R0FBviwmF7yEa9FIqQnSMbUCX7UauV
	Yei/aQr6Kqvsbg0dNBWc1LwBWw7haRoQNGjdaweNgYUUhUY/STL69nhXIQTf5aJpIoCF
	eTF9s+Mk+Ym9HMnD9atBv+yCXaPVOiJh0V3m95hWNr/14R3GWkIOCSXxMFU7T8DEyaVI
	fHyw==
X-Gm-Message-State: APjAAAULlOb+Wnba8iMEIjK4U+7IU0g1Wu0PohSwqxfda22xLTpA+F6r
	ydfookOUKJNpTLVLz3bS38BH2RtWQUw=
X-Google-Smtp-Source: APXvYqy5qK7YUvaYEkY/mriWrAX9Y7eNQZOuyGGA5qby9aANJKjPC+H/sPJaBRVrncjK3Rnb3lo3RQ==
X-Received: by 2002:adf:f604:: with SMTP id t4mr13499904wrp.33.1578603926956; 
	Thu, 09 Jan 2020 13:05:26 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id q6sm9825041wrx.72.2020.01.09.13.05.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 13:05:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 22:05:11 +0100
Message-Id: <20200109210518.22451-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109210518.22451-1-schnitzeltony@gmail.com>
References: <20200109210518.22451-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] xfce4-terminal: upgrade 0.8.9 -> 0.8.9.1
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
X-List-Received-Date: Thu, 09 Jan 2020 21:05:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a hotfix release for 0.8.9:

Release notes for 0.8.9.1
=========================
This is a bug-fix release featuring only one change.

0.8.9.1
=======
- Fix "Open terminal here" functionality that was broken in release
0.8.9 (bug #16307)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-terminal_0.8.9.bb => xfce4-terminal_0.8.9.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.9.bb => xfce4-terminal_0.8.9.1.bb} (70%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.1.bb
similarity index 70%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.1.bb
index 493758c18..4bdd4cbf2 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.1.bb
@@ -8,7 +8,7 @@ inherit xfce-app
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "cb40a6cc5b3e35fa4d68f1b702f11027"
-SRC_URI[sha256sum] = "247683a51a964cfaa6b1e92030afe9f782efebfcb550a464170b53eb94216795"
+SRC_URI[md5sum] = "cb995e4891a3c547bf133b31e4840d01"
+SRC_URI[sha256sum] = "0deb0d06e50a8a41fb00e2c3773f0793882cb9f073ae16ead887bb9681c514cd"
 
 RRECOMMENDS_${PN} += "vte-prompt"
-- 
2.21.0


