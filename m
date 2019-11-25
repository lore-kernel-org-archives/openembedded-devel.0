Return-Path: <kergoth@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2197FB0A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2019 17:26:44 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id t26so144721wmi.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2019 09:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=SWyI4uLzznwqV4KsymYKu6ztzK7RF3SC6kVYRoUVVzc=;
	b=ORHHcqu0ZIG60R/Ju6FlQ0N1sFMUEpOIPnVH2wy6IrC4EtQT+0kN8O10EJcTHY6eN6
	atPjr2Hiiv77ncy/ztscb7S9J/IGp0G0RNPsCggsWGelieuwaBEQ3/CQvN1zc27LC/e8
	Gp3+bMTpLO4VVsaIf6R7mfVtUHgydlSZ4uy57MJAGftcgYP0wx1yd99aoV5p/tyAbdoq
	kjCvVl62ly7NWDirBP/4eR6drGdaJzvDvKlp1AjoTU3+yTGjLfAfQvf7oSqYuYn7AMIp
	HIqR36QlP9HikViZfsmjJ0chWt9SMAbsUUxv/zepyb65e5RMp1oXZECs3WhFhDJnHEmP
	R0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SWyI4uLzznwqV4KsymYKu6ztzK7RF3SC6kVYRoUVVzc=;
	b=gF5Y0mB9n9+k62U0Vw2XpEZbBzxinl0v+gZZXU/8Ri5caAQzwPN/1Fl6/ZD0ifijdP
	WCkulrLsbAPmGzZZ4u77cx9NVqDmlf1vfVqTbdfhoCsoJL7gWIHzj+5bbTHna+6IjlBb
	69cnd0lhEs19/zN9tl40+6Ho2BOkBp9gRv0AY4uunaa8AMnPoNMl7ErgIEpy2+QZ4JuX
	V+2Sumh0j4G932UY0Bzg/TyJTYZmjrAYXz2WK9t40W4dyIoBrn2g4V/1kz+q3S6S7vJu
	0DhRp2L7PBAsfrQfOZPYWjrxkCCXJUNYxogOQ7mAAlADXCCMx2V3frunmVkosQRN9IGq
	IFSQ==
X-Gm-Message-State: APjAAAVBt51BV4ow+g18fsgt4gL6R4PTl/tYlDTU9uBslJKBg2MOBWNn
	N0arIVTYUFtw1mp8YRFZHEySZSTjXSE=
X-Google-Smtp-Source: APXvYqyMpEeqFXjrgUlhs/fzKZJcpxzrIpOFTLY0j+sD6E0RQXvJ2g48krB2+o7JWpsuKS8OvgdOaQ==
X-Received: by 2002:a05:600c:21c9:: with SMTP id x9mr4284wmj.54.1574702804866; 
	Mon, 25 Nov 2019 09:26:44 -0800 (PST)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	h124sm9202042wme.30.2019.11.25.09.26.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Nov 2019 09:26:43 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Nov 2019 22:28:25 +0500
Message-Id: <20191125172825.13041-1-kergoth@gmail.com>
X-Mailer: git-send-email 2.11.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH] kconfig-frontends: drop unneeded target flex/bison deps
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
X-List-Received-Date: Mon, 25 Nov 2019 17:26:44 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
index fae80a79e..ec959d27d 100644
--- a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
+++ b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
@@ -11,7 +11,7 @@ HOMEPAGE = "https://gitlab.com/ymorin/kconfig-frontends"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
 SECTION = "devel"
-DEPENDS += "ncurses flex bison gperf-native bison-native"
+DEPENDS += "ncurses flex-native gperf-native bison-native"
 RDEPENDS_${PN} += "python3 bash"
 SRC_URI = "git://gitlab.com/ymorin/kconfig-frontends.git;protocol=https;branch=4.11.x \
 	   file://0001-Makefile-ensure-frontends-exits-before-writing-into-.patch \
-- 
2.11.1


