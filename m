Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D86BB788D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:02:11 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id h21so15133913wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VuxdWdNta5NKZ4ZeVrpvg9AKjDX2O/fZaW4DaKar+FM=;
	b=IBxODQ8AVkyLzfTKU2ndxyr+QC1sRlUPgc/bBJZK/P4P/VAW2lydMxfFQXwsU+T/bt
	W8woLVgAAlJdemD9412mTP+EnAopWuHJMyXUC78LVhqMt3jtokU4g3HMTAuXZKUlYOe7
	Ogg0/CU79OQfP4vhmo6NXq61/FTfCewYTBfTd9EfUFSZemMDnhOYmy6RnfCsYIQA12Oc
	BdE+2kB4n/AgBHbu5Fko45jTkxmAQTHbrypymGqBREttk1R1JfJ1GPG3HJf9AgeDfzx8
	hYg3Kfeo8OuDHRvEf3g+2kc+Iw4UFFLkj7ml5wYYr3HYQB7a3wMkxyqpTvxP1UUNtKjN
	Fkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VuxdWdNta5NKZ4ZeVrpvg9AKjDX2O/fZaW4DaKar+FM=;
	b=UuRLEqGldUobHh+dlx5DRacQY4VnTJeRPt7gxOyTHx+dYuZnGkDZn33nXqe06fZE0H
	OagsHcJUZFBrf8ccjkwKr1zaZg3N6ouzEaQdKeOZsAiJVbhpPI6iKw5XIyHoLZwouNUQ
	q/JT/l09oe37bMsg94Ui61+ySxinvDRyDOZ1jmFwStHuPj1qQ42qUNx1hXcmFlRWJtHE
	D1tQOuR0lfWK6SYJrKAmoiqf9dIXZ48y3X/7bMbu8vYBz0ZICVRZlwof+6wmhPnhv2vm
	Wg0WEITfj8KjiKWp+USK8yPlILTWEsd5OLIkj7qeGaBlq6EXIVT5agmBTB/x8KjePkNX
	/uHA==
X-Gm-Message-State: AElRT7FPCrwd9WxK5SQIzXBSfD4OWmBeP7hCG4Z68YiCbcdJLjJwYVZs
	EcpM6Hxtw/FJg8jGP9qOEhbNiA==
X-Google-Smtp-Source: AG47ELsvF/e3IXp1+K/LDr4JxiEIgS2CyU/JD77RqKHDi6qq+d71vflYAQmSeABjMn2ki1ZMh6DI+Q==
X-Received: by 10.28.64.193 with SMTP id n184mr2446071wma.4.1519945332732;
	Thu, 01 Mar 2018 15:02:12 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC063001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:6300:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 8sm5490wmf.13.2018.03.01.15.02.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 15:02:12 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 00:01:47 +0100
Message-Id: <20180301230148.2284-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301230148.2284-1-schnitzeltony@gmail.com>
References: <20180301230148.2284-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/12] xfce4-pulseaudio-plugin: update 0.3.4 -> 0.3.5
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
X-List-Received-Date: Thu, 01 Mar 2018 23:02:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...e4-pulseaudio-plugin_0.3.4.bb => xfce4-pulseaudio-plugin_0.3.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.3.4.bb => xfce4-pulseaudio-plugin_0.3.5.bb} (73%)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.4.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.5.bb
similarity index 73%
rename from meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.4.bb
rename to meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.5.bb
index 32032a26a..a1d60c527 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.4.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.5.bb
@@ -8,8 +8,8 @@ REQUIRED_DISTRO_FEATURES = "pulseaudio x11"
 
 DEPENDS += "pulseaudio"
 
-SRC_URI[md5sum] = "05633b8776dd3dcd4cda8580613644c3"
-SRC_URI[sha256sum] = "43fa39400eccab1f3980064f42dde76f5cf4546a6ea0a5dc5c4c5b9ed2a01220"
+SRC_URI[md5sum] = "30cd40be36895c4ced48c2433ff440c4"
+SRC_URI[sha256sum] = "25e7bc414edf6e16140c31ca4e7dcedd4e17d40ea23a2921beb799fed11a99bb"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libnotify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
2.14.3


