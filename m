Return-Path: <jpuhlman@gmail.com>
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE0561149
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 23:18:50 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id f2so1083943pjq.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 15:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mZ/1dYEuhfgNGAkY5O8Uidzq+b46tphor0PnAHRU+vA=;
	b=U3vS0yzoMMeJR90nAQX3HoiBM5ZzyCIhh/sZTSI9DNnZkch21XqXeryplJ10HhFGFr
	R26LzzplS8VwkD3kPWuwhVmg0AY3eJxEsFrWxlx7kAtP6yj5s063kexisbMz9N92wwB1
	0wwrOkTkIu94Z/DEDxt7wyJl3M5f0+Nch8KK9Dl6sJh4uIl72ymKQYos0AkKwD1lCwiK
	nItZEJArMb4lTNy9/5yEugtJuuW1WtAIk/o1ZEWWvZEnslC/bTn7clK2HuIBBfoLL33Y
	LwValFR16jgCOEHIsHzrg/04yCjT3nn9RkvPIs2qqKF8PY/Pr5YGo6gAU7wg/w8aV+MB
	pA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=mZ/1dYEuhfgNGAkY5O8Uidzq+b46tphor0PnAHRU+vA=;
	b=o/PVqM3svgE3DDfelEtPDbO2q3i0jqHp2yylvTycNa2jh53qhqb/XIDChFUB+mPg5a
	rCv/q9H/hOxTktSsxU/seXY4qJnyNYHgOV9UlCV08ByOT7kJg2gkuPopTT3kGw/4XfXF
	wfoccsEvawUJFhv0DKnuW74SYNGz0ILl5idJNozsYIMclPWqqndQop9CPxybWUJfkZQK
	9DrypfmZdqHv1bXD8ougEiys+m44emb2oE2dhx7M/VRhA/BqdjSGrV/6OvTiXeHTYbSB
	1SGSozdEfD025wfaKJqbcyMhAiSYL4CoL3HYq45lDLPjDSznLsdz1ny7H/xYxxrLsCSq
	hH7Q==
X-Gm-Message-State: APjAAAXW5+4yv0xqDgUN+j+8cBHVdyI9zqGnhcGJJlfrnYQIGZTT0Mb2
	cW2Fi3spqTNy+S/LdEFBnBjGMcjwXyA=
X-Google-Smtp-Source: APXvYqy17rzLPpfPYYo62Iwv3lN4WvIte8fDBnkh5BKjuLTdDtZ99UXetKm8ml3wGF5FJJzYWG76Kw==
X-Received: by 2002:a17:902:9890:: with SMTP id
	s16mr5071447plp.77.1581722331424; 
	Fri, 14 Feb 2020 15:18:51 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	s206sm8390747pfs.100.2020.02.14.15.18.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 15:18:50 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 3E8C72A04B2; Fri, 14 Feb 2020 15:18:50 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 15:18:27 -0800
Message-Id: <20200214231828.9286-2-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200214231828.9286-1-jpuhlman@mvista.com>
References: <20200214231828.9286-1-jpuhlman@mvista.com>
Subject: [meta-python][PATCH 2/3] pytest-metadata: Add new package
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
X-List-Received-Date: Fri, 14 Feb 2020 23:18:50 -0000

Adds plugin support for accessing pytest metadata.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 .../python/python3-pytest-metadata_1.8.0.bb               | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-metadata_1.8.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.8.0.bb
new file mode 100644
index 000000000..807b0cedb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.8.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "pytest-metadata is a plugin that allowed for accessing pytest metadata"
+HOMEPAGE = "https://github.com/pytest-dev/pytest-metadata"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
+
+PYPI_PACKAGE = "pytest-metadata"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "95674c2390b58e0138cabac5101d1908"
+SRC_URI[sha256sum] = "2071a59285de40d7541fde1eb9f1ddea1c9db165882df82781367471238b66ba"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-pytest"
-- 
2.13.3


