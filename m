Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id A76CC6C8BD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 12:33:52 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so607202eek.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 05:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IRJ1IDPyBlrjmNQGSMb/d+E8Ct05h6Z8kxgSKIhZpco=;
	b=ORIuxf63pUCIEDipqKNNO1IHK4lWiqbM3QrNHAr81e/k8orP9OIHaBq6OYdoA9MhTo
	CBPbKM6rCyj0h0oX2nmodXJT0vpy5qMpZJtAuOynufWxryavULdIu5LcRw0tw6ZT2wfY
	WDh0fAyHySXviYNjdvQz9R6x8FCAY428m0jU+uGwk9ylxEkv24MXw2tOfhYjH9dmvFBZ
	EMqRqf0Fj1PZzWK6UK5N+A0FXTCbGuuF1uFPQQZbQBgpthdW5OHXBUZCwv3fmQROTZb0
	3QxiPkEhVOZsE1yEs5MQEXMb3ZEA5PU0yaGQ8oR4GXH2Osj7lw4d7Exb2MbF8ndykZBT
	2akw==
X-Received: by 10.14.246.196 with SMTP id q44mr42094745eer.45.1395318832634;
	Thu, 20 Mar 2014 05:33:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p8sm3914186eef.26.2014.03.20.05.33.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Mar 2014 05:33:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Mar 2014 13:33:49 +0100
Message-Id: <1395318830-606-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][dora][PATCH 1/2] bash-completion: fix 'files already exist' WARNING message
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
X-List-Received-Date: Thu, 20 Mar 2014 12:33:55 -0000

From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>

Some bash completion commands are already provided by util-linux recipe.
Also disable parallel build because "symlinks" rule is buggy (see completions/Makefile.am).

Signed-off-by: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
index 411b9b7..014d122 100644
--- a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
+++ b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
@@ -5,6 +5,8 @@ BUGTRACKER = "https://alioth.debian.org/projects/bash-completion/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
+PR = "r1"
+
 SECTION = "console/utils"
 
 SRC_URI="http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2"
@@ -12,11 +14,19 @@ SRC_URI="http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "0d903f398be8c8f24bc5ffa6f86127f8"
 SRC_URI[sha256sum] = "e5a490a4301dfb228361bdca2ffca597958e47dd6056005ef9393a5852af5804"
 
+PARALLEL_MAKE = ""
+
 inherit allarch autotools
 
 do_install_append() {
 	install -d ${D}${sysconfdir}/bash_completion.d/
 	echo '. ${datadir}/${BPN}/bash_completion' >${D}${sysconfdir}/bash_completion
+
+	# Delete files already provided by util-linux
+	local i
+	for i in cal dmesg hwclock ionice look renice rtcwake; do
+		rm ${D}${datadir}/${BPN}/completions/$i
+	done
 }
 
 RDEPENDS_${PN} = "bash"
-- 
1.9.1


