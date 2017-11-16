Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id CE3C0787C7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 18:32:05 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a84so15315904pfl.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 10:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=7flV+kwv8On3iVUw4sdbKiOkVNLRscYZBOMxWVSYo0I=;
	b=Zk2WJ2iT6XuVBw1mn+FcYCObYEAZAm51LRGmoF3Ux0RM5hEGdSQUxz4w32vggLDvXg
	Z7DN8dVRKwGNRy2/qJfRot/KbI40MOKmDLDCl8IEI+M3DOreWDbFXlrE/Fovy6XLtfPT
	5UevY6ghSNwFI7pc3jpEu1JKAiFaqdQGICnlRk/uvlt0hVGILpLOu/1pHPlwTdJJ1Tig
	Xj932Snh3Q+DZ+xOzkHM+B/TGZk5Q0+9myW6BShrJ7n9LOGUL9waWrWQT0Zj/R0x+YtP
	SR3I3ydy8M2AgzurUaGWij9TQAENJ/+OUmNw5hLIhkxBQpu7siFOIWtBED7xL1AXQRky
	XwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7flV+kwv8On3iVUw4sdbKiOkVNLRscYZBOMxWVSYo0I=;
	b=On27Z2f6qApbUs0EEXtSc9rR6h079GAPcXo2Zt9Ixuw0eGS6+b204QAYI6JYYIAmUa
	a8LsSt8VOKqkZ4L9FPI75O/o9HIvTXYRHBv/WMxKJlF/55FFkGW+LarpMr3bitaN1ZmS
	25omljUMYMMUvWqD9BNT2tWLtq+O6T+N1ggStn7Npc1ElyG3g8VXT1jNDaOMDNWmaePT
	9eh6fMW/KK98VeREma5Lf7q47OAO0tqqeEpOrHDqLB7HFC1736kBKQdb+b0AiQ+u+KY7
	Y49DhKY/yn1ifara+BcpKL8nV8xlpaK+m+2XtC/uv1V+vvNWo5e/B7jsWXIG6lS2XIqX
	KJgQ==
X-Gm-Message-State: AJaThX78XlzQJjgkHqNMzSK9m+3/+D0PwjJ7mg4dxKZ+zb+bxEHoKf8n
	AvANYsxXDltSgqEKXUE9Fb0=
X-Google-Smtp-Source: AGs4zMYcmZhZ08AiX4IXPk3g2pSbZRLsx/7m52DyBk16r+uIGURuUQB5a9BYXzKqiroYv+pgf2U7tQ==
X-Received: by 10.99.160.25 with SMTP id r25mr2500768pge.67.1510857126974;
	Thu, 16 Nov 2017 10:32:06 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:a90f:c0e3:b57a:b8e0])
	by smtp.gmail.com with ESMTPSA id
	s14sm3975736pfe.36.2017.11.16.10.32.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Nov 2017 10:32:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Thu, 16 Nov 2017 10:32:03 -0800
Message-Id: <1510857125-8109-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][morty 1/3] log4cpp: fix QA issue
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
X-List-Received-Date: Thu, 16 Nov 2017 18:32:05 -0000

ERROR: log4cpp-1.1.1-r0 do_package_qa: QA Issue: No GNU_HASH in the elf binary: '/build/build_artifacts/morty/tmp/work/i586-poky-linux/log4cpp/1.1.1-r0/packages-split/log4cpp/usr/lib/liblog4cpp.so.5.0.6' [ldflags]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb
index c7bf288..d4f0589 100644
--- a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb
+++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb
@@ -21,3 +21,4 @@ EXTRA_OECONF = "\
     --enable-latex-docs=no \
     LDFLAGS=-pthread \
 "
+INSANE_SKIP_${PN} = "ldflags"
-- 
2.7.4


