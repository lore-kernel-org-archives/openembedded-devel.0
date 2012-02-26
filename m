Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1ZBU-000871-Hh
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Feb 2012 09:10:20 +0100
Received: by eekc1 with SMTP id c1so32672eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2012 00:01:56 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.186.12 as permitted sender) client-ip=10.14.186.12; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.186.12 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.186.12])
	by 10.14.186.12 with SMTP id v12mr5286075eem.31.1330243316045 (num_hops
	= 1); Sun, 26 Feb 2012 00:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9JrX76Mw+lExsZ/Ra3E5zWm52ZhrJiJIsWc7Sf2+zmI=;
	b=FzMjjE5EiPJQ2DCDcCozJqgbzaOwKYsLLv3PwYNmnU5VCwTGSWgGT9Au66j/H8p979
	jcfdEYPDoLYYDwGhtoAazOv6LhSe/f49IfiRS5PEzEOXmDMN6ZYJBMXFp1J7UV+yWGLA
	vWoXGfSBVmjrxXPLEf2a1yzi/o08QCEe9n8ZE=
Received: by 10.14.186.12 with SMTP id v12mr3978746eem.31.1330243315967;
	Sun, 26 Feb 2012 00:01:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm41877762eei.3.2012.02.26.00.01.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 00:01:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Feb 2012 09:01:32 +0100
Message-Id: <d042d76a9c2c332f35a0d7b04ae5e57e1313b028.1330243124.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <64ab53576a0a55c3cb21c0bd690b6b4f95ab2769.1330243124.git.Martin.Jansa@gmail.com>
References: <64ab53576a0a55c3cb21c0bd690b6b4f95ab2769.1330243124.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330243124.git.Martin.Jansa@gmail.com>
References: <cover.1330243124.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 3/5] e-base: bump EFL_SRCREV again
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Feb 2012 08:10:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass     |    2 +-
 meta-efl/recipes-efl/e17/eve_svn.bb |    3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 17eddec..e53d5c0 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "67071"
+EFL_SRCREV ?= "67883"
 
 ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e17/eve_svn.bb
index 23e7f3b..7836c8b 100644
--- a/meta-efl/recipes-efl/e17/eve_svn.bb
+++ b/meta-efl/recipes-efl/e17/eve_svn.bb
@@ -4,8 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "evas ecore edje elementary webkit-efl"
 PV = "0.3.0.0+svnr${SRCPV}"
 PR = "r2"
-SRCREV = "67278"
-#SRCREV = "${EFL_SRCREV}"
+SRCREV = "${EFL_SRCREV}"
 
 inherit e gettext
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
-- 
1.7.8.4



