Return-Path: <joe@deserted.net>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id D02816AC3D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 14:46:14 +0000 (UTC)
Received: by iggp10 with SMTP id p10so36626822igg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 07:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=eZ3VPYIisw5JrvSTwlfiTVM8MxXxzl0gQdnGYzay0RE=;
	b=EncznOAsps6wXZ/xQAuVF5X65xHCQSxvIaT/gbonvPcson3quYgf4SuQv9Q2yPcerY
	v1uaiX8yyiytKLv70abD0CYUJptyek9wSqVHB/EBmP5NtxV+awdJAGHM6IJPR5Y7enC5
	UhA9X5KsqGgr2SNvI7LalQizCg29psokYp6fbPTGpzcJeJx1ldQ4NzMGD6dXLuX3eis0
	M5MOJ3HqDYYW1bn1gbS+MX8ocLW8NpUX3qhXV6u+0ZEVsMV68QfhkNzq69Lb/bPJloD0
	MBza/tO9TK3QeIpXDqmUq3AvTflrsQzudROdGrys65Vjl+4qbBI8h+qNGWlr5jeXfd/s
	cv2A==
X-Gm-Message-State: ALoCoQlz133N61HxnUgVaZSUVyRHAp/WRo7BUyag77E7dIF0JUX5AkXwz1m8E2PTcIgoejXWmhIZ
X-Received: by 10.107.16.223 with SMTP id 92mr21338874ioq.14.1437144374678;
	Fri, 17 Jul 2015 07:46:14 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id i7sm3790089igt.18.2015.07.17.07.46.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jul 2015 07:46:14 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jul 2015 10:46:16 -0400
Message-Id: <1437144377-3538-2-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437144377-3538-1-git-send-email-joe_macdonald@mentor.com>
References: <1437144377-3538-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 2/3] opensaf: add optional openhpi support
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
X-List-Received-Date: Fri, 17 Jul 2015 14:46:15 -0000

OpenSAF uses OpenHPI if available.  If openhpi happens to be in
PACKAGECONFIG from the build, turn on support in OpenSAF and add it to the
DEPENDS list.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
index 3d0175e..686407a 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
@@ -37,6 +37,7 @@ SYSTEMD_SERVICE_${PN} += "opensafd.service plmcboot.service plmcd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 PACKAGECONFIG[systemd] = "--enable-systemd-daemon"
+PACKAGECONFIG[openhpi] = "--with-hpi-interface=B03 --enable-ais-plm,,openhpi"
 
 do_configure_prepend () {
         ( cd ${S}; autoreconf -f -i -s )
-- 
1.9.1


