Return-Path: <mkelly@xevo.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0054.outbound.protection.outlook.com [104.47.33.54])
	by mail.openembedded.org (Postfix) with ESMTP id C35D274DDF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 May 2018 21:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=C8eaAGh1sHRs1p9jDXahoIABI8X8zFRQsM1uuZO82GE=;
	b=RT9V6OdBSlFHKo3QfxnwadjicRqNPt9/J0/2Lr90GIcRlvJspqr7AlanYKyUtaQwsC0TgAS/3b1ILUq73FPPjyPtfT/zCvR9NotI3bn9DbwfIIJZUhNilXgzNA9knxNWrsSyQGvYsnQetDkAJB8BJ7gIfAC4GWh4nf1qva75E24=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	SN6PR0102MB3424.prod.exchangelabs.com (2603:10b6:805:3::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.735.17;
	Tue, 8 May 2018 19:31:55 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 May 2018 12:31:39 -0700
Message-Id: <20180508193141.14077-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: DM5PR19CA0019.namprd19.prod.outlook.com
	(2603:10b6:3:151::29) To SN6PR0102MB3424.prod.exchangelabs.com
	(2603:10b6:805:3::13)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:SN6PR0102MB3424; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3424;
	3:AWnrNlTNZl3FixhTng6H/I+SJhP03KZn+UqWwRn2N0P9iviugyfeB9L/9ZSS74EPN+Xt1T9lK7g+5huFBpjqVsnpSa3IWezsjuSHV58EiTKgjFLpgVAmif75esYbBZujW/ogo2QeIZQty1B7sr7nECMqZ/EyQOYP+oXIXQ/0NNO2oST1t8gzkHbxq9PLH3pS9w5bEISUfLx3b+ckdcGDqqk5sn51j0vmHww+N8xfQXkV9CyQqMjDkCTsCvsHWuJy;
	25:Si/LWDhnCdyR/rSoiq99QiUPmYqQgu43+8QC4okt0+fI1ie0U6wNN6jkNgInkrpYBsYlZ0wIPUApYgS1Ipk48j+wda8OtBlgt01G+XXLnJes3ZVar3uYG6pf/2uR2ohYh5V/Xplphex2RAu47rpAB7CTwGm5UMTM+AeUOi/rKH/tLY0hNr4L3tJrlVZouH5ZZxLmPCV97lC6RSQ96xgPFFoybqG0MNlBad4q78xU/kqr8lJdGbsvDu/6dSAmslRs2pIqJWQv2+aSYlVz83B8q4CmAXueCd++MAqJdHiL7BsDOW7bbHVhb1bMkQgY7KDZM7V/OchUitKq1I+j5apexA==;
	31:brXjLVog/xoWQTBgA8hTSEwJWZj6EAbNg11AnqvWejjcVckubBLamSiiKYtxNNW0eRUS4OiMb1b18QTPPeDXa2OaMPdSISGDt8fCvt2RRu0XnM7ax2M5HxcR19hUbLDhs3BBN9jIDuMZUAGC6i0ejr6/H47GA6IoozCO6LaB2B8/tTifOuxUe+EhaCNaGmjUA7YYvqWuq22ImEhT5vNgTeK10x6J9V6u72CZ/Z+Ceag=
X-MS-TrafficTypeDiagnostic: SN6PR0102MB3424:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3424;
	20:uScN5a5/ObHpJmsZxTKjcdTSygqBOXJ1uGOC9l4CD+6NWuzlNO3bo3ETItRI+njl5pspTjsC13LlBwZ7nm/JVtldNOAbMXBVuJh4Pr2N1CRJWdoHhC6qvsWyhTwUIBkLa5ymzeZqXsxCa0XClxdLAsEuc3km/s79AzHm9nBoqn4XT5iAChY6bIV+DFVMbbXIPcO1Weg0XDqDcQtkNLEhVNe39v6LfjmqJCm8talr2CYLIdllmgSeXm6AN9UdOyiBisIPqIapwwt4Z+IKuxT/FL7gE99quLFTunjEe/3um4jG8YhYX+mPcNpQHW03iW0D4i1xf7pKWDixKbM8ZILAo/NCXVfINonQzL5F9YuBuDRHWpdlwe75WMsCpNulWrWLaW2wMCW8pDQxA5hyGwE1LLrp9IHzJyeGweaZooNFDUGoqQentNpBJ+2w9xQ2vKkKZBhhjHzNlE30PCzZOJRn4GBVIlmsup+Dr3m4IKvKMMpg9Rtg/TefgIzAfjWT++ZR;
	4:cCvZISxA4jNcQgqXWDUhxmmTNyZ/Igj95Y4A2oDhw8CGrBZXPfxeSPjMfE5amvU9yd8tRpJkYGMAEt7uJpgDwTnkwHXYpSan9R+V0++hmBcfn3GhohN9Uy+UKSdxh5HwNhfrR7HZ1+NNhDsSXTNJrkeP3+4lK6M5MmVTxDQTmRFOBj+29bAyzpezZQIua15vZP+8ojktU9rMZm5xmEn+pe5+8E73Zo4cNFo8tI7uw+TqzEwOZj03xgpACC8aB35piZ9lFsCuA30ZzwrzUB7nnw==
X-Microsoft-Antispam-PRVS: <SN6PR0102MB34248577E73882523F222F45AB9A0@SN6PR0102MB3424.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231254)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:SN6PR0102MB3424; BCL:0; PCL:0; RULEID:;
	SRVR:SN6PR0102MB3424; 
