Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0078.outbound.protection.outlook.com [104.47.2.78])
	by mail.openembedded.org (Postfix) with ESMTP id 49F5D71DAE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 04:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ebWx5rrqgY5ByUAkAcsBhaB71ak/QOUxFIfSIWZ5wQo=;
	b=BHxm9ox+lR5/KBDnZPOON1BzGJAuV/IHTecg302H+50PLnOsY+2zO2IeMFWZJnFgfS9pb1YaL2PcNQi4Dbg6MLGfxHTpnnhOoBKUBgFrE0e2vbJ68RN9CyhOhXabU+4IKggJun/zRsMtk+X2e+yY72KJLLKVvhx/2l+5WhwAH74=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
Received: from tx30imx-01.am.freescale.net (192.88.168.1) by
	AM5PR0402MB2819.eurprd04.prod.outlook.com (10.175.41.138) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.947.12; Tue, 7 Mar 2017 01:13:57 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Mar 2017 19:06:22 -0600
Message-ID: <1488848783-9696-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.1]
X-ClientProxiedBy: BN6PR17CA0040.namprd17.prod.outlook.com (10.175.189.26) To
	AM5PR0402MB2819.eurprd04.prod.outlook.com (10.175.41.138)
X-MS-Office365-Filtering-Correlation-Id: 52ed23bd-d16d-44e7-5e03-08d464f73b79
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(48565401081);
	SRVR:AM5PR0402MB2819; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2819;
	3:pp3lGAbscVeVHT7nRyC2n8RKQN/FgnCJZvSdLIvKMs1ie5kFxGw3OVN/hnU2trMj/nHCpkSLwZ0hQZaLS7erNVnoSb88xCbs/nto6LtD3h60XKMeRa9x+RfvBwyGG7aJqD/g1ewPm9W3rURhlX6Q8w1Bj2oYeRJlC/FiFhNkIpdQx9fdKS6zVe+APWcKrpnQ0jnPN8Us0YhPERaRYMBCXMFGHWkUCiBEEnpQEk4gLgRagA70Ugod6svQwElueSsJBKD5fge59PIls6oJyL3Ky+S/wP0oFTlXIlBzAkQ/GpE=;
	25:u5iW6+LfjQIgIO+sVkQQR0PNVF5v0gQJeB6Lta1IlcseVbkXQQAVLu5PLVCixDVrfjsfB/BspuQwnoEfi/HMMXQhbGNULPGG8cg/zNVtZlD/xgJleifbnHCMvaWpSCgh1MbXRuW0icUWOfhQ52Dl320Hln8zQ1UvvNdhg9joEudCWXe5iETTHeEbam7A338/Y7Er+nywatwQuruXIRxu6stGOmSxgzxwXK9baPSZ+hvDrg0V3nkjpWj+LdLzMxY518DbYnaIbqkrZdVg+VFWJrXunjvTIHnIPIpV3+8jVLUPVL5EN3Jy8km6II0c2s6+RPpZZJVJU4msZQKe2GIDhkNJTYvLIBlPZ1/5TcAMi6NGkDpkVe1h2RfdLy48KV9pB0PxsJ5+oyy+cafMsp8vKTAsqLhsiGljhr4vKqwQtCwx1OyFrIg10fN1aY2D05NT
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2819;
	31:VqFx5fmXW02w5XK9S6S56BMB1h9p6EFW96UJ3VygPkKsVq5bi95MligvuQRA/ctMLIkuPmfEbnkTVYspcPKGGbds882BVghmfDhs8lDglpBMdWNzc+imEo1HAVfvVHEnXj6HsSaojS+iedm4MBkH/6JCQgzIQ6Py63I6QiDSWdN4seKFOBv7tinbg+Xj67XDyiFlm2GRA4ZGD9YzgGEjdF93271voy4nsxBo/ePD8SlCb3zr9/lqe7oJUv9JZWh7f95dLcU94r7Qr3dCRlIh4Q==;
	20:Ae4/4wthDA4SeHLb4vErLOzgSXESZiM0itpTXJ668TIWzk0a9LYMWVB9d4gL7AI5MWrgYDy8nOY8szt5GxNyMnXtb4mx3EgLYB3p9DdhTt7m0iGu3bAeZjvsB+gzsJ0XM9kkUV6iRSKY91IXP5BhJbR/aSF5l6G+8GITTin7eXQ6ecku49rHmHfTq1Der9EjymFnF4tGGQPyjLf6jWGmEZY1LCuvWgMgeLtPmCBYmieCjj67JqN6BFVpeLuSipzZTcXMYrxVYE74piqnAZ+DHPF1+f5iulSDxrUaMsx8C3BaNpOkfGjgrFgpr7539iKjD2pS3g0FEhLlP44EjesTI2Y+kFRMqiqKikJHIV/aFFBxXWh4mrgiJLzDOFvxz48TRlzVo8ddORIMQWWywxQJU8OvVndwqNSa6aYeeIqNh3elos6ot31idARks2ZtX9I3KCEEIMlHzF+xQBlMUtgHaA/yJfQbh9Ec5GWjcPh5A2bIuFJyQQa2Kt+semJBAPru
