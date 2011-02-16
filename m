Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PppYa-0001Gc-S9
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 23:09:09 +0100
Received: by yxd5 with SMTP id 5so818684yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 14:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ZNNHCgAskELkZVcBUryYWLJnUp0bbNh9aleo48gBU0k=;
	b=cyIVuIov9HchSB+XFXvLrfVL5BTsULFH3xqm1ClJOhnPC6Rt8xzttpa4e6f4H7cbJR
	lbYoyOsCasXDMYja4NMQArmmreL3Q0Jj8BMEAzEYnwuU3yH4+ycxiEf0qD3mxOS0yrBv
	O7IETVZfXIJwCJizQwk6X8/xCPFZbiegB3MX4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=pRIpsF3gp5POCC3ClUrIyLltlHezHcbI5WOI6BLRokeESG5nQTZLSKsM+6lznxbXr6
	pSgk/oDdbIoucR5XkOeZAKakanYj7IuyCkZAYjgwIu7+RO9+Q22Li3Etat3w7t7/fom3
	Gs/2YTuzJTUVvxPA4de3i0odoBUwGPWUjlO/g=
Received: by 10.151.7.10 with SMTP id k10mr1397844ybi.223.1297894076832;
	Wed, 16 Feb 2011 14:07:56 -0800 (PST)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id u27sm399093yba.3.2011.02.16.14.07.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 14:07:55 -0800 (PST)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 15:07:41 -0700
Message-Id: <1297894063-27374-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297894063-27374-1-git-send-email-kergoth@gmail.com>
References: <1297894063-27374-1-git-send-email-kergoth@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/4] autotools: shift deps into AUTOTOOLS_DEPENDS
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
X-List-Received-Date: Wed, 16 Feb 2011 22:09:09 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/autotools.bbclass |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 60925e9..3c124ae 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -21,11 +21,13 @@ def autotools_deps(d):
             not d.getVar('INHIBIT_DEFAULT_DEPS', True)):
             deps += 'libtool-cross '
 
-    return deps + 'gnu-config-native '
+    return deps + ' gnu-config-native'
 
-DEPENDS_prepend = "${@autotools_deps(d)}"
-DEPENDS_virtclass-native_prepend = "${@autotools_deps(d)}"
-DEPENDS_virtclass-nativesdk_prepend = "${@autotools_deps(d)}"
+AUTOTOOLS_DEPENDS = "${@autotools_deps(d)}"
+
+DEPENDS_prepend = "${AUTOTOOLS_DEPENDS} "
+DEPENDS_virtclass-native_prepend = "${AUTOTOOLS_DEPENDS} "
+DEPENDS_virtclass-nativesdk_prepend = "${AUTOTOOLS_DEPENDS} "
 
 autotools_do_configure () {
     autotools_do_bootstrap
-- 
1.7.2.3



