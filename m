Return-Path: <shantanu@senic.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB007C041
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2019 17:45:54 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id y4so7536341pgc.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2019 09:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=senic-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=8x5AYIB6+tKpzLA62UFdZG9vJdoElB3GRiAHf2F5yCo=;
	b=mFfMLgBROS5ba5UU3Tzf9TGqoA8q24dnyi5jLuC6dJvM6lTLm0jVHeN/xOa6XEPpxC
	laQFrgD+fbT94d6OqKbINrv2vbFZCVt6ns0xPg3CeVfN/uEYfU7pbgElphzk2LmcOGb4
	aV91L8PvDWLdMmHwHN31NMTf5DsHBqMhwHdYL2UTocMkY75DNvg3MOPD6a33dqUXHpnP
	IEQRqLPsgeKNotJPV9jOSebUs8GLis8TPmm/WEQnLcnTWzUuo4pjcNlvqY51w4kr5kqi
	bMpqDNMzNKV3c+q3iMJhq5qMWDGat6MY1CIKOIw1lGfYDnMLOqXjLMlCYuORubGOMCPX
	zHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8x5AYIB6+tKpzLA62UFdZG9vJdoElB3GRiAHf2F5yCo=;
	b=nQKqh8pT3Aq0lkxIi2jbsw/3mR0gcIb1jzqYXUs43hOS7fHDUzFx3B/6gCOl3pYBnf
	XrY7HyCHiRCVcEgULL6r5QSwNBiHOsI/pO3IczKzhNxH2FGNHwWcg/l8BJ6gH32rfGDp
	vNwgbqjyzKpsGGto23I+nnmbQcC9/3Mtl6wDPBdJBvGhivAoHcKqAXNQFBvHvH9/aFRv
	+0VewPmmjda3VvTblOdavTkSby11j5STG38G46gsZECL5T24PaUZdxFxy8vTl9H4Zvw5
	oUv3pz5lGaYZA7CA76+CTD0OIjY/q8trxsNVsYAb1CsUwGVvMX6tmx+v5HXUjCrgoDRq
	VJIg==
X-Gm-Message-State: AJcUukfFNhI1NUwsT2g7BYqU2mKbGGWo5HhsqR9+oP0DFEiXxYWlpqhG
	oXDy3hYueMB584CvUCp6sjii/jZF5kA=
X-Google-Smtp-Source: ALg8bN5+mvm8lcEf/wjnc0G3WRN8eAq2KqO/9Gams5/kjp415XIZ4tgW3EbbQ4PqHaiGt0irER91ug==
X-Received: by 2002:a62:1212:: with SMTP id a18mr24693415pfj.217.1547919955516;
	Sat, 19 Jan 2019 09:45:55 -0800 (PST)
Received: from localhost.localdomain ([117.241.130.152])
	by smtp.gmail.com with ESMTPSA id
	r80sm12483347pfa.111.2019.01.19.09.45.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jan 2019 09:45:54 -0800 (PST)
From: Shantanu <shantanu@senic.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Jan 2019 23:15:44 +0530
Message-Id: <20190119174544.19389-1-shantanu@senic.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] Add recipe for python bindings of Berkeley DB
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
X-List-Received-Date: Sat, 19 Jan 2019 17:45:55 -0000

Included correction suggested from Khem of using STAGING_EXECPREFIXDIR

Signed-off-by: Shantanu <shantanu@senic.com>
---
 .../python/python3-bsddb3_6.2.6.bb            | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
new file mode 100644
index 000000000..81baf98fd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
@@ -0,0 +1,19 @@
+SUMMARY = "pybsddb is the Python binding for the Oracle Berkeley DB"
+HOMEPAGE = "https://www.jcea.es/programacion/pybsddb.htm"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3c8796b7e1f8eda0aef7e242e18ed43"
+SRC_URI[sha256sum] = "42d621f4037425afcb16b67d5600c4556271a071a9a7f7f2c2b1ba65bc582d05"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "bsddb3"
+
+DEPENDS = "db \
+  python3-core \
+"
+
+DISTUTILS_BUILD_ARGS = "--berkeley-db=${STAGING_EXECPREFIXDIR}"
+DISTUTILS_INSTALL_ARGS = "--berkeley-db=${STAGING_EXECPREFIXDIR}"
+
+RDEPENDS_${PN} = "db"
\ No newline at end of file
-- 
2.17.1


