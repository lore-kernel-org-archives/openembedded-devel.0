Return-Path: <f.forstmayr@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 36C6074BF4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:21:05 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a67-v6so45367750wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 23:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KKqrMk26n359PzHJuld+bhOtLPFGT9WTLTLLhWpbQMM=;
	b=ZfERSXP97rtqqiJo3GlkjOj7ozRiiA0ehO0smJXUPvAIetxR0Qaglncr8YThzaZzHk
	hnmxHqf9NUfMALEhJR/ZO9cSUJRjgeZN5NWUakUMMEMj0KIO15kD7Vsg39WX2xmjUPiT
	x7u56RLN0vM6Ezpvb0MtR7j5pPCtRu483K/ww/m/uME2rIWwA/+D+t9dxI36qxSw7at0
	tsM2+vCMqgwfhCm92hS2kxckbR9ujjzEZAn+w8izqNuvxhdop0Al+Fu/0rQL8o2nVabU
	ZhJc9eFOaxQecBFP/gy/Yyg01seG+OJOCWScNG+kJleTkTp34jAgnm66RbdjX4DyfDWF
	aFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KKqrMk26n359PzHJuld+bhOtLPFGT9WTLTLLhWpbQMM=;
	b=eYtvPVNT4P4wVuqAjpbQiZwW+ZX3o44fLzvDmjXEqFE+NwKTcQyVv8dyOO/nyHOSnK
	70KFKQQZTIttICkHmLFqUKr6mthNeLJg1MYSBsMdnpAZWWVY4Y12f5nusejSCm05G4Ua
	BiBUBAy/0Q/OTS5nuRvgWKqg6xrZmg915x7OtFeKQCBv0H5UPBabr/qNizstp9JHunYp
	ki2dIt988SEEktfHHEj2sYV76/fp8xpwHyN9XcISDLEPU1dsPlyzVsTkOlIQO7VIPf1n
	Lq3BTeDvlVDSLRmILD2Pfv7Q6bshVFNTedlRpf8qQuwjjidj+zCQNFirSUR4Zkx8JQSC
	159Q==
X-Gm-Message-State: ALKqPwd9tyyL8OlmXYuDefnyv2/XEN5Cb3ZvdIXeo+f0oRMgAWANPCL0
	YiWH+nJ/MPSmNJpC3flI41GSIg==
X-Google-Smtp-Source: ADUXVKKC4fTQhvgfJnoqqHExlJLJgrUy6dOnpxg+leU21vq+p38zzFnTc+LJ2NYjrDMLvQQTYj8BrA==
X-Received: by 2002:a1c:9e90:: with SMTP id
	h138-v6mr450723wme.33.1527661266295; 
	Tue, 29 May 2018 23:21:06 -0700 (PDT)
Received: from localhost.localdomain ([212.68.101.163])
	by smtp.gmail.com with ESMTPSA id
	x16-v6sm14972595wmc.42.2018.05.29.23.21.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 23:21:05 -0700 (PDT)
From: Franz Forstmayr <f.forstmayr@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 May 2018 07:40:27 +0200
Message-Id: <20180530054028.24766-2-f.forstmayr@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180530054028.24766-1-f.forstmayr@gmail.com>
References: <20180530054028.24766-1-f.forstmayr@gmail.com>
Cc: Franz Forstmayr <franz.forstmayr@rosenberger.com>
Subject: [meta-python][PATCH 2/3] Added python sijax package
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
X-List-Received-Date: Wed, 30 May 2018 06:21:06 -0000

From: Franz Forstmayr <franz.forstmayr@rosenberger.com>

---
This patch adds the python sijax package
 meta-python/recipes-devtools/python/python-sijax.inc  |  8 ++++++++
 .../recipes-devtools/python/python-sijax_0.3.2.bb     | 11 +++++++++++
 .../recipes-devtools/python/python3-sijax_0.3.2.bb    |  4 ++++
 3 files changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-sijax.inc
 create mode 100644 meta-python/recipes-devtools/python/python-sijax_0.3.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb

diff --git a/meta-python/recipes-devtools/python/python-sijax.inc b/meta-python/recipes-devtools/python/python-sijax.inc
new file mode 100644
index 000000000..9e46893d8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-sijax.inc
@@ -0,0 +1,8 @@
+DESCRIPTION = "An easy to use AJAX library for Python based on jQuery.ajax"
+HOMEPAGE = "https://github.com/spantaleev/sijax-python"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=16e213d75641a392478df50cf0841903"
+
+PYPI_PACKAGE = "Sijax"
+inherit pypi
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python-sijax_0.3.2.bb b/meta-python/recipes-devtools/python/python-sijax_0.3.2.bb
new file mode 100644
index 000000000..4226c4235
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-sijax_0.3.2.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "An easy to use AJAX library for Python based on jQuery.ajax"
+HOMEPAGE = "https://github.com/spantaleev/sijax-python"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=16e213d75641a392478df50cf0841903"
+
+PYPI_PACKAGE = "Sijax"
+inherit setuptools
+require python-sijax.inc
+
+SRC_URI[sha256sum] = "11b062f4a8b2aad95c87e7c09e5daf5a6b0d0f08abf9efe5f91a0075c6be7c0d"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb b/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
new file mode 100644
index 000000000..24e683372
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sijax_0.3.2.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-sijax.inc
+
+SRC_URI[sha256sum] = "11b062f4a8b2aad95c87e7c09e5daf5a6b0d0f08abf9efe5f91a0075c6be7c0d"
\ No newline at end of file
-- 
2.17.0


