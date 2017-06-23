Return-Path: <mkelly@xevo.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0075.outbound.protection.outlook.com
	[104.47.37.75])
	by mail.openembedded.org (Postfix) with ESMTP id C6C6878217
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 22:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=jQT7Ujwt8KHSrHzkJQH4EuVpnAIXR8zZXncMBbOz4CM=;
	b=vh0N/NMtjgbfPcd/FBQbR8vfrgdT1cGweFmuxHEfZfTk6xuAKWMtWL2Br7DW6Kj9JUlJ5PWXcRvfd2j8nQeIqbeszORLnqBUnFULSYOJSVgTjxCcPRW0xOIg9NQz+QrMPbTxXQCXx6/6Kh7Ordj9JTSL/SuenDJVW9TQcPXM2NY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:49:07 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:48:46 -0700
Message-Id: <c119c4c41e51373300a30cac13c88bbac2ba2f76.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a3d6256-4ffb-48fa-2121-08d4ba8a0e8f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:ROTL7A3lg4JcZfK6vaHeez+KzxU6agQADNHjQdjmP/YeVkNCQs5+TwXC2Bnonb6QMR2l87UALvJPEPveFHJFVFtNjFhOZ8Dz3N51ZatSNVCISop2N6Xqlh3W4qFGcR7t0ZFA0l2W5O1vVo7qXyunTIT/vNPv8A2i09t/6PlOicetnVVYGzDs+qU7MXBEJfQ2vH9T+Wd1l2XvdMv9NjQFnLGqbuS0aOZn/IT5TY42XpalcN/74LYSlwL3ah8M8f+iVI5h5ihOtuRBvtDwjyuRCSz8Nx9zIbyxR1K4undbt5ywfXp1AcJT+e7bF6TfhdKjljPcGeMmC6tXMAjVt8YIMx1IckeZKqK1oUiYgKXmXSFojXvPGoGki1Z2Y+vL8XYhLYugMR0hSeDgtGZY9wuSPPjqSuO0sS4ONQPuk5VZscyKeTceA+Aq595DTx7NcjXj8G7rnk72uvw1gw6eWecjLh5cf8CyyxTZHadYFpga/uLjZJj0fxdnaFZXskOuDYGdURKxS2vh4pMPv2hz1j49+EM5Ecj4uIYP6ekDsd0uP+K6OtbKsZatXeV0pQNsiRik6tiEahxCmuiDJIFQriWMDKeP5uISZIIvCntTbB9htl213Ecw5r6Zm3SyLzbPx6tfGbKto2EbyR+JVA86AP4Iv2GBnFCUSrRMUWsfMXhl1RX8P88gX6H22ifXKzZA7kdC1nEQGsU9Iz3hQYIgTChIY47KkUbCdIF/zzzo9sTS84A=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:j46BTDZ9uqkYROoNNZtqOMscQJRmEZGPhDfUHaxsiWwVzl+svmaH7FeSupSab7kaZQn8rhNFmwxNPQRuXKxZSaheIbNdPguJuRLoo3qR/rCOYwSIIMo2h0sviUdlSRUez4WAg5Y+dBQbOaTL7UXJail2ZjKXeODPWHFpTGXpcduSFZl42cAGSyRrandEMKva60lk/Xh4MwYl1DREYWOWhuYDLQcM19UKg2Gen9cO0xLCsTpGxmaELTZ48lPYW1NtwDUzq8JpdA9pHEdKHjVF+H73lp1G1FqBAYWocO5Ob59TbNKE016fPtFisv1FWq+vYHog6D6OLymetiCMRr2/dSX0EqO4UUYsEH2rBih4GomDDY9oZkGzWIpMA10O6q98SfN1vZ22cko6uBl379XTVmX19XMa0jMK8JzXddlY+Sj2trTCHPMUiTF74Bcu6i2TNrAm4O3g5EvfLSler7RvT3rPXCbL6VQLA7UNj5KAIoCuYezOZKga1kJHylm6UlWcxg3FAmBDsZeYxSidTmGgWLgNx+fXtqfEk8dFRFTOYomo9au4tP8zOC1H3As6kwDj9UMsgGPAkq6koCjx4VtpGi32fX8Pnjb7ksgKG4Mnq3PbCNYoUPp+C1/CyJBUly0WfHoaiGHp3IhKICSWHAnrItJe8uzvgU20bnBQ7QyGwZMPXddr6QBXk3a6JVlJqiS3IZe0tY6ecMk7r26N96aQRj3SdSBUsxNN7i/52sEqG9TiAOCwZCDr9AQW5zuiMjd4X4b5irw0frDPB1i3MDP9wtuePQ7DGQAodW3Fv9AOyn6PKE+KDm91m8pRhROxpDtBdqSbxtacmDzyKy718b/vQv33sHFVpPZ94l8lQVlGkLoG6qOeEgKHdSoyEpUZIu5tMKDFRw0Dr3UK5KHmC2iysDGIcaCGlZHd8DlqZDE2Bzw=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:RP7qRqBYRPnNaWs4nhALaOQgErh5guIKJ0yx8lVgaPTZhx8tPNtcN+OJFTuKWNujniaDYduwEFX67Y7QXdlEtQLIma5wThLhutE67/m4UChMywi40RYm3Geuu5uT06SGs+IPyA4eWI5xgYUT5S9rZlbd7MDHNQI4qeBhbhuKPhk6rfSX2UAp9pwmu8/e+XLKCgL+ZeQ5Deaos1KyJ9tMZQ+QImFtF1VzWId4FV6E2ZWmul4EkHKxtu03kSKqqum5/xTTRYNujwiV2E6c00Y9upWtPW7qL+eo0ASu9h6ciXHoOz7wRLeAvR2ZeLr/u/4Jv1c0HP7GSOrjdlQCLauVH7G7v6B/lNlOQzs2rD7uxwYgSSUByOVRs8CSu2kJjjyAf/U0nx3Z+Cwv9IM1kA9gDMJ3yk+03Q7yYAWqVBgUCMabcRh7ZqONdP5zIN1g1yp2Vbvc77i/KEW24f7tyJjD9ow/Is1m7Io4Cnmn5ychs9awn+dcOyIP1US4dgnhTByUiYQACAfU4stoTh3B9he87vqolWkHszODIoBoePc4xgcFuL3q9IbZhHeVep232SM7OgLKw84FNPDFU86rSM6sbsKAgnx4C+zgOwF0UPNeh8rnbD8yKKeJepxRHEqhkx431NH0VAcNRSyG2xmLK+hpnuT4ZI6U7b6eVhiz2yH7WLM=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:1XQ64sjO7HQnRj3F2t7sfxu94Xth7gbPrBE0CfUhl7Teb25RYRBKsYqnNwk71psuQSEzhIcS330SyoXtdwJEXl0/7ovF5jv9IIjex0XFaMeZc2HhPvtUyIqk9KZNSsrw1RmGCY8oC1ifoJSyEglc/LtN005D8PFWYqJG0ovzuhNBpSztbdkcv2P9bfEnITHkBzUAVEeK0FBoZkCVDcuQ/qpHPU0Nl/DWUK8EP1GimBSVRodC4SqVzcX0o4TN9I6+dal3dQtRmC9hRLNoE2BLZmzYCNUXJm0YP7EjVBonDcnBfNzeFgRmehb708GLzAW6LqN6syhVo5opSmUhYsU0rw==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB29355585FB10487494B7BFFEABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(236129657087228);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:O3UaGal5frNyGHILRFsr6RZ+jK6cZnRxeOXL7Dig?=
	=?us-ascii?Q?LN4u5eQeKx9OdBaEMDJlHDnf4sgmor8alT0J58vb/+l9P46DQb0++W43i795?=
	=?us-ascii?Q?dXaj9ck6xjYnbSXVdn374Sbu1rHdbeK1mbVjpvtShybPS+XfmnAmweEI6S8v?=
	=?us-ascii?Q?jdAnBAqO7M+l19XYQc3DOUzVeRdj3jukH2CCTpXfHAM3tmGRY6YzY8QxrgUV?=
	=?us-ascii?Q?8rf4wz9lP21ENwPj+OtPPNmKBsAgvdALnAYsrcJGL2o+yKFWgGClZJyi4pWC?=
	=?us-ascii?Q?2k90PwjMJAsHtBsyqU+u3HAA+X77KuRDMC9usqTmKdzJ83/ABLOIygCo03cO?=
	=?us-ascii?Q?KjocPYzulgeSPK3El2nllCe6E+50XsiESi0TJeQUHIx4cOjHm6tAt0r7Etbc?=
	=?us-ascii?Q?O1160GRycgJeYGnszrMQN47SQjOkDLNvv1kAdGcbQvvI9xHS5SVR4yue1r5D?=
	=?us-ascii?Q?bVlnHn3qdj10dspuM4C3y4+hQXBy5K2npihqk7TyYxW/0N884j99Y9+yOq+e?=
	=?us-ascii?Q?Sc8tWYKKJAf1rHsXVU8lXcV4I/oE18+uWFHFAdoVJvbPZ3A6/fiiYAdmcBrm?=
	=?us-ascii?Q?TTM09xrwKBnKi6JIPSgDZr1OtaGC0cJY8rNtAZ4BWHzQR2hsgnMZsEz/6Zsw?=
	=?us-ascii?Q?WcT9quuJqB6YYvmNoknfdeo6F0K3qTAj4HfPC2SgNZTXXdVsOXYTrrUh8WHv?=
	=?us-ascii?Q?JsvwdsPCr9owCDOIrtyfRcud8auU/Yk47a/uvEHZnAnZKCZIpqxRMRbfvsyM?=
	=?us-ascii?Q?v/Isp2TI7qJoMIvvWXOurLuz94QKqCAtDINcHGJHsuhX0y6fLgfbK08/abPX?=
	=?us-ascii?Q?NT+bw4c2fdeHSQ7vj+qeymvOB6uZ83QxzaZxLbB1sgI/XzqPq3C1V8KI0oar?=
	=?us-ascii?Q?1htbrBnVCAS84lUdHw5hSFVB9b7PxlliGTh1tRlCR2BHRbDBncAvRr9YSw04?=
	=?us-ascii?Q?SBUAUfR7y+x55qyp1XFoT22I7MKYaitvHsQYNzBpLxNQqMMNzd8CugxLP1z1?=
	=?us-ascii?Q?8DN0n4fI09ASCdkRMMg2H4I5oBRn7fiP7wx57CnM2B9h8xHDiQ+NyXzB3mRh?=
	=?us-ascii?Q?zTWKjki6nXnFdYRPVcZvz/0oNduvZJ8EipnTOdfZLMkREKIJpaHTcSPYiNUS?=
	=?us-ascii?Q?EbTTyr31bWpMLPhg1k/g+i5r43qci8EcFtooTzI+K68uIbG/DptbPj5ESztj?=
	=?us-ascii?Q?NMkepQhNy/dJIv4RNMLC9MAQNmhMtrF5m8dE?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(966005)(1720100001)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(575784001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(19625735003)(107886003)(6306002)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:4X+R36eREp2SyOuMfqMsXQp+I4euW7z/llQbxFp?=
	=?us-ascii?Q?MvDIP5KTI3+Z0I53eXunoMKRws3n7TJx80lFEZaaiiYtYOqTtgRjFgv1FQKj?=
	=?us-ascii?Q?f2M/P5iD+ue2RpJTDL7XzdQ6n0ZeWakO8z+iXVcOvwTLnctK00CKhF7j2Bnm?=
	=?us-ascii?Q?5htncLS5TA7zM3Ij8J9Uk7NPI4Zj2GGkaTXkkDQtFhqHK3Wh9mfiM3mVFC5H?=
	=?us-ascii?Q?HVbBlyjigs08iCZC2s9JvABtUkN90K3xazjSSShvPksIlBdbUq6lP1tSVC/f?=
	=?us-ascii?Q?ToW70WGMy+9I4XWIrnduAtImUoeeQ4eRw7XeK55SnhyMVHpQswz9ORN8zkz3?=
	=?us-ascii?Q?lvhnYX8YhOmz8qARyPaJJzywrdiG9gVvxm+ta+JbXE1Yss+3rqAlZuxrxnXw?=
	=?us-ascii?Q?jzFn4AZvH5zjQshrumCPhZ71RRUnnApEDtT2/wQN92bPLdmdOKwzxU1iLoVU?=
	=?us-ascii?Q?PMmk4U1tULj8eDzu/dMmtlVqg5HRU4IyyZ5ZXXI0bwfTCs3Xpr7WFJmns/DV?=
	=?us-ascii?Q?WC1GjGGIZVWoJnFOaycK5j/srIJIxTRHolXyZmPRZegmNszx9jJV6jjhJ7TH?=
	=?us-ascii?Q?ItwVV5fTMg422enjbKsKihCjL/ZE1xgnYljOUOQrFwIMOr5npsTsKt6esLDK?=
	=?us-ascii?Q?ncHYR29PYKFugP9BZcQchsC5C7SSWmbcYw4/w4kOONxiKOpMyp4pZiuoReh0?=
	=?us-ascii?Q?EjYr4tpr0eKgKQAsxTgAxnztSqWUxblFLvrcIUVo6vdz0QaCv8nluzKNDVGN?=
	=?us-ascii?Q?TGBgQkW4KJMyg2cMmJL4te9/RgBhOF22ZyT9NSsCGd7QPlsyKnQUXKN6E7fL?=
	=?us-ascii?Q?hpgfY+Fm6qtKHESMArihvvcDSgrn/VLuPmC/cBSRp/Kwg+8rkSUsdY6OSveF?=
	=?us-ascii?Q?x3ycEApFwZ9ps7cQi4vxdfYi7pF9DPJw4RMLgcRhkI3H7HnXn2DAnDhlJ7Kc?=
	=?us-ascii?Q?TWUqQwpnqgYcp/wLBiQTbeyNAIQUu596hlIbMToRHO0s1vSKuiCrRrhwLRYS?=
	=?us-ascii?Q?NSiwiAuSgtZe5B5e2hoSoCldffps6+nvhAw8NtxN3gV7rXhr0Yg9hUVyKWCi?=
	=?us-ascii?Q?zRbkkGYGYZrR4sqcfncqXqqPsVicbit58eITwJSoYM3dFY/Q65GsXRhJAt0V?=
	=?us-ascii?Q?oRQQX0LB7vHkzzMjVFku2PuRoVZL5nniscuJWJWeJUi2VychOAhzkv/5qBBR?=
	=?us-ascii?Q?n3tux3SDPEuAC0Y9CYxYFJfrQj1Asy6Drqk5i?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:vog58s821D4rOnMQyjDo6osAEEyLbjEV5qX4mCTm?=
	=?us-ascii?Q?1WGPEBnU1gDC1gzznkRDc5QuZPssqs7Bjas+e0wzGpkONodpC/3QLtNNQm7S?=
	=?us-ascii?Q?l0kIe3GRsunhIUwA6Omzu68nw05mIzBNrWSwhOcEVJYOxi1PqsCBt4dZcMNV?=
	=?us-ascii?Q?AEX2oI5zNT+asMeqRpg7RHUYJuWOCeBo0Tn/E7RFS0DHNErpo1xwc/TpWUqY?=
	=?us-ascii?Q?km8p72VGudAACtGMr74AMJm50ya86Rli0xGCE8hHu4iyrSWdiWEEUJRmDX0y?=
	=?us-ascii?Q?mjXPD7YokY9u71wPw5JQCrggeJIC0UIYZgMv55s0zPat4kmgdueV6hIIvR/P?=
	=?us-ascii?Q?bdXAGsFE0upu2Fz7S5dQn398vIKRvGrl68NHi7lWXbQ+g2qLoqeOJ4TP0Yli?=
	=?us-ascii?Q?wUqkUuxUjYVFSiJzD7BnmaEVqNlBgze3YVVc7+joIXrsoMgCysuWQFGF8GqX?=
	=?us-ascii?Q?AFDofWTWd8FrwPlfnlcwbQAuihg+kvMMYKwlziqqTXzfoX5ztxRt2JXVvd/M?=
	=?us-ascii?Q?SC2gtYf7iVFuX8F7yeOeKpQox55B8wnEf98SYixxzOpkKFMXqdal1GW/qoY2?=
	=?us-ascii?Q?R58emZesqWaj21nUcBweAe8TcvcT61F3OXFth7pEJqYAaBJTnasK3Ju1P+Mb?=
	=?us-ascii?Q?QNmdF1FKLu9bzcAqwv7gqI1SM4890LV75lpyleucK+Yx4crp//RTACPQlL5C?=
	=?us-ascii?Q?on78A7vNDdjAlUTUV3qGnaUymOKxTnDVcBvLLfNCLrZkawzQvOkOL6mkbPEo?=
	=?us-ascii?Q?PVS9Pe/XSW9IyozEnZkvipHpj5P8hTmrsakIVarTwcNaxPGbpxGLuo75uXlh?=
	=?us-ascii?Q?xF6CCn7otQWO/DfBkdw/8ozP8OjP+4hBn7yfPxbGD2lATsjqCHR2X/Vj/li5?=
	=?us-ascii?Q?s6Th7XsKXrHDh6B/GZzEYx4ZoutMb9uqjoc9d3VmQxoJoC4YsjUaldFJbbFV?=
	=?us-ascii?Q?V+xJytcFgHXQhsPq64IlMw8oSHqN2QzpvA3W7nu1102UJASq3wm1O6vTG37g?=
	=?us-ascii?Q?3+A=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:GCNrNB/8B7hwb9P1yU/h+t93Brz61u2SZa2OxrcGR6YuVrtBfYtQ0rT7xDiQSzxne0Jqj9SQI+OSlsMUSQPPCMhsdXC8kJqO84CaNyU4hKIjKUDiappsDl3qEOgOSU3OaI7j5fbgofRDXjRYFO+tzlTraOSxUpexUjp6ZfmDRJKWhFNfDrrSXC9ZVqvFKhg14ONajIYfLk95xiNcp5FJSbeME1GVfqKFFRZ4ZlhHbagD1VkDxBRrjnB/QB+dkDC78tuAvalDoqzZVmsw5CuZ4dIP7Kd4g7YqQ63CkqRJTxsNpCNKKi2NjGI2NSsxzjqyC6eHFqSs7BylQTr+OGXL1hGA6/iI8fAkDclry/Z/hv7w5an8yKjen8ZZ28hNE8UfU1L0llOHC5/u24X0leCE+ocdM0+AdzVwy8fM2qoN7D0iAQy4j3M8o0JmRTnOjK+XCJImNMWDt7DmWoPUhT04ObZedcuwPwccJ5I6L20awG2vuAmm8gn1YONK4NU9/30w;
	24:QRnT1c0DHR/dIeu7WVr8GX7PQuhEJ+ljIangLd0xsNz/TG/Ri9LNnyi6Kd14Txh2Bdj5rXO38Td10HCVU9Mzp6Y6S9skAuyGEhBwcS6D+1I=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:IbKMrqUYLjnf8c0WAyoDN6pOpKutFKTKjV5CoE5JhHMNIfF4teX3npqPboBUcDtocSqvTDtwxlWHB8V3P8X9+v3218EdMH9ck54wCzbNTc7j4+YG6Si0P9WsB4j5qwlJmJ5jLcOdK/XI3lYl0MWdj4IBcoRdWDVAqhQ7j86LZxH9xKq+SFCI7/ranJMk0cc0QqA82JLtYbU5XuotGl9Z0/VQidthP7qmHQ8Z3GPgnceAAbAu58w/c0HRu8tPFDIdevkZeseCp1Kn03AJTU4/VcdZlfCgopNjGzuv+Yg46jXroiDRH5UKwdQH5bWro42ILvkLpCULoO3fLeMbALKzlgFeyCS81y1PmkakQZWSQbEIRJ/25R4iGivzozigYqMexLMcw+xfx7zug0UE4SRlvHlfcv1MtKLDS5Z1HxuLVn5Fv2EEISz2+fkA+BRfE8jTZpAS6VSLQ+mESk6fMzu0aVE+PSs2X3vF/ZgfHKlMYAjfaPoBVRitPC85ZOV5dW/87fHUHhuLFgKMYehu/XBCrfo3Gyyc3jkAIMCDjMM7o0ypANYjitBNXw3LukLd4mmbfhDluAgMeLm3n75N5Y6kI4nrQpL6HyLSovTROBQ1cuRhnORzee7xZFAJm7WgMWOlyeuQrDtl87bgQK8nODnOE2y8kGVI5pBW/qgvmg9BT7bM3te8BeOrcqhSzoIHZkHTFGOZjdVb/WVs7zPZ92OKLI4L4gBBgvsw71fDi6kmrDvRiG5RHNtpHvEeHsR0qATJFGe1S3R/qAGo+h9wP+EdW3IohwsxlAdmtKHS6Y0ZLPk=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:07.6795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 15/17] open-vm-tools: style changes
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
X-List-Received-Date: Fri, 23 Jun 2017 22:49:08 -0000
Content-Type: text/plain

