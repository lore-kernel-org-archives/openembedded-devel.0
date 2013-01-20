Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TwtNO-00078X-NO
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jan 2013 12:47:55 +0100
Received: by mail-ee0-f44.google.com with SMTP id l10so2386743eei.17
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 03:32:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=oHVPzaFdKU1SQ+cZiiJbmASWG8H8T9BnKQHhtXU/6c8=;
	b=pw4QQymBzDs6Stca4xQQ4nid0ioJxo17sHbLm43ByMQDm7W1xcFakcl0eRazVWdUo5
	YKQTbyGhhepSVIemVcJQdO+nUPtsohPcUA+kPanQzlQJGf/87WySNhZACmcLqJ7W2H9y
	qbnOlSfsQcWSw/UG5pWEBQ2OLkWXJWAZvYFpTtn1YC22BcnGXU6amv9ca+hqjlwvoO03
	7JtAR4q5/+DqAu6DuIte0ZYjpXt4AYO3rh3GrRnw2fVglZYQE4QyFwawQ1w5FZvMYCmk
	bSshG040hFx9bO9hd92qX6aqzQalkW4byBdgvEyw2Jjhaz109gW9ThqHSvtVpZDXR8Yn
	xVCg==
X-Received: by 10.14.223.135 with SMTP id v7mr48181478eep.41.1358681543726;
	Sun, 20 Jan 2013 03:32:23 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k4sm16888656eep.15.2013.01.20.03.32.22
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 03:32:23 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jan 2013 12:32:06 +0100
Message-Id: <1358681528-19761-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1358681528-19761-1-git-send-email-koen@dominion.thruhere.net>
References: <1358681528-19761-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmmGW5qSJF+kCkC1UfvNNv3ae/IxJEcB8nhIiBZsqrjkl1CAuVkdBou4DdTXElxuvnzQQML
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-multimedia][PATCH v2 5/7] iftop: add 1.0pre2
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
X-List-Received-Date: Sun, 20 Jan 2013 11:48:00 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-networking/recipes-support/iftop/iftop_1.0pre2.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-networking/recipes-support/iftop/iftop_1.0pre2.bb

diff --git a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb b/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
new file mode 100644
index 0000000..f1ecf3d
--- /dev/null
+++ b/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "iftop does for network usage what top(1) does for CPU usage."
+HOMEPAGE = "http://www.ex-parrot.com/pdw/iftop/"
+
+DEPENDS = "libpcap ncurses"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "http://www.ex-parrot.com/pdw/iftop/download/iftop-${PV}.tar.gz"
+SRC_URI[md5sum] = "fef521a49ec0122458d02c64212af3c5"
+SRC_URI[sha256sum] = "1b193037bb3019afae88cd94c87468aac4b045d81ab816ed8d2f489716b14027"
+
+inherit autotools
+
-- 
1.8.1



