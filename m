Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2F88D600BC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:28:08 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id r16-v6so4964524wrt.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=CM0xu6ARuUtS76omCqicdSDzOYZhL2B7UGG2r9vxSiw=;
	b=n4zmbt4400/oeVy6cUJFOLrShewiABvQYZ+y3/hpsXhWBCC1XRhALi7I3NKYOsLwdh
	JeYe1CL3jyxzIing66r/XzfEFUBH+zK7i+7/QkdKFkPL0dly9aSDnsLIhk8CUMY9cqnO
	wyUqDKIjjCzr6gFFznjeLLb/skfXCXk4djZ30mw5TzVQqgh/GgTAWSWiRmlxAwHb5h0k
	XvT0pdtlGSbYqVf0NA27Fwu5rTb9rUQgwQpmc7qbB9rBUHGE+KrwJ4C5D7cVQf7oRZhv
	vGrF1itXhZHFk0v5i2EW+aYMxFKwxmwUdGdm6ek1tD6cweap2zzSOr1BfbV3H5h9SoTc
	L51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CM0xu6ARuUtS76omCqicdSDzOYZhL2B7UGG2r9vxSiw=;
	b=tDhtyhf5EYu3rfBdgOnIzWqcWUjc8mNQz0Yh7Jh4rkOqF9rlUAfWSlkEhaf16J8mmM
	mzflcdoS8pMRVwhmKQoTK3eOimM+YOR/cbG5mi+U7ixxRWQBvbGc5iazYcI9XAnKfxwR
	DpwofvfMJpQF95xTHjFkKLlt5y55S0HELSf7DIXxf1hfFahz6m1QGRp/RsDrb/x2sLzX
	qdxQyueTjSVMOl8bM/T2CBDs+dDbdrx93TOGZ9nFl9Cb5cjCbQVoseqCD3AjrFjl3kf0
	3RrNTEEr5dK9LZQ5QmxKPMuKw0bf1WjXdCkU1s3R7XblPCyw8OvywqyRE+xlLWK+rUZy
	sk0g==
X-Gm-Message-State: AOUpUlFCcFbiyPDUs1IrGeAdXiEC+h1rR3cgtGWsbUNHijJfrOIvmjT4
	riBZIGh/KERHBgmO7ITVIRaYT7En
X-Google-Smtp-Source: AA+uWPwSbpjqxZmwmcRuIB14lGVwt7jx8qgnAqFeO5xUuWtP3Xo1an2zZxCqs1TJCe3GT9h2AReTwA==
X-Received: by 2002:adf:c383:: with SMTP id
	p3-v6mr21068194wrf.68.1534444088599; 
	Thu, 16 Aug 2018 11:28:08 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.28.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:28:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:44 +0200
Message-Id: <20180816182748.2400-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/16] xfce4-screenshooter: upgrade 1.9.2 -> 1.9.3
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
X-List-Received-Date: Thu, 16 Aug 2018 18:28:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-screenshooter_1.9.2.bb => xfce4-screenshooter_1.9.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.9.2.bb => xfce4-screenshooter_1.9.3.bb} (80%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.2.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.3.bb
similarity index 80%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.2.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.3.bb
index ba77127e1..c6a4cdb9a 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.3.bb
@@ -7,8 +7,8 @@ DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "901b2c1fb1dd30940c94aaea3e35c540"
-SRC_URI[sha256sum] = "904f3a61417ace55a3b144187565335f8ad5e530ca23b397ce90ed61708c6091"
+SRC_URI[md5sum] = "f783eb575e2015f39e1c1aae499b113f"
+SRC_URI[sha256sum] = "364ebddc4c9971b4023aa8019d4e3bd08f091b65dc98b218beb55851f69ceda2"
 
 do_compile_prepend() {
     mkdir -p lib
-- 
2.14.4


