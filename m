Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5EyZ-0000WF-KP
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 12:19:39 +0200
Received: by bwz5 with SMTP id 5so1699187bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 03:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=i8QHmw6nMV0n1fYfdubruPGh3/3+bha/gV9AzvDnULc=;
	b=v8f+0pmEw6ipVIqmSQUMO9LSacqMIKsBu8gEKOOxDf4EO37FRlFEescb+qO30K1Ftv
	cFcmqBnhVG+dbZlGjq8KGs5ek+Fxt9hHZ4hF9MLBgqI1RofhClnWcAJM5wYOGr2Eo9Xa
	v4j63UC320E/wk9h2abji1+eX0JnEomPEFHTw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=YIoK6gH9RZniQWnFYnsa2jS8oiheCuLjO1IaoLBbvpHg5uHIACnUtC9GZdli+RPvvK
	zk9K0qW6bFkYw1VdeQnift5hAR+vNf3fmq36/cZqJtKY2r29fpBvvPaGK9w990c3as3x
	gDXnlHv1SbUORHboQ9GFAfbUOdfvoPSMeglMs=
Received: by 10.204.3.146 with SMTP id 18mr2217137bkn.1.1301566655372;
	Thu, 31 Mar 2011 03:17:35 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q24sm630196bks.21.2011.03.31.03.17.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 03:17:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 12:17:33 +0200
Message-Id: <7fae4514a24865924894e671cc9f3b6887fdede7.1301560589.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301560589.git.Martin.Jansa@gmail.com>
References: <cover.1301560589.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/8] emotion: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 31 Mar 2011 10:19:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/emotion_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/emotion_svn.bb b/meta-efl/recipes-efl/efl/emotion_svn.bb
index 9d7c16a..41726d7 100644
--- a/meta-efl/recipes-efl/efl/emotion_svn.bb
+++ b/meta-efl/recipes-efl/efl/emotion_svn.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "The Enlightenment multimedia library"
 LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 # we no longer build the libxine backend, since the gstreamer backend seems more promising
 DEPENDS = "eet evas ecore edje gstreamer gst-plugins-base"
 PV = "0.2.0+svnr${SRCPV}"
-- 
1.7.4.1



