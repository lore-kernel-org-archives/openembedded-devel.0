Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi3G-0002Sw-At
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:16:02 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926125eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GGY3hfrcVleixKZawrh2tawEXK5J5FpTAeuc4J+/rtE=;
	b=rwijq0F0ZCsrO1mmcqmZ9Xuy25c04xcvDQjJSIo0udlOoh/tdfkFfqcHiJmuFsp4It
	ltQTx44KxsYFWrXMo/881DC4pQ/rSarX+xusl3FJynD+hxdZbFJTXPBOtkOKRpc0vDs6
	Q/AErCeGP3MamhemHV6hhlwPwxEK5EAYylM6nnMhpeQcMvm3mHeNOJiFR0EPIQwf2mc0
	h4bdu993ncYw5iO8TWMX6F1VUzPAQNjMwuhilIacGhhTZgBf3eRHZQznvl3i+S8I5frd
	9qM/JjDWeR4hoCGEXSD3dnF2aXM0NPEeG9PiUW0+Exl1gTHSJ8T9yRyRcWh+woANpmfA
	YqaA==
Received: by 10.14.175.198 with SMTP id z46mr42706667eel.26.1354586502743;
	Mon, 03 Dec 2012 18:01:42 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w3sm34826607eel.17.2012.12.03.18.01.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:01:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:48 +0100
Message-Id: <10c24d3e244642474d3730e09b6a911a6c4bec3f.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 15/58] edje-viewer: add LIC_FILES_CHKSUM and drop BSD from LICENSE
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
X-List-Received-Date: Tue, 04 Dec 2012 02:16:02 -0000

* COPYING does not say anything from BSD license, only MIT

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/edje-viewer_svn.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb b/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
index c2670e0..0315f66 100644
--- a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
+++ b/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
@@ -1,5 +1,8 @@
 DESCRIPTION = "Edje_Viewer is just that."
-LICENSE = "MIT BSD"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
+                    file://COPYING-PLAIN;md5=e01359041001e8bf24c09acca556e792"
+
 DEPENDS = "elementary"
 PV = "0.0.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
-- 
1.8.0



