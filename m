Return-Path: <mporter@konsulko.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4A03075466
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 20:50:46 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id l25-v6so1466840ioh.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 13:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:subject:date:message-id;
	bh=jqO5xyHQ/iOXVSp4mPjdFR6XuzpvsW/LwBuOLMcmCS4=;
	b=Z2LCYkI+n+yvI2wpPgvnkxm/gk1IZu8heQ+LL+xTvU2Ka9crjkNu+HvB9ziEwdwAP7
	tTz13opRhNjxdkCb7R76xdiF1aygCT3ZiSlPyZg51KQErqZ5UBpSdjDHTKOQ4HvT9HCG
	ZCxBbhdqqzJEFTcQA1n4D8Gh5G+vbwiL9M3OE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jqO5xyHQ/iOXVSp4mPjdFR6XuzpvsW/LwBuOLMcmCS4=;
	b=suk4ZfrDY47Z7nAAIeB8UxSyLjSSMb7p3v2liLtVmaLSO0LHdsUaDy3UqyY1ImMXl6
	fiOJ6JQndX52aGsBgeH2rhS17HEwcBi/E9WukRcJGVKnej1hyKYKOycyQFzoJaL3LcIv
	Y9Ta27Zv+3IELnZZeW4PHKIjLg+a4gne/ToPVrU3TvnvREDA73kKveQXSOtvbXogz2/d
	GN2jqhJiY5jexzT3NI3HTvKTlCDMW5UtywkWYZyzdAEQ1aoQKutSgMT+h5v0M4c9LJs8
	aO4ptvT+rneaF2Fpt5i9x6oKMkbbH5/6bSfvcyNTmaMbM7EsuETqutF2Izk2Mv7ypXEy
	lSGA==
X-Gm-Message-State: APt69E1/itHBFMbmTdK31aHR1IRC9DmimDU6zGP+aunPHBdD0lBOPADc
	1qdOV6sEZ756zd8AEzTCQcJ4jZOy
X-Google-Smtp-Source: ADUXVKK1cRej6G8MxSrCj3QXIk8dm1omLl5aQRUivrVpiIXcrr5tSx9Kn81dCcPgs3LW8wFleQnwJQ==
X-Received: by 2002:a6b:9ec7:: with SMTP id
	h190-v6mr14761741ioe.185.1529441447225; 
	Tue, 19 Jun 2018 13:50:47 -0700 (PDT)
Received: from beef.ohporter.com (cpe-173-90-206-207.neo.res.rr.com.
	[173.90.206.207]) by smtp.gmail.com with ESMTPSA id
	g191-v6sm466542itg.0.2018.06.19.13.50.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 13:50:46 -0700 (PDT)
From: Matt Porter <mporter@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jun 2018 16:50:39 -0400
Message-Id: <20180619205039.4366-1-mporter@konsulko.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-qt5][PATCH] libvcard: add recipe
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
X-List-Received-Date: Tue, 19 Jun 2018 20:50:46 -0000

* Build tested for qemux86-64.

Signed-off-by: Matt Porter <mporter@konsulko.com>
---
 recipes-connectivity/libvcard/libvcard_git.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-connectivity/libvcard/libvcard_git.bb

diff --git a/recipes-connectivity/libvcard/libvcard_git.bb b/recipes-connectivity/libvcard/libvcard_git.bb
new file mode 100644
index 0000000..58189ed
--- /dev/null
+++ b/recipes-connectivity/libvcard/libvcard_git.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Qt vCard library"
+SECTION = "libs"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f94eaed54ffa1718d593504bae740faf"
+
+DEPENDS += "qtbase"
+
+SRCREV = "4250e2468552ea01954244a2d9cd5d2b44b00042"
+SRC_URI = "git://github.com/pol51/libvcard.git;protocol=https"
+
+PV = "1.0+gitr${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+inherit cmake_qt5
-- 
2.11.0


