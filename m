Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id F26C561182
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 23:18:51 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id 84so5585892pfy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 15:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=44vuXZMtmi7IZ10z8D00SOE5sSyqzXlAKLtOv/UUQrg=;
	b=ADWg1mhycvoxR8BDUXv49W02lTYe8PyyCwJPGcDuoX1axWsjaTNEobZUcbGYBjQuOs
	DcHhDGvYjnpRHF3B78OaBSevxh+XWEoK97jb5xERqTi3f8fxYAyFmnQomZIpxGbXjI3O
	7o0dyJkLvDEv1t6tOEBzGppP9C9jyztAA+FXsx7wTBBxJL2yGh2qC1YguQU0DlHmzqN+
	7aSRmKkgP5BDTE+EsWgh8Ss+H58M4JaYVFsH6+ESdOuLoByOqT3NpGb28ccwF+USx7sa
	TVrPbhAbTZZ0t6GIPnEOjZhg18S9GJnULy9m/Xwli7llDg0tfGqq9r4gsYjKWdQDq0GI
	34Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=44vuXZMtmi7IZ10z8D00SOE5sSyqzXlAKLtOv/UUQrg=;
	b=Ux79K/zJcK3YdBspUFpj36b9j6oiVbp8Y6Yvy07SRvWMKidjrLBkzduZ4Bn4dCpBWa
	2fbp3Gaq8fDD72PLHC2zRnSunDqrvIoVBQf0hIM9zuSkUuNrFNxobQtllyo2bJqZDeZM
	5Tm5CX/9fQbdYr2eXwVSKe8Nkiy/2/tfeCTzYiVF+J7KimCWa3qk7nzQKp5kw7aWuK8i
	gqg2Kc2YdeHDmeY9Myz3OiASYU8+Cg2TXrGFMDpnjRf4KLbIRrEyR7svT1YIuWVXEsYa
	JgzGPm17W4LnP5aKbAAfO2dm6qL/tj0F/iNq+72lYs4RN02LWocE0cV/sFUOaRBkOoQB
	kOJg==
X-Gm-Message-State: APjAAAWGmG9ZZMGZxQNyfDaZI+29rgpMOOIimWHsn2za1tfnCEEhIoY4
	wa5mULqgtVq4bT6Ez8IxJl0xNtH3SDs=
X-Google-Smtp-Source: APXvYqwL3r653gv4wg5eVzLw+P74IjVosfC6Kp+Ezm/DYnLRRYa0VnnWWIUoma6wfW6Ryfe6iIJ2+Q==
X-Received: by 2002:a63:c144:: with SMTP id p4mr5822373pgi.226.1581722332713; 
	Fri, 14 Feb 2020 15:18:52 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	h10sm7805092pfo.181.2020.02.14.15.18.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 15:18:52 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 77CA52A0506; Fri, 14 Feb 2020 15:18:51 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 15:18:28 -0800
Message-Id: <20200214231828.9286-3-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200214231828.9286-1-jpuhlman@mvista.com>
References: <20200214231828.9286-1-jpuhlman@mvista.com>
Subject: [meta-python][PATCH 3/3] pytest-html: Add new package
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
X-List-Received-Date: Fri, 14 Feb 2020 23:18:52 -0000

pytest-html add support for outputing html reports from ptest runs.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 .../python/python3-pytest-html_1.6.bb                 | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-html_1.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_1.6.bb b/meta-python/recipes-devtools/python/python3-pytest-html_1.6.bb
new file mode 100644
index 000000000..8ace29ed1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_1.6.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "pytest plugin for generating html reports from test results"
+HOMEPAGE = "https://github.com/pytest-dev/pytest-html"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://../pytest-html.LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
+
+# Per README.rst the license statement is fetched from
+# https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE
+SRC_URI += "https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE;name=license;downloadfilename=pytest-html.LICENSE"
+
+PYPI_PACKAGE = "pytest-html"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "ac956864a9b3392203dacd287ae450f0"
+SRC_URI[sha256sum] = "a359de04273239587bd1a15b29b2266daeaf56b7a13f8224bc4fb3ae0ba72c3f"
+SRC_URI[license.md5sum] = "5d425c8f3157dbf212db2ec53d9e5132"
+SRC_URI[license.sha256sum] = "2bfdca60adf803108d4c7f009000bea76ad00e621e163197881b0eaae91b530e"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-pytest"
-- 
2.13.3


