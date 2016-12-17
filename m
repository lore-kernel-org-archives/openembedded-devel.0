Return-Path: <joe@deserted.net>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7DB9377415
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 02:15:19 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id b194so13699947ioa.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 18:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fsTWnavd/hImuy6epyWsCEd/7nB5Z98QuGMBlO/okLY=;
	b=KA0smHXJR7nOTe3eWVJC+P7HAMom3A70TQy+TCQEcg3K7olAuC1OJ75JCMTe2KxCGw
	stk+0YZn2Oqib0oyWlaht4a+TQnE0FevtprJbKu9iqn0lhkkPQhwm+yl1+1RDtmIqDbL
	0MsnGwahQ6vNb4sBHWMJUBlXToBp4Er5pkaYHCumlxHIYYc+Ok/gjjt9WsEwNbdBPMPK
	0lVmGuGiRKRcxNev6ozFKxfy4I44/qzdnICy6QXzD4nVmTHI+IXpcGBrKS9qmDBG8LEz
	gcJZDZELEiEHexdMOAAvgxdVROf0w18UBouCZWmPMSqLFSxCegXG7YIuzxe0yWv4Gtor
	ihtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=fsTWnavd/hImuy6epyWsCEd/7nB5Z98QuGMBlO/okLY=;
	b=J6B+uRQFAhqxaVJhtR24shYuzVDfHeyNi4LYHDJk0UQ3YlbFHkCfKmLaSkHnWBDRgh
	L797wvrO7JUe0gVbPb5cbYMAdT/dH4xy3V2c0Q3eWQ7fi1RogNiTjOgKj7RF+FhXuz5h
	xGfOQeuCDOsnC01KKk6UAVfHLlw3Mo6WyQ5Vy40Qw3km3xVXAx8Q3UJI8G8V2o4Jy1GR
	TvpvFeSddDOc+JQM/52zqv6xudHqBDHeuSgWAeuuDjQaUfnCD4c8YOa8S232HaXarXfS
	Yjy9BAjnDGEBMZ/VWN5qZULQl84zustfgKr6qrHTzMT8nqPDEtsUStlkWmENaG3uPjSg
	Cryg==
X-Gm-Message-State: AIkVDXLobjeCUGg/UpEJZHgtjfAL7QNXk43JM3pHFcn5+QXkFyTkLmj1in4x+RhZGlb+Jw==
X-Received: by 10.107.162.132 with SMTP id l126mr6561606ioe.37.1481940920479; 
	Fri, 16 Dec 2016 18:15:20 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id l73sm3804122ioe.1.2016.12.16.18.15.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Dec 2016 18:15:20 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Dec 2016 21:15:16 -0500
Message-Id: <1481940923-12914-5-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 04/11] samba: add smbclient package
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
X-List-Received-Date: Sat, 17 Dec 2016 02:15:19 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../recipes-connectivity/samba/samba_4.4.5.bb         | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index c9e0953..37dabb6 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -143,10 +143,10 @@ do_install_append() {
     rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
 }
 
-PACKAGES =+ "${PN}-python ${PN}-pidl libwinbind libwinbind-krb5-locator"
-PACKAGES =+ "libwbclient libnss-winbind winbind libnetapi libsmbsharemodes \
-             libsmbclient lib${BPN}-base ${PN}-base ${PN}-ctdb-tests"
-
+PACKAGES =+ "${PN}-python ${PN}-pidl libwinbind libwinbind-krb5-locator \
+             libwbclient libnss-winbind winbind libnetapi libsmbsharemodes \
+             libsmbclient lib${PN}-base ${PN}-base ${PN}-ctdb-tests \
+             smbclient"
 
 RDEPENDS_${PN} += "${PN}-base"
 
@@ -301,5 +301,16 @@ FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.so \
                       ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/web_server/* \
 "
 
+FILES_smbclient = "${bindir}/cifsdd \
+                   ${bindir}/rpcclient \
+                   ${bindir}/smbcacls \
+                   ${bindir}/smbclient \
+                   ${bindir}/smbcquotas \
+                   ${bindir}/smbget \
+                   ${bindir}/smbspool \
+                   ${bindir}/smbtar \
+                   ${bindir}/smbtree \
+                   ${libdir}/samba/smbspool_krb5_wrapper"
+
 RDEPENDS_${PN}-pidl_append = " perl"
 FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
-- 
1.9.1


