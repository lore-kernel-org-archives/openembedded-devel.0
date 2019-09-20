Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id EE29A7FA68
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 14:03:02 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id i1so6896244wro.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 07:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iNnrvXRs/0+808zvs0QOQycGQQ2Ix83oe6metS+HHVo=;
	b=bUsUgCWK7VXoL/jwsQOncL3FB4hbNY7xw5aQMbwYAUYGmAxjEZRf7GLPu/qvc3avHK
	SUQ3T/0PwRywWFfvVAK61cflDvtbIUTOzC630HEzcFtH3jMCTEBGHEXoviUWZhayl9wo
	b79im+AIwrEyUjwoB9C8+PwbF+EfDnWDK0Q9l6M/fSCwJB5fV1vZ/a8YXSTm5tKOt/aJ
	JctSlLgHsUylnIE+iUTU6UPLKdjMYk5g6RNONwssF9J8N4GCeLJVv9MgXDJbae+KJKKx
	l4fh9BsKJJIYEGWY8E38fCCKjkrYGqn9yiPFvlNSOg2/b2flNUYZMwjCQZ8B/rtQsksW
	TBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iNnrvXRs/0+808zvs0QOQycGQQ2Ix83oe6metS+HHVo=;
	b=DG6Rd3StIcxu9Od3q5u9DSZdl8bzpdjJ5yrkqQOY8hBzyo5wVrLCyT1qhhNoqqv6TR
	yCpVwkhdd+WdonXMY11YgJi8VoU5e3uZLsOyY2t7YFy1ekPbd3DQGcwENng07Eecq160
	D/4SNybeQhAZObV0yoNlNqlYu+NKtA3Su5ykDxL2DtxQb5I7i7YnsgyUn6EkwP6j8GN+
	Cc1U73Ktla0rKeHHcMHCCsaJ8rf+vg3HzQN/qA4tvqEp4uERM4SWraqiHs4Ogz4WEcRL
	wqhJm5OQZGNk8J7FSF20z8cOKsneHHQ4qIH1pXG01uQfedJeROQWuPZbC9izCYnV9Kf2
	Nuzg==
X-Gm-Message-State: APjAAAW5gnN35/OGIhe9WLTTbl0juf+nTuqWRgyy+Zn6wyDeu4Kvf22u
	iQ4EplYfyi34GAFZgc4Zit3PnlAxiQY=
X-Google-Smtp-Source: APXvYqyzkIB0zTKYUNlwPqg0G/MJLwtu0ROdqQDE2spuHKYdWCmu+ZBduZOu5U23Nutwegg6h1OrZw==
X-Received: by 2002:adf:e591:: with SMTP id l17mr12535697wrm.199.1568988183267;
	Fri, 20 Sep 2019 07:03:03 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.215.101.3])
	by smtp.gmail.com with ESMTPSA id
	f186sm2338132wmg.21.2019.09.20.07.03.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Sep 2019 07:03:02 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
X-Google-Original-From: Vincent Prince
	<vincent.prince.external@saftbatteries.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Fri, 20 Sep 2019 16:02:41 +0200
Message-Id: <1568988163-30013-3-git-send-email-vincent.prince.external@saftbatteries.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568988163-30013-1-git-send-email-vincent.prince.external@saftbatteries.com>
References: <1568805952-19822-1-git-send-email-vincent.prince.external@saftbatteries.com>
	<1568988163-30013-1-git-send-email-vincent.prince.external@saftbatteries.com>
Cc: Vincent Prince <vincent.prince.external@saftbatteries.com>
Subject: [meta-oe] [PATCH v2 2/4] python3-cheetah: add recipe
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
X-List-Received-Date: Fri, 20 Sep 2019 14:03:03 -0000

Signed-off-by: Vincent Prince <vincent.prince.external@saftbatteries.com>
---
 .../recipes-devtools/python/python3-cheetah_3.2.3.bb      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cheetah_3.2.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.3.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.3.bb
new file mode 100644
index 0000000..52e8576
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.3.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Python template engine and code generation tool"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=15e13a4ed0e5880e3e55ec88b0921181"
+
+PYPI_PACKAGE = "Cheetah3"
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "python3-pickle python3-pprint"
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI[md5sum] = "5629445e7fef9659da2b49e36aacdbff"
+SRC_URI[sha256sum] = "7c450bce04a82d34cf6d48992c736c2048246cbc00f7b4903a39cf9a8ea3990c"
+
-- 
2.7.4


