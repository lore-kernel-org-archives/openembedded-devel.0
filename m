Return-Path: <aaron.zinghini@seeingmachines.com>
Received: from AUS01-SY3-obe.outbound.protection.outlook.com
	(mail-sy3aus01on0138.outbound.protection.outlook.com
	[104.47.117.138])
	by mail.openembedded.org (Postfix) with ESMTP id 776C177BC8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Mar 2017 15:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seeingmachines.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=Kc0NMWHfK4GVDJ6Aj+81YsC71bSKdA9a5kO10R2g6g8=;
	b=Jmu1LNyZGK6ikDYs2IKPRj4Ql2bVnwD36gNXkY3o0IPpnDuYBtmi3IjD29BhpTapVRVDgkhUaooH8B/4k7gP7mcBOWFh5/7km7rRAkgbBFFJBMZXrzDVSlT8AOq9Rx2PsCSJglvn8B+lfQdl3p4JFlWKaHC/BNCrWwLHbVwPWW8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=seeingmachines.com;
Received: from aaron-desktop.sm.local (173.10.236.117) by
	MEXPR01MB0598.ausprd01.prod.outlook.com (10.169.159.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.961.17; Fri, 24 Mar 2017 15:54:53 +0000
From: Aaron Zinghini <aaron.zinghini@seeingmachines.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Mar 2017 08:54:27 -0700
Message-ID: <1490370867-16507-1-git-send-email-aaron.zinghini@seeingmachines.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [173.10.236.117]
X-ClientProxiedBy: DM5PR16CA0024.namprd16.prod.outlook.com (10.173.216.34) To
	MEXPR01MB0598.ausprd01.prod.outlook.com (10.169.159.140)
X-MS-Office365-Filtering-Correlation-Id: 02280102-f0c6-4b03-b7cd-08d472ce1d40
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:MEXPR01MB0598;
X-Microsoft-Exchange-Diagnostics: 1; MEXPR01MB0598;
	3:kzM0T3RKYEN+dtJf1joESS9CXQ8aLD0md4zpReG/PJEV8QicSuPEobfRBR4qnaUvfEhSQzNktBGe2iwAabX7cALj52fjD6qyJQqhREnDwXGC24pd9m73l5Kyh6JnVBEuc4n8eeNUWNs8k1W6vNz1QUpr0jw9tUrBUWqYh95lWFQMAD7rtu9JI5afhH71JO3jQQ6P4J4vAMA/9dcaG6YBBYSQ/s48OR1+asrR+BkXiM3rra4tdIQX4dG+FBeH511St2TsjRbAYWBGHYCibNzIEw==;
	25:cuY8DWQgW9tOvnq4X4oczTzykuLriWE0xkZKy3Rfm1K34RlYKiH5xVP6mcUH52960Rgl+ZRVBBd2uKwjEy8CyJc5lsmTK9mne4eif+mDjplbBFhggv3CvAeN3mU1QUkJmW9B1NhB1rLzSsgPrpZXQITXJ8bzzklFLKx/9SzyaZMgxt2eEYqYS+UGHI9ohu4ojVhenIRGHoSZqNl1vuvPLg3UKYxV1w2tV/67bwfy829IyK077HwhEHDhnu+wAwcUtzSXtwe5XKgIR8W1zcPYJHJQXw8yT0ttgU06K3tmKhB5R7HLw4XpPIb6HKFgy+uGaesL12KmBZKQlbnnX/Ctl/2reKbZS0hsdVYjbq/DC/C0uca2W9zqNF2EUCzitpe3wH8wB1JjpZ/kdpNIh+zHX7snGpoUvWfb/x+NUrj5fGoF/wcnNyzAuPrq2zDL12INm8kpA8ukx/Am8kKX9u/J0A==
X-Microsoft-Exchange-Diagnostics: 1; MEXPR01MB0598;
	31:4r7/5Nh5K4t3rOk/AE39zW2hB/9uQxFkg31Y90BRbjG+qhW0XXK2qVtLe/ayXcwqyM5j+3Hm7/2U3DVboUur0RIQZBW/AueOdPckh4M9VMY1L9nzE14/1O8IApgAq7Mpq+1clieGZoql9Fb2IHX1ezp/VM2719BLKl/WmKfPpTxz3q+EPYSr8HJ0BvgTSusL7BR8m2UYpSPvcH8koZkC29jvX4ed+ncwujNAGiyR+UA=;
	20:lE6tGAsCQopXfOW4gOX+xHjBGgY/2HmSBaRemY3u3DA6/SLQgupKFzTc0V7+fhbOJzE05Gny9SvtXXdnZ5zslAxVD+fpUyExUV1cBveJMky0F2ta5NAfaV4x1tYgLLxsH8JDZ363E8r15ybnNMABxhF+tYUwswGzorGp8NMxDTA+HkMN035q6zIiOFdMkJhTIy+fqhsWAd4A87lZy4yUXoej4GTN5CVDAmzefuVeR0/aIhcnH0dwO1YOiIpZMkd/B6wB3gEJknnMbk5G+282JLQZIXgoUDszM/Mlxh7IDFmyhpuzP8ir8TpxqO7RuH9jRaRrIVsmE6jK5HPglPVn8w==
X-Microsoft-Antispam-PRVS: <MEXPR01MB0598D1AC5B4F0C3EBE54FC33F13E0@MEXPR01MB0598.ausprd01.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6041248)(20161123564025)(20161123555025)(20161123562025)(20161123560025)(20161123558025)(6072148);
	SRVR:MEXPR01MB0598; BCL:0; PCL:0; RULEID:; SRVR:MEXPR01MB0598; 
