Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8221.1795739735389649385
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=P39Ttycy;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386ab9ab619so10131466eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739735; x=1796344535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSP2uQmexrPKjLi4wlV0JYASXIP60sBIHGvqKqol870=;
        b=P39TtycyZbloXI8OL/GfSdnKx7dXUGdENinzbt93Zn3x+NBFEZwpD412jA7pGIByvj
         1sJcReonwfUFZmu6HYkDX55PfgiFkVmjdtiXleoVgAJBwFBB4VxzrER3XB2IaphH2mmn
         BqDEm+Sf2WZkcm4G8FN11HaHuvjgM419V+uyTVSYLl3MDj0bTBz9xl3HJJDDQ4zIFbjx
         3pVmlk6rjfd7N7Qwd/cyopABmtt7kgMzPtxDOndGrZPrEgbvRTtwvLIqlpHxX4i8BUDm
         3ykZ9+3l0hMUiwmfnzqH60NBNl73cwo1Wsj34BwHVcO/EM6Wt0fI18l7HubPLYv8Vnn+
         snhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739735; x=1796344535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KSP2uQmexrPKjLi4wlV0JYASXIP60sBIHGvqKqol870=;
        b=PfT7TqmS+Dw3CssSH3jjGRtreWogf2atYcsCkIuWIC+bwOanLpLTVs0mo0l7Ehe+af
         31PqP24awLwTCzG9ALN6Ul7mNYGyn+5rO7c8+lOlh8AXvvi+mCCu+IrTa5LnCyXf9KR9
         zVN2jWC7pODKPHcjnmAPCS4Lxs1axH12nqB8azGWMaEneKORrfZOF8WFHEe7871Lg+LM
         wM1k7VaMmx2phBMIvDgy9hXYvWWCgC+Ajg1n3J23j7h7ajqnI0DFky3cfn3faITrxxM3
         bvJiSB8sWxVxz7WpfHH3SH1XB3ANpEeiK96u1HlcRbZhfsm4qRvVy9B1AsK6nO9a3tN+
         utgg==
X-Gm-Message-State: APuU4Z/heN38FQh8YYlHJU+aEhBHggr30/ZK3/hEiSMRULQO9m0LV3MN
	i5brM/xOUbBCKtNvMkJ449if5cuTQ78O6ZkuQ8spMveL+CMUPIpny1XDoRkG/GYc
X-Gm-Gg: AZFdTZcpz1tG86vuScXn0ricMdw5HL3+i184zPCPo2G8J2u/sJ6oegmR6FhC9uZgyJA
	syfOZmlu8ZnJar2xFPGfn8bXYZuAskdkgo0QSN8ObwMh9cYFVM1C+JMpPAm89O9vqaRmabcXiYB
	rSQIcrrrqqT6TSKyiSI+SSjG3a8ogZrf7rpsKksMvY9oby6I6K61tyFnzYPjDiqd43L0r8+bdKT
	gc+CWBuCSz2QVPrxTOUc9Sg1ci758geoaK8AGR4RrpQSARCyRMruIHd9Y4BSdC3+VCqaj+YTmZx
	8bpV9p5/e5+DwarkO58OPZC4B/36xKNJK40EcKWC4IcWC8Q4YqzMApIFKpt427VPxamylpBpXnc
	563Tkv6kSvqT2ExfFiwm6rgee3UM3Bb5+UiUZQ+KEuarShCeVbsi0BvHBXiuESudQtIlgEntSEP
	oxbLV46ETD0BRSG/P0VuPJKiLR/FyUD2eNQcjbH82rAPtq0vg4meIlaByyuOmAP4aEtvX65bz4J
	gp7Opj/xfc075obMc+GIvs+/HhHoMEijqeqmnHCuMehegZ2NCyZnkPGMXijZj3Fr7MyNvIlCUSo
	QM9Lh8YQfG/aS822godedSwG38HSbr8nNwk4qn4a41AkjwhVPYX1aWSdHbqUpOF7xzpIGqm8nN3
	RIKc04rkZHs05AZxwMTetgjzjgG78r180py+ebvkcXvV5+d07JdnfE/pHuEc0AdXO0w0ROxPmEh
	LCIecFmzWDxA3FZJIqdtoS0eibqChIV5SZVDHCiR40YlyCzxcoDzKTeC/LFK3f4tBL9MyvgBb1B
	FojkAslvbDgNYMS7bPADA1tlpqt5WoCcQb3UO5QBHbDJbZICGEMJEphsg93aXUZyBkQjZ++k7UX
	rDKAX7zv0e9xyj4f3Elx+vsRQw==
X-Received: by 2002:a05:7300:1c17:b0:386:a105:fa66 with SMTP id 5a478bee46e88-386a105fd17mr17348703eec.7.1795739734724;
        Thu, 26 Nov 2026 16:35:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 61/69] libtinyxml: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:17 -0800
Message-ID: <20261127003425.2166632-62-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133161
Content-Type: text/plain; charset="utf-8"

The recipe was marked UPSTREAM_VERSION_UNKNOWN, but the SourceForge
files page still lists the release directories. Check it instead (2.6.2
is the latest).

This replaces the upstream check settings from commit 787d1b73e2
("meta-oe: repair broken recipe upstream version-checks").

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index cca9717f8b..31e5585856 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -15,8 +15,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'${PV}'.replace('.', '_')}.t
            file://CVE-2023-34194.patch \
 "
 SRC_URI[sha256sum] = "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593"
-# Upstream (SourceForge tinyxml) is dead at 2.6.2 (2011), its final release.
-UPSTREAM_VERSION_UNKNOWN = "1"
+
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/tinyxml/files/tinyxml/"
+UPSTREAM_CHECK_REGEX = "tinyxml/(?P<pver>\d+(\.\d+)+)/$"
 
 S = "${UNPACKDIR}/tinyxml"
 