Various cosmetic changes to make the recipe match the style guide:

http://www.openembedded.org/wiki/Styleguide

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../open-vm-tools/open-vm-tools_10.1.5.bb          | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index 906eaba64..4ab2820c1 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -9,7 +9,8 @@
 # in meta-openembedded by agreement of the author (Diego Dompe).
 #
 
-DECRIPTION = "open-vm-tools"
+SUMMARY = "Tools to enhance VMWare guest integration and performance"
+HOMEPAGE = "https://github.com/vmware/open-vm-tools"
 SECTION = "vmware-tools"
 
 LICENSE = "LGPLv2.1 & GPLv2 & BSD & CDDLv1"
@@ -32,7 +33,6 @@ SRCREV = "854c0bb374612f7e633b448ca273f970f154458b"
 S = "${WORKDIR}/git/open-vm-tools"
 
 DEPENDS = "glib-2.0 glib-2.0-native util-linux libdnet procps"
-RDEPENDS_${PN} = "util-linux libdnet"
 
 # open-vm-tools is supported only on x86.
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
@@ -53,18 +53,24 @@ PACKAGECONFIG[x11] = ",${NO_X11_FLAGS},${X11_DEPENDS}"
 # fuse gets implicitly detected; there is no --without-fuse option.
 PACKAGECONFIG[fuse] = ",,fuse"
 
