Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id C7B067FC99
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 18:55:41 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id c23so882666plz.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 10:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qr3g1aZ/1lhoWPqQ9dNsuZUpuxyrQ85eaWtlb72cYvc=;
	b=K5ocq8SpFNd6LH6l0EH1KlnCgdFkLfq8UtT9n4CW1ZEVhw4DsOfSYE+FDVllOzDCTF
	DyMlyZyP6ezuNQg7+UXU+n6xDtGWyQzYTMCXCKo2zBFCElZumr5Muzn/lAcybpXQaEVh
	69wlTEN5uq6Butrp4Xo45m3Nu1k2cCHijuWRb6+av09Kw6Qhlmhr+hYyXYHZxBr22WQi
	q3IPvKj9Emg4jwf/HJdVzhzgZjTbUc2IJA5hWfEHD6Zg/whCLL3jfPhz7fcKGNBNxbk2
	WF8Nkj0ecrtI2FZFVFP0AYbRVBTMSHKvh2DcXkZsaaeuf6CFE+xlwFL1VZ/DMPxTpsZq
	FIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qr3g1aZ/1lhoWPqQ9dNsuZUpuxyrQ85eaWtlb72cYvc=;
	b=BAaZjzmhss1F46Bma53/7SiP0oBKdeZcEUghCUctWSGzPLBlvj6N2ZGoadHtty/WFu
	14W7aSmE+uRoOpi+WZcee1infUswBrfxeO3+4leVWbonr85BwLcKQPLxZwK/HNs7XUl5
	EL8kw6hKI7jmgd/+afm634JXkHZinoy3U2aysm61GYFVSzcQPfZsVnnaCLg3lhf/xe74
	5tP/TsKeYk9Q6QBLJP60hoMzvKXRClvF1l87cpNLQ8BtDRbxLiq0ZDCCtt91dgMbMHwl
	fGj6BWB0vtHrTn+iv6Pqof6f8fHqJgY3BRbm3XEhp7YiVdi5KoGU6Cn1ndebX01/SFA2
	JiLw==
X-Gm-Message-State: APjAAAWQtiA7mfzpifsbW5B9azVY5MXXEXxXT3wM7DRwmTS7aslcB+vK
	e0nXELxzpbvqS0a0p2vxTXBmGwdMC4M=
X-Google-Smtp-Source: APXvYqz3loIh5Xw3R7LyEZiQKOXQyxm38W2viAME83rXtOFgjyvH1U/ad2Vz+ZSMYTVjuMvU4TnnaA==
X-Received: by 2002:a17:90a:fe02:: with SMTP id
	ck2mr590181pjb.10.1575917741944; 
	Mon, 09 Dec 2019 10:55:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id j14sm279360pgs.57.2019.12.09.10.55.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 10:55:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 10:55:27 -0800
Message-Id: <20191209185527.208054-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [meta-multimedia][PATCH] libdc1394: Update to 2.2.6 release
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
X-List-Received-Date: Mon, 09 Dec 2019 18:55:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use tarball fetcher and drop autotools-brokensep

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{libdc1394_git.bb => libdc1394_2.2.6.bb}        | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)
 rename meta-multimedia/recipes-multimedia/libdc1394/{libdc1394_git.bb => libdc1394_2.2.6.bb} (75%)

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb
similarity index 75%
rename from meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
rename to meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb
index 3b3ac83e25..c9ade4ac99 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb
@@ -11,16 +11,11 @@ DEPENDS += "libusb1 libraw1394 libsdl \
             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'libglu', '', d)} \
 "
 
-PV = "2.2.5+gitr${SRCPV}"
-
-SRCREV = "5e78f51936fd09db0c0f742c7d2c0e5bdbbeed56"
-
-SRC_URI = "git://git.code.sf.net/p/libdc1394/code;branch=master;protocol=git \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://install_examples.patch \
           "
-
-S = "${WORKDIR}/git/${BPN}"
-
-inherit autotools-brokensep pkgconfig
+SRC_URI[md5sum] = "9fad67bbff08fe2818d5ec81802ec89f"
+SRC_URI[sha256sum] = "2b905fc9aa4eec6bdcf6a2ae5f5ba021232739f5be047dec8fe8dd6049c10fed"
+inherit autotools pkgconfig
 
 EXTRA_OECONF += "--disable-doxygen-doc --disable-examples"
-- 
2.24.0


