Return-Path: <joe@deserted.net>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5731971999
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 20:50:09 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id c20so14332023itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 12:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id;
	bh=sGiVJp/SwHK/cgPPOqkGO4CAytf1knZ3ukofXLTvZsk=;
	b=i8LB8Bw7pyoslb+d4GFJPKVLxWk3gncR8B1P5bCAkC2QjhqF1U68hbJSeuZuNtj/9x
	9oapv5yGlZr+UrEkm/CQDY8nL6Wx0PP90yIZrZC/XLdAjgEOzQQvmb5Pp15bjWmAwubv
	tlWHKWXfpRZnW2f2UXbLyrpNv9Mtoe3si65sNvul2CDwzMbSrTF5Pygs0UrkY6oxFBrB
	IxtDyY9e8jVtmR0u54rJGJirRoTaCeW7ZciAVmsnLHMQYj4SLkG421q7+XqP1quRX1Dr
	udDjTyjq22f3CQuVDMa9lAxQCVQl7ytZqZSTCAXffprW1jRkQEVtExNC6bIyw4ZsjJmW
	JUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=sGiVJp/SwHK/cgPPOqkGO4CAytf1knZ3ukofXLTvZsk=;
	b=a8lqQbxo6+TmrS+aFF4TfvUKHarn3gakzE7kAn6pPY1NbvR7EbVoPtDMZ0EiLU7NSy
	TUK+udH0I5hq3sJhhLXK/n8CzuLjnhasGTK9P9cwUSDb85CllH4wtBYhym9M7SAoqMTB
	/xlZgO70MhOx5p1drN5I8vUNXVv01JxCg1Ym4pNvd+zMNbSTaj33Ohjcu0puwsDaCAJP
	zbZIY07CBFZH6Ne5UjyogaeZGYiJ8h6LleJ9kOnf/Q1COfryjIjoHYcwVgXlNGXrADkg
	hjCd+I8/eOiC0oQcCxAiws/lL/Fd4m2pZWrRkW3orKVNJhYPlAeVzepAl7B+q0ElT/2Y
	5sGg==
X-Gm-Message-State: ABUngvetZMs7ACmevkN3/Qs7zjwpoO5qDkeEJViOnD9qEG2VaS6Qg9QUmlY1WAl5zpqI+w==
X-Received: by 10.36.41.81 with SMTP id p78mr29257itp.60.1479156610929;
	Mon, 14 Nov 2016 12:50:10 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id i75sm116412itf.10.2016.11.14.12.50.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Nov 2016 12:50:10 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Nov 2016 15:50:33 -0500
Message-Id: <1479156633-20878-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] iscsi-initiator-utils: Update SRC_URI and homepage
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
X-List-Received-Date: Mon, 14 Nov 2016 20:50:11 -0000

open-iscsi.org is defunct, the new home is at open-iscsi.com, update the
SRC_URI and homepage accordingly.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 ...utils_2.0-873.bb => iscsi-initiator-utils_2.0.873.bb} | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.0-873.bb => iscsi-initiator-utils_2.0.873.bb} (90%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.873.bb
similarity index 90%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.873.bb
index 4b13155..d540085 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.873.bb
@@ -4,16 +4,17 @@ independent, multi-platform implementation of RFC3720. The iscsi package \
 provides the server daemon for the iSCSI protocol, as well as the utility \
 programs used to manage it. iSCSI is a protocol for distributed \
 disk access using SCSI commands sent over Internet Protocol networks."
-HOMEPAGE = "http://www.open-iscsi.org/"
+HOMEPAGE = "http://www.open-iscsi.com/"
 LICENSE = "GPLv2 & LGPLv2.1"
 SECTION = "net"
 DEPENDS = "openssl flex-native bison-native"
 
-LIC_FILES_CHKSUM = \
-        "file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-         file://utils/open-isns/COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
+    file://utils/open-isns/COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
+    "
 
-SRC_URI = "http://www.open-iscsi.org/bits/open-iscsi-${PV}.tar.gz \
+SRC_URI = "https://github.com/open-iscsi/open-iscsi/archive/${PV}.tar.gz \
            file://iscsi-initiator-utils-use-var-for-config.patch \
            file://iscsi-initiator-utils-dont-use-static.patch \
            file://initd.debian \
@@ -23,8 +24,9 @@ SRC_URI = "http://www.open-iscsi.org/bits/open-iscsi-${PV}.tar.gz \
            file://iscsi-initiator-targets.service \
            file://set_initiatorname \
 "
-SRC_URI[md5sum] = "8b8316d7c9469149a6cc6234478347f7"
-SRC_URI[sha256sum] = "7dd9f2f97da417560349a8da44ea4fcfe98bfd5ef284240a2cc4ff8e88ac7cd9"
+SRC_URI[md5sum] = "77ef4d5f5aceb4c7f0bef743fa7fc05c"
+SRC_URI[sha256sum] = "c51f6fad45afb7c059f10776de721c6d5fd0336ff927daacea6a7e0a3ad02f18"
+
 
 S = "${WORKDIR}/open-iscsi-${PV}"
 
-- 
1.9.1


