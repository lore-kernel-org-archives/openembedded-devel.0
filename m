Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8101.1795739765223768403
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IcpOBgog;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9ae391a05so51926915ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739764; x=1796344564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTiCoWhFmnHOiThS1G35/TX2Fyj3xpzgw2UvHjYuoAc=;
        b=IcpOBgogycQB+O4V8ptvXbJq8u0roDWdSFVWrWdgh3p6Q6XGWdCUfUz2oH4GcbvYHb
         eqgOEQMAHJWTib4uQMSOUTu9EOg/H5YWByTHtJfXsj6/vas+HRsZ6no+wk8LF5mWfxeh
         i5xIRcesy+IGI3XPNLXO4Y/uV83gZgK4c/mtyUpvnr3iNvyk42gaMlVIaSZt2srTDj0+
         ivWGbF4Ezl1BfPbwp4RxKRxxkqey+Awp/TtFguGf5Z+AnNJWAVOxaka6F4vQ6+vLHZjt
         nhEo9E1xSODsGdh//5PBjD9iuclj0MKYcP+GYHg84iJS8qk81+HdC4sfOaSvL/6zLV5H
         vFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739764; x=1796344564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gTiCoWhFmnHOiThS1G35/TX2Fyj3xpzgw2UvHjYuoAc=;
        b=T0RAzt8mdoENDnPqDweVHIlASy49Z0VW/Y9+jQh2Sewod/f6bQlo4v/RAvfs9OJ2ph
         +Hq7EVRlwRDt928RrKqAG4Fr0feDPwdfNT+HpdOrXdM+5nFHZ7CTO6YusAy1R5JiY9R5
         0TL3VwsnZbiUXq1azJ1tz5hPNQanHurC/fOIFlvW071VDqka/IoIPt8uw6eNhLzjGtu8
         z+xEC1xucKTrw/pFMDso9SQvGDMYnYn4+T3PPlh2uJSDRdX7wq76gf4flmENelYoNbw2
         1jXrJpBhekx3fe0dh6xdDJkItqjoXtH9X65ITr8z6WlU5Qa7j2yDIKdOj6BUGvnYZIK4
         i8jA==
X-Gm-Message-State: APuU4Z9QcfemW9BnNcaIk8gGcypEpMKxUQnzWnlXkD6PL9NPZWO8JHu8
	eWEgx1/cZW8C+SH0QDYO5jFU5ggRvBZ/WnvYc42tna5FFfjc1NgN15NmhEpMcw==
X-Gm-Gg: AZFdTZdqJc4HLclXBx5WmYP4vDDivqM/J6izKo3QaSDFVowBkvZdQsl81tezksE+NT8
	PeMMhVb2pEQFz8PAKaPsnsd3H+7yAv2bWbiBEB/ZL+1BoDmK+Kw/jxqgaKCxCQPBCxY3tz2RRG2
	XS9MoTM+ETcJFxYHCV7qwShyA514DIkknhWiKva6l+7ZT1IVFzoR8w/3i/LAVTmzSyL6CeZ+4DK
	9Qi3jtAky8kJeDEgNWMuFqQU1FiMSUycpIjnvwL9CR9RG1guvp3u83kgLgRNznxd5kQdrwbJU5q
	GwT1QGiU3NuE3u5V5eU4z/G4ny6c32D7t0NV3u6R0RZAqP7Zs1CfVkM3H1FvIV2Pnsw/CSBqIJP
	ExeGL3L1VKsJmKxcIyv7VGireSzS8w9dqc/XKiF0HC2Hy/Xn9qgqFtW+axrKzXCx0zUHAqnbv3d
	PDJqa2gy+flyr+8jn/qg69AsBPB31tEbsflBvU+YATj6ANJ8EzfItnQIHeQTubSOUzWa/Q/XpoA
	JcZosGbRhCGCPOFCX+QI93I/COxq9vosuWSOQlOJYVJpg/ISrzjzusx2YjmjmXNL6JSLJ9b64k3
	kqAHQr/Z8hybZaTVdEUK9oOF+GkcecFHXUyX4bcmjH9SeLixg+8Eguy7xIn7BTtO2p2ZDm6Gxnd
	XG15+Y5H8fmuXrKVUgdUFpyAFdMZFBWqgahCzSa6oii+QQ8HoZrZBDc/NRxoSvUC9JfoDQCcWwW
	SdfdQrU2U9VbQ27v376Lc/3CcKmmAwlxow/x6OhPhKW0wnhb6RWc3L8LA1oKGVWv+SQycsc+K+C
	1kNP+4iVxDPucCxqviw5zduNg1mGOTahn8ykOQ9b5uito/mU53QBRigqz44BuJbzM6kaoPKj/qC
	DEsw
X-Received: by 2002:a17:903:1545:b0:2e9:5598:d182 with SMTP id d9443c01a7336-2f031eab286mr177984755ad.15.1795739764510;
        Thu, 26 Nov 2026 16:36:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 01/39] libnewt: Fetch from gitlab.com/newt-ui/newt
Date: Thu, 26 Nov 2026 16:35:05 -0800
Message-ID: <20261127003543.2167775-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133171
Content-Type: text/plain; charset="utf-8"

releases.pagure.org is gone. Upstream moved to GitLab, which has release
tarballs only under opaque package IDs, so fetch the 0.52.25 tag with git
and check upstream versions from the git tags.

The git tree, unlike the release tarball, has no prebuilt .mo files, so
autogen.sh runs msgfmt; add gettext-native to DEPENDS.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/newt/libnewt_0.52.25.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/newt/libnewt_0.52.25.bb b/meta-oe/recipes-extended/newt/libnewt_0.52.25.bb
index 18a45a3342..e82ce8fe84 100644
--- a/meta-oe/recipes-extended/newt/libnewt_0.52.25.bb
+++ b/meta-oe/recipes-extended/newt/libnewt_0.52.25.bb
@@ -8,23 +8,23 @@ shared library needed by programs built with newt, as well as a \
 /usr/bin/dialog replacement called whiptail.  Newt is based on the \
 slang library."
 
-HOMEPAGE = "https://releases.pagure.org/newt/"
+HOMEPAGE = "https://gitlab.com/newt-ui/newt"
 SECTION = "libs"
 
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 # slang needs to be >= 2.2
-DEPENDS = "slang popt python3"
+DEPENDS = "slang popt python3 gettext-native"
 
-SRC_URI = "https://releases.pagure.org/newt/newt-${PV}.tar.gz \
+SRC_URI = "git://gitlab.com/newt-ui/newt.git;protocol=https;branch=master;tag=${PV} \
            file://cross_ar.patch \
            file://Makefile.in-Add-tinfo-library-to-the-linking-librari.patch \
            "
 
-SRC_URI[sha256sum] = "ef0ca9ee27850d1a5c863bb7ff9aa08096c9ed312ece9087b30f3a426828de82"
+SRCREV = "9b9e7e8936f51f83a7259c5f0a9b4ff909cbd39a"
 
-S = "${UNPACKDIR}/newt-${PV}"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
 inherit autotools-brokensep python3native python3-dir python3targetconfig
 
