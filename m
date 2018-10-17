Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0CA079B8D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 19:14:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9HJEQpw008923
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 12:14:41 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 17 Oct 2018 12:14:36 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Oct 2018 15:14:13 -0400
Message-ID: <20181017191413.111522-2-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
In-Reply-To: <20181017191413.111522-1-mark.hatle@windriver.com>
References: <20181017191413.111522-1-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gstreamer: Remove machine specific append
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2018 19:14:50 -0000
Content-Type: text/plain

If you try to build a system with multiple BSPs, one of which is qemux86
or qemux86-64, the gstreamer package will change.  This will trigger
anything using gstream to also be rebuilt.

For a package based system, the PR values will also be incremented each
time.  The end result will be an ever growing set of PR values as well as
being unable to tell which configured version of the multimedia components
are really being deployed.

The solution here was to remove the rrecommend for consistency.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb     | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
index 5f97a20fd..56d82205e 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
@@ -45,9 +45,6 @@ oe_runconf_prepend() {
 #    mv ${WORKDIR}/gstregistrybinary.[ch] ${S}/gst/
 #}
 
-RRECOMMENDS_${PN}_qemux86    += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
-RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
-
 FILES_${PN} += " ${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dev += " ${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
 FILES_${PN}-dbg += " ${libdir}/gstreamer-0.10/.debug/ ${libexecdir}/gstreamer-0.10/.debug/"
-- 
2.18.0


