Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5A1AB6AF31
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:23:59 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c1so1063085eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ql7AWVdbViKd8vi6yA9eMwLgAXloTpySBpdmkawqBJ8=;
	b=ln/qonsbmDGUyvYwDzBA3bGZP1p7MruH7F9VJrR4KuZ8TQx+mhbsznjBj9VbQf3fDQ
	6PWj0WE6Rb2klQhD+gThvre1XTOxov6KPGEERwYyQwQSN5yoFvvuusb40xODk1on+SrT
	eiWJke44wozZsr0q6t9i89XZVB6NkmHR638XQy/wERyDIO190H/BIrSeWRqbSinYkDcq
	mcC3JCTO7OZrRIl6kbk/M2ValeU0F78hGmG2rfvaUKPVoiOmEJLFObMZZPFwTpDzNjLW
	lTIUOLE9K++08+aup20rCXR/YDhEhLuusNt9X5PBLVmHFDHsHrefI7uYvpio6XBrXFFl
	35Eg==
X-Received: by 10.15.55.199 with SMTP id v47mr9242736eew.41.1372987439671;
	Thu, 04 Jul 2013 18:23:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm9576269eeh.15.2013.07.04.18.23.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:23:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:23:48 +0200
Message-Id: <7f300eae67abd68533aa21d7289f5c7714f2b7cd.1372987207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
References: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372987207.git.Martin.Jansa@gmail.com>
References: <cover.1372987207.git.Martin.Jansa@gmail.com>
Subject: [PATCH 04/10] cpufrequtils: inherit gettext
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
X-List-Received-Date: Fri, 05 Jul 2013 01:23:59 -0000

* build without gettext-native fails with:
  | Building ccdv
  | /bin/sh: 1: xgettext: not found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
index bd631af..e74fa44 100644
--- a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
+++ b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
@@ -1,5 +1,7 @@
 DESCRIPTION = "To make access to the Linux kernel cpufreq subsystem easier for users and cpufreq userspace tools, a cpufrequtils package was created"
 
+inherit gettext
+
 DEPENDS = "libtool-cross"
 
 LICENSE = "GPLv2"
-- 
1.8.2.1


