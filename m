Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0077.outbound.protection.outlook.com [104.47.40.77])
	by mail.openembedded.org (Postfix) with ESMTP id C58BD78221
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=jwlhFbBHl11g7Xza5+i2U10ht0grJvRBU6+ORA5RZ/s=;
	b=rSCKcCGDi7uuXXO/dlaF+6jq4VNy8ymIi3SB0NkdTNgWG8xVhdtmMbElduuIOGFQdSRqR9YJulqu7cBzMo4FrSDE88zgPhpr3vwOP/nEwtkQqfLpGiRokvzmgvGWrnEH/zbwMT8Wk5E/sl8RcOqZoEa0JmznYf36CRuRJ6MKB8A=
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
Date: Fri, 23 Jun 2017 15:48:38 -0700
Message-Id: <0a637ee6a8ed825a13e0ce1b1a808154bfc3f20a.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c38ae86b-d7b1-481c-5181-08d4ba8a0bbf
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:XyTPnX0S7dIa3W5AU2pNVpqjq0CQJtbjcxwXazodleJvaMP+YxUFVH/qyPFv69RxsCDsuW4IzPtdQ+rW97KOOqwoMnKES2Wvhbko9qEznvICsvh4yLGJWn35DwSGS0Rjm2Tr2u6i/o24Y3miSG+G9sDnk8vbImC7onfZmjTMEGo09uLbL4UQNixhXMwWgkDLpU/zX6Tbgteni3WjJFwmxCj6ej/GqZ/dctcxGdZKpPwgvvbTvfqmjjWDUR2GFwgr1oZbOfkvOPlNVX7jPGT8ALCkljIetT7tNCZzU3eBw0o+W1PEYT75ZgXmw9aAOz9GD2JySoREVsN3+DcgnTnhbkmjFUvq6ESGSswyGLa2ACgcuPKSWnJAAIR96WZhTW9Y4zYK1SZ8ywsLDtOSUKSVaS6dFpyzu1yCho5cv55g4wiE6ntV74b/QtkS1naPCXDkCGD/4pD57Q7UE24JP7N/q1DB3R090f+bBZDLg1TLjg4XfpJRYdMn0UGdGPpUVjgHN7TGw6okjUT3yg/NoCvbH21eO21baBh5PtRqqqkntuJ/e2QFWB6S8ZZWUNrDQnm9DpGKaRQJBq+OzYrg7vEnB4C9p5oVoLlET8tR3rh7aU7DjpoZow+LvsQaZU3+lMXVfgkb4drkgaQPCQyNWYYm0UzjTw1g0BO5r2hcBHmR+jf2PS7LRDoYjFC6Fo69Th3WW5TlgaZo27myxgSzhUxOwpjuO3HnGYgsBWlbT7PYXAk=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:7jqeSSi14txmmCemWX5Lz1zBVxvC5NiD/78K8knWGMaZZBbkEPzc2mw+2DuXT3nZM2FIr9Be0YMjI8Z/rlTtRDiD2xnoMo8wlDya0u5Z+9+S9rGs28O3AnSC6iiSn6ovRWONo24cHVv8iPIbz7xHtU0vgR6mVLC/M/0VuEQaJ7TeaIuTwAWu7xIgYQl68DiHAlJWEcE04czF8nFUUPuov2t9pcoRqYd/YGyYQ8w47aeekS4gvBzbGP1K1Sv+FTK7tCVg6v6nRbNFwT1losVaIve/6V0JuBe8NgwbcGno25pBVhKDQFZJE6N0HSX0nmAKVhzzGXtPaAEZop2bGaUm0X5zzaBjeybmzVPCQV9yULGkFmFbhWqmROGikG0yJ6vSaGEcREO7L8LvL6U2t0vs3AuTEoXM33U3jH6R42OiGSLCUhBstegLjBFzjWxaqLxEo6Nr0TdUrBZPgcLGOeA9cYNsJDR9ZGMGBmOM2QXQelOSgUj7LbLBQcILZAPT3OXiKyPZ6UvGzNFbT1rh3XoXg36k+ZdhZXJ0Ji4edfk1qYZq3T1vyDSU40NPeGH+dFZ7JwLHEBmapPCClKlkeuR9/tuPg/V8uwjlYzKXjWZX/u+FmctUvQs021TVqn3Wf6dWK7pqd4ANtEApCAXPEvF8gSQsA27CDTX7Uvol5Abe5OPFTZCUs8jAKPZhgsv7TQ9FuBPrze83XYPHsQXXKB7LoAUgwQLZiOl/DbKIkG3vZ1tFbbppuk10EYZ0mPDP5wgEb7snnff9dPleIr8g3SAcG3uv7Y681At0tu0OZHKUm4mx6oQHSMeAF5VN7dSIo1358zcjD2NGykzW/g2sv99+YhLw335gMg2y2l51afeZaNDT5uD8m8nkYzcaQjYq0DQXZUhi784a+lkKH6MiT7RtDoQ6kTkLPkJ0CAg+hZmyjn4=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:oc4XlIw6Ckv7r+K7IIS/LCFTBXF8MCuN30+UPbTj19hPkU9Cwg2EzjHLqmL3m8Uk8QrPegk8HZzuZx6lBCHIbmJxArd7kiuVbVqhT3GnJ7gTTm2SJkK0U9YKyDsERYmZZEnFeHsY/Z2c9RSMkT726K4kof3FQckGYZsG8Zg8rocC20jPnOS//b0EXefrGSUXD3oNLKbD/SD6z8/kBa5EzMXOtYL1uVhvMLbpyVCCo4IY6iFqo42ErYitJz32aTuJVPUESbYJ8lttyDEuQKuCJzHK0i12ltuo697XEb8cTmDGs5JnkejM3sx2zzwsFSlNkG2H9uXrp4t6DBQpm3mvM8vNCoMQnwWEqtCWX2hhfm6T5AaT+aecYkuutVlKtUBX015WLiujeyd0JHnxStYf5frQfOu4en5RBWDSagQfJH4f/Co9LUZi8XhCX35sOO1x8h53fQ0MBki7HMptFViGxt6SVKyQZxT/Lhz34fT/S7GmlhujiJTr0vF4A95RCnWZRC29EXb3FnE2yWa1cwZSe26tpOYAtESDLRGk/r2KfT3v8sGqfl1ORCYv70AY0CfV3pstt0QzcYevOPUe3sjNKVQ3TRL4wYPqkMNp1Ai+wZcJx8nSNcLBYsvxRQE1BGsKt1GZpRZhgxyotPliKX4jdb7pWNZDb2I5rrSuidk3p3Q=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:2HkWSnnjhLL41Fp+G5gnC52dC4ceSqOhXSs0gbSM+m0YfFMbfjmSbfTu88ACsp2EfexT9FJjlDk2YxvF5cy+FfC0dTKODueIk7Cmcwmj1cvAYWVPO9RGxVgDGbeAVXkTh6u2kQABXVsmLhaJ4SKczlOlyz2jq792/sJGRsatkICNcBoUpYmPXEWjzd9yJKsEvzkZfCijWJTu+RnnVfluKVwJqPpCo8C4ew5iarqpELPt10aVOD7bKFAn9kfhbJVYcaKXlx0gCL4AaqkTKw9Iv9DNhfb2dqSG6vsOkwT3nRcZIJZfZdDEuoa4INsY3RJUREQkN0i3kiVb4xNaqahCXw==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB2935645FE2795EF02C27E84CABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:pdnjNq/nMEML2hyu1kD8a8gDoZ8ZkdSPIxc0+6lx?=
	=?us-ascii?Q?b5JvFEsgn1rDrcCdIQHHZ5W6OJqzIYujR4RrYlriFwEl8OPeki6PLH6Aw+3b?=
	=?us-ascii?Q?LZp3W6aU08kvmNxWR3cHC9e35Usk5yfDRXP6axHU4hUtA2os1J8Agehy4J13?=
	=?us-ascii?Q?sT5RQVQ4lZzmeuExvjsHdiCGak0WNIHYHZWPux+8p6viVEoehXTWeu75AVti?=
	=?us-ascii?Q?KYw2ak6l1d0k/5WfMiCCDGIYb8Xrol2qjogNCBj0IFPQcr22X47hL5EOEKvZ?=
	=?us-ascii?Q?q6hGjHy5JHEJOv2PDC/jlrpcAphUuO9dQMrcBy01h3Dz/0q/zv5GXxacpsDV?=
	=?us-ascii?Q?6KsRJNKtSM4WRKKM3OMazr4Hgb5eUvIwn9PoC3TNbRzasp9jwd8GyzQxuSG/?=
	=?us-ascii?Q?uf2zo+RwlZRA2F2nvLR0iDM4eEsAKra9ZAYwytOVboaM7YnVQpSpaVMXRNkT?=
	=?us-ascii?Q?RWsB3ctwtcsdxU3inWGYnHkmJ90n4O2893Qs3AnFj7Hh9p2x02QanMsSHlou?=
	=?us-ascii?Q?4BlLxCfKUxx0qc/yTuMjD4sdzveR89rfmmmo9sQC5GPXyuU/NF1FzGQGnxo6?=
	=?us-ascii?Q?2e5iQWUrC4V/vntEmCAnFuj5pyOq/HGa0S4Q04IWTZdwTFyXqU6+Xo4KwiuB?=
	=?us-ascii?Q?XmCe4IKiFqNklp25F5Fra6zcN/2Ba6UPRWDUo+edMZZ6d0ptbzyp/rmryxVp?=
	=?us-ascii?Q?ZzgrsuXrVbAOUtbRTIFlcD3fmTIEaJEOHjtaNy6vTaQ4t6WYWmqF4Vwlr71K?=
	=?us-ascii?Q?zkHY1nCiE0R5D24fFDwyVl4teW6tiIlLzIasVMHZdXjEekEGtc4tI0eWx+R+?=
	=?us-ascii?Q?yAZnNdSVlulRLfjoGYGgKk3b+It78Luk53TX/MeU1ZK1aw4cdxBWpys4YC1l?=
	=?us-ascii?Q?OJXeXBebWr/TCpLrYIFx16WnJrOBfQoYjupII/y+OSTorqkr/J+U5o3ypZ24?=
	=?us-ascii?Q?vqWbu1f4CGQwfNrpP/Nj2Y4C4CS0Dy3TK2KZRGwm4pHoOvMPBYc2JRYo0c4C?=
	=?us-ascii?Q?BLaVNZ/Y8TsYscFFyPzvnSYKGmVeS+rdzclCRYHxdPqXWiK2kGItnoquJ1b0?=
	=?us-ascii?Q?56Pbz1KZ6EzCcMpMfF5eXidxf4/0Xxx2Z44iGtsy0wiYdNrSy2oXun8DHN1s?=
	=?us-ascii?Q?jIZTlbHIISTU1UPeRZqQQDOF+UHoBn/Z?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(575784001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(107886003)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:VAkKE5zTkMjBUBBOMT0g+BCzo9qWjPRJgHGSS5V?=
	=?us-ascii?Q?AQKewJ/udDA6s5cb8S/n2Yqeh2Bh8dypzMz5yj1BwDNSHZ8/COel4E5tMAUC?=
	=?us-ascii?Q?mTn+ATDIQe28NalTL3pIgqbytA2UdJZI3bKpqmm5G9RH4eChlvVpza2PZ86p?=
	=?us-ascii?Q?f1W4PgEcMOjeKWdb0W4U5J8O8jnXtagZ0Fwt7LBi0IlF9b+HwFgYqzim/5il?=
	=?us-ascii?Q?8yA4MAx7WhEMFHk5d9HXiykAT4a+B8In+PgM7/IpkgPXqQlxD1qdj6TrRM08?=
	=?us-ascii?Q?jfDXpxMVMtEKo+EQN+q7lYjlrYXYcRXcRnquJQ7f2wXB+rRiTkY4jfLW6Yfq?=
	=?us-ascii?Q?9siPI42TgM2jZ82m2+E0297s8sI57cSRAuVvdJCCLvCPvLJud2W+3j3Jn6Rv?=
	=?us-ascii?Q?dhROUy5MPU74Km/7JJYgI5GCkQqKhS/if7mbOxXxx0v4lcX+yq2undMDy8Mx?=
	=?us-ascii?Q?oHRWCWDP3qVj6ejJ5crt+ntZ+WvmFrO0z7aorMCl9p8zSkqyYnxm4I6uZtJb?=
	=?us-ascii?Q?HBdKNrcNK9XSdvEPM06YPN7P6ub11KYjmK7fXedk55/sxPEMzu2OzeGGHBN/?=
	=?us-ascii?Q?9PQQJDCVdZhEGKO6PoMyuAtMac7Fo6PwdDpGCTzLFpGdubGnLpBvlQC1DVFk?=
	=?us-ascii?Q?RRjPJWVMMuENlWgDriitjI0JIFZaTR8Fh7WtjLe5GJOvjHTxV2rjxtlTk0Eo?=
	=?us-ascii?Q?WYsgmnGej0uNbg2xBL9rIf/76S9G8wVvemV6BQKoLxH5TNx+jOWBaPFxxQQ3?=
	=?us-ascii?Q?7WmRCNzLEmygh+QkIQL7JYG5Z9rFBo4U0dXp5Xh0HeX6XXpyvBACb5AR3fqt?=
	=?us-ascii?Q?1sMe2HA4x4EG8bH5cAy8LlpuFbPFRrn4b89HlwapB10U+p2dXEg6DzIJejoZ?=
	=?us-ascii?Q?uEe33TdWoBTEYYa7s11zXBqj/NIb2+mvnNwIw7TLzwF0sSwL+B2fYsDjDRIo?=
	=?us-ascii?Q?UTSw7aCkf4lpbQ9t7TSPw58uzmgElIQBxVAoH6z4sEm8/IXGGL0FLR1e4QYY?=
	=?us-ascii?Q?eE/eVvo+z7SKdvahPKjhPAJyCYVQzGma2aRD2lcQMZkWJ9JADgZTN1hz9S2Q?=
	=?us-ascii?Q?Sveb1jAykt8qMpaRkdRRKq2oNnh+oOsldKmsNur+n8dkh2atGTxC1nMFRS6Z?=
	=?us-ascii?Q?6xsqLP1aPjiM=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:263Qy4BdFFuMTzRkTohxPv2IFDSRnIudJRbiQpSH?=
	=?us-ascii?Q?JyoBM3H01oamDuYx2kvSDC2pBS6Zx/je5bnqTRc2rirvpn27272PRlMZEVpX?=
	=?us-ascii?Q?bkCro6hlf44OxOthUxA++UfsLnznShF4bcDrS9DGmn/U2ecR9m1Mr5z08K7Q?=
	=?us-ascii?Q?+Q4g+UG/73+VYuBvYEB6u0F/C9RnpxXVft45P1fhapHju+sI7pf+J2nH5hTP?=
	=?us-ascii?Q?6o+vXoNUzQpokdnQ2nD1Tpdx764QEgTeEd1KSYvt07cCVtKuBQG3KinfJdkg?=
	=?us-ascii?Q?UXhgVDEy+2Vtxr7r5uisunsY/jtnVikQkLx57OUh/3hjs4sQ/W/qhOq+fDlH?=
	=?us-ascii?Q?14h/miuY6oqe/HeLtZkIlXwVjdROJmqq7zN1zlSRiwoDuSMAEUodFO1wsQ9y?=
	=?us-ascii?Q?I4+oxNpF6CRw0jhcnEtCu3/RxD5bHSwmfZdruLziSh+tvvrqNRfFM0602QIZ?=
	=?us-ascii?Q?VsARqzYKgtVDYvPKgDrqy788Y2bEj+2lTaA/o8cpQ9FOO//X0knFG7EQ87wl?=
	=?us-ascii?Q?PPKM8IOuKj5OSlbE1reJKriVWXoUWIhRoaGdFQ7CclfDrpZyHPVhprpTLmK1?=
	=?us-ascii?Q?rtIfxO316zDl/N+2k47nrnSWblQ1SplyEjsJdfDAUnxjC1PzbBYoRnGxn2v6?=
	=?us-ascii?Q?diX3tqOZpLmitjruv5dBa/1AsLl/OA2jKmEhGdtMfj+Ch7LSTj0vDI9lzO82?=
	=?us-ascii?Q?aJXTLbifCI4y9z2zs3jIBgvBtXSSiLC8/NfEfFB3n5SnH6yRbSD7enjmUTaN?=
	=?us-ascii?Q?Ml+zOqQfO45Yl5/3xz2gPq2D2yTjpL+8ESN3AzQH9qDEQdbQE58rXF5i2dmv?=
	=?us-ascii?Q?MYJIe08n8pr6KoV5M4XqJd3QeEAurxBkdgmYo7eobWOZmuhKUhwk5emy7jIs?=
	=?us-ascii?Q?qM1u3yoncul2PdpJH4Ulsc21yzfS8NB8ygNlvoo9kTjavfZHTxqqc5CI2Egi?=
	=?us-ascii?Q?bz+JiPU6rfxzSSY6NTS1l9WT8Wdc68N8KJD+7oiRyAn9nC2+Z3NBNMCN6uyX?=
	=?us-ascii?Q?lXs=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:j7b+qAac4ImhZrbJH7xJYkCc6M+/Fo29P8s2ms2r6oWmFwZ/PFjkRmWy6XdnumD5i4zLq8XttxIDOsKXb7xNUBHD9Ecy7NjXAlY9zJjkgxz47yrW3gXUywT25owAGIWfweSTu3ZgRxzxCr2Ik8jnUdjm0xyNqxfjoe8sOBYERvEtB0Vix3qXUBLjs0ejlw0AOsYXmphEMDzvyqEgGiphjUDnTrrpCURoZcpJ3yO69dBfaTGsNikPZq/m95WVWzP7+VbOkBkc1mkv/fRW1nY0D1+aqFmvNXlMSNYSWKtQfBk3z+rKkI1oyzZxoSZWdS9aZrqqurUkhwj/XjHiMsfUcPCq1HjOT63zY7AEov93qaZ6pRrEpsxi9vihUEU37HJui3oQxgeyVa0WXAsG1uy05n1rEDEolRglwDqTx1dC6auha2wAwqjq9U+k399mgPITIG7v3wMQe/T8UY2hOX6zh8Gv9Ii6PuNQZ48IfIIo7Iqv3+PrYLdlHlMQXOE5r7Zr;
	24:a7QPX1CWYhOoAelHlMPJ0FvPnY5YA82eOA7vDlT9XzRURarXldREAIsHLN+4FoWnwIJ52kipxm8hII4Dzwc2GpSP8VmnhrFdrKDfxzdT2lo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:9Bf/ceKZpMK7U/EzIpArY5WaY7eEDqDfRLrdQTaxatF/HRt7uohNwX5otxjooZttH1vbe5rn7Stbfv7YKrO3p62u7MhACgcr9ZTRUroPbWz6ZP2xfnYliTkB78HLAnEvi92AG24eJ83FwHXmKbEC/VgTUYUTviyRxYKwGb69/RlrWAR/fD8Oonocbhl+uII6ssc93JU54JdrgVgR1yLwZ4TtwSoEXH1QA0bB6ko47dhJZXO0BxlzYKnBPDj6nX/EcnUDAKtpgEOaGjZD3s5qT34TQPuagpNxMJiuJXGQo3riYB+uuDbs+OhhcsjqrXKZMZVcz8HpU9Q74FpX9i1kqsP6yABGHepYeSWC8jSb7h5tgHUpkqkduu4GE524+vWAWJqnabYYLlO01mE/S+A9360rSW5ugcwtHr1Jk+Nbl0GoZ6+vt441VjUzC8qCq8nL9Qy7YbJzSNbzE9Gn0uE3qp3yIxjptSbkXhgih9HhGm4sMgqhIF0Re3W9K0Hl2WpkFcuYgCtzU4DJrVcgvzzsIpVN/RTLsoedg3VqcV/SwJOR5W2JMvQLiNViTWnr68uG6BgY/ci6ewynd9RMa5AHXKoG0KmC/IB4nhIbhUVqgnH6FBJkjJ1JekccQr99L1Kqal2x+SSaeJC1eRh26BgXVlmGdkhHYbugyCf84ETk8upO9YzqC+hO+tWbr9WcVJAYK7/Mb7B6mz15Pnxzuah4VnZdvWyM5U0/58UmEhhWp1K7ueylT70MTBhu3++eSD5yR2bQfK//Oga2IZBO8Um4JxvHPPVsQB2ktkItYMy9To0=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:02.9612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 07/17] open-vm-tools: don't use mspack
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
X-List-Received-Date: Fri, 23 Jun 2017 23:04:59 -0000
Content-Type: text/plain

It's not actually needed when you set --disable-deploypkg.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index 8a71cb3b6..6793d450b 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -30,7 +30,7 @@ SRCREV = "854c0bb374612f7e633b448ca273f970f154458b"
 
 S = "${WORKDIR}/git/open-vm-tools"
 
-DEPENDS = "virtual/kernel glib-2.0 glib-2.0-native util-linux libdnet procps libmspack"
+DEPENDS = "virtual/kernel glib-2.0 glib-2.0-native util-linux libdnet procps"
 RDEPENDS_${PN} = "util-linux libdnet kernel-module-vmhgfs"
 
 inherit module-base kernel-module-split autotools pkgconfig systemd
-- 
2.11.0


