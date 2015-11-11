Return-Path: <ruslan.bilovol@gmail.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id A7280766B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 10:43:14 +0000 (UTC)
Received: by lffu14 with SMTP id u14so14052704lff.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 02:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DrvS+QqTkxl/0sqAWzh0zUpCsVU/UsrAS3I0oeiDjuY=;
	b=Lv6YdpSsEwegq9/aPvSikFft9idEsZ8HeKzY/Whd7W2fjO/KfxoeYHFhPIiAOvDqN7
	M8m/klCBoRHgrA5LxrEmebDgvD29WwMi2OAqvMSZbJ3iV1DF71Yee4qN/MqBdmvi4eMB
	IPmVruZNyRvYMLUjKGJ29l12RaU0Ary/8bNe+6tjRUfp4tu4pP2uzVBN5wKRvpbz4QlL
	6b+yU6sNrYHu9FJ9bz8cF1+bpbHHx/ryGryaiKeO/EeDneckB8xFTh2/MXrDOZ9HeCqg
	j5syajE/RiWlojwC46MkfFm+f5p2Dl5NlQ5S3f0QoO4yjJuO4E2rdB4yaSSh/EkSIsC+
	eO1A==
X-Received: by 10.25.20.97 with SMTP id k94mr4001254lfi.71.1447238593890;
	Wed, 11 Nov 2015 02:43:13 -0800 (PST)
Received: from localhost ([195.238.92.77]) by smtp.gmail.com with ESMTPSA id
	i186sm1369559lfb.18.2015.11.11.02.43.12
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 11 Nov 2015 02:43:13 -0800 (PST)
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 12:43:10 +0200
Message-Id: <1447238590-32465-1-git-send-email-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] wireshark: update SRC_URI link to sources
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
X-List-Received-Date: Wed, 11 Nov 2015 10:43:14 -0000

From: Ruslan Bilovol <rbilovol@cisco.com>

Wireshark official site keeps in /src only latest
versions of sources, moving them to /src/all-versions
after some time.
Update the SRC_URI string so wireshark can be built
even after few month after release.

Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
---
 meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb
index eee9f30..70d7c3f 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
 
 DEPENDS = "perl-native pcre expat glib-2.0 sbc"
 
-SRC_URI = "https://2.na.dl.wireshark.org/src/${BP}.tar.bz2"
+SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-- 
1.9.1


