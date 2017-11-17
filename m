Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0083.outbound.protection.outlook.com [104.47.41.83])
	by mail.openembedded.org (Postfix) with ESMTP id 8428E7866D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 01:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ZgvDQJHOM9YP7o48fivqOLlStnfvucW9/igXRDAPv1U=;
	b=QUcOe57EhVcZMpkolwYWhEiwc4WNYNtARLbvXrKsqt/8/wMJg+ooMYfW5bp55muhigl2xh5hOpzEKI4/71G5Y1UBNa+od9PnT/JPpnTyw7K3SSv2KlhujZFeTkFaflPsGC3zHZqVw5gGCtdrahxEfbGvgo13Gki5yj4eUn3pl/E=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Fri, 17 Nov 2017 01:10:24 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Nov 2017 17:10:12 -0800
Message-Id: <20171117011012.359-2-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171117011012.359-1-mkelly@xevo.com>
References: <20171117011012.359-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR12CA0059.namprd12.prod.outlook.com (10.175.47.149) To
	CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4387ba8e-b282-497f-cb58-08d52d57fb35
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:CY4PR0101MB2933; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	3:aBkChJu8LruAL4q6u9cBoX818CVjX7spIygcjNZrNjPIZSszGjWkqYL3JftkWy/ua+LZsw8PuJR023LPrVjDefxuqFq25hEkZoeVHMcESf/YGdD6znZvJp2koluON6JwE4P878AzVNZWqfeA7RAWOxSsQrJ+QYb236sAXvmG8W/QjZj8nXDKaJ2apvRaZw6os2h6Q6WJUqLa/NULA4RoE8ws8lA0YP7VLHSehAbE+MbAsmZOXtBduEbFs2rWkCzw;
	25:jasCXv/xln34AhaQEed5UauT5XqdH+t/oWQZ8VHlA31Ab57J8FzeXRrwFT6FO9uqGhjM6lt1/CkPcgNcjfSULRKFVK9+83knNwGa1slaG4Ljt5/eXfBxVGhog1QKe4TVLnj24nSPYBLvCMSKx2oL4FI/wyEo7ZLOMZKWhLfqd6Y6STCoP0MPrMPt8NUYw54Wo1aPmVdcK3X1fyBHDKJdGOW9bURTmzHG+JiPzLs+08+XpkxJMx0KWl5gkFDpiEfdgr4LyT9c+6jaddVtsdwuoiC/IZASm3q5ecH1vxhL1xnzMxxpf4iLPZBQzSan/s1ZB9Z0d6IVuXql3LY1CALH9g==;
	31:zQHYmNK9eq65dtx06ZaCXJXYxs+80q4TVsFcDGiWZqZm5mkALo3xsNE2IWdsMDX8NFAFLQ4IDrQsSmL3cbjCHCWGBiz/h4etcFaIzzmgfKEAOB66lX4c2e4hMxxeSaCxTisf3dNFMeyrQd9CzP9zrGE4gP2KL+c39V8x7tZ4ZniEyU48KvZV16pynpYil1vul4shm/BSZmiukPVjFo5Tq0UTkEKjSniXUOr+gxN3y14=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2933:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	20:/ytK8D1+cYZqcFi9cHE26ewAS4YyiRH7jW0Bq0CmtvHArNvCkZwinBpbTxpu6xDp5WiiIp9h9omDDtJ3btf+FVaBtKdpE4vtj37/SsimBuB4nq73lYMh6BgP7Ai328XUOOAAkB9LsdtoEjzJBHDGYGQYCSqaRt1iBNppCTh2+j2ofdAf50nQc49WfzFAh/jAF1L3L+Td73Hxw/HTp6Kn0bVa8pSTgrYhXBXec5QUo/aZgViwZnGQRqPUHh+ZKBN/zHBwXLivt6CCvuenGYw4mAwgzeF/ZNCW75OeAyS2wDDDP8x3054GEaze92PKlZmvqOpCaldDbE+azl+viyszaWQb30FHDVl/GHufFm+0nbz0VVcQN4LsIQSq78rWQv99BxkPzkl9wgPbYlZIbuETBmKaeQEDQKZCxaNnWr4TY/E=;
	4:LjJULXWQYapZTQAgmpKvwSCcIVTA88f44l9ddpBKGxQdT0ddKRWoqVcAajhMJ0QqB9Pt+0Thksso8QEi07Nbj1r2lp5O+Rb6acOA7gyPtJVmv+uOnela5c4pvU3gjvW6jDU1loHQFtw8NpzzDpOBYe6A9CVA9FhYZsV8K7nVV5rXyLQBTVRqxXUIar/mtAOFRFvQGi0E+dXzO3IQ+/NbR4AAc0Q47j16pYijrZBQAP4xp3LyfupEW5OEAOCWZJqmuzE6MKEY2vOoTgboRPzQEA==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB2933F173C3B161AB047E5CC4AB2F0@CY4PR0101MB2933.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(100000703101)(100105400095)(3002001)(3231022)(6041248)(20161123564025)(20161123555025)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2933; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2933; 
