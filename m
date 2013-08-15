Return-Path: <marek.belisko@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 03B416B5D6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 12:09:27 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i10so688768oag.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 05:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=TZookAcv8uEa3A+BwSajTJX4SKy8IEoWJ4wWnVS8hAw=;
	b=w/uwJJXvKtxa0DmJ/mhLvsrwXYrLHuAUC1BZDN6W8hVnQ7jDWTdKpzMbwT0rml6h7n
	7Qcua3jqAsy8Wk6WFkx+L3T9nuxmw8qv3aTq/FfSd52uszWEuvocDR9KbWNUDL6VScCD
	DSkyik90RUSyFSAwrk3uo0EBxhPmLm4KhWm0rIHue6o+PAedccbC/gqcwpLF59MXzd2o
	wtklKtqDjXVQQAZTWVuJOy8GoiKt2V4vb51mBR2Goq1GEtvh3FbYCKLfGF/v4XUC2muo
	3hQa9CmjtkqztW4Cf8WbyYysLdfmJsqHoU9Nc8MGnNItyvlGFubZ6YmX5pRVlQtctpvu
	7JEg==
MIME-Version: 1.0
X-Received: by 10.182.213.162 with SMTP id nt2mr17013570obc.44.1376568568283; 
	Thu, 15 Aug 2013 05:09:28 -0700 (PDT)
Received: by 10.60.60.1 with HTTP; Thu, 15 Aug 2013 05:09:28 -0700 (PDT)
In-Reply-To: <CAAfyv35Cig9wH7tYx2b72_groQeqLeWO8jZdRrGmn+ZBonFaFg@mail.gmail.com>
References: <CAAfyv35Cig9wH7tYx2b72_groQeqLeWO8jZdRrGmn+ZBonFaFg@mail.gmail.com>
Date: Thu, 15 Aug 2013 14:09:28 +0200
Message-ID: <CAAfyv379BfBtBff1yg4MDAVfYmSm2MuDi2UgO+JP2EQEgsWspg@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-qt5][dylan] Problem with fetching qt5 sources
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
X-List-Received-Date: Thu, 15 Aug 2013 12:09:28 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'm using meta-qt5 (dylan branch) but fetching qt5.0.2 sources failed.
Fix follows:

diff --git a/recipes-qt/qt5/qt5-5.0.2.inc b/recipes-qt/qt5/qt5-5.0.2.inc
index 0bf1404..c04b3a2 100644
--- a/recipes-qt/qt5/qt5-5.0.2.inc
+++ b/recipes-qt/qt5/qt5-5.0.2.inc
@@ -7,7 +7,7 @@ QT_VERSION ?= "${PV}"
 QT_VERSION_DIR ?= "${QT_VERSION}"

 SRC_URI += " \
-    http://releases.qt-project.org/archive/qt/5.0/${QT_VERSION_DIR}/submodules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz
\
+    http://download.qt-project.org/archive/qt/5.0/${QT_VERSION_DIR}/submodules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz
\
 "

 S = "${WORKDIR}/${QT_MODULE}-opensource-src-${QT_VERSION}"


Marek

--
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

