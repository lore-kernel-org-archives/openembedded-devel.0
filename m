Return-Path: <rafael.carre@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6735775D4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 11:15:27 +0000 (UTC)
Received: by wimw2 with SMTP id w2so7808524wim.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 03:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=7s+NuePbRQo6iZIZVM+TYzEJNWeOrihrzyzmtiavZYU=;
	b=R1Ne2GC7p/qDXRWBEkTtD6mlEOwR+xrk40JaHyFelLYy6xb8nURsr8gbg7DLBqYP4n
	sJCxDLabzZ3gqQoXm9gv+1ZwwiMjKX2tPy3u3tqsP8O9RiiLDUNcMB4m/2eYKmvh3pgw
	6/QQXcXdS6y6yNij3xjw1cduUH6V21uwgYPVTju5lbI3ViMcO8stfSSbI4DpYa9FWVHn
	Dyj1ik6Ozaok+sCI+KA7/1JvaaCG5RASflICfT8KxgWmDUh/STmp1L0N+QblY2sFPG/e
	S/NthO3dKZ0Eca3r9/198dkB9eqQ0DzACXqQrjR7ArSg3KchPaiNXWaNzku5JaBkTJTO
	BA7A==
X-Received: by 10.194.179.41 with SMTP id dd9mr7830465wjc.123.1446722127148;
	Thu, 05 Nov 2015 03:15:27 -0800 (PST)
Received: from localhost.localdomain
	(lns-bzn-47f-81-56-255-191.adsl.proxad.net. [81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	r65sm33572803wmb.20.2015.11.05.03.15.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Nov 2015 03:15:26 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 12:15:19 +0100
Message-Id: <1446722120-6291-1-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
Subject: [meta-multimedia][PATCH 1/2] Add libdvbpsi 1.3.0
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
X-List-Received-Date: Thu, 05 Nov 2015 11:15:28 -0000

---
 .../recipes-multimedia/libdvbpsi/libdvbpsi_1.3.0.bb          | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.0.bb

diff --git a/meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.0.bb b/meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.0.bb
new file mode 100644
index 0000000..48b0111
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "libdvbpsi is a simple library designed for decoding \
+and generation of MPEG TS and DVB PSI tables according to standards \
+ISO/IEC 13818 and ITU-T H.222.0."
+HOMEPAGE = "http://www.videolan.org/developers/libdvbpsi.html"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "http://download.videolan.org/pub/libdvbpsi/${PV}/libdvbpsi-${PV}.tar.bz2"
+SRC_URI[md5sum] = "2b217039a1299000c39423441f77e76a"
+SRC_URI[sha256sum] = "a2fed1d11980662f919bbd1f29e2462719e0f6227e1a531310bd5a706db0a1fe"
+
+inherit autotools
-- 
2.5.0


