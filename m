Return-Path: <ticotimo@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id A1A247FD4D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 05:03:21 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id 62so829674pfu.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 21:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4NwebRaR6TvXYWd/waHj/IRJrs1NlbfX8UyKv7C/vyE=;
	b=GMy/qc9yGWCsUeixdJzr54jopC7783kaYqJ+vywvgfaSb9n85Ji4dOwSwug3LnnK73
	PZKOV3d1pleJleCmEvzDR3ez9aHavn2uvm4e+irrIk27sZjIhFdDdQIRRCi/cvQd84av
	nnaHdHhibfvMHpfPyXsBXrS0y2q/lou/YnzG+QP+F6QVGTfWDZueD3a9gN0UNgFPcwUQ
	hFMGpCD1Wl36Z+tCaEfhb1ti9XXJe/NNQ6UX/yD75KmtCgE9JjSagJZuv8hcNkzqS3wF
	7fae0VmEv6OPCBFURVTsb4utJ3EoSvHL8CzJvfDqLwqNPKIaEYviIDntUBJKtq86xtJL
	yZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4NwebRaR6TvXYWd/waHj/IRJrs1NlbfX8UyKv7C/vyE=;
	b=oMZ8gsw1OeONKpy8+ViwloUrVkYSBZG9u1KFj9IUr8kUlR0AEW44OIuTlQsZjSJMKR
	qltMctOOYG1aAECq+UFyfIz3NXeNrwmy/W7Vj0LTzS5icJ8TPCzMK7LLTLD5PkypSksj
	jYhXMXqTN8Qp5LsF+vyNuft7ZDK9yItAUhyj5jESJCAc1Q9XmE2vUKZ9HiHBb3l9dKrd
	Jdlum1U1MILgn+1x+s1ELCQAPnoyElyBF1nm6/dQJapy1BAQVDTHhJqL+XnHEB5/Mk49
	Ll2NDJ2Lgnvudf56YFFAb29ObqlEmpRjzhEg5rUoDjq4QSNpPurZ4X67h6yerHLsQTdN
	dOyw==
X-Gm-Message-State: APjAAAVwB4hOSQ/TCSPTlUaZZzRjqU9YPB7iV7Ar+FyVfaj6ddT3l9Rr
	SJrezGAbBczMW5CO9XPjVpmu2RHdeOFuKw==
X-Google-Smtp-Source: APXvYqxS2mMO9XbS80Ozzb4/dP774ueRYRJGWgP213bkISVHg4NUgZIKYg1i9zi4zNxd00Fuy0tsSw==
X-Received: by 2002:aa7:9af1:: with SMTP id y17mr2745731pfp.21.1579583002385; 
	Mon, 20 Jan 2020 21:03:22 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:7c96:1b52:3429:d935])
	by smtp.gmail.com with ESMTPSA id
	y62sm43387877pfg.45.2020.01.20.21.03.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 21:03:21 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jan 2020 21:02:56 -0800
Message-Id: <20200121050257.16561-3-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200121050257.16561-1-ticotimo@gmail.com>
References: <20200121050257.16561-1-ticotimo@gmail.com>
MIME-Version: 1.0
Subject: [meta-python2][PATCH 3/4] python-pymisp: upgrade 2.4.117.2 -> 2.4.119.1
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
X-List-Received-Date: Tue, 21 Jan 2020 05:03:21 -0000
Content-Transfer-Encoding: 8bit

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

(From meta-openembedded commit: e020ebfdf2c65181829e180f6797ef6d7fa856e5)

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 ...{python-pymisp_2.4.117.2.bb => python-pymisp_2.4.119.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-devtools/python/{python-pymisp_2.4.117.2.bb => python-pymisp_2.4.119.1.bb} (80%)

diff --git a/recipes-devtools/python/python-pymisp_2.4.117.2.bb b/recipes-devtools/python/python-pymisp_2.4.119.1.bb
similarity index 80%
rename from recipes-devtools/python/python-pymisp_2.4.117.2.bb
rename to recipes-devtools/python/python-pymisp_2.4.119.1.bb
index ad1d1642..097328a4 100644
--- a/recipes-devtools/python/python-pymisp_2.4.117.2.bb
+++ b/recipes-devtools/python/python-pymisp_2.4.119.1.bb
@@ -8,8 +8,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "77aef367e57ba7dcc6f9b3d445a960ed"
-SRC_URI[sha256sum] = "de67196f6a8916b9c52a84a1c45ea967c53fa9d2b3795b070ad2c1cbc28d79d7"
+SRC_URI[md5sum] = "57184785340e25469e4a80ff9ddce09e"
+SRC_URI[sha256sum] = "594ea0a9e150052232425009eac6dd104a80f494d0e273cc48dd114d7ea8482b"
 
 inherit pypi setuptools
 
-- 
2.25.0


