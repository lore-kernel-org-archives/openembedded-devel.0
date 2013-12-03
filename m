Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 00DF36DA81
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2013 21:44:20 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id f64so10832967yha.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Dec 2013 13:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=rLMSqUyFlCd8W1dvZrrBUFkqMeDEO26oNNOrktU00jk=;
	b=FJBcG0fkthK/ZHCKEZ+hrwKP7CGnIhDfUKhmNSTJWNSCuOMuo8RXfYQcui13KqW+tB
	YNlo5T4nx5Ls607fKJsIh5AbgaV/2BDVIxl8sWGwtyNvog9/nTSpd6WupxJ6lKXpt1rH
	oeERXMceIZ5GzP2yD9Uk/TkraWa34JTVmn0KHcwNB3J+n/9b0AsObfLG7dMgUJV/JisN
	BmlBT2KFfCpLGehNTHlSt/ehSa7qoPO+YBEa57CgRmBeyh5NyAr9rDq7Q7/y3KceR/1b
	nYXjJ13lCoY7SEzqTRBoPLYVtpzi4V9sSJYCH2K3Ikzwk9UGCC5kICblVNp5OetdFMWx
	YG2Q==
X-Received: by 10.236.112.101 with SMTP id x65mr3367727yhg.122.1386107060681; 
	Tue, 03 Dec 2013 13:44:20 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id f78sm8593289yhp.12.2013.12.03.13.44.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Dec 2013 13:44:19 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 13804175EF893; Tue,  3 Dec 2013 19:44:16 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue,  3 Dec 2013 19:44:04 -0200
Message-Id: <1386107047-27409-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>
References: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe 2/5] proj: Use 'lib_package' class and add data files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Dec 2013 21:44:22 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-navigation/proj/proj_4.8.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/proj/proj_4.8.0.bb b/meta-oe/recipes-navigation/proj/proj_4.8.0.bb
index 6784dde..b4bfaf4 100644
--- a/meta-oe/recipes-navigation/proj/proj_4.8.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_4.8.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "PROJ.4 - Cartographic Projections Library"
+SUMMARY = "PROJ.4 - Cartographic Projections library"
 HOMEPAGE = "http://trac.osgeo.org/proj/"
 SECTION = "libs"
 
@@ -9,5 +9,6 @@ SRC_URI = "http://download.osgeo.org/proj/proj-${PV}.tar.gz"
 SRC_URI[md5sum] = "d815838c92a29179298c126effbb1537"
 SRC_URI[sha256sum] = "2db2dbf0fece8d9880679154e0d6d1ce7c694dd8e08b4d091028093d87a9d1b5"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig lib_package
 
+FILES_${PN} += "${datadir}/proj"
-- 
1.8.4.3