-CFLAGS += '-Wno-error=deprecated-declarations'
+CFLAGS += "-Wno-error=deprecated-declarations"
 
-FILES_${PN} += "/usr/lib/open-vm-tools/plugins/vmsvc/lib*.so \
-		/usr/lib/open-vm-tools/plugins/common/lib*.so \
-    ${sysconfdir}/vmware-tools/tools.conf"
+FILES_${PN} += "\
+    /usr/lib/open-vm-tools/plugins/vmsvc/lib*.so \
+    /usr/lib/open-vm-tools/plugins/common/lib*.so \
+    ${sysconfdir}/vmware-tools/tools.conf \
+    "
 FILES_${PN}-locale += "/usr/share/open-vm-tools/messages"
 FILES_${PN}-dev += "/usr/lib/open-vm-tools/plugins/common/lib*.la"
-FILES_${PN}-dbg += "/usr/lib/open-vm-tools/plugins/common/.debug \
-		    /usr/lib/open-vm-tools/plugins/vmsvc/.debug"
+FILES_${PN}-dbg += "\
+    /usr/lib/open-vm-tools/plugins/common/.debug \
+    /usr/lib/open-vm-tools/plugins/vmsvc/.debug \
+    "
 
 CONFFILES_${PN} += "${sysconfdir}/vmware-tools/tools.conf"
 
+RDEPENDS_${PN} = "util-linux libdnet fuse"
+
 do_install_append() {
     ln -sf /usr/sbin/mount.vmhgfs ${D}/sbin/mount.vmhgfs
     install -d ${D}${systemd_unitdir}/system ${D}${sysconfdir}/vmware-tools
-- 
2.11.0


