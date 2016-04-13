Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 02BD270031
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 13:17:35 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id u190so1579002qkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 06:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=S+UbP60fmUYKnE2/PFugffqcrqFHrdDBaAKf/XQyE2A=;
	b=czbqxeJCfhDyojz9jlisnQJJa6GTqzR5LF8HkDgWMqBpsCbkZmRwmvhc+IDs6hKxkN
	XpYkuSKrQLRhIfQ0T1hgOwkqB+aZQj2/05gBxx8nhxrnPUcsPr1DjfD+PEbaEhx9LR8R
	L5qXXCSoeSm17TPbhCcnDHX2xgV4dPVwgSpmgPsCTvootsP9taDAfGH5QeN+2ulRqsDU
	sLkkA1E55ljDuIz7cUzbPU0zWBzyye01tV1Hke/PwIsi7yXbTqrCN4+rmXeGLX3K7xpx
	66uktxA7AXIdz+uQWftqInw09EvwVClaf95N98ETa/Sz7AO6mXto7+RWByw+VGpASyv8
	Os0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=S+UbP60fmUYKnE2/PFugffqcrqFHrdDBaAKf/XQyE2A=;
	b=EC7vBOlVfwGPb6kWmDQRMgcYfJCLuS81KTPiWCbxLWQu6ukcVox+ptyLRrwQ5f46sX
	fX6dm8t3aFA/FT5cmC0odqzrHLQgIa6qNScQ0hWtHwjPfckBAw0lAmHFclrAznRlK3oe
	ZTh1oDaW4dS3Mkv4KAvcwGLpR6OdNST+TpPY6znO2tnrca7TNZghURKdCql90EFnsqHM
	gehPMrdy5iwsti7dSCAt/03S1SNhC8wxsmlMFEGJnJhYEsO60oIJb7E0ojcEqbTmx19K
	H8tJlstkZOSTWj1Lkx1rChtDSqsh6u8qW6riUf03Tbo/2Cs9mDxCfEJ3ce0i/2ROIWu0
	73DQ==
X-Gm-Message-State: AOPr4FXIkhWoebv8v249DVcV+JNQ7H19kvFNsCk2WFlK72cIVE/XFmeRmvj1F7Gj0Hq2Qw==
X-Received: by 10.55.10.77 with SMTP id 74mr3839006qkk.4.1460553456303;
	Wed, 13 Apr 2016 06:17:36 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id
	s62sm9367206qhe.10.2016.04.13.06.17.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Apr 2016 06:17:35 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Apr 2016 10:16:57 -0300
Message-Id: <1460553420-12533-6-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 6/9] python-flask-sqlalchemy: Add recipe for version 2.1
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
X-List-Received-Date: Wed, 13 Apr 2016 13:17:37 -0000

It's adds SQLAlchemy support to your Flask application.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../recipes-devtools/python/python-flask-sqlalchemy_2.1.bb   | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.1.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.1.bb b/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.1.bb
new file mode 100644
index 0000000..a258713
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.1.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5ed1b8cc741515a835a7f6bf2f62ef4a"
+
+SRC_URI[md5sum] = "dc15fe08b07b434d3d2c4063b4674b72"
+SRC_URI[sha256sum] = "c5244de44cc85d2267115624d83faef3f9e8f088756788694f305a5d5ad137c5"
+
+PYPI_PACKAGE = "Flask-SQLAlchemy"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} = "python-sqlalchemy"
-- 
2.1.4


