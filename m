Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id D15E077D85
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:09 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u18so5830865wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=mQQrVQL7cSAc8Bq4rXZD+xk3bZiiaNvqneYydg6MoYg=;
	b=BjwV0TYbZGzA1wgLLEKRJzY4EtMgXH8KPArSITZjGh4Sqlltm/Z/sfzII9hj0o+f6Z
	Js2+LBRX0xh8a0RA5b1bR6bDCh5ZQR814+sRrSp0Qhy/VNINnXetQxzRLaJOydWM/EaQ
	59OyN+r7/A2pxESY/4TSVdAv0MHmeCg1uQXCIOxbDoz3h8aZixQwn3ou7WC8LtQt49Qc
	GpViU+abt2ax2FLe8Jo2JaEj+i1nKPol6q1irr28/YEwq6R9uxAcAkQFxU74/HvEGxZ1
	w7l+UuQSGCffJe2LZF4OEbaImQzKldcL4JOFrAC4FFkiRvPDoxFLLphpH0ihsfmuGYo5
	1q/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mQQrVQL7cSAc8Bq4rXZD+xk3bZiiaNvqneYydg6MoYg=;
	b=HUMc6JMfDjq/FJ41/xEj3CZz8jI6U8OwlLBFo3Mca0C6rtZ3+vet0VVCYGG9adzy3u
	7HRB1HH0RNr7zNY9OaN86jvUBooWMGq7uw096axzcAmvOUq6tOCjBWbfgLMqnq6StMlQ
	uB2094g0Ra0ULgea9FwcwLx3VGO4igVUzwSgCj1P3SP37JkGRIQ/2oTsHutAkmR+ty1b
	P6SIckvfAxAX1gzdYv4sD9uLA4Vb8k3frr9p31Ymvcg6S9kXsy/zRqGg6/uGg9a6Frw7
	yNbpgrDpeSzCicv3p0BGKLbhgpaiUgss0RO9QqY5+QhTN8QS0SInVvfDLov9t70mFsfI
	NLrA==
X-Gm-Message-State: AN3rC/68lqRrs7DVhX0wGqr8vgjmL/QNaurZHVjaBSrSE9AWUA7Ff5FufOUNmv9oh71piw==
X-Received: by 10.223.138.199 with SMTP id z7mr4873817wrz.66.1492027030893;
	Wed, 12 Apr 2017 12:57:10 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:30 +0200
Message-Id: <20170412195638.3243-22-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 21/29] network-manager-applet: update 1.4.2 -> 1.4.4
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...etwork-manager-applet_1.4.2.bb => network-manager-applet_1.4.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.4.2.bb => network-manager-applet_1.4.4.bb} (84%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.2.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb
similarity index 84%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.2.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb
index e8c3dd6..5ad1070 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.2.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb
@@ -11,8 +11,8 @@ inherit gnomebase gsettings gtk-icon-cache gobject-introspection
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "35684ee788d8d1d6f913c63bb0ada0cf"
-SRC_URI[archive.sha256sum] = "431b7b4876638c6a537c8bf9c91a9250532b3d960b22b056df554695a81e4499"
+SRC_URI[archive.md5sum] = "3f82cedc4703df0277c76d9feb5bf2c8"
+SRC_URI[archive.sha256sum] = "693846eeae0986e79eb1cedfbc499f132f27a9976ef189a0f16938ac59ec3226"
 
 PACKAGECONFIG[modemmanager] = "--with-wwan,--without-wwan,modemmanager"
 PACKAGECONFIG ??= ""
-- 
2.9.3


