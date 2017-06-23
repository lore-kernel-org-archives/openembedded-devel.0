Return-Path: <mkelly@xevo.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0040.outbound.protection.outlook.com [104.47.33.40])
	by mail.openembedded.org (Postfix) with ESMTP id 21D1478216
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=G5b94yZbU+aHB4/XejihvnoiB91n/7ocv2gXMEGdasE=;
	b=jRGBKnz3Mus9XSt/zfTzDH17/HY9BrEYScWuttAyIrpzoCFhHaaxMRdK0rYIIXse6ebJJgAiXU+gDrcjNSiiLUGh/SIZLxazKPtmiRG0HKcUhCSHcpnUuZUkX+hZfv4CPnzV5s5nFNI8arTQEagji9lvzTK5rMcgTkid6Vun6Nw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:49:02 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:48:36 -0700
Message-Id: <36b5134f897eafd8b51792fd01ad5e9df824514b.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10bfb763-268c-4d24-7e4f-08d4ba8a0b2d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:7egCG1cF0BRgQ8Eas4nnhuBsRfhsioWENFfQiYr3TfzH0sJ2wZAUPJArdYCGH8k8/R1OXsD83aeI2YjMXyo7GCLWTJQHVc/6C+cQSQ595212XyQ1Tpspni3AnM7jbFVwfc53QU0LJDtp+4ThEnGISW8YF0bRXtfLrPrHFpXL31ctZ/VNCjGL0Zhhs/prFZ3QwQjp26ACHHXulriAzbmbqlzoME0YiyKzYgix0LpB7xIAPiKCi18N0n7qPsJZnKbtb9Jg3t6Wz9Tn4/d8TCmAFBSjFyWos0eHdabxj5x73L7bPmEpSEYD6QeUXdRRqO8F4Xh4mdejXdDacSJbOJi26Xpo10gZ3hlRErhEIe1cjTEfa61xWtC7jXDh3/V+dwACLGnlPeFGHzjQsujjb1I7gFnWSWOYDGNZRCL22zqw5MEOxs3Dz1r6LK2+6zE8p7YFd3g/aCSxLtbtxHq7nh1ePGyEUjquN+aHo4+/7zzOIeRg1tg9LUQDStvQpdNM1M7pp2d5O8JhHuDjm8zm3h3s9m1McLQQwbT0FxgK5+ShpSaGL7fDkAgg8Pj22s+Kas3YE8lOxpQzK6BnTO6plwgDgXLDeSpOf2OlGjYXV9Bf+086xQL7+yWxSyiaCysM/Kx4VPBtljAijpI55agvTwjLlj7gUzXBjgEOmC8oJh5TFq+B0QUGdDmKTZE1NqP1LdSZgb2VF2Dx1jQWse5FBSiYP/R2eymEKWa2AG1pSMbxQow=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:DAa4iSWCaEeyErJgUzIEXs3IhhuEBb+A7AtN71npLIWO4lHNwpIYihBLkN6/c/Oc/atwZfOe0nOgXOZIpac+LtQJLnoVfg89Dq5IKT2ShHqexPQmSMuaZHig/3QDdT4OSJV5Wr/QHzWat2L41Rqz6pstZzyFKcAKPujLEvkfdgQpwrfi4s0eGLoGO1JivTwFRsn/MGQ/EDoopi+P+hQac3es7qDsMCDqfmI1S7j/qI0jSlvM6x/hrjq4SPPXy6awnOjqqHMyQf0TVnPXYb8JgqRlZMYbvYgIv/7dYxMxA9raaO1cqQ8sppsEeb27T3sePvtC/A7bkfjNFfJSLpE7e+it01fNJe3GJjaxmvue+lBufJ3u3+XUXD7SIyzhKN8KEkMINaJrDSTCPzgc17sNqbXHgJ4TxUDGkx9QnS0WwOVf/EKFo4Qp/m3QRrVPSC7vnzbhpFIHuqqMY30Ne+nVysLPFnMqoiHkXYSzfo16QCBqEfHpZfKLkc0Qu4SBxqrBFmyfJEfoI+YHGr+svRZMlLLsNvs0BxgQFKCtN02zJmUNzsgnl5kpliCA8/OP/yCcnP8PhHGRWA2mZcFPF/ktYJfP4pB+TT/dZBzJoqPWpkAYbGfMeqEkUS8pTsUW/3Abmr9O19m0a2yTs5IGz2Pzb+7hnjvhVRY2KPKIhdDD1oDZ9EaI86BF81nBh0XPUAj+RqEEJdl6Fur6nRQWPE9n1nw62uudg4otkVma4GWjLjSnrSqR2HWzPeq/2+u44Od8mLE3LjsyUme7EjeLj1oe/KB1CgdIteMGirQqoKUVFUCmKb7zGPqxkPkaVoWlABiy3e21T0dX3Wd+y2EovxwVL+2xr/jdOHtpq6wSMBdUwY3InuFDlRVQdwDk7K4MqQS+jH+h4fiQ0OffltiMi4ZYmic6AMv5PWMDRaDHh8Mx/xE=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:bW2pRI7NDA0Ebb438yJN8RaL4Mw1+JXufm7PT5kemSMfWpWkp5+1vo0LTq+OdmgaSjsCUGorZk2Vzw9TXzLZOuVDy1wigQMb4kbhIz7AQU15dKKWcWr9EERvEJrm+sF1YNtVsKQv2/D7ZZM+P45cdTcbychX3DTAZitcmVJpYTUP+b7Jtzf3GygOxv/UWj30PDsrbW+8bBcgAKt5jzQJEf5iCGjGBXqAxASv/S3zivzwHahBgT+yVnqmvpPPgPqwnDzNyK4XihG1qqLn1eA/eGB7PXcmub+iJFJLYdmDk/Bc5KGEqQlQSVNEV3DW3ItLQxqNRNKarzVZZiUNZ+ktrKm4q2FiDFp23vWNmmXPvE8pHiqwec3MBWD6Ho6gSLnOPx8mJT2976Hk3Lqws+72tQQ3WCBNxSTCVRw0H/HYSiWTZQTY3BFu5vgXWpNkleKcSnV7ECyRz/vxb+Z1E+wDWmLc80TbjP1braXLiPFnf4b+8hz+16g2qut0/2oObnfri2fRxlGSbKbWaj3DoGg+Rlyyj48KkSMpuvgPgJeq5nACChqvd5bOJeb6Zh6qQU62h7gYn0ZMWlmi0jSI7pO3Ycy3xNAgZFDfvtxDZ3w3HPqj7lBLF6njtKic3/NM1ivkcQ8Q4T9Pjc4um0qBJ0PJgar1tb2pZWN97YQx+YqrtsE=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:PLH1COZau1WfDIVV5HfWPm0xFKKvgJiIqAXU+qDObwSwidAzOXxdBa10u6vq4lpQQcxhYRCmxSfey9AkOMqI3A517kcdbvXG3aEffHYcwqR/Dscnn7EvF7Q6k4WkpgvoNKOXSa+Ek02/AmPM18L7FWVcoxVRZvGuZTNnhReTAX6FO0Qji0029exPo5TUJZSSIvdH6+TZm16H0YkI7owFXevPXDarjRMRzvaNgD7vnG0AazwiRrYQKY0HrH9N5vXtPNZrUcl39aMhRUzFOyAnG+EixWvq6b5hQKcpV+PBg509dtflgwSt13BBeWqFOlpSBwljPQVje1T+zm2NyG7s9g==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB29359FCD3B40166E24AEC29AABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:cv+DnL3lbKt3BTUH3azv3Q0Jc0EWtGaf74pHBSEa?=
	=?us-ascii?Q?PVRK7/O1jbMKS2bkK4aZBEPG3c06JAhunko3T2hNV1fmgG9Kv9VqdCAJFuOV?=
	=?us-ascii?Q?5j9+onMX06t3nNPr5nQoMtbvO0Np9wsByehkmTvEvyoFPXsDh77Jw3C/KUAf?=
	=?us-ascii?Q?pzy4FZxWBKOMcb90i1FLuOYPCHHlk3U7WKkGGNTW+E69SA+S+nKObSdMV3V/?=
	=?us-ascii?Q?0y6LTWuo6CU4w6m1gwA/Fq+w2fe0WBwoHrkKzU2b2aNgs1G9fBPpLMHd3kAw?=
	=?us-ascii?Q?FPrQev4O/4xswqehv4K/XTIvjJjJ/oKX5dO2xkF0hxZR3m0t5g5RCrGEvUE9?=
	=?us-ascii?Q?RbQi6xeUxeNjI37GBWV0OP6n+j1XSiigw3NUa+yjJ1XGTqc0EvAeNVlmEZbr?=
	=?us-ascii?Q?bLrlF8DdMNBoF2DOIF9JPL3IefW76Uzl9OsBTYCOhbTgBsZQV93DcDU6bAxP?=
	=?us-ascii?Q?sQwYVgaJXkOiJMEBonmRnThCmJHcUehLWy6F1O1PgkEdu+O7rz3El2rxW0yU?=
	=?us-ascii?Q?bMdqhw7hvZFtA8hYX2P2/hYV1ERrMPs21gL4onGjcs8oKvXFUFfam/8Nb8N6?=
	=?us-ascii?Q?W0kx34mAQ7YozuyHgNItX82npBurNO8gzlRjiElxFTHHx2/OFwoJGqheVl+u?=
	=?us-ascii?Q?prONbqi7MKgV+toy2wEjSX653C7am7rgNXtrUwhDNV3EWvhUzVRnsvmA8heb?=
	=?us-ascii?Q?XvtxXMza1XhMVLfSITK8+dFM3xTfTyIvL1KXjicV3di1nUyJnTRUaAa4j31E?=
	=?us-ascii?Q?WQ94JHnKwTn85YNAaD6y9F2r7LECCIXpYFdlv7o1CZacuc8sFiFYOWNImPB4?=
	=?us-ascii?Q?k5Upd0Ei+5lxEc47y/ZZ2GNFcKuOiboSQEICYUhhjGlD7SFnZTzLHm7GGR1q?=
	=?us-ascii?Q?yKCwtzql/qtmPvTD5Dr1SgbYs7DBih6Bpecbryu+2uph5rpHCcn2QAWmucqw?=
	=?us-ascii?Q?Pt3H5H7H/sc6qul8bP7KcElTkQMibtrlZjFSsOti06A2nlEIJOlCf6Gm8xY2?=
	=?us-ascii?Q?m975TTgocXlrOAd+GbFUczrheqa/d7mFsxmSbEs32POAMODhFOSUi4vt6fWU?=
	=?us-ascii?Q?+kmTW7MRsul2RackIeto24V8xmbEb0QofBsdL/mdMEbUEBANMfwhu53CDgjR?=
	=?us-ascii?Q?GY/xRgr4R8E5MfXo6Ap3tdRw2Co94lZZpmRPzaV5g7xfnHxBlqMCfCCIVbVz?=
	=?us-ascii?Q?6KyH81m2PNtJdeY=3D?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(575784001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(107886003)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:bEfuK0A6RTtIXu8ZDZffi6W/TVM0Fk5QxeYqMuj?=
	=?us-ascii?Q?Pp1o9QPxr4M7psKUYIxfBBzVWEDgdKFpQy2XQdB1MjfF4Tdr6v/CpLra9mQ3?=
	=?us-ascii?Q?qyrHlK4WezDvGcmjnR0GOLqD2L7yt/EsFh8R+Qp5NYJPaKhfacndHxEpIUEB?=
	=?us-ascii?Q?4C7dbnDrWnTsgZ4WKka9kA4N3Ib4dJ4mYwIOlkphfBWFeUBKRxev+BhbUmYF?=
	=?us-ascii?Q?FDUT4Mc6kkImOHXKeRV1efYL9TGLvypyYnVd70xiUic61AowZNQ1oBiSrt5H?=
	=?us-ascii?Q?HkktdmJb5Mspt6nDlPbVQcM9AVjrPfEBK9rQpL3hjYxoPr/zra1ae5nS+2SF?=
	=?us-ascii?Q?SrhCtOqsnGWdBZvykemv849T6eHws9MEVHJsKxFxAtwAUQjFwnSJGwvlp00Y?=
	=?us-ascii?Q?MoXXvu+PS4/X2K8JFJjqpxHGfqnmEX3sY2lZgLYrB1hjfvmE+fuLnuBGebRB?=
	=?us-ascii?Q?FsiW6aKbEzBzmFYUg/heOqgRF/qRMFgUou7PqJsTX827puwbPbRnURssNCNZ?=
	=?us-ascii?Q?Cm6yoPJulqARtdHd0tqGT64mOh9xCJCii0fqP2PlISv1wfanEBDnMN13ld3g?=
	=?us-ascii?Q?iNPiorfi6X+7JHh9c/nRQkNtKuPsXESatqZJKApEPR1ZxPqb3619JUbo4m/p?=
	=?us-ascii?Q?0/em7mbTJw2L+h1p8oJazxcK9HbnY0Ct+VHQx/goQmTt7flon6qumCz6zgAH?=
	=?us-ascii?Q?7C64Mp3JOSBlocHNWpy/HXD9PuGYkwWIQr4Fs7MkhuR1cXcSFGRf/SnzmBKT?=
	=?us-ascii?Q?yJqYVOibCe+u1mwnJIKG1hy7CjqfSURdn/FWKkr91eNzf/UtLz8H7jHzuVUR?=
	=?us-ascii?Q?dZuWxCcp6bpdgzeTsB1yLg1wTaJjt9Pkt2ZQrxK4VbU5kki1dYnqsArWjyk6?=
	=?us-ascii?Q?sJ08yPhckqRKIYwj1AacWYlqOrG4sR494mCJ3iXzz42nvEA1tqw0fmWKnF1Y?=
	=?us-ascii?Q?Hc8xq2CLiyQvlHN6rDLkT4b60qUkRpTpBqf9iYgJ4ljlAXB4jRACngkNS9yu?=
	=?us-ascii?Q?CHbIocbvIHEfW7Jdn1JkdpOTG3gy518YuXv4+s46spBfRe5x8Wp/Padz5K8Z?=
	=?us-ascii?Q?BhF2npSMYRFoKxYnpwkofURM6oOR9HpyJP7d4xHCh8IS/oqFxfVGoAdT6dbL?=
	=?us-ascii?Q?GlvXZD41/kuQ=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:ISQaIyF/09cFmWf7bfAjx2QaMDmvnVNAIL7d0ivr?=
	=?us-ascii?Q?UfsdiFI7VJ513CliCMwiYvn3AcQP1s4q4MnPTESbsCqLKq1lI/VQB9aUPzHe?=
	=?us-ascii?Q?qDXGpQjdAmXAsBjGUaLUm7ykxj+hOqAJ9PJgrm3ucn+62EtZyNRB04aAvzsO?=
	=?us-ascii?Q?5U7J60hq64D3WSOgb/7Crh3K/hCkelwknPBWBkoAZ54geI7EeP/fKvDUmJei?=
	=?us-ascii?Q?PKtWtcmsrqeIgOL1munXjsOJn4b5y+RlD5Z7FMM1c71bo9PyeEJonTthX7QL?=
	=?us-ascii?Q?OcP0x7EEYPJk37WrZYZEv8ErQOyNGe8h3oLGaYXJTzAiiChOGKnxbTmIrsVu?=
	=?us-ascii?Q?JY1FOdz6+/8/ViqxYpswcdU0mU5uDU7V6cHiEHlACFCVXP/g+BTzOiCvCnm/?=
	=?us-ascii?Q?qI4NHrdJokwXcwyT8p3vajoX8BQOgo7L8YnTzjJwpJ/Kfac1+Bg5KejZ3Lvo?=
	=?us-ascii?Q?4CgGuQo+1274r8MkXuP2/mo5MsePSOSTUm+NnjVIiuWfBmbKIQR4iL52BuY9?=
	=?us-ascii?Q?gel7/pEhi7oc/fj8re8JEsMUH/KQKQoB9trCbas4qMnBOigYjnHrybx5Ny8q?=
	=?us-ascii?Q?7Z6XKWksAmt/tf4fXwbMFymnEFJB1CkUd4nSeatHs5d1A8EzrBwnGKu71zXX?=
	=?us-ascii?Q?hcBOlvbI6iV/RTh15USGQwpffR1xgGfeik2JZ+FGOxsbRk3Kzr8G5+G581yV?=
	=?us-ascii?Q?QVrFEVDQq8R8G1M5QTkAzQ0kxsWVGMeOT/YGxrRcW34m1h08S3avEcpaEUeu?=
	=?us-ascii?Q?0LHTiqg59NSFXlI1vL2GD0D+xrHDPM8jD5+VxFLkYQIM/ejQkyvtS4Cx2FoR?=
	=?us-ascii?Q?A5yCIs5b/cQNrOZOQM/wbJt0kgAxectcZjksRUsPjS03/Zd7FqgK57Zg4aal?=
	=?us-ascii?Q?q/4Z+H9qZ7zSyAne05b2qa0qY6cncd3tJnfLbg+ewr/RYwffqREDgIPuNaV6?=
	=?us-ascii?Q?Q87NZ9Cawp6KXR2HDWzkKQnex4Isv7E/NimkzStoua3EBIyTethAlZsRsOlh?=
	=?us-ascii?Q?grI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:whDffe6FHooStiJCuYqWByThiihoQgUyvuuom54tNtru3L8u5xewn/4qMSZ/v9GJn4e1d/l6TfYxrwd++JgDbDAF7jzZFG0ixvg50ZtWQgU1kejgdlmkpCsmZUYH/AKf+dmdKbnObFPhstmkorwMBrhdCHldXQHdDrDoPZwBI1wUVfT4NQz3sU2SlbM9d0ZCzMWjUbkHA3NI38nPMRqUK+EbYVjCWcsiiqpAPwX3stHQHF8Ygyn0HRi2qkB/HqH6bUoDGR3KYZ7ekfLzrgP3k3xPTXJwhi76X4ZbYQOlpFZ4Dn4KlS2/sQ4j5jU4NnCv6BQJnC5ezOoUgDBhXhprUEXD/Ht4siUR9HerAu9hcEF+5vY95u5c8xaE5aC8Op/TBEfZ2jmfIZvPrl9kPwxMmvZBxphFkePtkD17S940LpQf3S7HAWNnuKwRzPJAOuh72iXrvl9aszKuE9nT5akLRkQqfEdQ3ngBIz1BszrjRznCOyRltM1DLf72zDMDSnB0;
	24:ibqzsKf4uB0JQwt1ZYEpn1O7ruVutnbRvTH+BYLgaD/kfknMJn56rva11SrO5EulLdw7xkx5fPLTklJYGrGZyNACTftnwIv0PZjTrigDAHM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:cIewxhL5SlJdju9s6em4mAzn4+NYy6mIlKRL0dMeUZcqNstubbcb5L0k2zoN6iRfbuingEiATxIfpvIxOEgIHNDBrAEZ4SskmqpdTCJa0+XNEURSQFvfqozcdKimnZSqxYK01+u0vLF16Zl6chptVRwnh3Ti8VRxEXlAf1A7uYfhH/FsivpjjfqMl28Pr5mS8z9fQrImLZX4HmoQxL6GPHECO2kMkT0EnvN2bSLgQs5IMfi4V8c0f7ANwgaDydUdsuM0tWeceJBE0FQXeRIdcU7z1zxfAUNHlq5g1gcAqK6GhLOZP5e4XlTfEWeL3dD0r+2owJ7fz/bKi7RlsvIJGDjWo/zfKRBaxMo6E0oJ3X4io+bMOgAlWad8PGoGbW0GXRvurR8ovbT44bTefbVlwIY393VZtDFszaw3bWUQufjRj1vuK4SgxwaX1d1Uuowajgn3IRmGXqP4r+XXkQXiVYkAPyUXwNeQJCyDjH1CwXOAJDidVUo7NbPDNEnfEgWEirbj8lL04JK/v/8TbubUJSVVqJuSuqIkmWnl9pZ0RaPGf7WmQXQ4kNmUqdTdQ1/bjkWdXj27hO3wSJQ6Sn5SCtuzcwTllUopX+yg40oBfJ3qeLuHb62OkQxFWeNPjRFQExPcY6vrIpJFkab/gZ6AFjiU3AqTbuPoEjvQLqNwn1Zk2SyfSIcsRn/OghAcYleUu/wcswOfxzSZsaT75v7XBg08L/RwYHkYiXWq3gXiT1/LI3UFzTBrY3m3kMQEYeOAAL577US6q6JV8H+F6Dje+qWGAryTkAHhXw53H2WrXoE=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:02.0045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 05/17] open-vm-tools: base_contains --> bb.utils.contains
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
X-List-Received-Date: Fri, 23 Jun 2017 23:21:23 -0000
Content-Type: text/plain

base_contains is deprecated, as the friendly warning reminds us.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
index 1142399df..9db43b0a1 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
@@ -51,7 +51,7 @@ EXTRA_OECONF = "--without-icu --disable-multimon --disable-docs --disable-tests
                 --disable-grabbitmqproxy --disable-vgauth --disable-deploypkg \
 		--with-linuxdir=${STAGING_KERNEL_DIR} --with-kernel-release=${KERNEL_VERSION} --without-root-privileges"
 
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'x11', '', '--without-x', d)}"
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '--without-x', d)}"
 
 EXTRA_OEMAKE = "KERNEL_RELEASE=${KERNEL_VERSION}"
 
-- 
2.11.0


