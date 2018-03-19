Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id A51786093E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:03:12 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id d1so6541059pgv.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 23:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=phB79/3QY+3obx3d+sN1qAqSSooYEX2k6hQg2Uw23us=;
	b=mWsddFZwnDOupthWU+dzZIUlcSbyvmeAgwTCcf15AIEQvw301ewfaCPlIwpNRCW3d4
	OlCpbVLIPXRBN47LFZvnWGaK6CzDBVImpFYlTEjEN52O4i1lIEBgwChUtiABbJ8N7coH
	9f1keNfzZpyQUWXl5czxnXGzo6cIW8xhfFGtSDB8SG6Ai2GhKm8wJl/17od3bqfrIoJ/
	cSfd8FUX1mI+ZDs9ByaNYMFlqpoCaguwZHC815BI+yZvHNhnFCZB1fFGAgKeNqMi63nN
	0EPnaymFgeOjoviysjKAss41BHSl0gpWYuNuW6n2W2M0nk1BZYWzNEON1u7Q1HEkxey6
	mkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=phB79/3QY+3obx3d+sN1qAqSSooYEX2k6hQg2Uw23us=;
	b=rLhvJtrZjxwSsILKWBdodeFtJkN2u8fTFzJI915ZmRqtAZOaESZCmnbigMiF1UTTTa
	eSxn+B7/lDHOd4TiUMPFCeQWnM4GlvqtKa1DF/LF9qbx09EGUQm4oIrZeEotOtMVuP1T
	qjSivf5yBiDf3ZT1VKnRlp4uOXGNBw5hudEvhRvf3+TA+O97/vHwYOimLAgErZHFnfqi
	CVxjRafMZUoGgh9TWrG1wx1tAMwG3/Ep0LgefLTV1wrsIhPXvaFgxNzmyER2OPY9wehQ
	wS+s4GGBZw2UMO4oV4ZZxoiA6EIMA9loAqnrqP0CTMr9I+d8Y4nFfLJcbKqaoD1iJ5Q/
	Soiw==
X-Gm-Message-State: AElRT7H/Vt21N/NRcO08T79L5YBENvmsVjVRtV+qOXZEbV9bvsBshJyP
	BEHYnRUaoM5JDkbNleAaHwNoLA==
X-Google-Smtp-Source: AG47ELtc7krSgsCUp5iQCrjOeqmdX33ccr4MwXlOL+T9B8QGkLXi+xm4fZql2D71KThPtChzYmiNuA==
X-Received: by 10.98.30.66 with SMTP id e63mr9218023pfe.67.1521439393482;
	Sun, 18 Mar 2018 23:03:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a22sm5047426pgw.10.2018.03.18.23.03.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 23:03:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 23:02:43 -0700
Message-Id: <20180319060300.5366-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [meta-oe][PATCH 01/18] obexftp: use makefile instead of ninja cmake generator
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
X-List-Received-Date: Mon, 19 Mar 2018 06:03:12 -0000

Fixes

| NOTE: make -j 44 crctable
| make: *** No rule to make target 'crctable'.  Stop.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
index 489861cb7..b4a914d92 100644
--- a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "d40fb48e0a0eea997b3e582774b29f793919a625d54b87182e31a3f3d1
 
 inherit cmake pkgconfig
 
+OECMAKE_GENERATOR = "Unix Makefiles"
+
 PACKAGECONFIG ?= ""
 # fuse support will need meta-filesystems layer
 PACKAGECONFIG[fuse] = "-DENABLE_FUSE=ON,-DENABLE_FUSE=OFF,fuse"
-- 
2.16.2


