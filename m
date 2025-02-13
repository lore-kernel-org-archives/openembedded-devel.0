Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26459C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 23:34:25 +0000 (UTC)
Received: from sonic306-3.consmr.mail.bf2.yahoo.com (sonic306-3.consmr.mail.bf2.yahoo.com [74.6.132.42])
 by mx.groups.io with SMTP id smtpd.web11.8259.1739489659006880601
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 15:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=XSphjgXc;
 spf=neutral (domain: yahoo.com, ip: 74.6.132.42, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1739489658; bh=jZnSpPQAlijTWdURBbH7TPwXPgOZ+TTaM/P0c2FRVlk=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=XSphjgXcol55KxHYAnU5D2Q6DM1/nZ5bvuXE7sl/zSuzjrLzAJ9JHt915+PxST4qc3a3N+Muk8/idl028uYlqkmUYInfU+nwsPu0r2iMdrGdw8F7BUzZjpsnRjuIL7UPJTrGXqsUxcpaAjtnm9kVkxee9YE1q0rpKb1Hx4yplwFG3c2AJcV86WFXKxWcZHln/9/LUUBNe3ijaG7zX3LSzpWeut/F7lysiKpX6TFXVLpbGDMpzjkozDVUpG1RBH21BoH3u1IXLFkuQdqt6awnsKv+gru1YOa8+ay/h6KRo9lRRR2rTikFCpdUH1SXNlnFeYwchVMlj3Uo/ZQzoJSnpQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1739489658; bh=oCemPsGjmfVezVWyAtiHOkRr+Fpd5+zbwyQJIAOvPsJ=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=RF8ZznecZdKXxXguNt++lRJ69j4T2llDWbx1Sx77zhvMZke/3vSKBJ5aPWu4FghyLSsVSVTzROnTm7UVDq8wsNU2QtLPgnqSQ+A0r4WbUoYl9TW6BI4/IVRb8TJpq4E3wclSYlwqu13fUz/CIySExIV6AQ4zXqOoCSc4F+fozIcKK1EgBoaMrwhUa4vxeLHhxKXrG9VoaFXVNvZ00SOE2ZFHWEg1GeNfruWJCMH21HQaL60zKdcIYqm0n1JzmnW0Sqlgt6yPU0n4cMmQDB2fJlp9oS3jcVEB3PrZ9LqAPcP/5SlYFLjFKcLyhuObNPcrGMrZiCN+pwpMThXP2dsy5g==
X-YMail-OSG: Re1K8AQVM1kKW9hOrKVXrgByQqrgq1hnLLdGEewbrjpbG1P5E489htFhpZJAvq7
 .gPGNNTa1APMZyqPhBuDF2mxGlPyAllmVu1FEi4K2.tRlndbhjfaTlbiu8wHiXXCqnq_vQN4s4gv
 vIVnSthxRMc2lrPxE8aiYw7wjbXpaDjTvXaj0UK7PI22NgJRCJ392fEX3eHtHO3_Pt3.oB72TLAC
 oRrRkvBQYVya0EqBSQAGuxAMMaiP6FL6AQZVkQ5YWAMujmkYCUtTN.q5Njf9Vwej.VtLqiym0ewl
 9_pHGu0qMRjqPIC4QFAAZFKOjQbsuwin9RPefj_mdXzhJzUvJRm0k2uViudYbJU0zO.u_vZJnig9
 v2ZIMVP_xtxntqvP.6bPOGFfwjLFW9du4dVMZYJ5eTQhjPgf.pu6HHGd5WfdGaHzvoTNtWGGI4mt
 c57BD8jLsBQt81HP0JTUbR7VsfVBlnSDC5gff2rPrRnWhC0K6rvft6H2emolvKDVssHiVmdYvf6d
 V1KLkoZewhCGquZKeRrCT6lX9K768K8AkvuB7ds2cOuRWmoLoV.ndUXenhitkZM4DSemck43aRqY
 pWpUi4EyjVw4Q1g0aBQBmZ47LxixupTPr1RnzE42iXTe74peXX4Ry6fqyMDKuWlBlUI3ugaBIIcr
 VJAT6wWRp_fhGQaC.CD6EFFmnE4_G56iy_Dg4oTA6LnmXsFpLevwyDIIuCoxoMEC7j_NetQJWvKS
 mBlU7XsemMyb9PEfXmxO9ToZoC9hDh6Q7pMg2abr0JlrkMVT05nXDe53PtjdZHGoGvQSqwOA.WpT
 XnTCFL4tyDZ3cTb1bMQ.bYNHorON7jHPB0L5DC2IUWxauAt58_h2PnmHACWS3VWMrm_FgZq1scj7
 Zx9HK.yURsVItD19A8mkerIllH3V0EKnBktFt1ibUcnbO5vKzBTsX5Ikoi_3vbv9zb8AyGWPAdIj
 rKI8aQN.s4eLGZRynUbToWhmaJJnJrw4pLoK0Wpa1tbJ8XaCpkiNt8SzO7IgQ1kc4YKkMn5sRfPF
 PANYP.M7uQ_kUlPYI4lXd8ONHruLxtTaK3Ov.Mnj6b7x4xTljJMyatr.U8rj_kGHOggNU5blkikR
 msXxawax5LxAYq3PWh17bymGheCGZza2dQvBM.jCvUwvz51eZea_xxuI5DW4smaEA6JnikCQ.S9F
 wWVC1yW0jKOS36r_Fdah.X9sGQqbHehD9GTr1H6vb4dhTyfi6dF0zkRp82O_BusUwQes9Dvz6BM1
 tD3xzrsGworMYWATEZkJcE2B.g.0aRliqPSze.2HX2AQJaU1uI8lGp60lYfjhs2iAR_LLWHFIMqi
 IDmEU7hT4fAeWMprHxFFSv2O6e.4jSWeKasKJVVi1ANDFs3AkpUHrHp81tIb08XCx1Jn.qvDM.V3
 WAbDVBPM76LaY0fGIksivMB8EPriWIFjqcJvQwrAt7lPjblTrBsIKu6WqREU8o5aPDmBPKLfTbiy
 2ykP_lMcUqU6gb_tl9x9F15iuYvUlNkUN8mIb5oppBzJyOYfvQYgQcW_qRXRTI0LyqWzM1eqIaSI
 IgFGTvErp1PsPt8sLIlWC2xMS.9i48cB5la1oEUWg.oKGdsLSBzfNKDHLucs18XmG3xoFguQGHV2
 O6g1U8zd8JuCLb.nBayNsjH7fS7mDHFyicjZU7DawjaRkIj7ovPDnLafP95r4z8XJbgIeNS1Wqpa
 fCmcMDqCKUdY0gX51lCcYhFdUyfY4.vByBGePlPLSGWXKITLxwnekhtqcZ5fWFF8EUQ1zNUDitx6
 fcMOS0qH6OJTKvfCSc5UO31RfanTH9T.NGKXOU3ijAGZgTx6bhtbnmUFnPA_xCHmRSFiv0x88h9H
 Y3htT4mrgqgRalvk_82xUhGViIZWDQjZaNaNd6cEuYHMlCOtl.bAgkLRZZpb0WrFHt8cDCknwxB0
 H9CdEWGQV0ulO999zolIQo.sHBO5rgIhMrIhRQ2Vl1i85.AXdYgiBZB5BLDzzAVj_uKc3mz0sf8W
 7kw8kTEv.8VMbohQ1GtsBulWNL7HLxoSJZqdaZbGDgKDG7oIA1gRQf2HyrilwbAmXvRZMBYwuM.I
 BK260Lttv1AUz5D1c1O_THMp6ikEr_LBuLVfDrEgLZDOWKF38Rq9hfXa80YaqpO8sWOp7fMerbWt
 vG5VPyvDKE8143mikwGBlBHnYY.7ZcMs9hwfEgc0otRVy0xSUILtZBeCKY29bY2ECuMg70nUK6fK
 pVTKQoP37_mvfmb.hs8dppwhacMcmgDILbG4Wlcka_RRT7217IGgWlqAQcfs6Eg--
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: f90a1c8e-2405-4517-9215-557710ea54aa
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.bf2.yahoo.com with HTTP; Thu, 13 Feb 2025 23:34:18 +0000
Received: by hermes--production-ir2-c694d79d9-sckcc (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID b0a7a3e5118da2e023aec06558afc3dc;
          Thu, 13 Feb 2025 23:34:14 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-devel@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>
Subject: [meta-networking][PATCH v2] corosync: reproducibility issue
Date: Fri, 14 Feb 2025 00:33:33 +0100
Message-Id: <20250213233333.129530-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250213233333.129530-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 23:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115473

Corosync is not reproducible due to change of value
in NETSNMP_SYS_CONTACT which is set in net-snmp:
NETSNMP_SYS_CONTACT = "$ME@$LOC"
$ME = whoami
$LOC assigned domain name from /etc/resolv.conf

Use build in'--with-sys-contact' to overwrite it

https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/30/steps/28/logs/stdio

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
v1->v2
* make NETSNMP_SYS_CONTACT configurable for every DISTRO
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index d4945e482d..0840e4955b 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -55,6 +55,8 @@ PACKAGECONFIG[perl] = "--enable-embedded-perl --with-perl-modules=yes, --disable
 PACKAGECONFIG[smux] = ""
 PACKAGECONFIG[systemd] = "--with-systemd, --without-systemd"
 
+SYSCONTACT_DISTRO ?= "no-contact-set@example.com"
+
 EXTRA_OECONF = " \
     --enable-shared \
     --disable-manuals \
@@ -63,6 +65,7 @@ EXTRA_OECONF = " \
     --with-persistent-directory=${localstatedir}/lib/net-snmp \
     --with-endianness=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
     --with-mib-modules='${MIB_MODULES}' \
+    --with-sys-contact='${SYSCONTACT_DISTRO}' \
 "
 
 MIB_MODULES = ""
-- 
2.34.1


