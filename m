Return-Path: <marc.ferland@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 99DA56121F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 14:14:29 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id q107so8322477qgd.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=ikRNdwKSudWFqdJR0JQv/v53VdtSj55Upgencd8MBSc=;
	b=XnTVbrCa25fNqCrtePO9FGlcMsv8/iUoy3K9O7xpmVuu7P66nabNjJF32Kd7L+8Dlj
	HJBURxMsVnSYzwO1eRyNd1PKQSqqSMj1CfFmMM6BCaCiJ0Agafl3N6zld4blMcMV4fQr
	HUVgW/3b1ekU5kt0rx76nrY6IFX5y8r9n3hdemqIdcvtf+cgBNIxDLDcVbhRSvLfyzU5
	MnW09RdmfUfT20mIX1YIYw8p6QTqOQj2mUWg28/jsumI1GpTUyo35ljRC8nnqFY36J6F
	kZvVkbDt91QsqEVUJn+bN6r+Z5a0YagO6dk1cwzOaRwrPcVy22xD1X9G/La1D552eWDA
	bJwg==
X-Received: by 10.224.30.70 with SMTP id t6mr20040713qac.30.1397484870431;
	Mon, 14 Apr 2014 07:14:30 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPSA id t5sm20639283qge.0.2014.04.14.07.14.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 14 Apr 2014 07:14:29 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Mon, 14 Apr 2014 10:14:27 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Apr 2014 10:14:27 -0400
Message-Id: <1397484867-4582-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCHv2] autobahn: fix 'Missing sha256 SRC_URI checksum'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Apr 2014 14:14:30 -0000

Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
---
 meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb b/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
index a1e8c5f..ac775c4 100644
--- a/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
+++ b/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = " file://autobahn/__init__.py;beginline=1;endline=17;md5=1fde
 
 SRC_URI = "https://pypi.python.org/packages/source/a/autobahn/autobahn-${PV}.zip"
 SRC_URI[md5sum] = "160429e7fb043940e79aa7f4ebbab57a"
+SRC_URI[sha256sum] = "94ae5c6f37f9fe7c9d3f12c170fcc273afed4104a1c5508b26d6014bb9e6373e"
 
 S = "${WORKDIR}/autobahn-${PV}"
 
-- 
1.8.3.2


