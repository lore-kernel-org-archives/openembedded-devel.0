Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6C80A6E666
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 May 2016 23:18:05 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n129so14866730wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 May 2016 16:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Q5l05cyukGipS3mQ9GSwZeNBjX8U3sKq8tfas/m5qWY=;
	b=wyhnbOrAQROoX1tKHb5ewtwV3Bf14iCw4b3KTFWlHr8UEF1jlyjNeGX0kuFZ/p25gm
	55D3arFKtEZGU6fr78Hjp4gb2kmIgcXZQKkZUQ/5sYky+2KgN0czSDakr1PlA8tawC/M
	8gdSWHpKQztHQnAdb4rSI9uzmcTxKKN2y/dQmlTI7h6b6W/IdfCZYwtBchiERFmTfGLq
	czSa/D1HfV0K62MwSXlI4+wAKWRoznVg1NnT2qCfe3yP89VUTc9bdHIdnausStAW6cdE
	8E1iqOzr0J0fPePdXtsL/IRWrdTO5SjJTmkJFfaFNVF+Tm9FaAxZVA0G4R8XElTvugoM
	urtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Q5l05cyukGipS3mQ9GSwZeNBjX8U3sKq8tfas/m5qWY=;
	b=SGTUlGOTeUK6mvla/yET46evE7kv0FuK7+QEVv6eidUw1P45bQy7AjiAnmz2rHBcD2
	Yv3NzqsN1ygPt1p26dlCEmIgQEqaw164zwtGYkog44IH+48kwisBXeolFOg2sn699SI8
	7MRX540dovp4x/2Mw9xfeqnVzddEz+L2SVti9rsGyDWU3ko3rWmaeJY2bnygYpVOw/GQ
	/n9oFsrO/mohhSJl4T/+U7nRMRBk97rvYXJs/+TL6NTDRvhtVagLZdiJ+skM0DYh97bE
	gx4SQc/vokAapSA6syJ7y4m3C9XPt19Hz/ZxhBrwIWpJlF1UjjhxCWQst+1gk4JNJhFu
	qP3w==
X-Gm-Message-State: AOPr4FVbSei+uAwAyTRYDwL+UmYI96FCRi1LQV61TD+lGqBU379u8X5+qUWSnxwfDREqbg==
X-Received: by 10.194.175.70 with SMTP id by6mr33168422wjc.19.1462144685647;
	Sun, 01 May 2016 16:18:05 -0700 (PDT)
Received: from localhost.localdomain (p5B0A03E5.dip0.t-ipconnect.de.
	[91.10.3.229]) by smtp.googlemail.com with ESMTPSA id
	e16sm15572258wmc.3.2016.05.01.16.18.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 May 2016 16:18:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 May 2016 01:17:46 +0200
Message-Id: <1462144669-18427-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1462144669-18427-1-git-send-email-schnitzeltony@googlemail.com>
References: <1462144669-18427-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] xfce-polkit: fix warning not able to copy license
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
X-List-Received-Date: Sun, 01 May 2016 23:18:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

COPYING is a link on LICENSE. It seems that cause the warning so use LICENSE.
Fixes:
| WARNING: xfce-polkit-0.2-r0 do_populate_lic: Could not copy license file /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/xfce-polkit/0.2-r0/git/COPYING to /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/xfce-polkit/0.2-r0/license-destdir/xfce-polkit/COPYING: [Errno 2] No such file or directory: '/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/xfce-polkit/0.2-r0/license-destdir/xfce-polkit/COPYING'

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
index ab720f8..1fb4a5b 100644
--- a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
+++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A simple PolicyKit authentication agent for XFCE"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=758b03f872a88c99fc36d50c5932091c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=758b03f872a88c99fc36d50c5932091c"
 
 DEPENDS = "libxfce4ui polkit"
 
-- 
2.5.5


