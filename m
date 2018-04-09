Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id CA4867484B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 22:03:20 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id n2so11019698wrj.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 15:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=lRfXKsJUn8yV72ICkdBGmOcxuRcmTn/0SfVRemSh92g=;
	b=oLx9iPY+pItxbIfKNUoEFNg095j7R/ucFN9FHLlQ/ywIiHJCSKJqFaPi9usHU26uMc
	F5WWLLeqRI/p5llTQgq76e+iwPZbX8fOSJ/T4f9uJu/sPg+O9CoIrcWnPGYZKPNF2oTn
	D3lqCVON/3zGsVyf11K0AdbwKb89BQcRsQRnRFwDCNbD2uTjXAaxZcPH9WjWYCcD+8ul
	XRFKeEaW5ZE3I25DMspaiqvfjHn+OQvb0gd4dot0Fa68SAid4miCsSqbGLFP3nKkUn5J
	hyUFfvjMZXXaT5iE/pTj1VoLURyXJKExRvd3OHu+8w9wbvKFoTrRqP2zn48fqSWigTNZ
	8HdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lRfXKsJUn8yV72ICkdBGmOcxuRcmTn/0SfVRemSh92g=;
	b=gUxu/XQITl0Bd/+mbI1bJxf4qEhiqtm38VnDmXgw5kI/YbQ5SsEQI6heMLyXi5VOGZ
	/6Tu61+Oen2aKjl3J5F4wF3qgtRUa5vZqfjEYf72X3B1tg9LI7Orhf5o1Q9PuqgUGmmT
	QBzPB0SdN3Sp+G1GjifBUD2PkYDvnDqeCew9JF1Mnsp7pnLAUFEurjNP5WGXe/3gGKt5
	sQgnYbZMIAhiJtO0PO6/sOdoEUy8lbOLXgJrDPVR1fFrezr6bZyUzGMyO/7KABv3BHeS
	RuuwWFx/D0I5R4lS6cG/1LxWaatQFhSS8gck4MNBzpKSoqneb/EM2bNFVk6b++A27wDL
	Fq/Q==
X-Gm-Message-State: AElRT7GIyDr8R4vWc/Idhmfm87G6v8V9ksBKdp9vPwoBIrrH8ZfAPw71
	plsdH06P/86rdaVnz1dUtF9ySA==
X-Google-Smtp-Source: AIpwx4+HXSBq+i7biMXf/lir3CJ3pCPsn26YdlvWswZztHd0KOxhB2KZ0TAWlQ5FUAGpBgK8urMvVw==
X-Received: by 10.223.219.16 with SMTP id s16mr29954340wri.123.1523311400887; 
	Mon, 09 Apr 2018 15:03:20 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC14F231E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:4f23:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g185sm650954wmf.40.2018.04.09.15.03.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Apr 2018 15:03:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2018 00:02:47 +0200
Message-Id: <20180409220249.11796-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180409220249.11796-1-schnitzeltony@gmail.com>
References: <20180409220249.11796-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] xfce4-terminal: update 0.8.7.2 -> 0.8.7.3
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
X-List-Received-Date: Mon, 09 Apr 2018 22:03:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-terminal_0.8.7.2.bb => xfce4-terminal_0.8.7.3.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.7.2.bb => xfce4-terminal_0.8.7.3.bb} (68%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.2.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.3.bb
similarity index 68%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.2.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.3.bb
index 26bdf59aa..7630abc6b 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.3.bb
@@ -8,5 +8,5 @@ inherit xfce-app
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "2a812438aeeb3d76e3d8d790817456bd"
-SRC_URI[sha256sum] = "a91fcbb89cab7987abc5d42e32d7ad62d2bf07656e30773eb274c7f087017bf3"
+SRC_URI[md5sum] = "f014d613438848b452f1f9eecbf7027d"
+SRC_URI[sha256sum] = "dafa155177934fc7dce2d4efb33402f74b1a593a17ff17d2187a6429f599dfd6"
-- 
2.14.3


