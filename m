Return-Path: <Zongchun.Yu@freescale.com>
X-Greylist: delayed 3555 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 23 Jul 2015 05:13:22 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0148.outbound.protection.outlook.com [207.46.100.148])
	by mail.openembedded.org (Postfix) with ESMTP id 5046A734B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 05:13:22 +0000 (UTC)
Received: from BN3PR0301CA0004.namprd03.prod.outlook.com (10.160.180.142) by
	BY1PR03MB1371.namprd03.prod.outlook.com (10.162.109.29) with Microsoft
	SMTP Server (TLS) id 15.1.225.19; Thu, 23 Jul 2015 02:42:17 +0000
Received: from BN1BFFO11FD025.protection.gbl (2a01:111:f400:7c10::1:173) by
	BN3PR0301CA0004.outlook.office365.com (2a01:111:e400:4000::14) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Thu, 23 Jul 2015 02:42:16 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; mentor.com; dkim=none (message not signed)
	header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD025.mail.protection.outlook.com (10.58.144.88) with
	Microsoft SMTP Server (TLS) id 15.1.213.8 via Frontend Transport;
	Thu, 23 Jul 2015 02:42:16 +0000
Received: from neptune.ap.freescale.net (neptune.ap.freescale.net
	[10.192.208.77])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6N2gDpw019697; Wed, 22 Jul 2015 19:42:14 -0700
