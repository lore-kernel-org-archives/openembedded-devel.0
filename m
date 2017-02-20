Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id F1CB171D9C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:28 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id q39so12810384wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KDjUyn4vrnpjr8P/6kyX6g/bOvUC2IE3/5LRXJHsztw=;
	b=SKDlhi0SRMz1gpxZGLk/dlM4Y3wbbanD8VZkpDtO9K5FQEveQQb0PI55wNWUyLW9QV
	OKhHOVuZ6uNPlp2BIgNSBXKgejSc1ntMZp9MlEhRyToi29ATAUf6F2yRvfU9VD64FT3a
	LiI3TnnfKq5ibRBLe2NUSJFtaQCtU3QchOHQGrdpHe1aHn8OMVXN1ylo1tAml5LI8PbK
	oLOMF4y43BthsB+pkck0ilTAIN5mxjwXqfQZk5iEu/+RZeMokU0zAXD7vEuLSYmehBsG
	UEbg69Pie5Lvgg2RTRzyxvAvO9MMwzw890aphMbMTUWvRZ41w9pSsS4Xks59MpPv4lt6
	7K2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KDjUyn4vrnpjr8P/6kyX6g/bOvUC2IE3/5LRXJHsztw=;
	b=QpCpnypQWKxd2rqQZXVT3KwV0q/1NjWXf1J5u0azdyZvSx3L50gv22ZHlwcaWpTjsO
	tYGO/8hVPERDxqbySQzhIBpGUjSPwH9VJP95DYUhfY6Bj0m/bljKULHsGrHohlzKEI99
	2jXErWiO9vmuq0TwYSvF38zuYwFYkvgleZoeK6h1BshA8prqrRgpp9HlwsrBg5L2LtZ7
	MYM7RuQPeptC6f0esxNYyCCrqe0pwk5doyiKnBp3+NIy3GUiVI8AaKKpI9kgxntagLXL
	LXgQvDg2jR0y2sDT0dSOeNlCLDU7NZR0cvjnKDXVslx+RniK7bSk4lZazjfeOg4qSuR+
	FOTg==
X-Gm-Message-State: AMke39l+FSkEsc+cD+0EraX6KtI6bW3JJtVlPdDMAsg52GbaiKoOW1SMVhz+ZuGOvLXcfg==
X-Received: by 10.223.173.148 with SMTP id w20mr14250246wrc.164.1487614048799; 
	Mon, 20 Feb 2017 10:07:28 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:29 +0100
Message-Id: <20170220180700.29836-14-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 13/44] xfce4-mpc-plugin: unblacklist - all dependencies are back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb   | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb
index 105302e..f709e4d 100644
--- a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb
+++ b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb
@@ -13,9 +13,3 @@ RRECOMMENDS_${PN} = "mpd"
 
 SRC_URI[md5sum] = "13d5d95ef0c305bac45fde6231258e5d"
 SRC_URI[sha256sum] = "f1320916ae3112e6825699652a502cebfa78bb006c649b42d3d331dfe57b6cb0"
-
-PNBLACKLIST[xfce4-mpc-plugin] ?= "Runtime depends on blacklisted mpd"
-
-PNBLACKLIST[xfce4-mpc-plugin] ?= "Runtime depends on blacklisted xfce4-mpc-plugin"
-
-PNBLACKLIST[xfce4-mpc-plugin] ?= "Runtime depends on blacklisted xfce4-mpc-plugin-dev"
-- 
2.9.3


