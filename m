Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S3nsO-0003xt-3m
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Mar 2012 13:15:52 +0100
Received: by eaae1 with SMTP id e1so717191eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Mar 2012 04:07:20 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.45.80 as permitted sender)
	client-ip=10.14.45.80; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.45.80 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.45.80])
	by 10.14.45.80 with SMTP id o56mr7718254eeb.88.1330776440045 (num_hops
	= 1); Sat, 03 Mar 2012 04:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=3USVQoJJcW5Dgm9EvVESqLca3BfuCeZt3W6TcIdWvYk=;
	b=HKbps43MVV81qFc5PdgXyhtEw7saNVXhELEEd1qH87w2NhZaDH+Q+/oaVxUVjp1G+9
	GXwIXaU0yEqloF5pvDFxtCTvdOQbn6uk/Rz7NX7OmHHO/e+wJL76zxIeVOsCEjmhST4M
	8wJPNNp1YBmU/LxMq3NmFToZF725WMq1x45ZCQnoxLtBHBUpCqHMwpY0jKDTNMZPcct3
	Mg0ijKU/bpOtUwXSE1tZu6tdM72vldfaVZoqywVjGQAHk52l3pmg9PV0nNJKGYQbRqri
	Of/s2yliKdg+A9bd+1NSZUbxadNkpRM4IIi4HQFBoXnBjH/d7/yEblbkDs5VUkiMgkmI
	6aIw==
Received: by 10.14.45.80 with SMTP id o56mr5932339eeb.88.1330776439560;
	Sat, 03 Mar 2012 04:07:19 -0800 (PST)
Received: from localhost.localdomain (p4FDF1A4D.dip.t-dialin.net.
	[79.223.26.77])
	by mx.google.com with ESMTPS id i10sm33195646eea.8.2012.03.03.04.07.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Mar 2012 04:07:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Mar 2012 13:10:52 +0100
Message-Id: <1330776654-2913-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-xfce 1/3] garcon: update to 0.1.10
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
X-List-Received-Date: Sat, 03 Mar 2012 12:15:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

run-tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../garcon/{garcon_0.1.9.bb => garcon_0.1.10.bb}   |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.1.9.bb => garcon_0.1.10.bb} (63%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.1.9.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.1.10.bb
similarity index 63%
rename from meta-xfce/recipes-xfce/garcon/garcon_0.1.9.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_0.1.10.bb
index e99cb4d..2e88b97 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.1.9.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.1.10.bb
@@ -4,11 +4,9 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
 DEPENDS = "glib-2.0 xfce4-dev-tools-native libxfce4util"
 
-PR = "r0"
-
 inherit xfce
 
 FILES_${PN} += " ${datadir}/desktop-directories"
 
-SRC_URI[md5sum] = "a3ca1e54ad731c98f688900f6398fc20"
-SRC_URI[sha256sum] = "485e23c8ec1af0d3af423aa244e05467dd2f96afbb66efc70ca7689222cf31d5"
+SRC_URI[md5sum] = "e53514e79c4da2631dd74994452d3c96"
+SRC_URI[sha256sum] = "c2497a2991101fc1e621dc712ef72aba7c238f6e5f5a1733c9572f9b23761316"
-- 
1.7.4.4



