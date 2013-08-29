Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id D47696BEA0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:52:16 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so344127ead.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=vJWv5HNGGovydRNzdiNR24f8OOrCKFbl3HJ6V41zrZE=;
	b=qUiucHsTEBdjicvKAmLkvQbuknDV+r7CKApRQYWATeLAPplLzILePcv0L9Ozymcgis
	KuvVBlDaQXlhH2vXUHkl5IDmc/X/ptm0bgszJbo9gKHl+d3ixgc7CV3qx5tb/oVc6r/c
	wFbSpVUH4BgeUQG9Ypqcf1hVGIYbXUmn7RY0VOZ8ED4vpwCDAirn2mXlwWj0yBHzEY3E
	mJpG/YEsbuq8iIaTcri/azYyN/J0kXbIGl8t8FTYB71mx/9D9mVWEVXPDoMD8yTesR1D
	5dbc9PGs+efUcd9gVbEyv0/vIBq8W61Z8T01G92WQqopXuKAem2nsaskFjmN77y64qRy
	SIDg==
X-Received: by 10.15.67.131 with SMTP id u3mr5334743eex.34.1377791537157;
	Thu, 29 Aug 2013 08:52:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm47170033eel.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:52:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:59 +0200
Message-Id: <17f8e20d0952dba45ae02b778cfbf6a95ee26c14.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 66/66] qcanobserver: Move to nonworking
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
X-List-Received-Date: Thu, 29 Aug 2013 15:52:17 -0000

* depends on qwt-5 APIs, I've tried to update it to support qwt-6 which
  is used in meta-oe, but it looks more complicated then what I've
  expected, my WIP patch is here:
  http://git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/qcanobserver
  if you want to finish it and move qcanobserver back to recipes-qt
* qwt-5 was removed more then 1 year ago:
  commit 5ad3d0d042dcd3f3bf54d44144b731cd0607b2e3
  Author: Eric BENARD <eric@eukrea.com>
  Date:   Thu Apr 12 15:09:48 2012 +0000

    qwt: add 6.0.1 version

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{ => nonworking}/qcanobserver/qcanobserver-socketcan_svn.bb           | 0
 .../0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch       | 0
 .../qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch            | 0
 meta-oe/recipes-qt/{ => nonworking}/qcanobserver/qcanobserver/candemo.xml | 0
 meta-oe/recipes-qt/{ => nonworking}/qcanobserver/qcanobserver_svn.bb      | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-qt/{ => nonworking}/qcanobserver/qcanobserver-socketcan_svn.bb (100%)
 rename meta-oe/recipes-qt/{ => nonworking}/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch (100%)
 rename meta-oe/recipes-qt/{ => nonworking}/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch (100%)
 rename meta-oe/recipes-qt/{ => nonworking}/qcanobserver/qcanobserver/candemo.xml (100%)
 rename meta-oe/recipes-qt/{ => nonworking}/qcanobserver/qcanobserver_svn.bb (100%)

diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb b/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver-socketcan_svn.bb
similarity index 100%
rename from meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb
rename to meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver-socketcan_svn.bb
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch b/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch
similarity index 100%
rename from meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch
rename to meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch b/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch
similarity index 100%
rename from meta-oe/recipes-qt/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch
rename to meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver/candemo.xml b/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/candemo.xml
similarity index 100%
rename from meta-oe/recipes-qt/qcanobserver/qcanobserver/candemo.xml
rename to meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/candemo.xml
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb b/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver_svn.bb
similarity index 100%
rename from meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb
rename to meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver_svn.bb
-- 
1.8.3.2


