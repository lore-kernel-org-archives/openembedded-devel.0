Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9FEC0218E
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 11:56:25 +0000 (UTC)
Received: from sonic302-2.consmr.mail.bf2.yahoo.com (sonic302-2.consmr.mail.bf2.yahoo.com [74.6.135.41])
 by mx.groups.io with SMTP id smtpd.web11.8288.1737806185002435679
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 03:56:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=kIwqShh9;
 spf=neutral (domain: yahoo.com, ip: 74.6.135.41, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1737806184; bh=KFlC04yMxb3j2yOj2y3Tq/uydiNG7lJtzp/RlPjKeSM=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=kIwqShh9XSLTbheYbs2/JKlZC4XxIWFXReJRzyvAqhxMiJH14ROL7WvwThiABnTekFF/CueGZlEVCOR2ZUqMOYGYrkW8mOQNt1hhkuNCOQDvp20Ztmp7NTUF465S9Qpu7lhKJhf3p8rKNijKui49TlqWTb699Fl6UDzkS2hBJOrmS+fwboLBguJoorwUipxsYG/oE9yyTeyRUdVhWGvI29iPu9b+E33Mb3im0ASdfurHi4+iahbaC82WSja60T68/czpG/vRhUZyWI2NOga/IVa1MjCQk2+H9vqFdYpmeS3sF7tvR53bmWF0ahGHCuFQPnWhrjAyzXav/J9/uZ4SUA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1737806184; bh=wZluNpy55ji3SgAKFDennG+ZPrCFlZqvHa7rtvB2/Id=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=ZJW3XX94SevRDB8M09i3jZgr0WdYiFWlj1AHbWOR03BYQgURh0u98ZxCs7V6xxwmYHac/fv6UY7+ylx37re+c+URLWbeowfLQvwjljhfwvhLMDFBp+Bh3bNO3Z6JwUDT+UNL8Rbvi1Uwb5jxMtnrOBE0QI8hN76QjsuSVB9mvWb6oa/0h4pARQoJDnlGPvMCGRb+6imBSQ3OL7kTSMFqsf2k3VgTjI1PzFPvgXKq9d9KtwCPHErjM850JKDFrf7ySwTQ881xgTeLsrWKnId7tpiwSDxdHINb75/drKfHr6nmA01ZUdDVbbQIcWjwW5XDl3qx+jViTFY85veLFPBrBg==
X-YMail-OSG: _8S5iYkVM1mVvzEteGdVUKzzFamFANdgNYdTEGXkWhrit0pYC.y4TLfHIk95b6b
 7zWQo.vook6dqzFSe6wlsTAdnxiys47_lK7rlBn_FLTdgJ1uNItvVE1SEzVoqBGIYiK6XiCbEFF4
 cQPav6F0tQKTHC8G_K8tlvQ4Hk49UdmANBxHnDV6f0_3uQ8vUGa2OtMjjw2YASRHI8HXfag8x5Fp
 XCWPsDfywphSU81gi6v9LmGqWDPPt3bFbE8lLSqGIGSdjTgEU1px5t9XsmRtavaujlb3SjPyMiyG
 cZcDl2KL85NsGZzubexD0YGJCcyui9hiAITzauIkqY3tuXHAcZ2oz29uG8D.99p0whc.EGkGf0g6
 rkPSJU81i7cM07J6uMAjSavEdb134j19JE6sWthTs5AbqiOpdr0w3JX6ZUuLb9NiVBcQWPoD1e0S
 VnTn4iR.hJYYrysCku4IOIf3Hj4XTfj.cCAXFRCZExnqaZP97MyqxNCVZv7hrCgeMzM8rI2M9S5u
 NgZBDkiDbbWE5YQbtn3lPtkynAgbhUMAs04tPuYe.VWGNqVIajg4bxFnYA3zwfYuMOURnDpKRSMQ
 n1MdT8tH9b580aJ8RUwUoPEh_30ytTbH0yZrYkQizaF27XlREcpcVYh84u5N0qFEXsvc_Nq1yU9i
 ICMsbdDhv9AIG1xhc4qJvXac4VkCJAq96tVlB1exZcyF_gXNIL6OsmUysYEUqjzSzIqVT5l1nfgq
 x.Vr2wIP.kPat_9OBO7OQMU542b_sYCy8BVkn_va7ctCCN.d3oqcN9YszFNOvFk4Xzl6cRnxX6ro
 89tggB87Hgm1EQadtUXSXdYNFjbITtWUDki89PBUx8K6ai.n8SANlYW.4Sanybhq_yFSmotaWI6K
 7xUxijQzJXXC6b_8rFZOk5ISZ5Pp4Rl7InOSdbg0l6wHMP4QPrpoiSzWjNXwv0IxZdvtR3jlMBuN
 0YmnA1WGT3etpTDVY92kwe4_vcATujoEmL3x1DodfhHQTfG89dv5q0oIPRpoU5D5hE1MkvLbIg5I
 fCxNZ2XKyUSlykLH6CtblC3C5vk13LsowELEe0dCEvFeA4cVAzvQWj8XknseEq4raBZTjbcRCwGJ
 CXNsr_TcI_bg_sz1TSFbVN_SNPpyvR_5gutJKErRRkAm_RF_ZAgMZE81dGR.QeFSJ6.b758q7WMV
 bZiziDf2Z__OAwJyMFlXz71wJivZI0_sdbbP16Gbg_t2lHx8FZUGjAkhhoLPrv40bos20pRlM0oi
 S.jPOSSQwrCruzl4G2z9Bp48WdgPs.kp7cQAHE8KneEyqwKx6a4xCdL7va4mZCvf.3tmRApze2c.
 Ue1VAsrKNJ9bCzXq8rfWn4EDHO9.DlCW8tv_g9ORhMudQRf_Ag9s4nAeJxqhdw2MDxlcRArZCk1o
 DY1dUc7xhOqMuBDvn.AEo_7MN6k0hND2IzwT8eGlPPBvhNWswWReHZk11FfEfu8s37Tf5C5pO_I5
 aKLaMaqx7_KyUQJSkDRPXfFiKLQ0_Z8bwE2ya8a5p9ulOQaDa4jCdiIzmbqoiHurHWhC1cnRftla
 QzQ.nI2m4iQar0UfHT_MOCaOXd2hZfMmPnqp69PrGSugzxAFPoBd6z5ZgJ_qGfCufliW36CphXwA
 k3ghqJ7TEnN4Emc9XyXTN_4NpaDtoYwYj8VitKwjfHX8muoJ7mLf_Nid7bfuEUI3K5MvbRJ1.dxu
 ENOJYj3zFO8QtocjXGDfHMlEGNn9Vq.skKrvttoOM5dWI2JW47kdwgIAfGTy31Ms8v0NABdH3hPi
 gWdx8qbhK5DEHGdt65MFh9.o0b7LmHAHqbpuzUEL2wDwLQhtOuXwCyvb4HxloR3IRxMonMdviYYt
 vBX8og3vYiVQE9fBGD9GAgQn90pPIgaHvhBlHcuNads96j1_ZxIsaC5l5vZK8JP8CmR6IYLP3Hnf
 6R9IoOI.s_PbCMMMpLf.dYiXfn0VXVemytdwcZ64p.HP8zF_a4iNL5yAzPR143FwBWk6zg9rrd1P
 pp_suEpw_iB8LEi4XL5q7ylb_gtoVj3zOABd0ehizYS1kj5kG8XQL.umBU4IgvsiFLwjSau0swTb
 IciEzAfzClflbK6nMzEQGBnma8B3FzH6l5RjE3tDceq9Q1i9xNNpyuDCBDair236NI_xQJ7zZLnR
 h8w7AcYPDIyggGSTRAAaRFkpsFrZatdp4jBDyQB3o_yai4B77TvL6nB7AuSzgV25eIs0M_4OPmzo
 OO9qoSaoMZu2ENPKfpwLbUpuo3uk4peEJgougiSbGJJoJkpMRlbwmaImOV.w-
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: f7ea3cb8-258c-4142-b498-b783c9ddd0d8
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.bf2.yahoo.com with HTTP; Sat, 25 Jan 2025 11:56:24 +0000
Received: by hermes--production-ir2-c694d79d9-rpm9f (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 6fff5891475b44f865d399a636c49304;
          Sat, 25 Jan 2025 11:56:23 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-devel@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	randy.macleod@windriver.com,
	Christos Gavros <gavrosc@yahoo.com>
Subject: [meta-networking][PATCH] net-snmp-native: dependency with libpci
Date: Sat, 25 Jan 2025 12:55:43 +0100
Message-Id: <20250125115543.7605-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250125115543.7605-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 11:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115077

Building of net-snmp-native aborted due to
missing dependency with libpci-native.
Fixed by changing the name to 'libpciaccess'
which is recipe's name

Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index 06decbe852..cde1c1dfe8 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -268,7 +268,7 @@ RDEPENDS:${PN}-server-snmpd += "net-snmp-mibs"
 RDEPENDS:${PN}-server-snmptrapd += "net-snmp-server-snmpd ${PN}-lib-trapd"
 RDEPENDS:${PN}-server += "net-snmp-server-snmpd net-snmp-server-snmptrapd"
 RDEPENDS:${PN}-client += "net-snmp-mibs net-snmp-libs"
-RDEPENDS:${PN}-libs += "libpci \
+RDEPENDS:${PN}-libs += "libpciaccess \
                         ${PN}-lib-netsnmp \
                         ${PN}-lib-agent \
                         ${PN}-lib-helpers \
-- 
2.34.1


