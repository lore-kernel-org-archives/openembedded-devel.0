Return-Path: <gyurco@freemail.hu>
Received: from smarthost06.digicable.hu (smarthost06.digicable.hu
	[94.21.128.16])
	by mail.openembedded.org (Postfix) with ESMTP id 0CDEB71F1B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 22:16:57 +0000 (UTC)
Received: from [92.249.128.185] (helo=relay03.digicable.hu)
	by smarthost06.digicable.hu with esmtp
	id 1YB9Fs-0001bv-BC for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 22:44:04 +0100
Received: from [78.131.10.118] (helo=gyurco.localdomain)
	by relay03.digicable.hu with esmtpa
	id 1YB9Fs-0001Pu-5Z for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 22:44:04 +0100
From: Szombathelyi =?ISO-8859-1?Q?Gy=F6rgy?= <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jan 2015 22:44:03 +0100
Message-ID: <3131686.1jEHazhdRQ@gyurco.localdomain>
User-Agent: KMail/4.14.4 (Linux/3.17.7-300.fc21.x86_64; KDE/4.14.4; x86_64;
	git-a006e5a; 2015-01-10)
MIME-Version: 1.0
X-Original: 78.131.10.118
X-Original: 92.249.128.185
Subject: [meta-oe][PATCH]ntp: fix perl path
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Jan 2015 22:17:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

    Fix perl path in ntp-wait and calc_tickadj.
    
    Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
index 9f74f6b..e802ee7 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
@@ -74,8 +74,10 @@ do_install_append() {
     sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${bindir}/ntpdate-sync
     sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,' ${D}${sbindir}/ntptrace
     sed -i '/use/i use warnings;' ${D}${sbindir}/ntptrace
-    sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,' ${D}${sbindir}/ntp-wait
+    sed -i '1s,#!.*perl,#! ${bindir}/env perl,' ${D}${sbindir}/ntp-wait
     sed -i '/use/i use warnings;' ${D}${sbindir}/ntp-wait
+    sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,' ${D}${sbindir}/calc_tickadj
+    sed -i '/use/i use warnings;' ${D}${sbindir}/calc_tickadj
 
     install -d ${D}/${sysconfdir}/default
     install -m 644 ${WORKDIR}/ntpdate.default ${D}${sysconfdir}/default/ntpdate



