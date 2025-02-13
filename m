Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C01C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 21:51:34 +0000 (UTC)
Received: from sonic309-14.consmr.mail.bf2.yahoo.com (sonic309-14.consmr.mail.bf2.yahoo.com [74.6.129.124])
 by mx.groups.io with SMTP id smtpd.web11.6026.1739483488040718416
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 13:51:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=NroEBz4p;
 spf=neutral (domain: yahoo.com, ip: 74.6.129.124, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1739483487; bh=GRqmTmtuatOhQgUw/2xErLhMX6Dp3CQZD+VUI/UbFgk=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=NroEBz4p8PqSU+sqTEISrbLmFkJ2NOUNp2BJE8GqN/1xlM41GRZJrR8b1w6iba3/z39GSsga5frFBs0ne2kLk7ghfDTfO+5m1XOzZK4mP16pVdVMljO1+VyXj1KaZMqtIXvNbVdC88YkxSEvqOH9bOXZIUiuI6XyEipyshxcX4f7LlsENebl8ta0JeWphXKU237Ka7Ngokfuu+kyVfAGDACk8/8ZjsdkU+R+2r7+FSoGrLK1q3+iet57m8ZMcdnhg+k99i0W1QBSclOFlV7pKzY9ISlUyWZZnOZCxbuervA/uPLTwkBzq08EXOn6SlF0b9fJJGfVxJM8hKmP0X91Pg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1739483487; bh=0ZvdiAWBc9Qiccxp/pPVycp+LWdJZdvXi2DF0Tbpo+u=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=nRE+uAYuxTtWV4R0NgMsgS2RKFJQ+UNRjBduyWTV21/a/+1p2PYLUg+Qsm8Q+rM/o3s9lNpZoTVo6VrXdY98cKocHj6yA0vsNULuTQdRYjowzx9zHP+74nyzmHuWGj8LvlJX+pKmWMx0raWDBRaJmZDyWE/syOR2O6fbYOZ//i8jAFCkGCXkub62TRJ4cq0GvwvQ5hTjxvPurfVOd4Tlh4BlxcL3fycAGEIHEchwFDhwMSN7jVU55EEGdLQl3dNvobGzh3F798Lju4aVTDr7wSAM9f2lrUN96gzmLzgGICGW0YSVdtERMiXn+1yw85mwJGz/f3xy8zrvgwkM8XjUBA==
X-YMail-OSG: uh8dLykVM1ngDMGXP8bYpglsRqMSLPaYsVEzCHjfSNOcWwVy1HiIWiEvsuImF7w
 dGtYkOXfzetB9I73s0iaN7CjwAadzEtPRalYOcnHP1qaPuX0xDF7fhenInjawLRpqe_HYMTgqxHi
 KEwyuii7GASQJEflqcWSnDsJHNmwHv5Qew4xqL0Fl0MIIN405ZViamu7x7nMskfCzFfZihwW9XP0
 XjiCOK01RY29Le7TR275g6iMTH5KtRH5SSErN.LfZXepvHNVbvYhbSlcPbNP3OFqLdBCQGZMcQzi
 KqNg.N.uNjgakPtsEWK9ZLgbbZB4U.uqb_PNctSGdzfj.vtNldphXbIwVE4AVaWaGgHFSFF4kcJ9
 W_Gmde8MdPktdXWnLw6FpLW4R3QhuzGl_pL9eDrd8rD98hiIwMxU2eRXmfyOTiMqmKcx2B2Mpfq.
 0gxzuytVQUr7NLKjesD1ODrxnsj.xQF8i3_ypO40T_9EYZYjvp_dTE5PEtCxlB9_6KsqZ.AWrkVa
 bb3aeaYrD7ZgJOY6ZNMGlmqvrd4bFf1po7lM9aZ5kd.lfmpoA4oSn6G6ZLS4uWJELknBYlukOdgf
 3CtCfkFlWCVPF4qnx4ytLCwv7NnT_2abwHI9ySQK1UXzh3rWZWpBkMhNqX_YwcMndmkowfUTFGbd
 iu1yWWZ0I0fQRQevWUwLOVe_ULsAuZJYUeWAs.PWmKPhcRPVeD_LL015BK7U253pEGD4Aum2nVcY
 2yYmJYaJvA1jjced0Lqaaxe2mkI4SIwDPu95NtPKUuU287fO8892XSG4QWzvrMeDYr9W2_GJVE_.
 tc8mV1yzN1ixT_cjiUZsenSjz6Pk23xTuOuEMGLdddQ1CKlqZ30KED5ZzgR1luYMKXlkUE4F2Uvt
 dsOflmBkOFBA8uny5CK5SWQdrZ7EAeA9cmr_y9Pqw6AsWBWlzDvTta2jmBEfN55xHZRwR2eVqbtF
 SdQ8D2b5XfilvbVVA0SAZRHP11CByVRFThYc4ivSmtdvOutlQNn2WbJt0136b8UWXS6TneAlyZAU
 vulUh.eVOg7uetH2G0SsoTeD.3t0fee.vtbMUyr5EljmyV2H6EKRmohQLbOGfxBgx6C6qzfOTAih
 rqfM2Hwr3LLA4d837W.aBBcX9hLnMK42MINGVXX72URkGstHa4nMEt4b8oDB4YdnboMGMYaVFZle
 j1zumnl7pbc0tXRkFFDtNY8q0blZ7efryUmN12Ehz9Rsptc_RGq140pzTXYtLZIB5EhMiJ1Ok12b
 d1B6p_617vFGh6O3FivsG83ephysQxdZ3SzA82jx9iX2uuSBu_qOI_j8Ex5yOIdqCu.sKSddBuxS
 OsKQIVaxQmvnk5owRgHYGLds2aDoiP__RGXo39ncmLUlCgels6143uWt0A3hxfiCmqUKJ3zbP4o8
 SV8PXvi.85.FQ2OvrYn7_6qQMBBgxNCwxePzwQHf2FnDj7m6HgVTxpI5xO6ed6YhZ8V2zqYW.i.5
 t6epNxtYr.xwnWvqkaYAclV.D5swiFXdI83coDO_aqLhYbEE5Q1kbOfnbetbtLqhGCH4o0jfQQSo
 n3voSU4DGNmTuQkakrJcuSmsP7S56zSAf.xB4ddq3XhfO0wEU01W7XX9jlBcQTbCCwvvyw_wxXpS
 Iaq.B_9NAvKLFNHdHNPJILnSX32.f62rjUPakUBIBJM_vJas2lZpAR2fO0dpYg5lXm_wood7eJGF
 n2FFcaLtSwR2IW.m4p8kdkV9l7LVAoGScKVAtawUm7Hb69CDpK7AdMNayiPaVKNqiFYezFcrzk2a
 XzpZaVZF2.S7AxaGCC__dKl36gKdSbsslB38Kmh.AgASOxzVOEGtol6AQ09YRQcfYk1Ku6b9Dbgv
 mgIiY1WDxCgEEFCdPOvPH_VZnOkDci7yDFoJNX6DpKDty7vzbpTpX8v.vCAwGoOS0_eh7LptaaoR
 dS91LLX9hSNIDXME2B1jzniHanX3d3K4pO5mw8Ybx0TwOm_A_kGU5YCDHGBmAgV2dbon796CNNVH
 kRCF3HwNMIlI_pjq8AwhMqpouEe0jdVvzW2t4lMikGMwSClOj5RBCulC0W4HF5Pa2xfDbKkRXWwe
 .95My8C.bxU5bo7FAwutVjIlg_fSYjzxhDaK.HzhaHiCG4K1NeHLqXUmrYYdwfPm5Ja8aGKtINSx
 q3gxzxcg92zSIwXUtt6mJl4eDcVDC6XSmOsIr0TJCnljL9IT2iAtBR7KMpvTFpufwuWbCNx1xj6O
 Hzn0lzBz4UiTg0Es3ptnBaTvzqUexCfW5mM1vV4WUdcHhgad0Kh4Top_le.6W
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: ded04024-2996-4ff2-8035-a2720bf6033d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.bf2.yahoo.com with HTTP; Thu, 13 Feb 2025 21:51:27 +0000
Received: by hermes--production-ir2-c694d79d9-qjs6q (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 92bee572f05969c62d8b2ccadd891f8d;
          Thu, 13 Feb 2025 21:51:22 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-devel@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>
Subject: [meta-networking][PATCH] corosync: reproducibility issue
Date: Thu, 13 Feb 2025 22:50:39 +0100
Message-Id: <20250213215039.108265-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250213215039.108265-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 21:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115471

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
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index d4945e482d..b364edc065 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -63,6 +63,7 @@ EXTRA_OECONF = " \
     --with-persistent-directory=${localstatedir}/lib/net-snmp \
     --with-endianness=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
     --with-mib-modules='${MIB_MODULES}' \
+    --with-sys-contact='no-contact-set@example.com' \
 "
 
 MIB_MODULES = ""
-- 
2.34.1


