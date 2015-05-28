Return-Path: <dbaryshkov@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3765175733
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 20:20:08 +0000 (UTC)
Received: by lagv1 with SMTP id v1so40774121lag.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 13:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=69/OyXb6pf+orGkR7AaNcjn7SQ9ovv01jyyE8iHB0Ws=;
	b=y3uzc6sWQzsHAJQm6VLPnOScPFKuehJo5LlWTbjQNunTospyC1BcutAzkxI/sfqoYj
	Z/AqziJNHo1gQgBG79rQlWQGybKBORBZLyfJowX2USH39rzFxvnyaqr7+hHDHBsMOmtf
	kSnoDj8HQA4klk90MQyc+JK85kDlzSuLiKmc8m/j2lamwWlGrcoJN2ttbU1URu4OHGBj
	+7v1EWnIuftuSrQ1oqsOqYuINzCEkZgl7b4nAHNljVw53GRKyfLdK96IyRReivB4yGd+
	Xa3wLQsPn/qhc6a36CM1QnvCk16mL2B0TEYiObRVFvlHhpwLxU+x0pufA86NLUpCq5lK
	NZMw==
X-Received: by 10.152.170.165 with SMTP id an5mr4598246lac.100.1432844408784; 
	Thu, 28 May 2015 13:20:08 -0700 (PDT)
Received: from angmar.lumag.rup.mentorg.com
	(ppp89-110-9-6.pppoe.avangarddsl.ru. [89.110.9.6])
	by mx.google.com with ESMTPSA id h3sm818730lbj.19.2015.05.28.13.20.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 May 2015 13:20:06 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 May 2015 23:20:01 +0300
Message-Id: <1432844401-4284-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1432844401-4284-1-git-send-email-dbaryshkov@gmail.com>
References: <1432844401-4284-1-git-send-email-dbaryshkov@gmail.com>
Subject: [meta-opie][PATCH 2/2] packagegroup-opie: fix bluez dependencies
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
X-List-Received-Date: Thu, 28 May 2015 20:20:11 -0000

Make it runtime depend on either bluez4 or bluez5 depending on DISTRO_FEATURES.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/packagegroups/packagegroup-opie.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-opie/packagegroups/packagegroup-opie.bb b/recipes-opie/packagegroups/packagegroup-opie.bb
index 42568aa..50122a0 100644
--- a/recipes-opie/packagegroups/packagegroup-opie.bb
+++ b/recipes-opie/packagegroups/packagegroup-opie.bb
@@ -91,7 +91,8 @@ RDEPENDS_packagegroup-opie-base-pim = "opie-addressbook opie-datebook opie-drawp
                       packagegroup-opie-base-todayplugins \
                       opie-datebook-birthdayplugin"
 
-RDEPENDS_packagegroup-opie-bluetooth = "bluez4 obexftp obexpush libopieobex0 \
+BLUEZ = "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
+RDEPENDS_packagegroup-opie-bluetooth = "${BLUEZ} obexftp obexpush libopieobex0 \
                        opie-bluetoothmanager opie-bluetoothapplet"
 
 RDEPENDS_packagegroup-opie-irda = "irda-utils libopieobex0 obexftp obexpush"
-- 
2.1.4