X-Microsoft-Antispam-PRVS: <AM5PR0402MB2819FD43A7EDA2E5083F689CE22F0@AM5PR0402MB2819.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(42262312472803)(5213294742642); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026)(6041248)(20161123555025)(20161123558025)(20161123564025)(20161123562025)(20161123560025)(6072148);
	SRVR:AM5PR0402MB2819; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0402MB2819; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2819;
	4:BthMLRKQ1NK1iYkw8ROmpFScJZyXu7aKUEr4o28kCpMBbUqEh9qEBU3Wma7tcpOoaZsFYVAWrgGOH5p0xHIO7VxcUlbTS2iT23Ar466HSc+xpkPsYZXfUk1kOM65A1ycEaXcUGa0w7bIOeLRMav+ZZ7hj5JMmpnVxNboLgUL6D3BUza9L1agBilBwWlg5CaeV2qtG/454cTOdcTltTK+v0lfMjIschek9su2JtrIPzIW6YaSJ6ZbbjGvKNwcvQPOfEoSUGj/zLOdconm7M6XjgKghVz6SrpZPFPtDMIknYiXG5xieottVU0MR2HnfkH6u+z6RCqvsI6nJ/nOQhzPWa1CZQ07zIdjMnHWI49mY040KcDEJB4JqdH9X/kpuKaFuYvgV8fZmRSccq86KLDSd6hT149yXKfhw5L2xxLiv/CYutddAbSbfq3s0rcgUIEixmA+06pFS6ZHLgiUr4Xok1GOcSiBVZnWF3iVajZqVF6383g02nJNJGbTr1g9Zpo37bPM8cOyczOAND6On+hHHGQSpGK180JEEiXY+Sz5DB8L0baypBLPfAzQ75R+REFyVS6dlll+X7HGe/L2wTIS7AU7uw7OjnIk+m7Vd/nLhwY7MHlDoI9nwW8Qi0/SCrItGHkZiOAsgNxgbrSkQ5cts05yid7CBI7n/tRoG9EbU5OCSK9h1bI7wIjKFryCMSRZ+Yv4OBJUDDMYxTAgIqpavaVLgn7CNu0pckR3xO5IxwI=
