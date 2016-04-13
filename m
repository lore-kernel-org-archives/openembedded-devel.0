Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6C89D70031
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 13:17:42 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id b32so4540796qgf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 06:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=gR3jfJ1Qd0F+eF4a5xBKMX11wNFIeBQZmwXkui4IDTI=;
	b=Oy2D9VKJRewEuoLDfqZp/TCMwW/awXdaToynbDLJT1sTKuYZb7AFxsIqaRHSohFeyj
	1CknHqRZeWL8ibD92QXD9nzdGVzNDLJdLxZRsIZnploTlgTg5bCItrg00WfDKwR+mv/l
	oAdeTDbQQ0jtnoGXqWDzwQoZNUqXwZ98gLsouiuVSgN3/mu6AIEpJUpKuWSmmneJeNW0
	HTHR2Is/lsBsalxv/1s5P2gv2DVPplwfd4si3Gv4mXAp2BVs/uZvESJHgfGHrrbm4AyZ
	26qNUcvQpaG6idpaUpkR9lub3DXqgttFtD5qfskkaOmYuZEzM1VwNSY4GrdMM1BOnrNi
	n3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=gR3jfJ1Qd0F+eF4a5xBKMX11wNFIeBQZmwXkui4IDTI=;
	b=D37SZ8CV5Sgs9dIoUSaAJwC1jKwBwZPrX2lSoVOjlxPVCDo2uxByjQFMdTdM3OTu7H
	l5h3CbliiyeZtmQBLQq0ABRq9YuueLaWCprBBi4PxHoTmhKLOS6QmkwvnIPC9UBv+loI
	vs39Ptu19sGaJDZ/8uOj35r2OdioBnIOEvhYpJ8JJj7PTBEcMEqU9cIhBEa+OIDU01ui
	8rsx1bmuYi0EUi4jkKZ9cXQgxUfyttDWQe6TkbJJXveqoC/ayaGhXRapsn5xVTCdV1Ni
	Mgo+axunY+a+RojGYXRXSgscWRf39H1yUS+Nn6q5L0xHPZ886C2TYLxMnev6PkR6oa5V
	zZeg==
X-Gm-Message-State: AOPr4FV+Q4bLsLZ2mphdcpHi7drIVY+M5co7yMwbZDgxwtcC/Y+9eW24Jnysgh78rbU9jQ==
X-Received: by 10.140.159.18 with SMTP id f18mr11693993qhf.61.1460553463726;
	Wed, 13 Apr 2016 06:17:43 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id
	s62sm9367206qhe.10.2016.04.13.06.17.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Apr 2016 06:17:42 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Apr 2016 10:17:00 -0300
Message-Id: <1460553420-12533-9-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 9/9] python-wtforms: Add recipe for version 2.0.2
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
X-List-Received-Date: Wed, 13 Apr 2016 13:17:43 -0000

It's a flexible forms validation and rendering library for python web
development.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-wtforms_2.0.2.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-wtforms_2.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python-wtforms_2.0.2.bb b/meta-python/recipes-devtools/python/python-wtforms_2.0.2.bb
new file mode 100644
index 0000000..ae605d5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-wtforms_2.0.2.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "A flexible forms validation and rendering library for python web development."
+HOMEPAGE = "https://pypi.python.org/pypi/WTForms"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e9377f5e4bfad82b40ed63f0fd4d1cce"
+
+SRC_URI[md5sum] = "613cf723ab40537705bec02733c78d95"
+SRC_URI[sha256sum] = "10737758ceae03b53021f3aa7e81bfc8dd6f679c879ffeb5e64ac6570facb6c1"
+
+PYPI_PACKAGE = "WTForms"
+PYPI_PACKAGE_EXT = "zip"
+
+inherit pypi setuptools
-- 
2.1.4


