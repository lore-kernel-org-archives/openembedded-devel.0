Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RL9oi-0008GO-6J
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:35:32 +0100
Received: by mail-fx0-f47.google.com with SMTP id s16so6983168faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 01:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=PXmEJq/Q7UNRI7p9fp3EJuxUPHKBE0OYG6zQeo3NEwg=;
	b=wJxQ/nUm2MpEB+n3X2kiN1kSikqviNWz8/h/dW8FB4pGu1KiD9OiCv54iDxdxiTy4k
	YfUgqBlJ0i6Y6DMff2qqVPndzP9n4DLq83/09GZN0QQSMjC5Z/OM4md7LF+4NDpX4+eW
	XPdKf9kEU/7LSJJ6HY3bO6SE+z9Qd6KCSVPhc=
Received: by 10.223.77.71 with SMTP id f7mr35425495fak.33.1320136168023;
	Tue, 01 Nov 2011 01:29:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x19sm35706267fag.5.2011.11.01.01.29.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 01:29:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2011 09:27:47 +0100
Message-Id: <0b2e2430b3678eae58810b354e3b4be568959692.1320135926.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
References: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320135926.git.Martin.Jansa@gmail.com>
References: <cover.1320135926.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 13/15] meta-efl: e-wm: renice to -2
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
X-List-Received-Date: Tue, 01 Nov 2011 08:35:32 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

A niceness of -10 is way too much, and it causes some audio problems
  such as buffer underruns/overruns with writei/readi with the
  fsoaudiod plugin responsible of sound during calls on the nokia900
  (and maybe other audio problems on other devices too).

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-efl/e17/e-wm/enlightenment_start.oe    |    2 +-
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm/enlightenment_start.oe b/meta-efl/recipes-efl/e17/e-wm/enlightenment_start.oe
index e5a6502..ff86172 100644
--- a/meta-efl/recipes-efl/e17/e-wm/enlightenment_start.oe
+++ b/meta-efl/recipes-efl/e17/e-wm/enlightenment_start.oe
@@ -5,5 +5,5 @@ if [ -r /etc/enlightenment/default_profile ]; then
   . /etc/enlightenment/default_profile
 fi
 
-renice -10 -p $$
+renice -2 -p $$
 exec enlightenment_start $E_PROFILE
diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index a4fb5b4..2c2518b 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2667a0f4120372ea91f7467cdff4095f"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r20"
+PR = "r21"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
-- 
1.7.7.1