X-Forefront-PRVS: 049486C505
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(39830400002)(376002)(189002)(199003)(2950100002)(76176999)(66066001)(47776003)(36756003)(305945005)(1076002)(3846002)(25786009)(6116002)(7736002)(50466002)(50986999)(107886003)(16586007)(50226002)(68736007)(5660300001)(2906002)(316002)(2361001)(54906003)(8676002)(101416001)(33646002)(6486002)(97736004)(106356001)(6916009)(86362001)(2351001)(81166006)(39060400002)(189998001)(8936002)(5003940100001)(81156014)(16526018)(478600001)(4326008)(6666003)(53936002)(105586002)(48376002)(133343001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2933;
	H:columbia.corp.xevo.com; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2933;
	23:a2TMzE0nRCgPSEgqizdF40JRn0qdh9FPXI7fGge?=
	=?us-ascii?Q?DQrMfw89Lpgx2/ql7lDRq2TRYLQlW3utImNpJ27TWFfYowUrdf/zMoYOJqaJ?=
	=?us-ascii?Q?SNb0cYn6r8XgipG53AdoDWrdnOMmWtR/S3FzZCJ7e0aoqJ79XxnF7dHvVaHA?=
	=?us-ascii?Q?0pMQnQKMq5j9LyLHnmVaqto1WhYHPndi0IwDvRMyvs1rICdwX1yAtyuzhyTf?=
	=?us-ascii?Q?4ZchVx+YHbM9SW8Sjtl19VK8sw+Ueq6LV1wA/VZDUQjD8Jcg8C+SLc5nlme6?=
	=?us-ascii?Q?YOalJw9UJI91RWo/TCs5QZw5QiQ/Bbqn5By3n3l0W+BtNuLFyc1UbLWxyNH7?=
	=?us-ascii?Q?tf/DrY0l1HrkEv2IcVQq7XZwTbjyhRKxZmoix+LVOZHDC/dLobGFN1+nyyvH?=
	=?us-ascii?Q?8VvLrf0ry0Lutclgdsu2pKg8SmIgRHF27ZizbH03b7JWQaNHtUBqOGQNay0d?=
	=?us-ascii?Q?J9HOUK4QS1F4u+Nv5CV+X/wgNgX6FYIUTtaqAQPLDRBZfw1TphsDinwYPEfM?=
	=?us-ascii?Q?t14/wRl4/JNHlRIbwEYr9yXChevHF7z8J96l2RfGVSSX4umIA6Tr6NnxSwWr?=
	=?us-ascii?Q?Zl1Xb6q2/1PEGdyt5WK9IQ5ZFdGbop9Y/9bcXBAyHUA/Dzmrkm37qvSzpfUA?=
	=?us-ascii?Q?0lMX4mUkq+jQtlDN4BsqV4jP/CUdQkVb3rkeoqJkRwMG7frn4PSdJjLHycHH?=
	=?us-ascii?Q?JT5B6Q5uhQ5HokGmnAutdVfEbtCRsd0N0WWRbWb6EYeyh9aRtkSlsi6vrhBV?=
	=?us-ascii?Q?d642W+yXwbAisu/IT/wLnXFi81QmFxhg3t6d0/lJHDHTlPlDb2LO0Yv4NCV3?=
	=?us-ascii?Q?JFQsSNiVFzUSUQcliyEQmJY8PZhnNGUd66jBmuDGPmaQij3SErafGMtuC2eU?=
	=?us-ascii?Q?T6dg4k+C+aUS0fkcSFxb1o6G29efD9bbWHBQFsf463NKMFVz4f/dJ9AycBV1?=
	=?us-ascii?Q?KKb605dKbDp+i3j8cQCacWxAP/XG1J0YXvt6orXfWX7tXMUjoXRldXdMSAME?=
	=?us-ascii?Q?QDtMvkltJBVQtQkHBP70Cu2KrfcLjCzD0JiEwr+MHywlebHysi96IeKWe8Fp?=
	=?us-ascii?Q?yoeNDp9H7lPiDqfDVRQKExzV+ryGQvowJ7VVv+oGtvlj40RxPpzbou8weZMU?=
	=?us-ascii?Q?ozJJYHGmE0E1+R3W3btjdOhUmJfiszf2GBfHzw/Ne2i/4b4LvOfaWQy0A9mO?=
	=?us-ascii?Q?XzCFcQiBIWQvr9hkD0mMjZHrFdYVXAFevgM5M?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	6:YvgSh8Gdokv8MBW7eObZUktb8t29hhPujt1W/GCuwNqrtjGZArzF3GzcP1EiGbbCnLqJ+oit5WwgUz+jlGbXNQZnAloz+VFXHMPOVt+X9W7UHZW8b9me4/08ihpgGhGJ9eMd64zGFVUruYQ1awaO6769dNNuVs30hamIQAeH8x56JCGj8MIjx6SU4ptQ2bUkZmcSSpVN4o3fwVvLedaN+5N1Af6yhV1UTkpqrkfe1oknNNEs+FYrLd6/24e+1/gtodJkdmJH/P2NPAGWGGXZto3H/pJKOAlPv9eNZt8joImKojzA6F8cC6j7X52e8HlgeiDbXpS8g8MHylNxg5EdWSOUVJAtVMoOlsJ2GyKrCtE=;
	5:kJ+jk3Un1ZWhGSj24nZwKCGGFWu/GBHGxQ7xLFE6dYSm5x3thJ9S9gxTL7Q3XOkj2kLeqNhj/6I4Z9utR0ulpgoMVJyFJmL7V7hsCEV8zLOkgcRQ+Anx0Zl224r2wm75Lg2XUqS+09Dw4FPCmJYnQPOldj+MtQKX0XaPEEieJyo=;
	24:AgNMyLmbmTJPJv/IdVRjXJTnNNTvFqFA0jtTdm2lKDK43U4UzygrLXDFTF2Wr5/BLJvXYEudxo5yvj5t34bHt0jR49TugKy8sqwLmB7Ylj0=;
	7:BEnsjir5+GkcxXnwIEErEafRhTDfYngdAynl/Ftd0sV/S8xwfVWZbznNHp5coCpFvFK6R/uiK2FkZnAkLazIiG6EoEuQZnUpUKpbhX0COQ4eNMKMejI75mTTDSJ6TQ1gYAmzsZnvLyBHgyaong+KVFzh04fq9UBN1/kmQteoTwORywZ4A1mdh4Vjy+TOs8qA20sPiE0Ij0fV9GSQmDgBteVvk/1a4j1wSX9dK/1NOUE+Wr2JTyhLDXAui7TVyBO6
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2017 01:10:24.1554 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4387ba8e-b282-497f-cb58-08d52d57fb35
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2933
Subject: [meta-oe][PATCH v2 2/2] gpsd: add gpsdctl@.service for USB autoplug
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
X-List-Received-Date: Fri, 17 Nov 2017 01:10:23 -0000
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
index 47db41f22..6d84ab9dc 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
@@ -80,6 +80,7 @@ do_install_append() {
     #support for systemd
     install -d ${D}${systemd_unitdir}/system/
     install -m 0644 ${S}/systemd/${BPN}.service ${D}${systemd_unitdir}/system/${BPN}.service
+    install -m 0644 ${S}/systemd/${BPN}ctl@.service ${D}${systemd_unitdir}/system/${BPN}ctl@.service
     install -m 0644 ${S}/systemd/${BPN}.socket ${D}${systemd_unitdir}/system/${BPN}.socket
 }
 
@@ -128,7 +129,7 @@ RDEPENDS_python-pygps = " \
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${PN}.socket"
+SYSTEMD_SERVICE_${PN} = "${BPN}.socket ${BPN}ctl@.service"
 
 
 ALTERNATIVE_${PN} = "gpsd-defaults"
-- 
2.11.0


