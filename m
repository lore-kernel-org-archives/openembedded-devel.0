Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0085.outbound.protection.outlook.com [104.47.41.85])
	by mail.openembedded.org (Postfix) with ESMTP id CACBF786A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 21:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=8iXfDrNcEWhzVjRxVyTWgTdBHqUoFBYHw5UXq/4MA9M=;
	b=CiyEkd/zf3Z2MdTNE2ql4UYL2T10KLdzvSQlrA7JDuh/kNsQWw/KaO7AQ792dnaTGPFQ4OyXvKA4QqhuJjGY7cdL4UXib9IwfuM9lfzET/Ee7ZdpSR+45QNCf93POH0LvobXCpeJKWL/yov93uD0sZXQ3S87ZKzJ5xs3lm3S7OI=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from willamette.Home (71.35.172.156) by
	BN6PR0101MB2929.prod.exchangelabs.com (10.174.87.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Wed, 15 Nov 2017 21:21:48 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Nov 2017 13:21:36 -0800
Message-Id: <20171115212136.16472-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [71.35.172.156]
X-ClientProxiedBy: MWHPR1201CA0004.namprd12.prod.outlook.com (10.174.253.14)
	To BN6PR0101MB2929.prod.exchangelabs.com (10.174.87.138)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f2b000b-f405-4ba8-b063-08d52c6ee214
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:BN6PR0101MB2929; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2929;
	3:K4Q+84rZN1hs7V21w5g6bN4AujmcudCTUF2RMsEctGS9CBTdAF1U+miXEsyBuM+1Ovf+ActfuNeui2+/tHUWaig+MaQoe8O8XrG+wHD/UV5yZhUeLMfDszXVFeTGFdfxXEqms8wEPPW2xIXYIkTLhEG8Cemf+MxH9B6PLBhX5YR/YFAP1ncx5XlrzwkTEXUTKW7Tn92k4V6L6KlU4Ii2ZvT65LHOth9XyFkLrt9jS2YO2pBlMwmUhaX1y6s7q5SR;
	25:6G5eWaoLtkO1BvR3BirtHouBS/SqPank9BRql8gQWawkffX5VG4bxe966nEwsuw02146guUvhOobCpR/Y2G0g93rLMgvER76nA0Io7478kI/9gwfm5RkyKIYHh5ugTLpG8f1DAm0mS5XuSahfQlPlzW8bnKJ/ctPAkUKBhcpM70cRg+V2bXTIygKYtey04bC+tsQZOYNXR2ya7lY/bv0fQtEZPkAlTbjLwJZ1A3o9s3MjhSf0eAr0OnEBY3wAlYWZaldDW322L9KxwbI6ANTfHdWugWsKRdD7p3ga7QK0T3G9qhO1m6vZ6FRg7nCBYVpoJqq/WlxRpcDJECuUA45Kw==;
	31:VBMVR2O1YWcc2rxYgtTIARcRPiZrfEeSHUaEtl0DK9XTXLPD62dz/hZ15ZzvQ9grkfap10KiZJtyX+0stzJKjBhA9j0UM78PjOFNdQf4HbdENpIVf3P2KTvEVBOZnOHyRGhjFHrM3Z1Pk9Jhtf4814+nsOho/IxNArc2wiZuI2sgE/tsLtCePRdqfI5hVcHyRklj0QzQhpXzOjzJg85fLw4iMIB96bAZ6tOw0Avl8dY=
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2929:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2929;
	20:qT/Q8Z/suVZ+l3P89XkK7XM/E/LRyDlzkFYlCigwexU5ZcqgO4FCHqnj+/O9f2Olgp95sHJc0J9zjxJUmMsQhRz/mxxNS0MwJe+/rBO+61OdVepyLHE37T0o5blth7sLuli4p8JFK3KlmoBdIM74jIjDYzGCF80gFq13c/d1oS3B5OCEkknjGw4fUBTHADfvv+B9HmYlvRo0u9P9Xt6nSz1JmIVbEBcT2VMJ6Bo6hQCps9upeFyPUw/V+Nk2QguEaVDh0tYwujRO2Zk3oIJXBnpePHB2epNBnFgM1yZjG4U9hw0jWTeG2Re2vpPOQNMi2va5hRVsdA+A4+w3iJEAGTB71BJRCLN/TgDs25emd/TiAGjxQEP8vsXbP7+dbOTgzfqW9JfNiDcKfpVxCXflsk9w/XaIMxi3eJ+J7v/F0rk=;
	4:AgtZtwIqnOjed/0z3QjZZeDVANf6VIZNp0TyVFcQKcT3KGPgodsT5dryt4IpWpZOK8iIky08U55x87Lw7dlzYWaPsKcTBR7h5p1Bb9EK5FZ/SfEbGa3I3rujy6Fh4ALmPdEMq5kfKrQW4i3vDSKMFitmpzRQehd2dYBWLoo5BmNWxpT+O1cnTbXq7cqVjiquy8g9cWoiUsUi0kR3F5IHr0q3yoPX2muojSw7apu9EgnL5R5eJQwZh+OcwMEt8VpTn49lbZj0IUjrm050cewBwg==
X-Microsoft-Antispam-PRVS: <BN6PR0101MB2929A20B98987CA8E544FC48AB290@BN6PR0101MB2929.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3231022)(100000703101)(100105400095)(3002001)(10201501046)(93006095)(93001095)(6041248)(20161123560025)(20161123564025)(20161123558100)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR0101MB2929; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR0101MB2929; 
X-Forefront-PRVS: 0492FD61DD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(39830400002)(376002)(346002)(199003)(189002)(6666003)(6486002)(305945005)(6916009)(3846002)(47776003)(6506006)(68736007)(50986999)(50226002)(101416001)(69596002)(86362001)(1076002)(21086003)(105586002)(36756003)(54906003)(189998001)(5003940100001)(6116002)(66066001)(478600001)(39060400002)(316002)(8936002)(81166006)(81156014)(97736004)(4326008)(53936002)(107886003)(6512007)(25786009)(106356001)(2906002)(5660300001)(33646002)(16526018)(16586007)(50466002)(2361001)(8676002)(7736002)(48376002)(2351001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2929;
	H:willamette.Home; FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR0101MB2929;
	23:yPKcyexAD5Tlg2tCEVgM/5ZryULtprL5f3Ck6bM?=
	=?us-ascii?Q?ksMrT3UGkmZU+8XRPjNvmQJxMxoq2rph9HNwG7GoK/WOCNCz3XrbMqPLj35X?=
	=?us-ascii?Q?azuxIRLjW4lpx0vs4gSwkYZQStfVXakrLAleE8ky1LDCpra1DwvqhQ4a98yW?=
	=?us-ascii?Q?xlbVHhknezzQLOPeKbu0aDvRoehLuW2UkBJzbopM7pK5IKW2YSj3hi1k32Td?=
	=?us-ascii?Q?MHsU75waPw+V4B8+8qbRWeFkmzZ/7IokzDgSs8Gzs9n+MZIRJeqU+UiJbdLD?=
	=?us-ascii?Q?twsWzl3zVDDo0CiTRawBWvfDa3IBBub7mKCXGRTLu/xumwDjTH3L7AliHXCj?=
	=?us-ascii?Q?AlH7sXgN/T+UuZBg7EKuoBP5H2UqZTrgET7YtJC0k4hmXNJTNi7AOW/QVUCw?=
	=?us-ascii?Q?lV19dF5EDFA2Z0J7FD6RUs20aSfoiggCloI9dpHj38qx5L46r7aunrkN+3lT?=
	=?us-ascii?Q?e1pr/87pxBH3yW9dlcl3Y8O0ofiqvRTpFjgue2UJ01tjJmIWHuaEdCKfpXaT?=
	=?us-ascii?Q?O/quFzb5Uwp0axA2QH3Y/eKiQ0DykGwIBdKzQUO8CB0380rxYxPd9/De2+a1?=
	=?us-ascii?Q?53wG+nKBCKlAJ4NuWaHH6AGgvh4Yf0h84xO+eEkg5MtOb0dKo1LJ5ABFcP97?=
	=?us-ascii?Q?e54yInQ/8oZ/O1GWwlCA3SU4+JfIoLCsdkGGbgPlgWPGJh+stvCW54Zf68ru?=
	=?us-ascii?Q?IW7OGbF99O4aThW67LwSunmjdMgIidoEujUuS1RQnb6rmNDxsFJGSAOIc2es?=
	=?us-ascii?Q?BZfflcBqyfTKH5PM0XfkuZmEyuoa123zgeRigXy2P/H3t3mPOdrm9Zbjz/Iy?=
	=?us-ascii?Q?4G+61jWHrS06aUtJBzJdjBnPVWinpaXNalG4RFW1IkQ41SuTVA3+IjLjT1YO?=
	=?us-ascii?Q?EymQVKsQH0mJ09yNKMfuxFpTq5pEGIP/eQWSx6AzCd9+phsJUKRRaJeEXSHN?=
	=?us-ascii?Q?bRh1DkEzAv0mVzg5Jn6JOhCou0CaPJ7av2YHE8+9DN1JI9YLpMDjJxPN41xH?=
	=?us-ascii?Q?BDtTmL2OK1OONQtYylnIMiadtDu/UeJ7mGm6dBLHttQy76aVKo9dtoAcZ875?=
	=?us-ascii?Q?rU9Dr4w9KSxSzf4G+IApHNSC6F/axMFbu2o6qSeTptfYGmLuMAGF8CDLEGqQ?=
	=?us-ascii?Q?OKyUZvlHaJHYaFxhU4LkUS0oGsThxv2qXqJeukNIpQtmRki+cKDUQatufzhn?=
	=?us-ascii?Q?sJ1duAANE0OhudScsQ22XN0RyswT+AnRjVB0n?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2929;
	6:B4Ecc1nZY16sTOiEH/mZHaePpiPOxeQP2EMBJRQy6Y0QbyMQ2IsGsbx+TPQlUyaGqSGiQ9Y2pLDOScXVhqd2ah6GlTbgBX+RTdl6e5Jd+DWzuUALDWCHSFMIm7l8DdA0N+sc0s5FU1G4Q005tmdgRvsouZkO+2zhpoKL7DJjJ4vAw1s7EJb6A/9aW04lBgyyU9gQCxum1sWh3C+Zr47WnhNaBi2vggYHeGXgSKTEClqYWfPQ/UrK4Oty0xRqpdyCvU8apC8Lnf42ZixcZP+J5zC9G8HhOuUNhZdQju+G8U7vrSx3jJIoR8DIY8a5DU0dHDbku4Oq5fIGwG6Sek8+b4Hhn/ujDIGddyqOaE8esd4=;
	5:GLdSYzTl3omZRruB1c/nkSdneQAS2f5FcO9802r6b2hYaBR9l77v13lx22zSLDlZ9sWHaVte8ToxC2Dq8fHvQITCC8MsJe7TuKzgCW9uOsDjvYR6oSBQqfbTwV8zYuSraEu/no9FSXS2t+1wZK5w5krqlmpwmo0W59tZWbGn6xg=;
	24:il0OyZ+B99lb+8bDh9aGmwA2DaW+brjcmiCAOpffrIHZx8BldGvyqUpwYiDOIhm4nsE/2HGjEaBmuwnXPeMObLn5OfUtdlfBbtN6IsQRx9c=;
	7:tLVhOiIM7s7rG/06cGk/1Fb0fpdGMALcjCp8Jlv0u2sXpH2gBWD0Nt3pLeami/+rSGBmjRvYpKQSDXxuG1w4n4MPd9aW0ar99dwkoawdEzxq5+pd5SU3DpRqJOEHpiY4mpdDt+7FTdnZ+bxS/9fXPUWlLAQfHtpGWs6eM0SuM7YAoSlMgWqVh/FSCrNar74J4k88hBo79TzL57xJx8Po3vXrB1ogsiQhzHRyuNLnppj/g0JdYuElDJCzI+VzX+Ds
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2017 21:21:48.9651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2b000b-f405-4ba8-b063-08d52c6ee214
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2929
Subject: [meta-oe][PATCH] gpsd: fix /etc/default/gpsd ALTERNATIVES logic
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
X-List-Received-Date: Wed, 15 Nov 2017 21:21:50 -0000
Content-Type: text/plain

The ALTERNATIVES logic for the /etc/default/gpsd file is broken,
specifying ALTERNATIVE_LINK without brackets. In addition, it refers to
ALTERNATIVE_PATH, which update-alternatives.bbclass doesn't use.

With this patch, /etc/default/gpsd correctly gets a default link
pointing to /etc/default/gpsd.default. Currently, no such link gets
created, and gpsd starts off disabled by default since it's missing this
config file.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
index f8e6a2b13..47fed2d97 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
@@ -129,6 +129,5 @@ SYSTEMD_SERVICE_${PN} = "${PN}.socket"
 
 
 ALTERNATIVE_${PN} = "gpsd-defaults"
-ALTERNATIVE_PATH = "${sysconfdir}/default/gpsd.default"
-ALTERNATIVE_LINK = "${sysconfdir}/default/gpsd"
-ALTERNATIVE_TARGET = "${sysconfdir}/default/gpsd.default"
+ALTERNATIVE_LINK_NAME[gpsd-defaults] = "${sysconfdir}/default/gpsd"
+ALTERNATIVE_TARGET[gpsd-defaults] = "${sysconfdir}/default/gpsd.default"
-- 
2.11.0


