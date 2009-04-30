Received: from [130.225.51.26] (helo=mta1.es.aau.dk)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <kim@khh.dk>)
	id 1LzVUj-0002C7-NI for openembedded-devel@lists.openembedded.org;
	Thu, 30 Apr 2009 14:36:05 +0200
Received: from dupont.control.auc.dk ([130.225.50.60] helo=[127.0.0.1])
	by mta1.es.aau.dk with esmtps (TLSv1:AES256-SHA:256) (Exim 4.63)
	(envelope-from <kim@khh.dk>) id 1LzVPX-0000el-TT
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Apr 2009 14:30:43 +0200
Message-ID: <49F999AD.6000305@khh.dk>
Date: Thu, 30 Apr 2009 14:29:33 +0200
From: =?ISO-8859-1?Q?Kim_H=F8jgaard-Hansen?= <kim@khh.dk>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] enable zlib in python-native to fix image building, cannot import gzip module
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
X-List-Received-Date: Thu, 30 Apr 2009 12:36:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


---
 recipes/python/python.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/python/python.inc b/recipes/python/python.inc
index f113451..d609f1b 100644
--- a/recipes/python/python.inc
+++ b/recipes/python/python.inc
@@ -20,4 +20,5 @@ EXTRA_OECONF = "\
   --with-signal-module \
   --with-wctype-functions \
   --enable-shared \
+  --with-zlib \
 "
--
1.5.6.5


