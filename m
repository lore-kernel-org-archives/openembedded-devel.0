Return-Path: <logyourself@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA9679558
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 10:00:45 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id s13-v6so2301137pfi.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 03:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=v+1rTE+7i4dpgB7bKekry0h7g9rp8OBeGDdcMxljwEo=;
	b=R8SEcuaG4WWUZR2k+LsZuZXYzFsmA2JJEqcceLp30OrDumB/JSNLFwxAsSIGWoD8FG
	Qcm7UgQRoL13wNJsw6lDGyrdr/3sGnxjXmCHlqTrZemOBpajKsgl7DltqyODrQPK0Oe+
	/y0KoGdXGO4wgHVESQmIuCCNc3bo0UuQpjWcUVU2jxjPISuHzcQ+cSxPbSI8gvvWBPB3
	72jxySkyduyVRYXA/o6zcAEZM0Vz714Emn95Z88l6uH0cY1lDlnNNJ8NY+xh4Oo1EkyD
	ipsom7zZkeQiNPr3Eqc1YBWMBjvVlwRns2aSuQOXlYnR6nXeKeBFj9PdMLHSupopTzKR
	MFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=v+1rTE+7i4dpgB7bKekry0h7g9rp8OBeGDdcMxljwEo=;
	b=TOLH/7AjGXPLPNGdsGDMhuBWH3u2nZiUXSdnN1J3d+JUKn34yXfPssKjV3KDgaI7/J
	Ta+mOnb2gYMrMwYN6yAh0cXJcdNWxSCwbJkKK+MGczvipjaRI8rvNkBsEfCzufwxP6og
	5MitLsSG3Le7oOaA6V6zVXzHGkfziZa0ri4+kzNRBsicoErHMOI6jnuBHbBgIKk2hNOl
	5x6f0E1N0cNVbV792jnWwaaqh/V/nLGckBDb5tMBShTbsnLDnYTHGm1zmqD+lcM7psIS
	T/qgxcyiDuV435tz20XCn3ZtLqLcfFEVlC1gOGvmnHLAm2kVDk/zX4+ocAvVxm8dPpkH
	khHg==
X-Gm-Message-State: AOUpUlGadg70uTrqVnMm9TnAgeKmnmCY9TGWL/+QfDjoDZLHrqHFj+c9
	FGfTmMqvTk6ZERimUOyqMZGMAVb34R4=
X-Google-Smtp-Source: AA+uWPyKIQV+gQkRUaxrKCs5GUQR38UjahJuZnwzPkVeka+P9bqqZHsptGKbnuLrTHNSgoVS862eCQ==
X-Received: by 2002:a62:6602:: with SMTP id
	a2-v6mr62096490pfc.159.1535018446059; 
	Thu, 23 Aug 2018 03:00:46 -0700 (PDT)
Received: from localhost.localdomain ([182.212.44.138])
	by smtp.gmail.com with ESMTPSA id
	i3-v6sm4255700pgq.35.2018.08.23.03.00.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 03:00:45 -0700 (PDT)
From: Junil Kim <logyourself@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 19:00:37 +0900
Message-Id: <20180823100037.31812-1-logyourself@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Junil Kim <jjunil79.kim@lge.com>
Subject: [meta-oe, morty][PATCH] ltrace_git: Update SRC_URI due to inaccessible problem
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
X-List-Received-Date: Thu, 23 Aug 2018 10:00:45 -0000

Existing URI service was closed and fetch error occurred.
Change existing repository to another mirrored SRC URI.

Signed-off-by: Junil Kim <jjunil79.kim@lge.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 8ae018503..097723802 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -15,7 +15,7 @@ SRCREV = "01b10e191e99d8cb147e5a2b7da8196e0ec6fb94"
 
 DEPENDS = "elfutils"
 RDEPENDS_${PN} = "elfutils"
-SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=master \
+SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http \
            file://configure-allow-to-disable-selinux-support.patch \
            file://0001-replace-readdir_r-with-readdir.patch \
           "
-- 
2.17.1


