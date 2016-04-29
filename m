Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7B24C77070
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 12:39:37 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u3TCdUhK029582; Fri, 29 Apr 2016 07:39:36 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016042907385952-473226 ;
	Fri, 29 Apr 2016 07:38:59 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2016 15:38:50 +0300
Message-Id: <1461933530-18167-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.8.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 04/29/2016 07:38:59 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 04/29/2016 07:39:05 AM,
	Serialize complete at 04/29/2016 07:39:05 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-04-29_08:, , signatures=0
Subject: [meta-oe][PATCH] syslog-ng.inc: fix prerm script & class includes
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
X-List-Received-Date: Fri, 29 Apr 2016 12:39:38 -0000

The order of class includes is very important because it's the order in
which classes are evaluated. Both update-rc.d and update-alternatives
write to the prerm script, so the class order decides the script code
ordering. As they are now, prerm is:

 #!/bin/sh
        update-alternatives --remove  syslog-init /etc/init.d/syslog.syslog-ng
if [ -z "$D" ]; then
        /etc/init.d/syslog stop
fi

This causes errors because when syslog-ng is the only alternative it is
removed and then the script tries to stop it (No such file or directory)
but even if there are other alternatives, the script tries to stop
something other than syslog-ng which was removed.

By reversing the include order, prerm gets generated correctly and it
tries to stop syslog-ng before removing it:

if [ -z "$D" ]; then
        /etc/init.d/syslog stop
fi
update-alternatives --remove  syslog-init /etc/init.d/syslog.syslog-ng

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 382dc5e..4e0f697 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -22,7 +22,7 @@ SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source
            file://configure.ac-add-option-enable-thread-tls-to-manage-.patch \
 "
 
-inherit autotools systemd pkgconfig update-rc.d update-alternatives
+inherit autotools systemd pkgconfig update-alternatives update-rc.d
 
 EXTRA_OECONF = " \
     --enable-dynamic-linking \
-- 
2.8.0


