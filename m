Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6DDE07FC1F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 09:43:03 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id p17so5117751wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 01:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZFl1nrc0P6RHxiPoUvhhpDoKAqgHPBQjWR2JyozCzRI=;
	b=0EBu037LxK1GB3aNYu6npFTaSCyWkkton0byeC/2XOSTR0q/BhfOGMp1r3P18kYI+U
	0dyRmFX7tJzQE+ezjq0HtkKNfFCzihGdDA5yk8rlQRy4C32UpqRUrlz22OJsAXQ1J43e
	sBY7NyNkoeG6GmfGn+8TjgCojw2S/KlanrDSt6CRZT+kdB/HgaIY7g3HzM74YuCqgDSr
	UiATvNtEbC0Sq8YYde42xef92QDgj2lfIMuH1bSgCYxCmXXFk2QjBKNFUUiV2YYwKSWh
	p4frrxPmi0JzENmPon1JEwJBTZz3OXBHjNylJ6v2CAE0l+NX/aqbSr1VAlCAuf0rVIFV
	FmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZFl1nrc0P6RHxiPoUvhhpDoKAqgHPBQjWR2JyozCzRI=;
	b=WC86CFCEEu4pY4o/EvhNKs/BE6iBEoweHO895fd7lK0qWXgAwo3QnZ3Qc2sQueHE+f
	eADqTgoohWrNOFSrEhlT3FBcAbRdJgeAf7eoIBrpvtDanko1ERL2F1qyU/LnrUNskUfI
	7gMoA+au2DeN0I4lgNoT19W/9bdBvl403IfplGR0rfOKNzg5zGoRQpKjhpl+jKV3rwb0
	40hcaVxcObW26EprLKDghxdRzlFYziuVu+h0JyPcuzkceu4tzsI1XkstwcvAKoqqChxX
	oQ/2/NP5dO0N0mQNdiL3Om9J1Q84lL6WKs2xvpUPXrQjYfHNpzxxnjKqW4+hAErcdUaK
	X/cw==
X-Gm-Message-State: APjAAAXOMpJ9A4dTFtcqDnHkCJHqtfJreC4GVlcvOVxi8Ceay/S5/wLe
	EdMy43OtDjYn/3KpASef6wKsMA==
X-Google-Smtp-Source: APXvYqwNHScb343WT3jNshZeraNfzh2b6Nn1zqeVQUw4xu9nuXYVIs3Dl+Hgolff4/QyvfTYeNnecA==
X-Received: by 2002:a1c:b7c4:: with SMTP id
	h187mr13643917wmf.105.1577958182911; 
	Thu, 02 Jan 2020 01:43:02 -0800 (PST)
Received: from localhost.localdomain
	(lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
	by smtp.gmail.com with ESMTPSA id
	j12sm59294535wrw.54.2020.01.02.01.43.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 01:43:02 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 10:42:58 +0100
Message-Id: <20200102094258.27733-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] speedtest-cli: new package
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
X-List-Received-Date: Thu, 02 Jan 2020 09:43:03 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a recipe for speedtest-cli - a command-line utility for internet
speed testing using speedtest.net.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../speedtest-cli/speedtest-cli_2.1.2.bb           | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.2.bb

diff --git a/meta-oe/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.2.bb b/meta-oe/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.2.bb
new file mode 100644
index 000000000..de4fa1642
--- /dev/null
+++ b/meta-oe/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Command line interface for testing internet bandwidth using speedtest.net"
+AUTHOR = "Matt Martz"
+
+LICENSE="Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit setuptools3
+
+SRC_URI = "git://github.com/sivel/speedtest-cli.git"
+SRCREV = "c58ad3367bf27f4b4a4d5b1bca29ebd574731c5d"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} = "python3 python3-setuptools-scm"
-- 
2.19.1


