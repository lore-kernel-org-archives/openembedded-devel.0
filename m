Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4EBB57D485
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 22:43:11 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id t17so18251388wrw.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 15:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=UR7Eyz+lOUUq1uE0A32V1c6etZN1LEhJaVg2a7YNx1Q=;
	b=dwh7PAojCICODoYRXW/z+MI9E5rZB1yEERb7/GjGso2sMYXgtE/6DuRa0MnLkxgaHH
	vJK0CzcHCkF3ymaMY9aEz5hHC9Tes0Kf/TpFyVwMGJf+48q/RipquujLi2PjPQxD3cit
	tKkCq55v2n1W+fBp4Ar4MLqrs4MgDOYXRGxyNEE2fpI3qbjVWuG5n7FBX6TBQWp/xUVA
	EqaJAc5GqmNau8eiGweKcqoStGQqn4Dtq4o8gEWpZ7hWbX+CrddFzJebPnGm+GG6wyj7
	L++/LHWrxIF+brqBJk/vOTFU8hTrRO/xT+bOzeTzkOzSN0vn0zjgUxIs/fWb8SQHdTRG
	0ZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UR7Eyz+lOUUq1uE0A32V1c6etZN1LEhJaVg2a7YNx1Q=;
	b=W890egoRtE12BeJ+PxVKdxIcl2lCay10Dt0AkJHs570hbEPQFcA8ICnAc7sOCweVik
	zRSeApPb2+Exk+KyFF8827W+HFurOgjOZi42VIqT4WFc+6/bkcjsLjP9zIJmuaGqnSuP
	TQ+L7Oqe8YUqt38t8gfF6Gw5H1TBFWgxIE637UDwi938QlivM+wFQN9xBWS1VOzV+8OP
	805FVbt1/Qs00UIZ2wGpzogG+DXXqPTDP2jn79K+GyP3Dulzy/6mRXZHXqpQCgKuhgfC
	XY1pJwj5e8+Bjrkkxwk9+8xTOBu7gmRbhW2CWNjiWZiN+vfAuvZbtjRip/esHbrVqS6n
	neYA==
X-Gm-Message-State: APjAAAVsFG4sU7r1DbotyVAszVolTUybNHFr9Sf+ldzFHQV4w1j+Jdci
	d8FFZsCSPQEEvaOmFY4pn4j/BkOS
X-Google-Smtp-Source: APXvYqxri5LGSir7HOp/89zLbj0xjqXQ8L1uBBHgkZv/1dM3mE2GQkNWG3ekVVOKnCz31MMZNWRJ1g==
X-Received: by 2002:a5d:43c9:: with SMTP id v9mr20244539wrr.269.1554763391700; 
	Mon, 08 Apr 2019 15:43:11 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F03E65465DDF607A3E693C2.dip0.t-ipconnect.de.
	[2003:f0:7f03:e654:65dd:f607:a3e6:93c2])
	by smtp.gmail.com with ESMTPSA id
	k4sm42824144wro.33.2019.04.08.15.43.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 08 Apr 2019 15:43:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Apr 2019 00:42:55 +0200
Message-Id: <20190408224258.1744-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190408224258.1744-1-schnitzeltony@gmail.com>
References: <20190408224258.1744-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] parole: upgrade 1.0.1 -> 1.0.2
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
X-List-Received-Date: Mon, 08 Apr 2019 22:43:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bugfix release - from release announcement [1]:
- Added support for GST_INSTALL_PLUGINS_HELPER_MISSING when attempting to
  install missing codecs (Xfce #14529)
- Fixed compiler error -Wcast-function-type (GCC 8)
- Fixed disabling vendor-enabled plugins
- Fixed crash when disabling plugins (LP #1698540)
- Fixed play button sensitivity items are added to playlist (Xfce #13724,
  LP #1705243)
- Fixed Appstream validation by removing em tags (Xfce #14260)
- Fixed plugin active state when reopening the Plugins dialog
- Resolved g_type_class_add_private warnings (Xfce #15014)

[1] https://mail.xfce.org/pipermail/xfce/2019-April/036347.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../parole/{parole_1.0.1.bb => parole_1.0.2.bb}             | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-multimedia/parole/{parole_1.0.1.bb => parole_1.0.2.bb} (81%)

diff --git a/meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb b/meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb
similarity index 81%
rename from meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb
rename to meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb
index 2b4e97490..a286a5adb 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb
@@ -19,8 +19,8 @@ DEPENDS += " \
     taglib \
 "
 
-SRC_URI[md5sum] = "46fe86bbe0c4aa02c53244d66e62e90c"
-SRC_URI[sha256sum] = "8ad2931fdb35415cc3d7551b5f2207bfaa1aba15545accbacbb4984cdabd7099"
+SRC_URI[md5sum] = "cd22ab579470c5728db0aa6c0b9d4c7d"
+SRC_URI[sha256sum] = "bff0fc846d0d7b8f435ac5514976f1cd1d82b62dbf1b7d470e253a5b439407da"
 
 RDEPENDS_${PN} += "gstreamer1.0-plugins-good"
 
@@ -34,5 +34,3 @@ FILES_${PN} += " \
     ${datadir}/appdata \
     ${libdir}/parole-0/*.so \
 "
-
-FILES_${PN}-dev += "${libdir}/parole-0/*.la"
-- 
2.20.1


