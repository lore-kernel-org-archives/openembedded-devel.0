Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3540E7D2CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 12:37:53 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t16so1383650plo.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 05:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=8lCQj7SjYDglTSYcdGxG4OBb/IdPNZzgYa2D5if9iY4=;
	b=Vwi+bpiR/OvREySW8RV1IQSn6HFbtVQDgb/SzH6FIO4LOPeboTV6dI98BFFBHYZ9o2
	c9nPNBh6J4bjF+QA1RIXjcTRRBlkcsezcS8GJyLKBIlnqWV4V4kE5kXgMQxaRabgDJjq
	yJs1nTzhpwZDS6eFkkrqCyrxMDlf3W08scdl+6uUX+DSAB1TFiL/N8Jt7Kgnua62Vap1
	DfEy54c2jlkvmU4XycykB6JRocplCbWTWCotgd3CYXuz1DyoibpH6Aihd8ehixAq+MaW
	lM0O+8z9DSULq+dO4sFAQUMf5dKd+mI5TjTw74nrG7NxnV4EwIUb79WXAr7hQ0GFQ3MA
	07Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=8lCQj7SjYDglTSYcdGxG4OBb/IdPNZzgYa2D5if9iY4=;
	b=J54WXEhtCmk+WkoMGzbJipp6nXibrKhdepG06AgAQNn6QxV7IIgoNrolv52Rns3trz
	nuHcJzrKbqUPAebVs7b05GnJhzuLmobVLI3utmP5ZajO6rp/iRE95pGg978DqNFFzhyC
	owknNqkbxUl73wPblS/JjxYh7znrfwuID/NmYhxRPl4KSkAQvm5oVf1MgGO/tr/Ewlg2
	n7rdFS2JEVlSThjCFiHya11RitI6dN7b2veDLU4/w9yjoCY5edQY9hWhC5XITEY5AVxt
	YT8CN5hzlcpxQSEYUo7eEqku/onZ/8m0rB2/THLPqOGkJC/pGWdA0qaf7kL+Lwjb4pPr
	uy8w==
X-Gm-Message-State: APjAAAWkRCaoqNY2GFQiol1MN3yOmiGrsqYT7KJ7ek9lFcbPwYrvgW9J
	Nl9oS62zOneGC3bIdhQW3z/xqBOwAsY=
X-Google-Smtp-Source: APXvYqxeqT4Vxnw5N3eVUa6mMAIJtDU0ez+LWBAfk8qruVkbBUqZEmQN0VjaPNa9djhlTDaMMzNOZw==
X-Received: by 2002:a17:902:9006:: with SMTP id
	a6mr42376940plp.259.1554899873840; 
	Wed, 10 Apr 2019 05:37:53 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.78.119])
	by smtp.gmail.com with UTF8SMTPSA id
	r145sm80224171pgr.84.2019.04.10.05.37.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Apr 2019 05:37:53 -0700 (PDT)
Date: Wed, 10 Apr 2019 12:37:43 +0000
Message-Id: <20190410123743.28863-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH] fatresize_1.0.2.bb: Add recipe for fatresize command line tool
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
X-List-Received-Date: Wed, 10 Apr 2019 12:37:53 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The fatresize command line tool provides command line access to the
libparted-fs-resize library implementation of the FAT partition
resizing.

This tool is useful for safely resizing FAT partitions which are
commonly found as the boot partition on a variety of SoC targets (e.g.
RaspberryPi).

The Debian version of the source is used as the original upstream on
SourceForge is no longer actively maintained.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 .../recipes-utils/fatresize/fatresize_1.0.2.bb            | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/fatresize/fatresize_1.0.2.bb

diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize_1.0.2.bb b/meta-filesystems/recipes-utils/fatresize/fatresize_1.0.2.bb
new file mode 100644
index 0000000000..a2f6b6d131
--- /dev/null
+++ b/meta-filesystems/recipes-utils/fatresize/fatresize_1.0.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Resize FAT partitions using libparted"
+SECTION = "console/tools"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https"
+SRCREV = "3f80afc76ad82d4a1b852a6c8dea24cd9f5e7a24"
+
+PV = "1.0.2-11-git+${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "parted"
+
+inherit autotools pkgconfig
---
2.20.1

