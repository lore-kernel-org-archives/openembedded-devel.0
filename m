Return-Path: <saravanan@linumiz.com>
X-Greylist: delayed 2399 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Aug 2019 21:01:40 UTC
Received: from gproxy8-pub.mail.unifiedlayer.com
	(gproxy8-pub.mail.unifiedlayer.com [67.222.33.93])
	by mail.openembedded.org (Postfix) with ESMTP id DDDC26BC44
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2019 21:01:40 +0000 (UTC)
Received: from cmgw10.unifiedlayer.com (unknown [10.9.0.10])
	by gproxy8.mail.unifiedlayer.com (Postfix) with ESMTP id 10F7C1AC790
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2019 14:04:34 -0600 (MDT)
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTP
	id tHJPhSVayVUbhtHJRhpamh; Thu, 01 Aug 2019 14:04:34 -0600
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=PKQhB8iC c=1 sm=1 tr=0
	a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=LfuyaZh/8e9VOkaVZk0aRw==:17
	a=FmdZ9Uzk2mMA:10:nop_rcvd_month_year
	a=oz0wMknONp8A:10:endurance_base64_authed_username_1 a=vU9dKmh3AAAA:8
	a=r45qBiYaAAAA:20 a=bOpFcRUdDVKRQkKqBMwA:9 a=rsP06fVo5MYu2ilr0aT5:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default;
	h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iL1R6Di52mCDVKqV5kKuxxdwNffCLHdK0pUrQg3D19I=;
	b=NYWzBAIU5ejY6QlLUwAk2A7cc+
	mZdpY5Cw6g/5n0Eu5eMeB/4lReLZBvBOh7W6cgJtNcq0yumVtQbjGZEs1V3eLA9pjEsTDQ1FHH7QG
	+RW0hdfu0+RoYLQ7DbZhRrs51bKSrMmix0BXyEIdulKsm60rBk/RpAs+x4aDmf7dFqv+zf+Q/6RmV
	jUfhq4aaUSFAbhoNETOchRsT5Pbx+0h9DpjzagA+pDZfnSzryh+21VHS5+ugMXWZusdJO8OOqdW4p
	tnebPLYoTVrv2aERn5CsrmO8Z+EGrZTQiciGUWW57c4Er5/MekUEYg3jUGBHf3nboSLKUdPEXu2tm
	I+u1551Q==;
Received: from p5b3f6e3e.dip0.t-ipconnect.de ([91.63.110.62]:53324
	helo=localhost.localdomain) by md-in-79.webhostbox.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <saravanan@linumiz.com>)
	id 1htHJK-000uuU-Lp; Thu, 01 Aug 2019 20:04:31 +0000
From: Saravanan Sekar <saravanan@linumiz.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Aug 2019 22:04:07 +0200
Message-Id: <20190801200407.2239-1-saravanan@linumiz.com>
X-Mailer: git-send-email 2.17.1
X-Authenticated_sender: saravanan@linumiz.com
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 91.63.110.62
X-Source-L: No
X-Exim-ID: 1htHJK-000uuU-Lp
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: p5b3f6e3e.dip0.t-ipconnect.de (localhost.localdomain)
	[91.63.110.62]:53324
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 0
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
Cc: Saravanan Sekar <saravanan@linumiz.com>
Subject: [PATCH] liblightmodbus: Add version 2.0.2
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
X-List-Received-Date: Thu, 01 Aug 2019 21:01:41 -0000

A cross-platform, lightweight Modbus RTU library

Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
---
 .../liblightmodbus/liblightmodbus_2.0.2.bb          | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb

diff --git a/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb b/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb
new file mode 100644
index 000000000..1e35f08c0
--- /dev/null
+++ b/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "A cross-platform, lightweight Modbus RTU library"
+DESCRIPTION = "liblightmodbus is a very lightweight, highly configurable, \
+	       platform-independent Modbus RTU library."
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
+
+inherit cmake pkgconfig
+
+SRC_URI = "git://github.com/Jacajack/liblightmodbus.git;protocol=https"
+SRCREV = "59d2b405f95701e5b04326589786dbb43ce49e81"
+
+S = "${WORKDIR}/git"
-- 
2.17.1