X-Microsoft-Exchange-Diagnostics: 1; MEXPR01MB0598;
	4:WeU9337jlRGtq/eGbcmwR3IR0qfZpzHQTZkviaon9lgkMm9xfeZum6mhccvpL+k+Raxv7KxwTgof3kYNBbtUQ70jovv36saADCZj4+Sn+RFScoJEE8gymLPGwo8Ry36CsmTze1u3cbbXax2tCO9TWuKy18NW9Cga215/IIXhm71XzJPFfC0Q0oP1dxyFo8qATjCnaORuOxe/ENxiuvham91raqI3mf8iSmutew46MRQCI36MlV0ZUo7n2r57yki2zdBhBwK6ff1AT26m2iSL0GVZL7UtFy5SmY02sd5wPdqHs0wevmlW4HKFl6PXJ5cX3Qk3+N6GjZnUQ99PhR1CVb9WfM8ZuoQ57X4D2XYGblLYP1oM3oem2Mr/fSRVaruNuoapYlDXZtJNU2NlpKkBnoZxBKm6ZhmwjMzOiEg3yFBgsMyp6LaR8ZynWVrTUuZTlJgnutokVEEDoPHpQ+0D5rswSj+nVQKND3sXCBwRW2hHojgA6mcsNPkCpKCwL5ruSInG8E7NBo2iKeUCfB2l+RSXd7J/3rqQeKvwnKc++SC6C3bjOEl2VLFZV8WK3NPIPxURKHolLb0P6tBR69UjzA==
