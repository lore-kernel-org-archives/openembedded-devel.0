Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9F5DE7F4AB
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 17:31:25 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 4so5299108pgm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Sep 2019 10:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=op4m/0tETfRa23Utmh6GJ5ALE1titbc61uXZsQANm4I=;
	b=U/KUsvQkEonIHlaS4YHX0CuSkxRNgXacv0W72vokliXfkHD9lr3BbaXahZwPqytBb9
	ovpSt2gvZlURfKJ6IhSBa5hOK0pYx33irEgDs5lvsomk5P4U106DYLo8r2Wh+E1TTej4
	Jz/6+ApFfahCy8vG/DdP3+SgG6srst7TtQ+60c+93Qe5eXh4UiFfOcgDMoumHGWvDnoc
	xvWVMV4pTVd1DEWGJ2ONum6g7Gpx7JFsQHR+eO6MfOuCNOPrdt0W0nsj1Wr2vW2RBRWd
	untgLxlWW6BNswxxovZneokN0tqAuzr+cS8+8PCcuOj/2V2c6hbQFkZwtZUxNCr7sp4v
	1MPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=op4m/0tETfRa23Utmh6GJ5ALE1titbc61uXZsQANm4I=;
	b=jzzDDpdXOK4V0B9o5BpPjQSbhCSc2OfzrchrR8Bak9lOKMdSnI4JrJsM1Ic+4J6gRk
	dXlSinMUW7AXASYqTgBWeUtFlQB2mu1V6+hzLSG9GjRpTbhEoy9xpi48E0OlrVAFSpYh
	qHpDes6KoNn1YR6VwEyqEUGs6BnhP/Zkm9S/BSYimQBAVn4EjBsiHyWNsKImPsbJPZdf
	bwt7Ra7Cb5sFvl5geitRotkR5ZeT+yjWRIovjLRgWRryjlYcdn2oMGNcCy8aSfq10taJ
	m1/Sip8tKLfZtJ0sdLXcGFsC2kcdHC/+tNctbzxqV007CKJJDn8NM9iJ1/ymllIOe21h
	EhCw==
X-Gm-Message-State: APjAAAXTlz9kyryR97spUeEsfxz43Q2n9Ggaah+SbFggEGSbri4bRdyo
	cromtVPCeRUEozYdpwLpDHtVKqZhdVc=
X-Google-Smtp-Source: APXvYqxCAj2uXGbXjPdjHyOuHcAGOYN6kpR4tS16KBkEUeZpPgExQTBnqDkINdk868GUr6tsPIazXQ==
X-Received: by 2002:a62:1e81:: with SMTP id e123mr17963991pfe.52.1567877486104;
	Sat, 07 Sep 2019 10:31:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	d10sm10812474pfh.8.2019.09.07.10.31.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 10:31:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Sep 2019 10:31:01 -0700
Message-Id: <20190907173102.35561-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190907173102.35561-1-raj.khem@gmail.com>
References: <20190907173102.35561-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/3] python-jinja2: Make asyncio specific to python3 module alone
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
X-List-Received-Date: Sat, 07 Sep 2019 17:31:25 -0000
Content-Transfer-Encoding: 8bit

asyncio is not packages seprately with python2 but only with python3

Fixes

ERROR: Nothing RPROVIDES 'python-asyncio' (but /mnt/b/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python-jinja2_2.10.1.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python-asyncio' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-asyncio']

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-jinja2.inc        | 2 +-
 meta-python/recipes-devtools/python/python3-jinja2_2.10.1.bb | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
index dd9fff86bb..aee7bd3ff4 100644
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
+++ b/meta-python/recipes-devtools/python/python-jinja2.inc
@@ -8,7 +8,7 @@ SRC_URI[md5sum] = "0ae535be40fd215a8114a090c8b68e5a"
 SRC_URI[sha256sum] = "065c4f02ebe7f7cf559e49ee5a95fb800a9e4528727aec6f24402a5374c65013"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-asyncio \
+    ${PYTHON_PN}-math ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-markupsafe \
     ${PYTHON_PN}-json ${PYTHON_PN}-threading ${PYTHON_PN}-numbers"
 
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.10.1.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.10.1.bb
index 61156b630b..284f5f588c 100644
--- a/meta-python/recipes-devtools/python/python3-jinja2_2.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jinja2_2.10.1.bb
@@ -1,2 +1,4 @@
 inherit pypi setuptools3
 require python-jinja2.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-asyncio"
-- 
2.23.0