From: <b40527@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Jul 2015 10:42:07 +0800
Message-ID: <1437619327-24301-1-git-send-email-b40527@freescale.com>
X-Mailer: git-send-email 1.8.3.2
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD025;
	1:xIrQASwj8908qxnQ+/PajMvGksnltIXNuOcoCwFYPIZPhJH2PDxzekfSQIlMAlK82Dp+gjoEecxOtx87mFE87pFhbEb05nf89F8CvDpBFWPSNr5PtkT8AS8DmoT8r/7eonPjD2rwP93svqnCXfbJfsdtXRjPnnHq+N0AhLZxOAF93rMBzLvElug3cXB8eAOII8hGIRdvuJzKctPE7oy8bCMi5aUN9tu2tJ6m1rjVim4HAAkoOtbvmCU1PtlazEDnXh74ha+UtWpGZALFRhIKoR45XlFUOmB/fbY/xwMgQoSu5Z92Ig8rAggxUjriFCg/Z3NwlGxXe5txaykkh7AfaD6in5cbyIXXwMnVoBOayqbdIoeeQ1IBV92x+czqG4Lcfs4uYCZHqK++2NppDydVAR7RbGWF+AMjOuQnbqc83c5xc+Q0pAHEPjiZjiLpe77l
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(6806004)(50986999)(92566002)(19580405001)(50466002)(19580395003)(189998001)(33646002)(47776003)(36756003)(48376002)(77096005)(46102003)(85426001)(87936001)(104016003)(86152002)(105606002)(229853001)(50226001)(2351001)(110136002)(5001960100002)(62966003)(77156002)(106466001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR03MB1371;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1371;
	2:Muj3QJ/ZdTvprl2WMjbRHIyFKfph7dLjLGKWs7SI1cW8BV4Jy2+i5WWL6DhD/tkghB6cEGJlQ7eVOOs72H58d2jFF63NQ7GvwHHDSiK2DksGQKuAptfuOth8tDNCzeiSfqaRLhYiEApEe4rlCWkWaMMTEm1aHuG8Qmzm6QiIQ5w=;
	3:48jK2bBg6/53pCl+kx1+gpvCX+ydog9OT5wp7FrE6EtUAHrQTAdvrbbym4RF9w+VfUWv9DwhG9GIYnBy3BaC68IjLUeVAZieCXjrcPmX+dYSaWptadgs/OgMs0Rcrbb1kAXJMk7NPZtGCWhAmQwGR+ZsndBEkhiDY4ItzNwlkEzsh+qfyZlNsMNWF1jmd7yrl8ztxRHEbzqoOIFOeLs2TuEH83YxHYHTL2u0HUoR04A=;
	25:3RmAEBsdJcNY192/QQ+kMkBHhnMW7y/gvYgDFQ8XiV96WWPAuQ9vOG6tgbuOo+SeNPCGoETmQOTGTj3OJt/CAcYev26HB9YCgbCXYkwvKpXYv39Sf9kbzjn3EflnEKOj+F/h5NXSrgxiCXbuv/MhoxHcjERdhbwzfM5y61XJpRuDVhKSyGPdg/78HZ/cAoTpZv+CLReRsgRWmJ4iyJlJdobslhv970kmf2oSKJsOCFTOAcPVVthbSLhIVWlcLShU9x6I9wCWZC9t6Jjau5rt+A==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR03MB1371;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1371;
	20:8TCplfRY+Dy3qFlD4/rCK54i6G2u+0Sa5OiTTL76dmv8pOdXupsCbh3pX5B3E0MOTrM5wPrWQAq7DoUVQAfYcTPfjIaKbo2wQMkfRpkuXpiG/OZzqq6j+QhhxSY3itIsHGPjHjxStKKaDoR4tpgcd0CnR8xO6oAnGWtys2kt9MX5XbPkkzCvyydrtRMUkXq6SA1mvb8O0rxT1i7JpVJoCjkuNfpn7KccYJdTvkOxH6y+xNaYDJumCvPoA5JVpEglaLwsMOgXX0ubHJ1a1fcrcKNTVvZm97OWryrew4fvo5u9DWnp0qlhYmLkReGsL93526XB80Z2K1ri94Ls6YRkkRAvkic7p/ayzshnbIkx5bA=;
	4:USpoeBzNd/1P0oX3famxihFenLccnJrVRxRzrNBfW6LFqkNR9sqhx1MuDb7x1FMtMDlWbmcZ76iL0kzTe3Pa88fA+uUM8hAV7UZMnnNko3rKifxtoYNqoOrlCjO9j7gECSDO9LZnQqj6at7ZuhrzyuUG4qXi2VpihdwpWczKbFr6O4qy3TFZ0xqrrZABLvVzaZGt8cyoZi8Xi3aR1kQZ+IBcrxhF5H0tr98U8uX5lGRGI2qm2SU6bVmpkb57icCLokvfuBHaPLVxj56cfTNpssc6z6ps3+Y8DadReqf5mw8=
BY1PR03MB1371: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BY1PR03MB1371A55BD65D904CB251A860F7820@BY1PR03MB1371.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR03MB1371; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR03MB1371; 
X-Forefront-PRVS: 06469BCC91
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1371;
	23:uyn/27rqhv7YyXqDKsJ1TiGsd/PPtMsjqLWYMD02YFvJ9NFCZx37QHWbla9NWPVa6Z+FUf9AahaIXlFT2+wWAtkIkcbAZ23hJiHpdsTr8i/ajweDQ2r71i8l6ZcKbFFAEHfgnzbpc1ARlspIX1epAwSjpH/O2Jyhp54fgx/3FM1T7RTE+gs/8bO3dgE0+JDFSgeB8sRvqNxX+5KzgJOp98VhFECRSZvluX8pamNs7N1pDncXIEqwoAxvnCeZ12x0w6oKMBMde0O0ThcNQ+C6EQvnX7wtAiq2x3HrSqxY0/57VLgmRS91YXJ0SP8pKGgBekVglLlMlOliQlT4zBGzOHQz/1FWtJVdr9PPWVD9EvsbpIbAgmDyOIeBl+9Ey3HHpokOR1kBn6sanREKztu9g9HJwi3y7RRpNYeYXnoD8Bkn9TXFTTjrKu4KXqRBmLxzie20POSCi2NpsqTcFIolQPaSOwEM4KKSSjbn7WN39fS0yTVR9GQDF2GW/05MJDchqyXtVkywF+Ad1FnAdGbUI/+79PNltmkbovK85+FfHHcuPb8cIO6QUgpo5h7BjcO4I11u5h3w3dcx8CpslH5S9E5P3em3ApaHXk4pPWx4i2wzu1v+TPco2aQjpYF0UF8iNrdzI7OeE8ml3ofG4BuDCrG0SbwGSVkdSENYXrvdd89nVu3B4EKVSu3d5rtil2kiiZw+huwTDDZ+TpxbgNxwkcyKLWTfa7d88edd23U52WizWdwAco4BjesZB3B9OsvSRT4GV06f3LLNmUS8wqxTQJT5hUikcMiSkp30aceOAGVvwarewYGXsBhXESFSitvJ1wFzVsP8UUQjXzdd/xNa3A==
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1371;
	5:qTY47+Zof2t/4Mdeyql7w0Qlt1eP9lcj0zUIWzhg1XDHc4Q53nKyf0HRCMZtJQBGfeMpUfAM0IBNknE6XzoZriSaN7QI+gqibz+1BF4h+wczmSP+TkvbmqA8HrcEuAt+/HXc+s936kMfe7SRon6MWQ==;
	24:ETjT3ZiEf7mtF/hNoas+zGWShtRdsL/pvRcvFRm3YDotZC/hgf9sFlxzPxo8kKiRVNjiOub99olLIzOkrhjVl18ZHInNR3pMZ1IboEZ4jto=;
	20:Cf69LyqrObwvZLpDW+dw6qrA77/Ba2+IKJCZRfl0hwjbkIPtT28CCIeRnkGY7pzXW8ea7YQJXqDCdlsmjgkdXg==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2015 02:42:16.7411 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB1371
Cc: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Subject: [meta-oe][PATCH] lmsensors-config: fix a warning about not existant S
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
X-List-Received-Date: Thu, 23 Jul 2015 05:13:27 -0000
Content-Type: text/plain

From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>

Set the S variable to $WORKDIR to remove the warning about S being not
existant (which is true for this package, since there are no original
sources for it).

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
index 343971f..fe2f499 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "file://fancontrol \
            file://sensord.conf \
            file://sensors.conf \
 "
+S = "${WORKDIR}"
 
 RDEPENDS_${PN}-dev = ""
 
-- 
1.8.3.2