X-Forefront-PRVS: 0239D46DB6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(39410400002)(39840400002)(39860400002)(39450400003)(39850400002)(189002)(199003)(6916009)(47776003)(6666003)(5660300001)(81166006)(8676002)(86362001)(33646002)(50226002)(8558605004)(48376002)(3846002)(6116002)(50466002)(450100001)(92566002)(66066001)(5003940100001)(2906002)(4326008)(36756003)(53936002)(110136004)(189998001)(53376002)(38730400002)(305945005)(42186005)(2351001)(6506006)(6486002)(7736002)(25786008)(50986999)(6512007)(6306002)(19623455009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2819;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; MLV:nov;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM5PR0402MB2819;
	23:cabFRbF5kfP4dh/FjK4f+0j+/VsvRKOgwv2BMcB?=
	=?us-ascii?Q?B/0ZtbVdSQdm4ECOs8eGhO6fDwTBbjHmBcIwTM4+goKFJjMl0zq6EUa5KHY1?=
	=?us-ascii?Q?1wShLF4tVWPjOLecd5TzpD9M7/xxsY48WQH4oFrO+k/9LQmWeBQV2vSpG7Jb?=
	=?us-ascii?Q?h2jzgxbL9m1MENoGpoUwLpSrZeV96gd3HDRTUH+w7h4pQ52+DOW6uoZx1rBb?=
	=?us-ascii?Q?QdPfWBvuOp33QwGokzfIn7s3MHq2ae0ytP+xuS8Sz0Eehw109X0ppx/rM+FS?=
	=?us-ascii?Q?QmS41deRp7k5v2RVpcSUodPvN0jqNw06Sg2vPVs4TkBEk68wYyznjhTJmJPb?=
	=?us-ascii?Q?WeboasmwEVsdneQQSEpt9bHZ3P4h325juGmZNmbjBbzSVEZbR6kNg4Bz9zM+?=
	=?us-ascii?Q?SIkiQSCA7wDMhtEfxrHXxuXYl8P63hZaBlV/SHzqYUNYfiG/vLQ1NPfFIchS?=
	=?us-ascii?Q?Q31os0nLDUaJjOw7nqSno6XDRo9LETS6Z2f7LfMLOA3+tKPzFkVGt3e6GiQZ?=
	=?us-ascii?Q?SVRCKdH/xrSRvNpN03P0oQJ3u/XwuYesdXnHG0xXoV9koaOSEyStwyuqHIoW?=
	=?us-ascii?Q?reI632lKM6vylTg9J1HJYq3ndbEkbhgu7m+cGojgURLdxGBXI0RRpbkm/oNc?=
	=?us-ascii?Q?rCAwR0LnqH1xzIgy9wRUQsqDDkrFRwNMckAeGhulyKvcnVHOclpl8HB9wiQX?=
	=?us-ascii?Q?nzGvaa2phLsfBEudsuaWwfNBg/z6i+nNiVNsZoTBpVhsqDekmQ7kXjM2OjHo?=
	=?us-ascii?Q?5xJLs7T6ZLmkGRoMjvB16MTiR9EYEnqguGq310hMCc1FJqJtP1eIEd20aTDS?=
	=?us-ascii?Q?WTu7iobofe+jWdza5finuhgNUo1tgXON575PrbSxsC0zPrJINL8AMhgKDZja?=
	=?us-ascii?Q?TK54n4Eqj7J3KSYaP+j/1x4FYOs4Pd4HoUJZ30ypbnNffM254NiXudA5rTBv?=
	=?us-ascii?Q?PlpZi3YhHGMjI+GQMJFlOYpGC6DYfElHLr33zvRUV1uQ0+0wFHLn5EVQzFXd?=
	=?us-ascii?Q?3PjjMLSf4M5phVKFbYmG4JEbABUmrRtO70OQlYJGNLlEWwh/rFL2PuoGbYj6?=
	=?us-ascii?Q?sQ/lfOOwsRJbygxFGrFcnrJgjYgAJNaKRNgsXCORjWg8GqneLQGddod7m5Ff?=
	=?us-ascii?Q?lb98iQIz527EjxQeLbdFzEXwIbzqJuOgXoeGLlNQZ4hLyyZyEyvxgbw=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2819;
	6:pA4sFe//knYzeJNLTmr7GInP803J6oDksqWdpY8WLwbMSKOCIuJoMK+DrhZyHSRG93D0JYQkHdO+sw4Kwpipn10p4LCa6Lw+QrcyPtavRrg1oSr1pT0/LSoKrSqQymGcHwltpKt+B30DUqfTB/Of/aki5phOSf3+MRv0UxuQqdwXT78ldD9yXIidYy1xHIDn6jVBE3HvYOePlvEM/9EjEaeZfkiIkmV7YhuLzeNFx/Wb2Zwe4ucfxKYf5GFC96BHONQLAAidcyC436igc5lNuWd19kcBsFp6xIj0jXCs56IHE6r05FzJ3hOvRXJ6m9Oa+fduUtJHmkYMMGXyF91JfbhRHQCfCL9qt9ts6PNrNiYDxiD9QblKSNdvcIN54hWlD8FNhxABEv0fAiCFnf2AlQxuPAXER3VfXW/Bok6W09k=;
	5:ecakN0tGqHMygFmz1oR3u0w38VUaOgPQMlQHf3AvVcw+D+7B64KiHrTUllJkSa9V5vHLKMakTktXjMsEls3gl4TLiil7LNlgYiFsl+OcfOgGlBOWHKEIyEFM20qsdiSO0bRvF3NLV2MaZeh31E2ZrQ==;
	24:Y9sJHbZK3FVqhPniuu581DczLjJgZ9TB/FWD2sfAYgUvJKjkSR8Ly8tWvrP/R/5LhmQFUZwh33yNR39N40aHbU5ubkArzikbjiG5ZRlOr/w=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2819;
	7:zdJIYeKod7+DNKH9HQTsgm+ePGuUoKyTHinPwWjvjamWvIMZVRgxJ4SMSXnNfwrc8LN4itUv/abHD9r5E0Ndza91U8G3lZYT0pLQXSOq8zDhNVEmB3rory0oTB5D3FzW1aXROQlfIlhMFW2H8xzsKKZu2c4R+mtZV5XwXc8ivc8Mg94lnyz5zxGQtxlnf+Fwvtl2zMZeGGkQP2zF3H7adTJZesEnIW17+/YZS8WXl8stJkIHvjNVnwYnFgfO9jAOXXEUPhlCkpLeHzjZvAQIyVxPyT6loyLyy7cigl4OpSVE6eEbeTPIBOunVKLWmrLNVMd8NVvgSuK25bwGJGvBmw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2017 01:13:57.8307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2819
Subject: [meta-oe][PATCH 1/2] assimp: Add missing dependency on virtual/libgl
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
X-List-Received-Date: Tue, 07 Mar 2017 04:49:20 -0000
Content-Type: text/plain

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb b/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb
index 5ffa5c2..4da3dc2 100644
--- a/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb
+++ b/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bc4231a2268da8fc55525ad119638a87"
 
-DEPENDS = "boost"
+DEPENDS = "boost virtual/libgl"
 
 SRC_URI = "http://sourceforge.net/projects/${BPN}/files/${BPN}-3.1/${BPN}-${PV}_no_test_models.zip"
 SRC_URI[md5sum] = "ccd4788204509da58a3a53c7aeda7a8b"
-- 
1.9.1


