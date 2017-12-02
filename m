Return-Path: <bill.randle@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 86F97786EF
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Dec 2017 05:13:16 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id f6so7442933pln.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 21:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=v2yn9vznEDiw5MZNFDVXV3eCGFvMVJrh+MJxQ3coph8=;
	b=fcUPUEmElfM4q2Bwg3BRSBf/xG0sg5y9g086AOjVHwwi2rB1Vl3PnVZr3Gmza/Edh1
	oJrAmarOq0YX6qKksxU8fRhAQOJIhrRJeDiLX6nRqfFjsz6YnrtAyAhcWT9/BYZPNWWg
	+wha/saRk5wWwwecTtch+BDxX0H+C2ZlBZ4yNVi2v4LzZY4okKpd+sMSMZtvnvsz0lRW
	trXGo7roo05VcvliaO2j1AO3yLGlTYHlGuyqLNuPy5IMi3YSEgdiWbTRuTfu2+iR7kkF
	sVPTBLKVpL/PoAFyMuG0xuPegL92sOnmRHh0bF4sP1JeBdkGZTizytBcfQwB6XbHMVuK
	q7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=v2yn9vznEDiw5MZNFDVXV3eCGFvMVJrh+MJxQ3coph8=;
	b=p8eRfXDayxGlOsylLe8EpHQ1v03/OcdJ/akWWcXJmFSnJ/81yJ2Fal8bnHfZxr6eX5
	FdGjI2HR2tS+fphJ0OG+o93KaFjOjehjnWmo+LlS/+GUA1zQ6R6TQA0JBax7FOlp6coy
	hfco7sKqv5cT8+az6QIZi5cd8W/ns9Z2H+9EX9BZ6oYFlT7O6u0Ij68A1tbyIUTp/2bb
	+0dPTyT2OJLzvTz+NSks1JN3mD5xonmioeSc7JcSXeeQvZ4OlfXcXLDo32DsdWYAHNw8
	RMVqsOWgM+2qCNQQ7LdmldEd5IJduSfJa3yl4LgOpxXHhgrRQDglAMwukZsFEBCVGmVa
	s6pg==
X-Gm-Message-State: AJaThX5qTPvH/uhxDCuC0yDXgDdQwXEUV/G8dgT7V6EQzPukaqMhGUeH
	Mg7hDYeZZGoKsBE0ylJKVyQA5A==
X-Google-Smtp-Source: AGs4zMaPuQqnaBloStYDAwFeK4R6EoXighpjWRP3id03pMdqb6eYV58dHC/pHaklPBRc4DDbesUiMw==
X-Received: by 10.84.242.145 with SMTP id d17mr8085041pll.4.1512191597340;
	Fri, 01 Dec 2017 21:13:17 -0800 (PST)
Received: from neosoft.neocat.org (184-100-225-25.ptld.qwest.net.
	[184.100.225.25]) by smtp.gmail.com with ESMTPSA id
	r1sm14681137pfg.98.2017.12.01.21.13.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 21:13:16 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:12:52 -0800
Message-Id: <1512191576-2302-10-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
References: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 09/13] python[3]-speaklater: new recipes
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
X-List-Received-Date: Sat, 02 Dec 2017 05:13:16 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-speaklater.inc     | 9 +++++++++
 meta-python/recipes-devtools/python/python-speaklater_1.3.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-speaklater_1.3.bb | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-speaklater.inc
 create mode 100644 meta-python/recipes-devtools/python/python-speaklater_1.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-speaklater_1.3.bb

diff --git a/meta-python/recipes-devtools/python/python-speaklater.inc b/meta-python/recipes-devtools/python/python-speaklater.inc
new file mode 100644
index 0000000..94fa8a6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-speaklater.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "Media asset management for Python, with glue code for various frameworks"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b810770075a29bf44b96607440e7c801"
+
+SRC_URI[md5sum] = "e8d5dbe36e53d5a35cff227e795e8bbf"
+SRC_URI[sha256sum] = "59fea336d0eed38c1f0bf3181ee1222d0ef45f3a9dd34ebe65e6bfffdd6a65a9"
+
+PYPI_PACKAGE = "speaklater"
+
diff --git a/meta-python/recipes-devtools/python/python-speaklater_1.3.bb b/meta-python/recipes-devtools/python/python-speaklater_1.3.bb
new file mode 100644
index 0000000..56fd555
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-speaklater_1.3.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-speaklater.inc
diff --git a/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb b/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb
new file mode 100644
index 0000000..aa4f699
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-speaklater.inc
-- 
2.7.4


