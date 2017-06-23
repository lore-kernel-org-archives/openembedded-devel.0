Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0043.outbound.protection.outlook.com [104.47.40.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4097378212
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=MnFWcAyGuU97xsX1AHgPgxc2xkKZIPJgedcbu4CDbUw=;
	b=HVQaO1C3gHDrKCcDwpKEyrEB6t6BjAh6S2GY8VJCqkjp4T+gjVlsVo3WwNAESKEjHIK2+6bt8hhrcigFY7D5OcxEXsHXF+bBgGYjMKEGSPeKv77YzjyYdJhnGwdkJ20sFhbMtqLk7Fh54ozG0qawVALVl0XDQ91/zaZOhKiEgoA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:49:05 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:48:43 -0700
Message-Id: <406667f3f4383aadf40c2cf4b47b3757db0036e2.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f938fbf2-b1ff-4d19-4699-08d4ba8a0d7c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:KktKNhKEekydHZeq4QJNJlQzfCOc+1GjMpmxXhQbZ91m4O77jXT4h+2sMQNtIAU67C4R8kgu1u6UXBBtZTqZ6yBPSlDaFrTZ8/qsay1k8BTjVplI7zqDHWmRjRZY1R5Hpvz/o+zNAX1k/eI3InXij40Or/BVZ9sSFAclCLClwonmUuJiCwOc3IKW8vnpEJYl9cpdoT3U7ppWl/MkgB35pH2zJ4HVwBefekgquOGpLddOlaJ75UTeHKN74AJX648ABflH0yU3jLT3czO+lLJm5YBcB/9zuP/0Lwp/mvE7bLqeFwoIPnuIdCyl5Ud2fcCExjvC6n4CO8j4vF2bf5bG0UzqVq0GEdwqdD1GsmRW8wwngYuldBc7I4lPpWuyXK9pqk80fi78j4rcwhYwrJvbHc8uODwLuJ2CDGmGa20dRJqlQ4HMxCNaN3vlm4UDCz7WyzwC7/nZmRiohutagV8UvoXt35uhje8yR5frQkZ1XDBCyQe9gfXEGQ71stbpXEB3wWNtjqnJ0mlY1B+ftID4b+AZ/BkC2OASQvnvVnW41sftIytW8LKFKhffyQirvS3UowkHstO1gUQq00p6CD3ZRAaNkWNow3N7UDeemaSVPlfOGyYqaCsn/mexaGyyVqiwum9FyGRSCje7Tpgni4uGTDuTOjRyqaGhBSJAVWeevydm9JEp6sve2kMoUsu4qJxhUOUNXDpuZOXkVUq01kSmmojpVPzeiCEp1DkKJuKegvI=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:YM0zhdciMzQf8ZhP2dhDRulYs58m3B5GqH++yCENvT35b//x93XYd7MONzp2mSrIBHuz8dXrEmx4RYre0mhr5ZamjPhWvJ7ImCVCsloNf5aWGv5sy5cT9559bEYNA86kw34OK9tPYTygUzcA6wtGi+RP8Y7+0k7u8ELDare+V3Z7t2SBJHKw7EcsEHEcGdvYWobv5wpWGtYwqu7D3mhmM2kaZ2+bTyjwtjX1W5xW/VYnG65IXOyaAymcVqlzPl/PCd+U2OvA8c2X8SVTDD8LCLjMLaJkB+uW0oyGtvvmdUKUSfCBYBe0zP2+IgK5Sl+S0XL4eEQgJsAYog9w0J3p+IsPBd7qjzqdXkbY8uJ0hCQkLu/Hsy/Y6H64zJM4nEpnVlVnXhRPXCPdkIJQ6CzDWPWdO9rzFI61I46LZ5FJarCRUWTDrQm+gtyJo8ejSm66cn4RWk8ENcTEP+TpHh/BsYkItOSfvLblx0J8hS6VX6Uz86FqgyOJsz0M2fshtWD3mErIGLDVjHu+9zw48aOJAAr3eoaqDm5qeR8Zq0GXYJsjMcGwEAd7rWwMLDRl6TmsWoYr+1Llv0ibAzJlQaujz9wo0yFoBQDdObUqZenwQPK8DrjcPGwssgKU0PciUSIGCt4luHl6uYX070hMKRq65g1GoPv3VrZqG7WcfbmJ3hCDI3MfbgxuUTZrpVMTzly1n+GK/3XMueYMfvHH5ikhV6akDi2FVqlyBLY/ypNiPb5lE/YJOCBZRY/XLriPPkLLHAhmL1VbbkfY6trKKs99tsOavd8AxaIDAYUnhhZZSbVVmqCp8qMp/5reTbVGpnbKXN1YD+FeJ4rKyyxXVBgXA2LXxju8gJ7cQnKEGV2cFf1tqSAjv2kwh9qPPj1wNfWKbaW3KYNqieKYPdrhh/ZoFMxde+GMZNjpkn4ncVHkJvY=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:3ZjnhczkEBRwEkxPIQwgR4k7Sm52aDRrUfV5PK7T6o67+CADLifaVt7mItDi4PVIa6eum0F57tGUY+sgaCK+ygaj0xOxkmiWPNoiF3p0gpD+1LRN/W0AI9SPJfZNnv4qdiVnZzwqW0d2JRFNaiJJ22q4aGRuRbkKFiKTYiWkQY5QqmxT4LmwwU6lXZB0hNd+oJZH4R0+HFvz2e96cJePSYjTiHIz9cYYZYvdepSsuOBV1QbbcdgUX3SXSZmRM3ks7RejR9n7TJEdfq4DljW73p3W1T2hDf920tIeaxtpeuzOlmW7YMelOlFhHyeE4F6uh5O3Afk8YXyniy8UiKdfgy8fpSx3p2+83RwjbHI2dFXQWD6PjpEZwBNkyfiyg3ddGjVyDE8OnchPw+XJCcjq00SwGkfCmdCaT9uq5mSm0XWef9GWTCBtbLCzOKre78tZbzB2GKTZ9S4PggcOjiSZuflaQUvjq2nstP7ijXCe1S4bWnlvtTrznVsjMnw9XJJbV03l7V828mMCN8Ct8GFLw0urtX5crdQw88aDX82qzdv9Ttftst2ioAGaL9AXj5SmXZf8oSy2Lxd/S0XOIW8R6+xshFiTUTTUBR23RAQ7Ui3SbCxtXHHFYBz6O4rqYI9pysRmeXS9cT0OptUidUar3iZU+NHOE8IYxmMPEnHMfG0=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:raxMU9Vqg9vTr6+XP7bA4IXNTsxGipgRqdqKiHD7BPBMZkunAEBurWeD70BCUsvZtG1BmDekK8HMKuaVjEyxDRtDMUUq3LcMKvIupRTV7mOBaIaKzUFo9psBuImk/gfS1zPSRBVbtkxPwtT8uHHDjBIE9IErHVVD992bjG3lcspNO9/TiPNRhJCtWHTDbPc20PJBMv8q9aAPq+C24g+oXLCHpKrtwpR7kjXbJwINEQNsZRgXkEkYBsvHc56GQzONV1b1JBjxWOpEkC3EFwsNegXHPb3KFBdFh5SPe9BGMqgjkxMVjo6DKEObEY5tCOMY3XAmlB8xXq77S1mzvXAKsA==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB2935A3AEEA586B206C5547E4ABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:r4b8OHguUk5HkGQm7G3+v8907egaX5etytM5S8Ss?=
	=?us-ascii?Q?KmYTwdus/q2r1A+2Z0V5qj4+nN1SSuwMZClP22eNzOdWyUHGet0jS02h4vxh?=
	=?us-ascii?Q?BgmfQx4ui1hI/HNSbyKP9E1wRTlGXBZlB0iYpOaOUDuX/XqnMY5fZl/SZBow?=
	=?us-ascii?Q?R89wDJCDFexdMCDQd+iRqd/SnE/DoDwn22SE+DafBqlgwT5mZWa90oAiLAIX?=
	=?us-ascii?Q?5ueb1MKLN1TTSUkWetLbNNky4JVT5WYFJ7pMkwweWssqgDi1Tf3YXVUKa2w/?=
	=?us-ascii?Q?JoCAuG3r0UnzEsXCiP4g1Z3WEbVO6+6cFgAiLiBAVr0Jvf14qw7lAq2AdDfm?=
	=?us-ascii?Q?WhLu23oaewl0WQY1THEkjFRddtbavnP00n4HxElcI7ITrTIBZw7dTIg2ThHF?=
	=?us-ascii?Q?E9hSjrtKb/PupBPOLVY3XVcmYlG/FtBzzHOhjMAimtVz0hf5L6a3VKqXHV1a?=
	=?us-ascii?Q?kbucYBIK7DBI6MVBKlXEYTADAyRlGwi211NXMEpUreDWVmuwj3XOpE/ouULn?=
	=?us-ascii?Q?qH2vi6DHtSNJAxvNNcP2XIcPWHtfSGGUjqLJqCfW/IPK1/o+7dhhoLe6moKU?=
	=?us-ascii?Q?fNRVufqqhv5Etvj/LF4X8lyg8RYtHN4EAojIg5Hh0Hmt0dBQbc7rTy7qCEpM?=
	=?us-ascii?Q?rIrzC6zx/IpBcw9NzFr3fUvGIPAw6x4Tvfjvx15FjBSZrimX2StTQxakXVA/?=
	=?us-ascii?Q?Kfv2B8CuhsmVbWthRuRbcFlMZg05cIwKV6YmxqcNCYLnIIKKMy3O2h+Y2Nif?=
	=?us-ascii?Q?Y7yu5mzfruRPM6sdDDaEXHGLcmqczsEuynhWbW1EaFLqz0u8/E+WdagDaMCE?=
	=?us-ascii?Q?dG6PmFaqexyVaEZNNuEc+IubKYbiqk7rXRRLVyoZWZh3x/K62ztDg2UJd3rG?=
	=?us-ascii?Q?6yjfExjgcl40fBeWq+C1i4ix7Fs8BKBGpc3qNkREKjsaQSm5qINULSkCLjhT?=
	=?us-ascii?Q?mfyaJK0bMTaCGmOjMMMIM3pFmWUJ5Fzhgc/rlUsa4MIgeHHi7AWOKVA7hocB?=
	=?us-ascii?Q?x8X2RRP4bEllVQQT5ypiqxY7qR0HxSQVKaK/+FsyBM+OefO4gu5B1Bs1Trlg?=
	=?us-ascii?Q?RJgXy1yGzXnZHYJ8Hf3z2ARxOj/UUqlYDP6iQ8N17EhlzEr0o5ucswlvvFYR?=
	=?us-ascii?Q?oGMA+SeoXjX0H7TUEV5s/O2VmEMa62uN?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(107886003)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:eBWM/FycfAs8bnwsjp6x+Oh42uzr5rHEy1ODWNy?=
	=?us-ascii?Q?W6GQyWRQCP7ZxpO5A9bKg8ubW0VlmVVBqG92JuacJOq6sAJqEJ+rzMr81VoG?=
	=?us-ascii?Q?KlfuP1q1HQnKS8J26/VeGpekPCzQJyb66a6wmoXzZPakHEivg0ieRe59maNd?=
	=?us-ascii?Q?BppyApM4lc5zKrLXPzCY3KVFw+GYQNmb1OiaEa24GIpwiE0RLwWNBzNc9kuC?=
	=?us-ascii?Q?7fTNYWTuAuWMYzKTgPgwXQ+W0uZIYuOvIfB46O0Xu+Fa2HokH+NWp6XOOFeU?=
	=?us-ascii?Q?xEK/xgd2pc/3s5H+8irN1Bmfm8VWDNEX24oAkELxiK8bfojv5S3TZPDiTqN0?=
	=?us-ascii?Q?d3l8V/JBh6rYdMYMNzbcdCJ3MIBAut50Iu2325Ugoz7dKQ1Ai9GEcJRF4hqC?=
	=?us-ascii?Q?NknuBTROmjzBH/ug8TXnMN+43rJQ2MjulRkmanZ1Xk1ruTnyw245nrW4vlOn?=
	=?us-ascii?Q?wsDT2PvTR6AxPRLrlWURUTzoryPAYMKMuer8V70Odep+UgBJ4Pw/uwTHRj9a?=
	=?us-ascii?Q?KTf6d3ocNxDByQptnv99hND2eC+Kq9gXCVtiWcin9QCz1X7rRTZ6u0nlrB0/?=
	=?us-ascii?Q?1R08DcqdGY2Vm2emK7xta/xRYJAiUujEs7r8VEplBeBKKIT5hMlLW3lCceAt?=
	=?us-ascii?Q?+62kZriNkJQ0CKkacNlyaVDW5Y/c1aEznbFs5bYdrR5+nmSOInxGO618wAvC?=
	=?us-ascii?Q?NvKcV/mSYuBdGDCe64qQrUcKsmBzw3hLDDjgs3fXsSjrSiTxdSBJkW0iHuyb?=
	=?us-ascii?Q?PSbNUa0V2jBa+E+Q8Ad9/X/e1YI2e6ZmU0Z+SkWPdVMNrfdmAd7o27ohEdhQ?=
	=?us-ascii?Q?5nfF0JckkuBFK8iPj6huIJCrhqk4agbe3nC9V6T7yBlS+xklLjA1iu0g9bi8?=
	=?us-ascii?Q?mWQ12KDumsqpSQVSHzz9/8+V0EZzG1EKLOmYiG+reZz3Hk/j6jjRxTbOqkLg?=
	=?us-ascii?Q?z5PO2nraHSMqL6OpYQHIo5bLrymwJY3S4tSvzWtuX7DCDvMs5QTdYVpS7joK?=
	=?us-ascii?Q?BnrjdiaKhXgQq/gTNKMhqPRBx/wDJ3DmSuZqvXIvRlQX86QJ0cdV4A/4vqSd?=
	=?us-ascii?Q?42Y0y+vC8SNbGh6QUkR1E8SSWs1LWuKIAJ4w73Yk0Hs9cFPvYgA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:S9o72tMLpyDbILUlrRvg4dUdasES0e0zWYGPuLe5?=
	=?us-ascii?Q?180eOfYqi9qMUiTQE3nxCV0WcpCyZb/ZiFPx2bx5Q4p4ArLToKk6St3J8jMv?=
	=?us-ascii?Q?rpBOgOJHou/yn9OssiqpOprhkOVapfd6ut7GGlyqrRDuYzDKcDcJ+98p1npr?=
	=?us-ascii?Q?8ABj64XJ8EAjiB0ywOCYql/QGB8raIF5vEmf5dBu+lllKfVj9Mk+aZejCYwr?=
	=?us-ascii?Q?xypCkTBAErWOuj4Gq439sdXP+ad6NFcFvOHsnpIG1+bvXLZ8L4pOX3Y4Srus?=
	=?us-ascii?Q?GOdsvL6cN0GInQgD0Np2tEBgoD3tXtcIFcbOHpBWXK2+t1SXEkKKnS3YrlxX?=
	=?us-ascii?Q?hb2Ur8wnSyChDv8pSsgMogdWJvGKBzAUqiyeat/OxeKhku/HTSrt+TM54+qs?=
	=?us-ascii?Q?gcZd3S1p95vryNXOci1vC3Qp/oxZo7U2GbWA4igc+Wnp74AUsair9z7/7jwc?=
	=?us-ascii?Q?HL0qW68cltl5VN6VlDLj6KqG2we0Eaa0qxdfDkU2JpdkcX9gaVxTjR2Q/GFv?=
	=?us-ascii?Q?PopsI+7Dxhmj5oWQ9UZJn1lCcodqI7dqksxZiyhntspqyyzE6vQZy4IsW4vO?=
	=?us-ascii?Q?FVr8XX65MgauCKhQU9kgfXIU/xBxPmapxNEIr9kaxGpM4aoaWwmwKsZKrPY8?=
	=?us-ascii?Q?AvcRqEO9bU7d+tAEJ/UbgpGiKYH+S0YE/BgKTLxq3AebxxhmU9TiXoaPWhIx?=
	=?us-ascii?Q?iUPAHAFMjZVw77u+BTUULSSJh0Fob0cGczLj6E6O0gN/p+8I64wkaGwg2ZMw?=
	=?us-ascii?Q?UtkPmSJ7m6BqOBwW8CRkixBdRGDVeG+eoZ3asNL2GTEXtv7pf2IjsaA1je3G?=
	=?us-ascii?Q?k01qma7rz7CmMStGutJ2VIA60y73bmRwHV666mqcQCPndXuJzNZPG7cclBpJ?=
	=?us-ascii?Q?2CqJP2ulI6XBu9sCtsu8dSrlA5cUyNQHKYKEerUK3wOIJlualwE/wWiwDuTj?=
	=?us-ascii?Q?zd/yxZf5MQ59rQdB4BoNDllZ820jm6QGzX/tvo6MStjR2wOI06eC+FmkE8hz?=
	=?us-ascii?Q?EQw=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:Dq455yOJJwKnQ39fny8tv0MCuJ3TEmlK5uCHCSKrMSg4tHHClGHhUJQXAuxlPUpPd6eeDiBnf/+mc2baGxy/5i+x1eL1s6MUVXBFGPeM//NgSmLhD1gVbrYMqOOUKwrWSg5x6Dun4nP4DSm/OFH7pfoO2AnoW0OendoR8xjRfYosXMlaF6/lg7ARl1rM4DsK1AO1xnYVwl1dRtbSa9rdObkbqud3XEfl6U+vEOiRPuCfy+cclraV7m6DVQnn+qElL+J8ttDC5qEo1Qx7zAZS4iK0mxCb9mfjOozZMR2rj0NTOMB+WothNZ0oslNEc88jNslRAcP8uoM5bRUKhDfCrkdeCyhvUauzaKoQobjAjLytNTuOU0nBp79RBLqeV6llL3wGP2h8jbHY03O+LUlZhHkZ3DfZVUdZ5csSO616M0/pI8llZW8gn1TTXqy5f3y6HYKX2HSXSIcfYI9SDG1geez68BQT0Qs4sisOR1MwROs1/Ic5Uzf/osq5mHPtZ15p;
	24:dbscSqUxz2KNeZA2/skES9DT5p+BjRzP+vFezmHZzTp4jFgUxUOZKwVSMvebckJ++RPlHaEKu5YafEghPsXTZMWWNbY0ikZVynBLx3//qdc=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:uN9XbVm2en+NhCVew7nnLCk435sD4Pj1cZMtRijhknTeRVknRQ6m5+y9QCmvwJlUcFbg0TRzPqw4SbHb5/hhSyw6EAFsehWm8PSill2BWIMOUTzhkikhPsTGjs4LsdReJDSSZunxA2JYj9E53uf8LsXRSDMl5Cl7gLPVf1JAte1qi2zdnYi0WPQ9KVf2UEq289aJG6GAoWGCu7vAXeTRx9Xzx+liIKDEahJ4ZqEIJY0EFBqYNqkCoNN8qOzAflSPAqSNKZwvVmZI2/5JofJjrZV6n2WAvGdPl4Weebj8gUQMT73FdNH6MuMoNBQyDYZekwh7PK+YaW8uJLO3bGMVsisre7/SOiZegH8i9biHVyF0i1UBJNQGfMkwSl6/yyRvUKSsm/jIjxNwayHyfsHGwHpVdKJo0nNtQsEzi0Ur9+wGLcluWDfbvh0QjskxmJKG4yvV1xdCOcLFOSCICV9sqK+1wpPlhqpd9+zK8R3TvqlWnf3x1CZtUTSub1W2P8JfC+NvzIBUv5i1hK6za/FIDN4kFne5z6wE8jHfcABEFdGo7RJA2xsCCjS2TtsT7RIasMoEyIy1a157gU6GSRuR2OK8MRZKJvK4XkGzVK2j9v8FHhAhCCCFOL8YFq8sF36s8NwGPRFTK2QYSQm+kP2GyvP8GI2XpUH3qlEbnVWkm2gSmVq895UpEPFnZ3d30K1nMwRycC+O7tIAZ5pMwJJSFRj8wD/OWqZnMm/VKDhA7K2P0pMfaa4tsTzHl4DY9yOGG0b2rcJTsNl7qG5IsczfLzV2aRQVaZiasv8zWp3OUHI=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:05.8772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 12/17] open-vm-tools: line up configure options
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
X-List-Received-Date: Fri, 23 Jun 2017 23:03:16 -0000
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index 24c8e9300..c3cb9d567 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -38,10 +38,10 @@ inherit autotools pkgconfig systemd
 
 SYSTEMD_SERVICE_${PN} = "vmtoolsd.service"
 
-EXTRA_OECONF = "--without-icu --disable-multimon --disable-docs --disable-tests \
-		--without-gtkmm --without-xerces --without-pam \
+EXTRA_OECONF = "--without-icu --disable-multimon --disable-docs \
+                --disable-tests --without-gtkmm --without-xerces --without-pam \
                 --disable-grabbitmqproxy --disable-vgauth --disable-deploypkg \
-		--without-root-privileges --without-kernel-modules"
+                --without-root-privileges --without-kernel-modules"
 
 NO_X11_FLAGS = "--without-x --without-gtk2 --without-gtk3"
 X11_DEPENDS = "libxext libxi libxrender libxrandr libxtst gtk+ gdk-pixbuf"
-- 
2.11.0


