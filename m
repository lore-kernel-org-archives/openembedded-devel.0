Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1385874FAD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 20:27:43 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id s12-v6so10607404wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 13:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=usBAA/Am+025dsBISle24IfMekL7t/CP3QvA9n0EqME=;
	b=YVHNSmjjXWp35ke71LKryg0wXusSDlD8uGdvpfe8sjL6+iFu5EWClU770I1MZ2fZev
	gN8qGEIBw+62jf8dVOMQkOUZ6ZZmqG0GcS+JtvO4iAyqosJ4iWsiVxtJZIzg12pbjsHN
	VVz6BG2M5uYa5SsUU+SBwnBGHp4FXG/LiGpbBug5CFAiypODm+pua00HXMTXFkHNn5+F
	f6mwe8MLZX0CGlmfEGHpVXhBqfd2k2ODP6JSQu6x9al2YLDel7Cptj8mS52QuYwmKPV2
	WmyX+8gNogWCuO+WTddKRMHGeK1vSB8+n9Z6b8yfrgO9W3NiTaQF+HNCPifRHqBtJ/I5
	ubJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=usBAA/Am+025dsBISle24IfMekL7t/CP3QvA9n0EqME=;
	b=jwDJY8ivkdQh+xveDuLaivmo2GEO7BELBQb5gR0JjbR+PtqIBmoJsIQ+VP14zTEnfS
	jPg+HqWIQnS+fRqmGkI9CCwoUoprai8IXkghNWALrjHWPcDU1iide0/WNbMruAyi1NJY
	Y8/NFTl2TEiZh5D3RVbY1uLcD6ycqD+UIDEKmpgTfcjUMupaHoXZg/oMBlTq7SlmeC0E
	Necya7YFHL6fy+0UWSh6t/seO4O80vdaUnxuiykE7+hG6eJsE75BUwRwDdJE1rHHSr1+
	bupuWBFoWO4RxUuxyRzcbUapmY44wtPQib6atqHrV1+0XCDXb8fEjcy8cZy+C2BXx5JF
	ha+g==
X-Gm-Message-State: AOUpUlHRVRSt+mvbhAPCtyK/cvBFw/FYPiRXq3zCk8VFgxYRGeNKP4BT
	dC0WHF7zbHiDeoJga3hjdqJBAi1R
X-Google-Smtp-Source: AA+uWPyQaLoPxwY1FF3eH3kPzpCwjgNJtRNYGXx0Oq+25eXfhKdzi9JGr1pcf8NN06zsvzyotFv30w==
X-Received: by 2002:a1c:1314:: with SMTP id
	20-v6mr21298186wmt.55.1534624064664; 
	Sat, 18 Aug 2018 13:27:44 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g133-v6sm8323692wmf.44.2018.08.18.13.27.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 18 Aug 2018 13:27:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Aug 2018 20:27:42 +0000
Message-Id: <20180818202742.5967-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] snort: add dependency on bison-native
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
X-List-Received-Date: Sat, 18 Aug 2018 20:27:44 -0000

* fixes:
   ERROR!  bison not found.
   Get it from http://www.gnu.org/software/bison/
   (You may also try byacc or yacc instead.)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
index fdf41bfbda..22f52b55f0 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
@@ -4,7 +4,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
 
-DEPENDS = "xz libpcap libpcre daq libdnet util-linux daq-native libtirpc"
+DEPENDS = "xz libpcap libpcre daq libdnet util-linux daq-native libtirpc bison-native"
 
 SRC_URI = "https://www.snort.org/downloads/snort/${BP}.tar.gz \
     file://snort.init \
-- 
2.17.1


