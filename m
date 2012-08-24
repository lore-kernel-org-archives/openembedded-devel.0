Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4n5F-0003j3-3R
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 08:09:29 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so2827997pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2012 22:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=lYGVkd+Vo1Pf67ME6k6RSiNzdW1lmfYTsAPoOBHHGE0=;
	b=vrvc1l3XKOitrpvb5nL8LXiHccJo+AjRxSEcpuHzCfXEcWDRlKyh5AhXUkL3pDs/M5
	/v8Plqd+OBhFpMXnnp5tfE38fV7tJatM2Xa8IU04X5KYewCeWTYErVQdeyaL6VgR7AdC
	oikIljOkcY4iaYOTWknkAkbXhZBP7fD26quBE+ydiC24zaggJno90PQ0eO3TQqHQZG43
	adwTPXgIAu4xV7PHWX4vSVcZ+pQMPiObYVVG0vRvcgeI08tVYw7UOymWhwkBBGMb3L1t
	zi/2u4HHVdQehxZNhbVOCqLUKqNIk/kzuhuV8Cj0E4jI9bUcthR9gBmTiD6eRjkqMYfN
	eHQg==
Received: by 10.68.203.34 with SMTP id kn2mr9989425pbc.144.1345787843673;
	Thu, 23 Aug 2012 22:57:23 -0700 (PDT)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id hr9sm7594293pbc.36.2012.08.23.22.57.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Aug 2012 22:57:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2012 22:57:04 -0700
Message-Id: <1345787825-9950-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345787825-9950-1-git-send-email-raj.khem@gmail.com>
References: <1345787825-9950-1-git-send-email-raj.khem@gmail.com>
Subject: [2011.03-maintenance][PATCH 4/5] schroedinger: Add recipe for 1.0.11
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 06:09:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/schroedinger/schroedinger_1.0.11.bb |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes/schroedinger/schroedinger_1.0.11.bb

diff --git a/recipes/schroedinger/schroedinger_1.0.11.bb b/recipes/schroedinger/schroedinger_1.0.11.bb
new file mode 100644
index 0000000..9f03a12
--- /dev/null
+++ b/recipes/schroedinger/schroedinger_1.0.11.bb
@@ -0,0 +1,15 @@
+require schroedinger.inc
+
+LICENSE = "MPL-1.1 | LGPLv2 | GPLv2 | MIT"
+
+PR = "${INC_PR}.0"
+
+inherit autotools
+
+SRC_URI[schroedingertargz.md5sum] = "da6af08e564ca1157348fb8d92efc891"
+SRC_URI[schroedingertargz.sha256sum] = "1e572a0735b92aca5746c4528f9bebd35aa0ccf8619b22fa2756137a8cc9f912"
+
+PACKAGES =+ "gst-plugin-schroedinger-dbg gst-plugin-schroedinger-dev gst-plugin-schroedinger"
+FILES_gst-plugin-schroedinger = "${libdir}/gstreamer-0.10/*.so"
+FILES_gst-plugin-schroedinger-dbg = "${libdir}/gstreamer-0.10/.debug"
+FILES_gst-plugin-schroedinger-dev = "${libdir}/gstreamer-0.10/*.*a"
-- 
1.7.9.5



