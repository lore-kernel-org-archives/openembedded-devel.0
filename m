Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UDXjR-0003Kd-0a
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 11:07:31 +0100
Received: by mail-ee0-f48.google.com with SMTP id t10so152422eei.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 01:50:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=RCgelsIMH7/yZpWd0JOzzFjpe5lqWaWm7FEdjWL7bag=;
	b=leR9UbCiiatCIOuLw1pDc72rEfqozTX5a7BMkD+Fm/AcPOK2t8eQ/4ZiXDIA0NXIgN
	EMvlFS8G1uhhzZp+W8ADun6F3kU5I3FYz398e4aHbQsQp/BCwDbr9R4SxpJpKDXeV5ea
	VAgTLd5aQHVYknluB3txjXrHWrJBY2b22AmuZNMmukPU5VGebRJENJsVuOCDkqRH9P53
	Ti9UEXlAN5QV06PHqbRN28DAhAe0fR1d1nHQe9wAUGGW1VdL3dtSmFlJpbHo4HqcJ1/R
	+PdQFqBszC2QVDS/+VkuWFM6sxO3RMu5UGp/DhNd9eB3tOPThWcuFtf9zUd6xxhXjzsh
	L/0w==
X-Received: by 10.15.45.201 with SMTP id b49mr54039670eew.9.1362649853273;
	Thu, 07 Mar 2013 01:50:53 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id 46sm1327877eea.3.2013.03.07.01.50.51
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 01:50:52 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2013 10:50:38 +0100
Message-Id: <1362649839-9160-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnNEmuLUyy6etDs7OqBlAnXhFoDF0hM34G3zM3NN2ItcvK8IHhgRCvlZBLv84sSGc9gvAFl
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-kde][PATCH 2/3] ark, gwenview: fix RDEPENDS
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
X-List-Received-Date: Thu, 07 Mar 2013 10:07:38 -0000

ERROR: QA Issue: /build/setup-scripts/sources/meta-kde/recipes-kde-apps/gwenview_git.bb: Variable RDEPENDS is set as not being package specific, please fix this.                                                                             | ETA:  --:--:--
ERROR: QA Issue: /build/setup-scripts/sources/meta-kde/recipes-kde-apps/ark_git.bb: Variable RDEPENDS is set as not being package specific, please fix this.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-kde-apps/ark_git.bb      | 2 +-
 recipes-kde-apps/gwenview_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kde-apps/ark_git.bb b/recipes-kde-apps/ark_git.bb
index f33d8b1..844bc3f 100644
--- a/recipes-kde-apps/ark_git.bb
+++ b/recipes-kde-apps/ark_git.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/git"
 inherit kde_cmake kde_rdepends kde_without_docs
 
 # for videos?
-RDEPENDS = "libqtphonon4"
+RDEPENDS_${PN} = "libqtphonon4"
 
 FILES_${PN} += "\
     ${libdir}/kde4/*.so \
diff --git a/recipes-kde-apps/gwenview_git.bb b/recipes-kde-apps/gwenview_git.bb
index 0fb85d8..1068aba 100644
--- a/recipes-kde-apps/gwenview_git.bb
+++ b/recipes-kde-apps/gwenview_git.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 inherit kde_cmake kde_rdepends kde_without_docs
 
 # for videos?
-RDEPENDS = "libqtphonon4"
+RDEPENDS_${PN} = "libqtphonon4"
 
 FILES_${PN} += "${datadir} \
     ${libdir}/kde4/*.so"
-- 
1.8.1.4



