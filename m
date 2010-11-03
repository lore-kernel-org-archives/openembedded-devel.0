Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PDeis-00063H-ER
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 15:53:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id DDBA08E5581
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Nov 2010 10:53:08 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16404-08 for <openembedded-devel@lists.openembedded.org>; 
	Wed,  3 Nov 2010 10:53:08 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id B1F298E595F; Wed,  3 Nov 2010 10:53:08 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 98D508E5791
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Nov 2010 10:53:05 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 44ABE5000E6; Wed,  3 Nov 2010 10:53:04 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Nov 2010 10:53:03 -0400
Message-Id: <1288795983-27967-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libxcb: DEPEND on xcb-proto-native
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
X-List-Received-Date: Wed, 03 Nov 2010 14:53:59 -0000

libxcb needs the xcbgen Python modules staged by xcb-proto-native.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---


xcb-proto stages xcbgen to ${HOST_SYS}/${prefix}/lib/python2.6.
xcb-proto-native stages it to ${BUILD_SYS}/${prefix}/lib/python2.6.

I think since we're running Python on the build system, libxcb should be
using the module staged to BUILD_SYS. I hit this when building for
x86_64 because xcb-proto's /lib/python2.6 didn't get staged - it's not
under /lib64.

I'm not sure which is the right fix - make libxcb depend on
xcb-proto-native, or add a special case to staging.bbclass for
${prefix}/lib/python2.6. It already has a special case for Python, but
only when staging native packages. I think staging.bbclass is right
and libxcb should depend on xcb-proto-native.



 recipes/xcb/libxcb.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xcb/libxcb.inc b/recipes/xcb/libxcb.inc
index 9fb3377..8f86c3b 100644
--- a/recipes/xcb/libxcb.inc
+++ b/recipes/xcb/libxcb.inc
@@ -5,9 +5,9 @@ HOMEPAGE = "http://xcb.freedesktop.org"
 
 PARALLEL_MAKE = ""
 BBCLASSEXTEND = "native nativesdk"
-DEPENDS = "xcb-proto xproto libxau libxslt-native"
+DEPENDS = "xcb-proto xcb-proto-native xproto libxau libxslt-native"
 # DEPENDS += "xsltproc-native gperf-native"
-INC_PR = "r3"
+INC_PR = "r4"
 
 SRC_URI = "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.bz2 \
         file://configure.patch;striplevel=0"
-- 
1.7.0.4



