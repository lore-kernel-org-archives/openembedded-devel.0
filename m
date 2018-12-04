Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9E1726D268
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2018 17:46:31 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id z23so8661619plo.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2018 09:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BeAZJXPTT3xQk60jklJoTR4CfRkRtTi/gy4vsmfvDFE=;
	b=Ze5979A79aVQEFqJTAmEcNjZqGTvG0LGHtg4vJ9Ybtpg0FfF6FSEvSBpa27L00/GNn
	w8oDe5HD2VgxcqCZdqyHlcvv0/2UYDrph5qtLDqhjvrNmCWlfFQQcfNqLyfql/KhBgkD
	ybEJNboyBlm5Kt87hQpXUJh1MW53Qvb4PTh0f+SLxi+idRg2LCVREwDv98aPnqj604Kv
	Pi5esw2QIOn1BDUir0sMu+lE8zvBn661d54fsSEB6SIA82eSnhFdJFrnPm6eNAjg2xZ/
	JAAisccWFZYp7LApBDBKSP9ak8fpdTzPYXMowhdlRbzH4y72CDPfKcx3MNvD4V+LXd3E
	QDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BeAZJXPTT3xQk60jklJoTR4CfRkRtTi/gy4vsmfvDFE=;
	b=SQjylPYWXEbKcWjFjJd00auzDax1hYwrdx9/apHPsEY3JPOvyAh3nqHSFpumsPPW6i
	7hUQMNkjogjmTJKCGSHEy1M0iIMOyPYPqthKlUVYR86HTRPLdXqboMrFRkAzNeMUGYnE
	z7YbUeJO73UgpH5pqPB3ZN463K17KLotbhyQNJZK7OsrtoT/qqrQuU+tU/Obb3cR/it1
	LEk+8szsb1JCJ40p/8sFgEXh83+nc3EgZ6MFrs1IQuwbHo+t3d5DNlLPjVqPC/OSVyJv
	pfezh813JqKjd5BgBnCgS13ecO6L/RLwMur6dSz0x/VBQ+R+pHLz1K2fwWYj0Ig8uADy
	DPag==
X-Gm-Message-State: AA+aEWb/CMVP0NJveoazS7gwZ4q8FAP6B9dbkirw4cDnL6ondNU3EScO
	17msaoNghIt1ptHBxZMEC5FSbMJuN3w=
X-Google-Smtp-Source: AFSGD/WX5f9+j6VwHch52/+Ruva209U1bAgtq7tW24Xua1Bzqcw8slAoZD1kdCc5NMyw2FTJg7inpA==
X-Received: by 2002:a17:902:8641:: with SMTP id
	y1mr20963897plt.159.1543945592324; 
	Tue, 04 Dec 2018 09:46:32 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::5f84])
	by smtp.gmail.com with ESMTPSA id
	i62sm20503065pge.44.2018.12.04.09.46.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 09:46:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2018 09:46:18 -0800
Message-Id: <20181204174618.6271-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181204174618.6271-1-raj.khem@gmail.com>
References: <20181204174618.6271-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] packagegroup-meta-oe: Remove packages which don't build for musl
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
X-List-Received-Date: Tue, 04 Dec 2018 17:46:31 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e79d6ee217..bd4ed9c8e7 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -171,6 +171,7 @@ RDEPENDS_packagegroup-meta-oe-kernel ="\
     agent-proxy bpftool broadcom-bt-firmware cpupower \
     crash ipmitool minicoredumper oprofile \
     "
+RDEPENDS_packagegroup-meta-oe-kerne_remove_libc-musl = "bpftool crash minicoredumper"
 
 RDEPENDS_packagegroup-meta-oe-multimedia ="\
     alsa-oss audiofile cdrkit esound id3lib \
@@ -182,6 +183,7 @@ RDEPENDS_packagegroup-meta-oe-multimedia ="\
     ${@bb.utils.contains("DISTRO_FEATURES", "pulseadio bluez4", "libmikmod", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libmad faad2 mpv", "", d)} \
     "
+RDEPENDS_packagegroup-meta-oe-multimedia_remove_libc-musl = "alsa-oss"
 
 RDEPENDS_packagegroup-meta-oe-navigation ="\
     geoclue geos libspatialite proj \
@@ -246,7 +248,7 @@ RDEPENDS_packagegroup-meta-oe-test ="\
     catch2 cppunit cunit cxxtest evtest fb-test \
     fwts gtest pm-qa stress-ng testfloat \
     "
-
+RDEPENDS_packagegroup-meta-oe-test_remove_libc-musl = "pm-qa"
 RDEPENDS_packagegroup-meta-oe-test_remove_arm = "fwts"
 RDEPENDS_packagegroup-meta-oe-test_remove_mipsarch = "fwts"
 RDEPENDS_packagegroup-meta-oe-test_remove_powerpc = "fwts"
-- 
2.19.2


