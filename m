Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4123F79C69
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 10:49:14 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w5-v6so870299wrt.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 03:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zsdc74DnCBOUHVXbO5abDg3EuAPaa+oqQvfT2QrZvFY=;
	b=Rw6Qy/+6Nj03ojFt3rSjcCRLaTNQ8nQux5qbOwpRb1hdJhxmcwLH9wGQM8cRMGGMz1
	1coLAyjiKNzR2ItA+S71BLKflyp9GiB5L0bnYYmlUkrkuUc+g6sAbasceJ4MIwqP/Q6r
	Usbtr/bFbL7FFFKwRj+pyeJFbcEGhwMXmNjtjgwdPQ8KGpY7MAxNNgqpGHqOlx5ERYZS
	5QUbjFVhhhLnEj7m4ctwYfI9NqUaLAVkip9hyVNyLOejTZA7swkpBTMEG5xuN6oiRzhD
	dj+D9vFT4+80ScSxES00z2In9kMzFFs9wrhq9ZwJ5PHcHc0DqvQcJJ5Wc3FBPdKGaLY9
	NbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zsdc74DnCBOUHVXbO5abDg3EuAPaa+oqQvfT2QrZvFY=;
	b=PMUx8OBMPzHRkx+fp9nlfo5zqMADMx/jsF8jaK+Bu5uDO8viVlLAbIHBGCZpkCxxxS
	Uk90rWJnjalq8Vz8lFUk0b6A1vKTu/j5RZ+j0qgdmdHV+Y11qh27oxznKwJA/6P/VCpv
	OhwZ2UWDmI9XYEKbKeNSQ2ExmSSyUBOy0wlcMun9Ui4SgpXqMDKiJ6tChxHNVQMDGzfX
	eW5gamLGss4fvlDpBlBHbG0BokZI0IdODp3Jg77Kh4BZysaqOfzJDr0N7oViGb64bnYo
	fAn5hnuKUVmtPX8YyOqYuLmO+3m++d5TK0ym6oB8TIGjS+1Xum1S60Cp478Ih13erKlT
	k37g==
X-Gm-Message-State: AGRZ1gI/xr95kLDA04BawuWmeHhnOwXxfCsUyIU0tn3e/2KxQtP1EKpD
	Z24YY5j7zYln7p9JmaBAhY1+KH8Z
X-Google-Smtp-Source: AJdET5d5vX2CJtMk6QoFAx8ovB5/Zy5QIARYvZbhGnpHtLFY4OR0LBdEfSorGGgaE+ePrJLPz8aRtA==
X-Received: by 2002:a5d:4a89:: with SMTP id
	o9-v6mr5553598wrq.132.1540550954437; 
	Fri, 26 Oct 2018 03:49:14 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	x8-v6sm23905660wrd.54.2018.10.26.03.49.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Oct 2018 03:49:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2018 12:48:52 +0200
Message-Id: <20181026104857.32142-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20181026104857.32142-1-schnitzeltony@gmail.com>
References: <20181026104857.32142-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] catfish: initial add 1.4.6
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
X-List-Received-Date: Fri, 26 Oct 2018 10:49:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb

diff --git a/meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb b/meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb
new file mode 100644
index 000000000..229f882d0
--- /dev/null
+++ b/meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Catfish is a handy file searching tool for linux and unix"
+SECTION = "x11/application"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
+
+inherit xfce-app distutils3 gtk-icon-cache
+
+DEPENDS += "python3-distutils-extra-native"
+
+B = "${S}"
+
+SRC_URI[md5sum] = "879197c9400be2a80d51abf494bfffb6"
+SRC_URI[sha256sum] = "e1caee14c5268ac781434701c0eb26eddfced2c0f1ae066549583ed05f99adbf"
+
+FILES_${PN} += "${datadir}/metainfo"
+
+RDEPENDS_${PN} += "python3-pygobject"
-- 
2.14.5


