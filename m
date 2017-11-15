Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 886 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Nov 2017 20:53:11 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0056.outbound.protection.outlook.com [104.47.42.56])
	by mail.openembedded.org (Postfix) with ESMTP id 130407868C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 20:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=aq3B4dyAIDsoXQUb/NqPH2IpaPKLyx6TQPPu7cySpps=;
	b=YuEprGsFXO6HCV+IHuNJB2mKLQjLL9TkKM98xnx4T+169yDgm7aMzbPVVHH2xad/oSzBjbsjxttRJzQUCC/DvHeOwBVEd5l+xHMip/9PyfJrCQaw/Qac6MvdeOka54pSNlvv4RSmsgmh67f+pfMtBhmZpPMrIZm3pkrmaGOJcRE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from willamette.Home (71.35.172.156) by
	DM5PR0101MB2940.prod.exchangelabs.com (10.174.183.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.239.5; Wed, 15 Nov 2017 20:38:26 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Nov 2017 12:38:06 -0800
Message-Id: <20171115203806.25651-2-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171115203806.25651-1-mkelly@xevo.com>
References: <20171115203806.25651-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [71.35.172.156]
X-ClientProxiedBy: MWHPR20CA0003.namprd20.prod.outlook.com (10.171.151.141) To
	DM5PR0101MB2940.prod.exchangelabs.com (10.174.183.15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72ce085c-c82d-452f-7972-08d52c68d2ea
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:DM5PR0101MB2940; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	3:jIyfwNrc4/XoZgpBUphmG6NvlxEqbINWj0qY8LMuP+csxPbgbQJqlVwH556DOoPk21vRoh0d5N/QEuX6X/y/gn3WO1JSOexPHbkCFcfvcHdg7UQpPW0jm3qnGjuFdpr2tWw1UQlKchhVhaSqsAPJD1VU2WVa439ZppK0v2GfUnFYFT80gKxRC7bH9jOvTEyF4PFTigWVRMeSDxlrTctFpSTEDdbrybHvTsUTFVV87iq3BNnCy0MFtSdLgxDuqm/5;
	25:74+Q1FvAsgjVx6z5G2Jas5AWxD6BdLlPyaCLxISzT7+m4s7HLhCfa8/YWqrQrjnf2S0BxER//WuObZ8Rcm1IeVUGO0FHNwo+aJqscRYqfto2XIQA/OtCb1zZECKtg3FGJxP2boKj1Twp5U1XklOmhEtcd2+ecGumq3CAgB28IN1hh3fEybwioBYM8KLrJ41z0MzjFkKuMpHS/48ZIXkMO3KtnjAQsEHOjEUCU6AKNhXaNK0Upe2OOGIgyKVy6wSJfDNAvH38QN9L+LbTNpr3mi0D8flr2K6wL3v4rwrxbQZNwEjyP4qcg2GbTk14kC8jLbDS4z4UAU3t8U67lGqfQQ==;
	31:Tn9QvyF94V+Xb/Oyk66uTYqnbzFs7NbJS749qOHUHI99uUtoM3SDdO17AXBo1CaAsEcL5o88Sj+XYvNIXa+FYu+bPsrBXDyb8m7qNd89Jwij0AWp1wskkYUbeFyExUPi7rp1TFHG78GC8MjzgIm0j01c3NWdhniJc+/YNkMBDZQVwMfZIleLD/j9RuFY3RdXorNDH4lQEGfe1W5n8OTCXr8u4cVKPaQZBxUkx93gRak=
X-MS-TrafficTypeDiagnostic: DM5PR0101MB2940:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	20:i3iYNAOf0rqjzAcczrUXsgvrQhc/Twfr4pBLu6PEjdbPCp0y1S7dh/yfzyj0+5kZE6MruziALvrB4FKf0uRHafJ695kq/073RD/l/PIFeZAFVtQpGL9/dUv+8WBOem5ypHoZ7vZn1HA1UIrVpkA51XNljpmdQeNhx0YMDz7wdSoYfMYLxfMepDri8AVUvKs9t/hnKpWb8RfhpwRJb+9DM8jQk2L7Ql9YcADgbo+UFxrSWT2W+GK1TuVLEb4Krn1mv3tHMnmS/+j/Bwun+IpnO00fk3CN+klqVKq+LX0wXF+Rxn10kSmi3hQcJu1MIdMdyuzkoA6K0iL4I4axBFlQTDSk1wmJRhWvOdmu4uNXKwiTHXIYo+kmJJq+EdA7ZBtci9I5Xy8jMmnYtbmfDtSEsIbw+TqyTUEueXzDH5fxP7s=;
	4:XWruLtmhwvw1hgi4OH3jkybRw4fp+hAPC95NPVjyghdocw1psRuL5V0GKtj11JkrO7oYhCOIPHEyNpR1bS4GueP8vVQ0D1U+kSlQQQakuSXUPA1Ik76HLThfs6/3+ek0dOz3q+gC/OvyyyEnpNMX66qzFVpif/qNdos9sNdG6485p4x19gQpzJvmu5aX3x7UQsasQGG+AfyVnx8mE/IQXs8bqkCMm1mMKNFwOOUFzdgzktNwQgucZgdwWP4aWem4gpkS3X78nEgpb8eqqhXy3w==
X-Microsoft-Antispam-PRVS: <DM5PR0101MB2940003A26AE20FC922750F5AB290@DM5PR0101MB2940.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(3231022)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123555025)(20161123564025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR0101MB2940; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR0101MB2940; 
X-Forefront-PRVS: 0492FD61DD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(376002)(39830400002)(189002)(199003)(2351001)(6486002)(6116002)(305945005)(6506006)(7736002)(3846002)(50466002)(25786009)(33646002)(47776003)(2906002)(189998001)(8936002)(4326008)(106356001)(97736004)(66066001)(48376002)(105586002)(2361001)(50226002)(5660300001)(8676002)(6512007)(81166006)(86362001)(575784001)(81156014)(478600001)(54906003)(69596002)(101416001)(21086003)(39060400002)(36756003)(6666003)(6916009)(2950100002)(107886003)(68736007)(1076002)(53936002)(316002)(50986999)(16526018)(5003940100001)(16586007)(76176999)(133343001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0101MB2940;
	H:willamette.Home; FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0101MB2940;
	23:O+DiK9qpkAlhSaTRQMVVXzv5SBiLCWKVpcbfXYI?=
	=?us-ascii?Q?3xTjpYjSQXjc4rb38vK8zWbvGA24RVE+G5bn0Im+Cfjbjw6vTFjrY4NC1UwK?=
	=?us-ascii?Q?goasMSL0ns6hyd+EcnYbkklbw2+YdJubvhpV2SnCOwckU2HGuyJQPVNvPIFe?=
	=?us-ascii?Q?HtsdRxaqsw56ekS21YngTTLJ5JSJGfOajKdSX0hrGBXWDEy24l2XiuBNBBA/?=
	=?us-ascii?Q?THibVQb+4/PRNat1b6imGvS7QQLP6MEiCO/UZ5/KTSRhAmJMsSHtfwCMWRWW?=
	=?us-ascii?Q?3Mo972slqcEGDILjH+fRo2UwmWrGd5HiTRSwq/lFHUudazxGzohRvbGBd6Ho?=
	=?us-ascii?Q?1saAmQAx2nXU7w/pASeGE11NZASqdFzXq6/x4db4GysnL1Lp01SkSSQr6QU4?=
	=?us-ascii?Q?E1TWvbac9HXLqgIB2NP7Wdqqqb5AR4RE2R6ksy5T5VlKJSOGm7oFcZMlP/1K?=
	=?us-ascii?Q?+B77TQlHVLm27YpaJPW6S6Ww5B6qnAV0rGn4daSRx0ie9aO6h80tgEk5umCd?=
	=?us-ascii?Q?Viz6+YXfOD5cxaAQiJuk9oSQxkosYFRzZzZr0jrOfleGOiHUPOfxAwm6q2Qc?=
	=?us-ascii?Q?9gtDpY6jIzGbdg5NYzKczkstZFIoCpssS1PVSRRvjmWAyu98+H3MP4hjNZy5?=
	=?us-ascii?Q?hq8qfgA1pcbp/4JBAgWAhTbw6CDNxijkQcH5Rhl/aVGIgXHgJj1GtQlaejJ2?=
	=?us-ascii?Q?Z8KPPueP2JW5hPVYwghCgdswfu9ZjkmRbzgrna/chzBmUHPMwAsLf0YKBBnb?=
	=?us-ascii?Q?0akYZdlf8SIICmw8oA9U5TFj653UdR+Y9NzEhO2fQ9Ep7ZwnRGI4EXQHAYwr?=
	=?us-ascii?Q?P4BRWXx7Qw3lCb9LeR0ktK4R7HtE6H7Q5b4SR9q2D4AVYpFbkS1am+o+zU83?=
	=?us-ascii?Q?zuheHNQy4Vtkj1KP6IV7TdvbdzAg4PoKOOJvlCSzOV8oJEfGyTezQbaKZSCy?=
	=?us-ascii?Q?rI6DtlfQooOVmtGxZ5oHTHWqN0w4k0SiPy0Jws2IATUn83Acml9YgCE5/BAf?=
	=?us-ascii?Q?SsHfpSeYK5ZFFRGSF4NRxRvYNAiB4kiCepFdEtAytRHMnT3QvmFyap3DPHlK?=
	=?us-ascii?Q?UfspZh+vcXnoLUbUzRXkGB0GuJifSARewiK3l1r8MeGEueiHjmCVoyl36h9C?=
	=?us-ascii?Q?RC+As3X7xOuSeJVCt+bLxHcW/agpWp22v/J7LNKBCrd4Kwz7zg5RxE/U0QzI?=
	=?us-ascii?Q?U9DVGck40LpMXzYPNGZKi8h9XDhajNzQforrPP9+spulJUwMPot4IV4oSnJ5?=
	=?us-ascii?Q?pICXwMpEEqdaqJvwEbhGGeK92pgtLRUzpXVCj7vJKKYtisy1iBToLt6GDGqX?=
	=?us-ascii?Q?h4r8pAMmBQM9NWrIRS9ToVqc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	6:/yldGZHuNYsVoISH8kbRo5l9ElH8P1/0Hg1wBtCWUWY/W68JjYAlFHe6i9K6UE+W083e9tneBlAkXI0Y+2wCC0jzRt1NFMvFkBqfK3ojTfbTgZRuMiXNOsUWOYjSBpTpvd49/B7elvKGez48MZCs3v+8m61BlQrzs7ZJlatKHCt4d/TXkSEzS8KOMmDbm7IzUZvJrcdSeWh/lW0tXd/ft8kk9kd9MTXQq+DMYQXD8hAAOFe9H52ZZ69jlUbxufrJp45oEQJDqO3R2wtXlR4XWqTF/kQKR/jVkeIgtU3hC07dF2BJxwQEpIQCXZRF4A5ft4MnX2bdEY1XOBEqIczM4x9/VT9EXnIo50TySP4MolE=;
	5:iqFjY0AimnIS9A1c4AfNttIKRRcwGLlobfKYtanzIX5BwlmKs8EZnCr3fWscdhGRiL8FhHMfZzrpyhzPFaVwXJVTKYUAtsxyTBJPdnE6Zi8tWKiAVEZWYGyH8/Yr6DiHCZcRomrfmnwQcHX4ALLuIvub3VvFog+/73d5vdbPHr0=;
	24:0s4HZch3uO0aBqR2NpYgLO44eBzsdzSutHA3MA/n56XQde1hjptX4CHDpYgMFx5uiPp3eFlh9lI31eU1rcdMXBGcKj1Ow3vsnKsYSwHoqmI=;
	7:zC2zV8XFZHVQVnxF5E6Cb5Nw/9ulLrJZAmG/q26BELj9OXnD25sNWQTWjTMeePfKOPLb/nmuWWcn5CEVfvUns1AX9pMzsjVve4pOcZtwKiAQdN29INVyQbQaDI98d/gx+uVaJ92Od2CCk4zelKWTFZSo23qOk1SYK1CtNH6URxyV3u3QEFaXXYo3RiqBIhbHa4Pu0ULMZ4C5qxcAc55wY2NeFQbt8tTpLuT/fZ1pr405H9O9fEnauqvT82sqRO0b
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2017 20:38:26.7408 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ce085c-c82d-452f-7972-08d52c68d2ea
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB2940
Subject: [meta-oe][PATCH 2/2] gpsd: add gpsdctl@.service for USB autoplug
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
X-List-Received-Date: Wed, 15 Nov 2017 20:53:12 -0000
Content-Type: text/plain

This service allows gpsd to automatically recognize USB devices but is
currently missing from our packaging. Without this service and the
matching udev rules from upstream, gpsd will fail to recognize USB
devices when they are plugged in.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
index e94d6a108..80d9b0edf 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
@@ -80,6 +80,7 @@ do_install_append() {
     #support for systemd
     install -d ${D}${systemd_unitdir}/system/
     install -m 0644 ${S}/systemd/${BPN}.service ${D}${systemd_unitdir}/system/${BPN}.service
+    install -m 0644 ${S}/systemd/${BPN}ctl@.service ${D}${systemd_unitdir}/system/${BPN}ctl@.service
     install -m 0644 ${S}/systemd/${BPN}.socket ${D}${systemd_unitdir}/system/${BPN}.socket
 }
 
@@ -121,7 +122,7 @@ RDEPENDS_python-pygps = "python-core python-curses gpsd python-json"
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${PN}.socket"
+SYSTEMD_SERVICE_${PN} = "${PN}.socket ${PN}ctl@.service"
 
 
 ALTERNATIVE_${PN} = "gpsd-defaults"
-- 
2.11.0


