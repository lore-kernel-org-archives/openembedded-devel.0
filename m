Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1F14872F0D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 23:07:30 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id s27so4358562wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 15:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=r8XRe+KJ852LewJjNf+0Zq7ntAURdSqBw6uiXio25ps=;
	b=D6vTVyIPb2cI+hwbYSSFtMAR+dLiU7Abbf2o/isg/ya3W0d1pWsjyIzcInrSlqG2B3
	cSOg8I3oDNttcIjhQeGwf3X/pEwmQErSlUw22PnPxrE8gLLVQ9C8aReoW3vqXZcgucBN
	YIV2+VHs4cIK6EXDOLQczUoKbrFjRSwM9mYjueeAPOrO3ZMvQvqlOAS3BZWLw45WYtb3
	NATRXymRSY3KibVbfhKNuu0NmacN3Pa9uquzrIy9r94CLtXhRAWtJzs/w2bYB/PYqC6W
	CNbNCvkcik0fZk04tS80euB2QwPtHdnbeZio2vRobpA3zTucVRyg0H6CBG3KrRtPYW/j
	Ztbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=r8XRe+KJ852LewJjNf+0Zq7ntAURdSqBw6uiXio25ps=;
	b=EbFUBmeJM5ckKEpE2fSUBtigDzHJiP5lHAwYNkW6zAxuIyXb5yBLVz9h9YfCgMPqQb
	J0Sj8B2FtYe1tcGMMkTHYq8nsJb8i3sZPCTs/KhVbq82ogPId8IvWlWHz29X92vln8gJ
	oDjG10jJvFa3l85FgqDrmyV49I5FUqe2F6W1Cmb9whnAyFJg5gaOU+5tQWZDUERhQJtZ
	3xJqhk3ZMI+DAWGrai5uWkCLrGZ5a30GU4v+LKJdSNelez3Gu1nURH/esHLYLn3UJaDK
	D7T8UlMQRmSA5xEFIpjHw9Zw2JMTIIpBwuOc6dZWR93QfMqE4TATDSEdGiYySUUj7nUK
	CO9w==
X-Gm-Message-State: AMke39kNJTvppiOzqozOtmwzNc3bCBs7uJDB9tOV/Dk1DNqKsfGtVEsjmZOwLzqErLVugA==
X-Received: by 10.223.148.193 with SMTP id 59mr7335657wrr.127.1487632051674;
	Mon, 20 Feb 2017 15:07:31 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	i73sm15294743wmd.11.2017.02.20.15.07.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 15:07:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2017 00:07:17 +0100
Message-Id: <20170220230719.10066-4-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220230719.10066-1-schnitzeltony@googlemail.com>
References: <20170220230719.10066-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] onboard: add necessary native recipes to DEPENDS and unblacklist
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
X-List-Received-Date: Mon, 20 Feb 2017 23:07:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-support/onboard/onboard_1.3.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-support/onboard/onboard_1.3.0.bb b/meta-gnome/recipes-support/onboard/onboard_1.3.0.bb
index 3b4a0b4..bdf0a4e 100644
--- a/meta-gnome/recipes-support/onboard/onboard_1.3.0.bb
+++ b/meta-gnome/recipes-support/onboard/onboard_1.3.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "An onscreen keyboard"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING.GPL3;md5=8521fa4dd51909b407c5150498d34f4e"
 
-DEPENDS += "gtk+3 hunspell libcanberra libxkbfile dconf"
+DEPENDS += "gtk+3 hunspell libcanberra libxkbfile dconf python3-distutils-extra-native intltool-native"
 
 SRC_URI = "https://launchpad.net/onboard/1.3/${PV}/+download/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "8000df3e789512a90fcb227580fd60ff"
@@ -23,5 +23,3 @@ RDEPENDS_${PN} += " \
     python3-pycairo \
     python3-pygobject \
 "
-
-PNBLACKLIST[onboard] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130637/"
-- 
2.9.3


