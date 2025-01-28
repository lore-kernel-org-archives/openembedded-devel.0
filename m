Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644DEC02194
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 22:33:10 +0000 (UTC)
Received: from sonic304-10.consmr.mail.bf2.yahoo.com (sonic304-10.consmr.mail.bf2.yahoo.com [74.6.128.33])
 by mx.groups.io with SMTP id smtpd.web11.10514.1738103588456901840
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jan 2025 14:33:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=Ezjwx93q;
 spf=neutral (domain: yahoo.com, ip: 74.6.128.33, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1738103587; bh=iccZbEGV7/kIf3imv67IVBc85nvR4gCJZ+cbDKDBX6w=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=Ezjwx93q/OUGSZDRpivK/SrDllZo9set2ggJBDhGQz3TSHX9dQ+R2QuFi999EHWCVxNe0XK63XLRx6lY+Japeb29hBmEQphuYosEm9Ts+i6uc6zn1F41wAA+FMBb8QGq1Exd9ppT9BS1fu3kI0KRhHSlAVeIdvPXJBGnsNH74bY1dbdAJeqC+gIdBb9+x79oeax+urlBUs7K0sxehVJVnQ7C1Raci7bNH3QYAz6VUEiXykYYGBKdsV9Aw0PGKgGUtiBDdPF+92YREXq09fi8A3IxV4ySKkk+44IbZnYxcFcc5yuXnT9ybH4Q2wCK1D8HyPeRRCWwthx4tTMRdcgmew==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1738103587; bh=MmTg8ZsX0iiFPCkiLf329RJ53SpMAUCj6ipKoIWz7/T=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=RYFbl6Qhk75R605KKN11Vz0pNqxGVxGCLuMldCyGatItN594NjhS+XCBrkRPt8x0YSNDVS3L1BFbRiILCivkEq3JKqqeDJWuAgVxvJzYUm9HgSg8WhFWbhzdds66ONR8m6QeyfjYHCfN22YvPsgH862msfmH8aIpEVycv28hbo7jhSg/Sc1lE7rmKaEbDUVL1QlJaxHxxBCWLYAoCaivO1idlCnFJszInl995I1PI1S6eQfhmZ/w5O5tyJR6lVjjiAoPm65xIZK0iUeP83mVa8piDlKXcz6ivzzseab1uAxzqaVKgtB5MXEt+t+weNHpLuQKsGDXxsnYLiYuYj/5Xg==
X-YMail-OSG: NOxZ7ykVM1nDMVeWPBt3v2NrNCOwh83t8EkKSz0H6u9ut3gPSD7uFxOVo91ms0u
 MESl6Ybd94ZW3IkpW.jKRqxR7MogWtj2bH35dfeUEfSgZGYsMo5XVjNrv.a5B_UP91EXKH_NnLkO
 ZHLG8pO359kyTHxZc1DmBqiWhqeCv17y7KI3m_3wZUphR4JYNzFYRzw3zIqo6dtnzfIQ8PM1L3cJ
 L9IJJlt0TmJaqtMfacGEUr.yoYzFSV_UtOxWh3qniJz1W6vn2SZqWe167__WTlKg6RHpIuCQDOAs
 OHZ7eEBydmIiuE2LoEM.YdEoJ0p06xmj9XxCJbiOZbPdV9KbXV6gFig9sNTuBviFwJYmk9jRdg4M
 sHwyDmRPf.HlJ3mE8CYzPn4hSvrxFSXuahlkasr7BwgSoKicgxpLAtMNsgix6xjOjLZ85QNVQUfr
 9WHEEi0V4LQpLvFJQQJHwdrNcGtWpQJSnndRRbOFTGXNSYltHUoW6OLCXNRE8Qwg_b7ViphmSY4r
 wcrnMLB95sKQ7f5pJ39oIA3dSlT4VM2pw9Dd6bNxq7XrpPMRfmJe2jXjMHHulwIN3zYwHAgPTTh7
 fhHg9kensIv0Poy1IDK1_RMgTeFvV8XVVsgmcTUo2NXh5vEkxmDLTcHVIU0AogVMX3zyx_wdgDui
 mksUuW6uWxvNZ56OwCyDdgAl41pVTPyK5tOlwq4mox1pfn0pVCuYKUhgi82sEQLRezlXWH7IDUtx
 t_lNyieIP9sjNzp4rECWh33r6Crmg2GXVEnereTCDAGGBBbG9mKSXvBl3mTwazsDshFtXk8yzul6
 gkDpqAlduZvkTxdVZspDLaUu7ZKEGwfZZwZbONxRdjwoVemnLdjheIo8oFRrwzgo57G4pplzZwrC
 l_yNTLspT73PWII9u8kHleVeRS.lRBjOcNKEwY8yPFWAUiBpjrb4pcxzH1M9KgaibuDUOLKjrfFg
 G4Na970H8cxvurRgEx8aysa98dTVQk9Td._E0iGjFMHgwFzaBG.m.03EU3349Hf8kfrrGIHLyDqZ
 XlhJPz1SKbaRBAvpOAGbDulLfJ1y6LahTd1H35OXYAOwoF_tsL_uGtk3qGbTImOBnmZ3G6fQCLP3
 U.y30x9Zx8uKrE_MbDlmivhS7jAyb8Uj.jlHmJ_z81mbliw4rT4I86u03tppjrRutV233vqolFZn
 ffiJio.mk0dCgP1xvwo.rKL1mXSrHiGubLrHbKN5nQkgg1jwAcJWAEKdeZk8v7wznlKyE4TtJy4p
 Iwzw2OceM7WXoXTMzEqdQiHNqKDw8mSjSKctbL7XGXrHyZG8iAQq17B9oY7Mkgut.qCNdT1ZpdJd
 __W3smhK2PTdfA_XZnjHo_LzXpgZ5pXBgcz4zm54Oid80KsvabDdGvnTAFuI6Dsuly6bkYKOBmYs
 e6Hxyea0ywJ_x4uak_pnEou.LkVjXQC3ej3JVH_55zsHfRaxPeO1PH5vz_TJwZYLa6_v2NVzL07h
 N3AG_XHz1aMvB.zhm242I55r5LdIT5oNIgKAzAfrG6DSeZ2lsB.f_bxmMTxkfRnNzkKciuE6Ljbb
 A3DeGzDSKnrqmK25l2G5_bmX5j.GqQDeeGFMe3.iUfisBLJWUCzFPju.Qn_wYHDRX4XLdMNiEDvX
 n04JhsOhgi1xPsrREmDlFiIZ21UkTQFrp_zPHG6OAN7XBTL53m5BNG3Fpy__9MGwtjFcyvVyEjlp
 Y0nNfF4FigymYtiyGhFOwlGvahqnRyX3QDUQXXdHSMMc2DAjSyKmyslDvzIuce_eYu6Rwc92xAsb
 9b3T2CxcmGyVdeHRAtJxmjzvA6NFr2zAnJVyR2m9XKrK8INTZjrvfBkHVnUzch7vVLPVkTo9sCsI
 bjmzptEI2ol2YKErRZlWakpQwoTIWUkzzmioLAVkFUauHHjhTmzYIhCEJqJY_wgN_V7FNggEGM_x
 tN1i.a6Zrvh80WWCRWC_lA8Ui2pSD_Oob1gXWjZ_Jw5p_Yyo9GqiJFBFi4VgWov3iTlanKyX3mDV
 kbZOW1BVcUt5ACibEqxRhw73MhHVYl2zQNm9haQtSAzVfS7PlXrxBsGmkiGUX8oZ42Pys.ufbvMU
 vxW5FfDsM6i3NXwr8n4GMm_N_2bFB4y3OzwbsrBbQwpwKhtzv.uk8YJpW6yUcc2YX0JdkeY4ZUof
 ar7yecVUtlCFNH3g96Eyk21lCoA4v.kIohQu.jypN0TuwHEKCr8EgQLUUudAe5eY0IUmfc2UHlCj
 bF9kd84ke9eFjKGwGljDRU7OJvUMI2KrbMNL9w.HMln2zptQhE8R.yaU0
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: fabf12c8-f967-45d2-bfaa-08fa745d551c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.bf2.yahoo.com with HTTP; Tue, 28 Jan 2025 22:33:07 +0000
Received: by hermes--production-ir2-c694d79d9-mr45v (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 6366103232b6205033fdb7d97ee2d95a;
          Tue, 28 Jan 2025 22:33:03 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-devel@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>
Subject: [meta-networking][PATCH v2] net-snmp-native: dependency with libpci-native
Date: Tue, 28 Jan 2025 23:32:31 +0100
Message-Id: <20250128223231.280118-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250128223231.280118-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 22:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115125

Building of net-snmp-native aborted due to
missing dependency with libpci-native.
Fixed by keeping the dependency on for
target recipe and removing it for native

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
v1->v2
* shortlog changed
* description changed
* remove libpci from RDEPENDS:${PN}-libs
* add libpci to new RDEPENDS only for target
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index 06decbe852..61a2a3d1a8 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -268,12 +268,12 @@ RDEPENDS:${PN}-server-snmpd += "net-snmp-mibs"
 RDEPENDS:${PN}-server-snmptrapd += "net-snmp-server-snmpd ${PN}-lib-trapd"
 RDEPENDS:${PN}-server += "net-snmp-server-snmpd net-snmp-server-snmptrapd"
 RDEPENDS:${PN}-client += "net-snmp-mibs net-snmp-libs"
-RDEPENDS:${PN}-libs += "libpci \
-                        ${PN}-lib-netsnmp \
+RDEPENDS:${PN}-libs += "${PN}-lib-netsnmp \
                         ${PN}-lib-agent \
                         ${PN}-lib-helpers \
                         ${PN}-lib-mibs \
 "
+RDEPENDS:append:${PN}-libs:class-target = " libpci"
 RDEPENDS:${PN}-ptest += "perl \
                          perl-module-test \
                          perl-module-file-basename \
-- 
2.34.1


