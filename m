Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B1A8B75299
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 16:14:27 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l1-v6so5377709wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 09:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1Vz0ZHKFCMHIgWmVdYzaRUHwbYl48a9+TWMfRZvgFXU=;
	b=Q0vTLV/n22x/9mh0kp/GEp9bRSF2n5igywBKLmLpYE/KIEsaeINTeDllZ+qk/U+E+R
	m3+pkme/zkZsugL9jXszBRtXJVFYDyb8YqBSkAeneDStZ3bQCHaHnWViUXG3Lzu5rKsD
	KdnLaVTAAPrIN0mGHoJIt3lBvB4uCt6EnJrn5+RFq+X88p5HxJXi8jao10I65+wRMhhP
	/h0Bb5RPvemX58nkiVoMtvzEKp0h5bDZeMFZHEzk1A9foePJcMJptFHjWIU/scjVjz8Y
	AKnLPL3ti9u+7Y5IyBuu/fk3CA9ElhKBWHrdTgR3pjfjWiGMDUPsLSBSH+Ov/dGbLBh1
	4vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1Vz0ZHKFCMHIgWmVdYzaRUHwbYl48a9+TWMfRZvgFXU=;
	b=k6ms5VH/Kf+H/fsWrCPV95Iw+XizO+vYfADA8JxYhMGw/5F/f7xnfsnnxsHOQneEq2
	ZoNn4Bmd1DhyT7DqNE0Fk8cNtnXFUm6MPBt68WvoC0eXZLkKWXDJX2P8UVZSFGZ4C4j5
	QZKUgGQDsc4auUI1rxzgLbsXXrPpjFFanobIquZDZk+9GcwSmpDIL7+ojpU0bSQCIZEy
	h7XIKAkv+arnFeICSwIwL1IF/HbRim6gtQQv7C3z7bth9mUO4r0+tBhik6IMsBol1xRH
	yIcILCgtpLM+NJ28nd4H/owiK9oSsHYo3kjkT7KTfCvGoEpsAkU2iVZRVpJ4zFRHH7Bn
	Kftg==
X-Gm-Message-State: ALKqPwcIDY9OKmFfBB/afYSgQo+UuD84R3FJjfPbzY6ZVBYibgyfEjwQ
	HeEsuHHfAdrYDS1AJ3RJ/66Khg==
X-Google-Smtp-Source: AB8JxZrRsPm+K4yWS1+T7XuFfCWmZMtpulhpPFlqjk9k5nk9qfpzAIhtSw54EYC5BzYDFNCqQBqGtg==
X-Received: by 2002:a1c:3f56:: with SMTP id
	m83-v6mr1780576wma.88.1525968867638; 
	Thu, 10 May 2018 09:14:27 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC0732689B6120586BBC15E.dip0.t-ipconnect.de.
	[2003:f0:7bc0:7326:89b6:1205:86bb:c15e])
	by smtp.gmail.com with ESMTPSA id
	f143-v6sm1679595wme.43.2018.05.10.09.14.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 May 2018 09:14:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 May 2018 18:14:12 +0200
Message-Id: <20180510161415.12827-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180510161415.12827-1-schnitzeltony@gmail.com>
References: <20180510161415.12827-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] xfce4-whiskermenu-plugin: update 2.1.6 -> 2.1.7
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
X-List-Received-Date: Thu, 10 May 2018 16:14:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-whiskermenu-plugin_2.1.6.bb => xfce4-whiskermenu-plugin_2.1.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.6.bb => xfce4-whiskermenu-plugin_2.1.7.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.6.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.7.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.6.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.7.bb
index 762cff0f6..f0780c701 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.6.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "b2b2bacc8d5f3c3119a0f317b6074276"
-SRC_URI[sha256sum] = "8b2a8ee1445df39a2cda139e353f2e9ec3720a780296dc41b7d4aebde57371fc"
+SRC_URI[md5sum] = "5cdaaf5799c3f976e8cee81ed24c7fe7"
+SRC_URI[sha256sum] = "045c48bbe6fba62a46c2752a9eb3533f03bdd29dd23af29208622b79eb045e39"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.14.3