X-Forefront-PRVS: 0666E15D35
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39380400002)(366004)(346002)(396003)(39840400004)(376002)(199004)(189003)(2906002)(53936002)(47776003)(50466002)(2361001)(7696005)(51416003)(6486002)(52116002)(105586002)(2351001)(107886003)(5660300001)(106356001)(36756003)(305945005)(4326008)(6666003)(6916009)(97736004)(39060400002)(48376002)(316002)(486006)(54906003)(16586007)(956004)(2616005)(476003)(1076002)(59450400001)(3846002)(81166006)(1857600001)(6116002)(186003)(8936002)(26005)(86362001)(66066001)(575784001)(68736007)(8676002)(7736002)(386003)(81156014)(478600001)(16526019)(50226002)(25786009)(6306002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR0102MB3424;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR0102MB3424;
	23:K0oLfk3SHqVqqc5D42s9IuhWh28qlFotdFKbgru?=
	=?us-ascii?Q?L50KsrhfU7z0WugTsdr5WAbE25me49+8AYhI+7uMhGyqizUgUEzDUYMAHLLs?=
	=?us-ascii?Q?bNsr0bKxzFRTHw6BJdWCk2BO5QHgG8V1C4KzAhGrbBqRFrmrrdnv9yhVpQlK?=
	=?us-ascii?Q?Wy5QklC/MOh/BR90rw6WS46lvh0ZrFAJpsrl9lL1vaNOMeDcgn8bv/ptvLAp?=
	=?us-ascii?Q?kBQJpn81vHwHUpskq0kmyKfa6qjeSiw2l4sApSEMSh2xP07/rLmAuO4kxzRm?=
	=?us-ascii?Q?Sp1t/dGgnX4B7kefqmtvJ0f0N6B0JGL9XYlJTQrhSYhzlVJlFP2mG3cEAXHH?=
	=?us-ascii?Q?3CpuvnqyhQsv/TApWerlPCJ6Jm5ViBc0tH+tSqSS4Iav7YZh+VM+s4wRERd2?=
	=?us-ascii?Q?GTRX9EqBDDMo3gTwRWZ0B2KzEm3hwkwzWiebaFwTnqVNHANLON3uBPPfPCX8?=
	=?us-ascii?Q?Rl+6x1IsYBJdEDgRNRA80Tyf4DQ6+szPNl6yFkFnCakOTZh8Vf5MmAGCxpo7?=
	=?us-ascii?Q?cJpbsKU/8WSXtuwh1iKCUiOnJxb3mJMteLRaZpRdwIMTSwPTHL6fHIGNBmoQ?=
	=?us-ascii?Q?c8oSOWrQWPEb1IS+0lkvm8xJvRfp1izmp6BCXcTU0Mb56w0mjIIi6qTRzbbS?=
	=?us-ascii?Q?iAeC6gNwk4BLtK9Ii81GX04BT9goQXJxAsFBTBxgZxzN83iWQt1vvbCHGo9q?=
	=?us-ascii?Q?lu3jTl4qniwaiqNHL7lgZ7mWylkOMyWTXcy/Tr96QRtFm02VV55ochqFEdWY?=
	=?us-ascii?Q?64oHZozjK1CRl40X1eLnzkAr+gfseRdLpXidlNpbbqxWtNIutElZnmN0aw54?=
	=?us-ascii?Q?aQEttQHaLe9aEx6s8Z0Z0vDitEZBuN6o7mlm6UppDci3CXiBZbYgH768VHOy?=
	=?us-ascii?Q?cXJhbO07sJch97Y/mg+thwbAa9gEEw5g/pZCTW0SpYHOKqRN8feXHAStMraw?=
	=?us-ascii?Q?CpGrwau4DpwclF4ITosouR7KC3CcgbNgxCAYH8KhruvHDudV89cRKOnGDlrR?=
	=?us-ascii?Q?aFqRoKNed3mmFIeAFZj3VMZc7c0r8TQ6PH1tWoaz5QeP+69ms/qOYHGbPjHt?=
	=?us-ascii?Q?yoKjs9rE9r3V0KMHu6fgVZM6FF8+PxAOiDJ35OkDCkuvDTka5SHlUEZwdE3Y?=
	=?us-ascii?Q?NAiGvNb3sqcau5h/pP+l1qdjeZ2YPjBOEHrRB+FcG9G3PtUDcz0DkTLeKAnC?=
	=?us-ascii?Q?YfdF4d93MsDGG3mTiSNtjcMTNFQZ5gNsWxPzbxmdRmxMgOw/Q4s3iDePIAJa?=
	=?us-ascii?Q?GxZPhfFqNUT0lv+IKL6wLDM31Ny8PEvqk4liCtTEWUd7AK17Z3Qd8n6qvBqz?=
	=?us-ascii?Q?UgnggR0rWKsuT0IRPNANS5Pk=3D?=
X-Microsoft-Antispam-Message-Info: dJ5UdKt2loq+nCLBmW9/KfDBfNUf4BvxQKfGzC4XYYLc6vmYBwmlrsHZ6qBs7rkqbu71qRzY0rpdgXAG5o2uF8AcIAZqEDLPyEk1Z0g8oSLB3TE4PpabS7Gy62Txc0mKlXhkXBo23n9rRwg3yn6iN/EkhpsSBr0Gyn2dwTWWUSS1Vk+XKRTU1FrTIvJHYydg
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3424;
	6:y/Y30wugRgrhyUZbB75szB0pxvFOBnJk9jqAG7pMOw5cvRe8TVxynnpmxSF36deR9LKsm2PV7sGWctuf7jnOfi42EYELClsX0ds37U6pRiP8uco1DOdxlQDQoMvxK/e+WgjTNJXG6Fj+XBxpSnF2GQgtPbMLttFEfMVXjSaP8jh1vMljrrBm/uvO8q5OAGH43QW6lQBSWVu87TKDoDYkhFA3PBKlI9fcciSbHoFTjDvVGhndm1h49dvveIH7pnp5T/9mIWEPYr19uslEjm7tJtDnNNZL71Cjje06qAUjSCELBgV57FnenSZKju20CWTnDroUcaL2/MN4PlgSkPDDFg9dJ7Vq7rqh81Fhr21VLtakZvCFKC4EtpMthvD0EGvk5aSvb+CyykR55s6MBrgqoNkmW7y4S+IyuLsCohTeK3xYOBNjjJDEIWrd6ARYr+a7VJ6tGmeoE27Gfoz4/ltSCA==;
	5:0q2LwdJ1d2Ev1piv99ZswMpMVjeX64gz/F9T5qBs1QJu557IVyZiebARnkM8B9U5iQ49BEpEHXhjX9Xb6vRPtPawVAj70Dfq0pF9vlrfgNwtMHXGFfAXf6SpxH6AyAFtVnwPAArdsestcVU28fAPG/O/QeZonMyhRccWEvaevGY=;
	24:R1wyUwMoDb+oVLN6cEjfXjURkHK3p8hT/FwUNzICOx/xQfuEJUR9o9TqhQWgZIKJvW86X88mCorTlHY3YWwatfOAr9amUiYUBdKl+ernHng=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3424;
	7:rLC2grLj1upqBjVFxyBH0CncpB5yLrDtOu19LY5XTGw9T2i0tn+uBuUg5fPk/+7o9m7l0g4NsULE/pEE/OwfRQ07JqpnXa57rwuF8XkPSmYisqdnMRycb6cp+o8VlD+G3agf1hjOnYeh0UJv0r2h/v17ms5KpYyofb5KijwQaJ0sXuVlhxOGJjBzU94jt3DVDniXQ3bozBly5SjXIzg5kwc1sbq35dCH4LPuZ4j4j4LWfXp732yMCnB7V+KJFgLC
X-MS-Office365-Filtering-Correlation-Id: 0b19d087-3f59-48c2-71c4-08d5b51a5bcf
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2018 19:31:55.2985 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b19d087-3f59-48c2-71c4-08d5b51a5bcf
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR0102MB3424
Subject: [meta-oe][PATCH 1/3] libmbim: upgrade to 1.16
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
X-List-Received-Date: Tue, 08 May 2018 21:04:57 -0000
Content-Type: text/plain

This is needed for the next version of modemmanager.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
A similar patch was also sent by Khem Raj; that patch is just as good, but I
wanted to send this in the same series because the modemmanager upgrade requires
a libmbim upgrade.

 .../libmbim/{libmbim_1.14.0.bb => libmbim_1.16.0.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.14.0.bb => libmbim_1.16.0.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.16.0.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.16.0.bb
index f89ef9d57..5260c0f14 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.16.0.bb
@@ -14,5 +14,5 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            file://clang.patch \
 "
-SRC_URI[md5sum] = "2ed809e65c85353d3ab59e372890e549"
-SRC_URI[sha256sum] = "ca8d52a95a18cbabae8f15f83f1572316e888b6504f946e6645d24405127ab5b"
+SRC_URI[md5sum] = "76ea4d8381989919b1d9b91c818fed80"
+SRC_URI[sha256sum] = "c8ca50beeddd4b43309df5b698917268303bf176cea58fe4fe53d5bf0e93fac2"
-- 
2.11.0


