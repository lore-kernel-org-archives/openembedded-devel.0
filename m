Return-Path: <george.mccollister@gmail.com>
Received: from mail-ig0-f196.google.com (mail-ig0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 64107731D6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 21:04:18 +0000 (UTC)
Received: by mail-ig0-f196.google.com with SMTP id ik10so20915419igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=D35DP+rrbempQS/RyAmC/ccVFkhObiQpfLNxhHaso2o=;
	b=MHb3pEtig3WQ5iv2monUIwEkGzoFlS86UmBYSOSf3KjMej/c4ykawmzGDFDw6Jyfqp
	JCSCj7THj21nGzWdeCBlSBVMuGoyFfBuQJBWIfUrvG7GLr466Xsw1gPCV4jEM5n3HDNo
	/JBbrr0l/V/oEHRnOZXsenK+juJQ9O1iPFECtPnylfWETmEAh5Ds137m/UVztFo1UNs7
	DQIGFdwwYDM96j3zh8brcMZ4EeELcqNM0WpFqdnEtSY4E/WZM/krLdlEhK0waBosIeNi
	tOPPenpa9mRnon0GOcKeblnhwHOhXGf7HpDp+uc+7yUJEIrU8hDVGgffah1P15dQbeyM
	4HlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=D35DP+rrbempQS/RyAmC/ccVFkhObiQpfLNxhHaso2o=;
	b=FtraqoO+UjC+zejU0EnQ5aEI9ewOiXIQBCv5x2hAKyD4IsbW6cHEWICBDxi0osO5kd
	RC4RO3vs6wE9VF5LugalPBIlMuVwc7ZGR/oeQjx1uOIgl6IQ5nOencp4A32MHNv+um9a
	afqRJL4EUeO8dlJUdhHtuYfvsHBgZGHefOLV4EOv004724DCRPRbKOLP+38l8yReJRWT
	m3hH+Ufq9heeJlwV+rmhYyxYgjHalhuJNxMTiR7I79ONMOO3TPdbHz9mbdf/fp4TKeGN
	0TY1+HIGtP+md7N6LhW97RFTj7HAbJX5RT4QivIvFqwzS5oSkfEFUHA4hyZb5mYuOtfA
	M0Pw==
X-Gm-Message-State: ALoCoQkYtjls40bgUNw7cCSBSO7mEWryeQupTXta0TYIZqpRkOA0G6ik78BxWZPXClP/SFFt0varhTBSwZsLns/7CX2DAMJOZg==
X-Received: by 10.50.147.73 with SMTP id ti9mr6625607igb.36.1452805458903;
	Thu, 14 Jan 2016 13:04:18 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id 81sm3210754iod.31.2016.01.14.13.04.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jan 2016 13:04:18 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jan 2016 15:03:34 -0600
Message-Id: <1452805416-22520-3-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1452805416-22520-1-git-send-email-george.mccollister@gmail.com>
References: <1452805416-22520-1-git-send-email-george.mccollister@gmail.com>
Subject: [RFC][PATCH 2/4] dracut: use bash-completion.bbclass
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
X-List-Received-Date: Thu, 14 Jan 2016 21:04:18 -0000

Use bash-completion.bbclass to package bash completions.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index e026da7..0db9688 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -11,6 +11,8 @@ PV = "043+git${SRCREV}"
 SRCREV = "eab03540cd695d940062af5b55c02e8829aaa526"
 SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
 
+inherit bash-completion
+
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--prefix=${prefix} \
@@ -41,10 +43,6 @@ do_install() {
     chown -R root:root ${D}/${prefix}/lib/dracut/modules.d
 }
 
-PACKAGES =+ "${PN}-bash-completion"
-
-FILES_${PN}-bash-completion = "${datadir}/bash-completion"
-
 FILES_${PN} += "${prefix}/lib/kernel \
                 ${prefix}/lib/dracut \
                 ${systemd_unitdir} \
@@ -54,7 +52,6 @@ FILES_${PN}-dbg += "${prefix}/lib/dracut/.debug"
 CONFFILES_${PN} += "${sysconfdir}/dracut.conf"
 
 RDEPENDS_${PN} = "findutils cpio util-linux-blkid util-linux-getopt util-linux bash ldd"
-RDEPENDS_${PN}-bash-completion = "bash-completion"
 
 # This could be optimized a bit, but let's avoid non-booting systems :)
 RRECOMMENDS_${PN} = " \
-- 
2.4.5


