Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Sh5Qp-0002Ka-UD
	for openembedded-devel@openembedded.org; Tue, 19 Jun 2012 22:53:47 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 67450EA040;
	Tue, 19 Jun 2012 22:50:47 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 720BF604DE; Tue, 19 Jun 2012 22:43:05 +0200 (CEST)
Date: Tue, 19 Jun 2012 22:43:05 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Message-ID: <20120619204305.GF4845@hermes>
References: <1340055995-14534-1-git-send-email-apelete@seketeli.net>
	<1340055995-14534-3-git-send-email-apelete@seketeli.net>
	<20120619203738.GD4845@hermes> <20120619204030.GE4845@hermes>
MIME-Version: 1.0
In-Reply-To: <20120619204030.GE4845@hermes>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][udev][PATCH v2 2/2] udev: Update attr recipe SRC_URI
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
X-List-Received-Date: Tue, 19 Jun 2012 20:53:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This updates the attr recipe SRC_URI since mirror.its.uidaho.edu seems
to be down.
Fetch attr package from download.savannah.gnu.org from now on.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/udev/attr_2.4.44.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/udev/attr_2.4.44.bb b/recipes/udev/attr_2.4.44.bb
index 00aafce..1b95c58 100644
--- a/recipes/udev/attr_2.4.44.bb
+++ b/recipes/udev/attr_2.4.44.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 
 PR = "r4"
 
-SRC_URI = "http://mirror.its.uidaho.edu/pub/savannah/attr/attr-${PV}.src.tar.gz"
+SRC_URI = "http://download.savannah.gnu.org/releases/attr/attr-${PV}.src.tar.gz"
 
 inherit gettext autotools lib_package
 EXTRA_OECONF = " --enable-gettext=yes \
-- 
1.7.10


-- 
        Apelete


