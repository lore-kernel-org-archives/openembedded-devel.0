Return-Path: <koansoftware@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77446C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 13:19:50 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.9585.1634649589419330012
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 06:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WX3yR4wZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: koansoftware@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id i20so12709788edj.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 06:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=8emF8+ZXF6epfeT68JJROibqwpRLSKOQZnQyfX/3SX8=;
        b=WX3yR4wZI0WXne1saiTouySCgd2RFk8b4x1942L1Ey6wcdXa2tfxFvaIhUtxLf+PFG
         XkrmLC4SH3zJC8iid0r9voGOhO9vh3e1QpIr2UzbwFt5iAtrluch6yPOHP+Z991BpIrd
         ikC/z55ZM5PHb0Pf+Mea2fXCI5/lVbu8Bk16YSANduayUoy+vqaJ8PPqohRcw/8PRc4o
         nZV04aOkMAtJScIslACYmyuF9/DDGQ9sgxe5lt74CmEafAETTO8lBDoIXzzU//wppsNB
         Tn8Cf/Ab938XpUjoBbEMCpqWHFMZFx8/OrN7BhXZ3bjttrvL0l8webbxCB3LMEIORLa6
         GoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8emF8+ZXF6epfeT68JJROibqwpRLSKOQZnQyfX/3SX8=;
        b=y5Tjp+5D7lHSJD40N9fSMUzd3+eQB+vmlg1VMLNpyXqyBRJagXs75XjLA5v9gva4XW
         b4LSv1gRXGiQApWvZ0D8OHn+qS7NqgjMnaj3EKDHJwkSi/odi4BSsViNJmpzx7wvlWMi
         LqFPu+shiH1iJF5TNPWOFIQ03Ncxxv7XWDilz/jt/6zMgXXusGLl6XCYhaHxLdz38mw/
         6lRwi93mJebpWC1GPCeqWPc0RpliyvxaA0iUa1XLYfdtCoAC4IWMHHjzAw/eX+qKaLeH
         d/f442y15mpmqaLaYOJZNWzV2nE1dzVi1zcGj+hFvmef3rrbfLFVJhFqNyRTDRfMRooj
         qE0w==
X-Gm-Message-State: AOAM533gL9YLqbZsssA6oueqaQLjhG7W8lNP6tnI0crOD+TmoN+N0SoP
	VoY2pJmfQFcAlBYFTyOsXuc9BbLtFI1zXw==
X-Google-Smtp-Source: 
 ABdhPJz6adIttIVEJsmusTNg97+zgQ+ImUuxVKSVYycRj59qKXoSpBXmGFq1HecwKingwGcqSJp42g==
X-Received: by 2002:a17:906:4fc7:: with SMTP id
 i7mr37345471ejw.236.1634649576139;
        Tue, 19 Oct 2021 06:19:36 -0700 (PDT)
Received: from amonra.localdomain (host-79-3-92-72.business.telecomitalia.it.
 [79.3.92.72])
        by smtp.gmail.com with ESMTPSA id
 f22sm11223138edu.26.2021.10.19.06.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 06:19:35 -0700 (PDT)
From: Marco Cavallini <koansoftware@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marco Cavallini <m.cavallini@koansoftware.com>,
	Marco Cavallini <koansoftware@gmail.com>
Subject: [meta-networking][PATCH v2] bluepy_git.bb: Added recipe for BluePy
 Python interface to Bluetooth LE on Linux (v2)
Date: Tue, 19 Oct 2021 15:19:25 +0200
Message-Id: <20211019131925.21725-1-koansoftware@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 13:19:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93464

From: Marco Cavallini <m.cavallini@koansoftware.com>

Signed-off-by: Marco Cavallini <koansoftware@gmail.com>
---
 .../recipes-connectivity/bluepy/bluepy_git.bb   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/bluepy/bluepy_git.bb

diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
new file mode 100644
index 000000000..03b1562b6
--- /dev/null
+++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Python interface to Bluetooth LE on Linux"
+HOMEPAGE = "https://github.com/IanHarvey/bluepy"
+SECTION = "devel/python"
+
+DEPENDS = "${PYTHON_PN} glib-2.0"
+RDEPENDS_${PN} = "bluez5"
+
+LICENSE = "GPLv2 & PD"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
+
+inherit setuptools3 pkgconfig
+
+SRC_URI = "git://github.com/IanHarvey/bluepy.git;protocol=https;rev=7ad565231a97c304c0eff45f2649cd005e69db09"
+S = "${WORKDIR}/git"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.17.1


