Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4440E6FF76
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 19:32:28 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id s140so99337752qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 11:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=TCrvcJgXiDVyB6S9WvCI/EJMv7Uz+w8gyMtylMPSBOk=;
	b=hdrGDrafPFeYHp3fQ6nmCIc9KAZwYYQ94kaifDJj5zoYVc3qDZ0VNtbepB3jgONV7O
	G/kbcqA5qDwZPphDthuhchtA/3tv4d+8ajyGK6hfi3eHSnG8EnHkMLcL/ektweXk5qOA
	rn+cz/U5GNiRT+WOfJazb+Q9BUuImliLObgaIPGF6piRCFkrc/xwPX8hAlG+TTXB7CYy
	YUUYdnlcrY9NaCnccDdowNzam1qp68Dh9sdveFShXFiLXZXjTMnq3FNDuA4QGtNg0tCD
	6DVkrXS2B2Uuvo2+eV6sSk10v5KdaydIsfYwXcFAIA6pASl6o1jUgM5Roas+6mZmMuwG
	+NEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=TCrvcJgXiDVyB6S9WvCI/EJMv7Uz+w8gyMtylMPSBOk=;
	b=Ai344kwdVyAG24mliSHu9H30WMc1lL/FCuo+e7hLy3KxP5xQKz/j56j+H6MDO5l/1F
	bSLA1DOqsmHm0uwNvBBjJXe8bHMZ3irKR2al9cBi2ReMD6xIvmGfMGMhNmN3onWbTwkZ
	3qLUgIFRg3zvmZ9L7Pl1Y1F0X1ELmuZ/3h+gDPJh7VtI1eoB/HpyfFdYCgq1jl7c/Uz0
	hKMJ26njEFtGSPqBDXxjZWRbuhxNnDlw1O9z+EOnwQP7F+btTTp3U0RgWy2UIEXKUypo
	XbKGqjcHeiNEkSHrFqbCY4cccIPonQjVJvYhtRUN/gtRdXnuxH3kvEwBFOwoRAEJmgpF
	k0xQ==
X-Gm-Message-State: AMke39kuq8ah0bdp7YK7h1TpiEcxM/cNsrR56mkJUU02c3bNAVIkBpRLPDtaoyW195xhjQ==
X-Received: by 10.55.132.5 with SMTP id g5mr15897211qkd.155.1486495948437;
	Tue, 07 Feb 2017 11:32:28 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	h62sm4171846qkc.23.2017.02.07.11.32.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Feb 2017 11:32:27 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2017 17:32:06 -0200
Message-Id: <20170207193208.5051-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH 1/3] libev: Add recipe for version 4.24
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
X-List-Received-Date: Tue, 07 Feb 2017 19:32:30 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-oe/recipes-connectivity/libev/libev_4.24.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libev/libev_4.24.bb

diff --git a/meta-oe/recipes-connectivity/libev/libev_4.24.bb b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
new file mode 100644
index 000000000..40f7dc710
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
@@ -0,0 +1,14 @@
+SUMMARY = "A full-featured and high-performance event loop that is loosely \
+modelled after libevent."
+HOMEPAGE = "http://software.schmorp.de/pkg/libev.html"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
+
+SRC_URI = "http://dist.schmorp.de/${PN}/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "94459a5a22db041dec6f98424d6efe54"
+SRC_URI[sha256sum] = "973593d3479abdf657674a55afe5f78624b0e440614e2b8cb3a07f16d4d7f821"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools
-- 
2.11.0


