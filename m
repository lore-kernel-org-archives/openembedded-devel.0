Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id CA2826B808
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:25 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so181049eaj.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=45EYsR+YJaqso446MNfyRtSHXFlbVJVHprWhgmiY7cg=;
	b=kp+6kM3+kBbM3Bo/kUTFk8qRMc2jUkpbtEQk+0V5bp8HV2LI6uJOa/ngiHaYip2vSu
	EiY+XSCjayvGRXU/Wz8w+rn2Y6QVuO8AUIWMMDY4kS+4mtjBjEkVCwEOoVcCLt38X3VS
	eEezja2f+brKSytiILCE/uk+KQ103bM7ayH0hM2JxG26w6IKpU+7tqqgi29yKQ4+sfQk
	tXUGj1f210s0i0qydBa3O1DZ+lO19gog+HA68wKz9ss1KkEuoPuH7y6BL2OykmsS8eOq
	wYsNBwQPFWyWBr6KXhyv63nTUH4Cz+egZ6ktHM+ZzV+Z0jRtn4xhvxIJ7tVDRr9Exams
	rcvQ==
X-Received: by 10.15.107.74 with SMTP id ca50mr529458eeb.72.1376551166267;
	Thu, 15 Aug 2013 00:19:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bq1sm81934326eeb.9.2013.08.15.00.19.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:05 +0200
Message-Id: <8e61c12ae8f5f4a93cb77cef41ed71444a272c2d.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 25/60] jack: add dependency on libsaplerate0 and readline
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:26 -0000

* they are autodetected from sysroot and configure doesn't have option
  to explicitly disable them, so PACKAGECONFIG won't work without improving
  configure

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/jack/jack_0.121.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb b/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
index e3d5e7e..b255cef 100644
--- a/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
@@ -10,8 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c030468238b2cf89925a57f2780396a7 \
                     file://COPYING.LGPL;md5=e77fe93202736b47c07035910f47974a \
 "
 
-
-DEPENDS = "alsa-lib"
+DEPENDS = "alsa-lib libsamplerate0 readline"
 
 SVNPV = "${@'${PV}'.replace('.', '_')}"
 SRCREV = "4484"
-- 
1.8.3.2