X-Forefront-PRVS: 0256C18696
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(39450400003)(50986999)(47776003)(42186005)(4326008)(38730400002)(50226002)(36756003)(107886003)(7736002)(189998001)(8676002)(6666003)(6506006)(6486002)(305945005)(6916009)(3846002)(6116002)(110136004)(50466002)(53936002)(8746002)(2351001)(48376002)(15974865002)(2906002)(33646002)(6512007)(6306002)(66066001)(81166006)(5660300001)(5003940100001)(86362001)(25786009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MEXPR01MB0598;
	H:aaron-desktop.sm.local; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; MEXPR01MB0598;
	23:lqk1NOPs4rfhfJfASOcZwGrna0R0Y24B8TXPvVU98RrqvXYt/uS6tfJvBSEpjMjRq6ggeEDkdiN0Qsrhev4rvtrxPby37fw+sNXvz51cptl5qAtk47N2q8b9bFRAHIUd4kcpWbtEAg6bZMDvgPEkmVsco6itOQ4eXmwHqaQJxeQPDgVtKYTbMCcrFVtOY/1h9t5+fiU1CSwxwPLqpaOT5zn1Lz8bwZHJ7n0cQGdmWs31+P4z2xxDmdOg7tO79aMOuV0Nrc8YYrpnze/4oNd6hOHVTFiv6ZG7WuahZbwMl7UyNYHXBsRZXITBcjYiYBRNtfoX2HIh3Kh5QenPDQ0V8+MrHIo1tJ9r3Hk7UL6+OgvqRx1I9cKef+MM8Nl3ekZBSipvVGuxQkC7a7wFrcfzqq9iiOWm21pM5vzpy4ZJXbO0VlsGhgXw7RMM3OZApy5IjpD18hkvVME6bG9mcxnv5MggfX52t98Ya9MgN3uC9ArV9SoXQsDRH87JxebUtBz5NXggZPuUc+l0BZ0p5gCGKFGXNiJbdvqQiFN6wM3JS4+DEYILEPlhpHaHwJfaxMkjHoH0vM5xQtQlsfEfLpP1oLAfYyRy63YkXHF+UL64tSDNOqiFdv7jDSVSUmpO57RtNJCfGGqIzqyF6b0ruB5DmGuYHVDHKdRc/IfuYZeDjXiU17Ly6S52x1UXIDg8KXf+wM+FlHhruGJZ9ZV/SuVlIp821Rgsi1jKZxKBX2jIPZS3doFdY01qfJnKF/HWewGGi7SGViT0DCTDaP8L1MSU0AVSQ54kHWrJlpzua49e1kncHk8q2j8JnPJNWyU5vJhfuMyio+jWRr4Cqix2KhksIu1T+r4RD3SAfFKVcchn0VkkPsHhlbpbkdXF5gkni2++dB8DEc3yBVl9dJ64Z6syiROZ5TcF7NgSIJr3ftTMxhCK0MqjOnZqhjD9iA9WlLFB
X-Microsoft-Exchange-Diagnostics: 1; MEXPR01MB0598;
	6:KQHxHgderLBOrXSI2Iih9qQlMNy1QoV1Klq1pFz/94CVh9mw4j0/gV+Fmcng0W/vkQp+FUqBY9LbHbmDtwPy1z9txUIuQokxGkKJpNJpSeJsya6o/sbiS7rMAA2HlJciQySiog7v2E+LU4x7OeixIvyunqoSob98CIxiWvelBgnbAtUWmFxUJXzz0ov2A0LiYswHiQjaQVJwHQlOLVVLbPF77Z8WBQrxngFdghSS6T+S0LJdgZO2b5zqg8yEq9Ot7xERqoWpsJptoU9asYauuIP4mals2f9M7I8ACv35Z+QzqIP2id1hM+OlfV5mvCxpvvesK5WR/0mQi/zfuvkVAy2laMmzjtGwgZ/+A/7ppxww8UJohIXVwUwGSINH5udxH7jlyOFyLUoqlv8Tc8Tixg==;
	5:HtrPiijjfgxwSokWhQwNI5kW9JONiEp1QQQSNtVfkbeS8FGbmeyxVCJKJr+jcG2d8HHUkN+As04WACTK8TEFrguaDTKcXtNhr6dPLmfKo9g720BYUax2X1+fL4Lp/UecDUqIEwjUdRai4Ydw0dOCbw==;
	24:zNbnr+d0jXKcM5X8kF0eaXd7MxKhy5IFWADUCs9NLeWOOUEnG+4MBKkuE9tb5fJaaNiv7JXWSl0Dq/UtK45Ikq3fgL3Y3aq3FaWRhQ4xlrQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MEXPR01MB0598;
	7:6bqyAmdWdFaowEaLFPxMiajx54k981aWKeUoMrSyneCQ5vnv+PwoN89NOFSGEf0PWk/snLelikQ5ZWQfGru87wxA/3f016GMTgObWnzfRM8vtlM/wPF1Wl6cRJlI2rpdG88tzzH7FXiZYfT6d9kwppv+PineRnc6iA6Jdwslq1rH5jYzDEFurV4M7R2R1yDd6R9fshk+cgj3f0UwKqqsvfg00Vg+XrEWwocTyW3Q9peqsG0TVWX6SvfCOtjcICS4o8TDAiQM24cYVxjXaV3oQLESlceGIAxI8ucLLrf2mlDclMlgyaSPcKY4po/+X22hwkFXobZqsczIAJzUHK9c7g==
X-OriginatorOrg: seeingmachines.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2017 15:54:53.3352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEXPR01MB0598
Cc: Aaron Zinghini <aaron.zinghini@seeingmachines.com>
Subject: [meta-networking][PATCH] wireless-regdb: fix crda failing from missing pubkey
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
X-List-Received-Date: Fri, 24 Mar 2017 15:54:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

crda fails with exit code 255 because the public key
from wireless-regdb is missing.

Signed-off-by: Aaron Zinghini <aaron.zinghini@seeingmachines.com>
---
 .../recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb    | =
2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-r=
egdb_2016.06.10.bb b/meta-networking/recipes-connectivity/wireless-regdb/wi=
reless-regdb_2016.06.10.bb
index a9119ea..64e9401 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_20=
16.06.10.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_20=
16.06.10.bb
@@ -12,7 +12,9 @@ inherit bin_package

 do_install() {
     install -d -m0755 ${D}${libdir}/crda
+    install -d -m0755 ${D}${sysconfdir}/wireless-regdb/pubkeys
     install -m 0644 regulatory.bin ${D}${libdir}/crda/regulatory.bin
+    install -m 0644 sforshee.key.pub.pem ${D}${sysconfdir}/wireless-regdb/=
pubkeys/sforshee.key.pub.pem
 }

 RSUGGESTS_${PN} =3D "crda"
--
2.7.4


Aaron Zinghini
Senior DSS Software Engineer










T       +1 917 346 2993
M       +1 917 346 2993
E       aaron.zinghini@seeingmachines.com
W       www.seeingmachines.com<http://www.seeingmachines.com>

[Seeing Machines]<https://www.seeingmachines.com/>

This email is confidential. If you are not the intended recipient, destroy =
all copies and do not disclose or use the information within. No warranties=
 are given that this email does not contain viruses or harmful code.

