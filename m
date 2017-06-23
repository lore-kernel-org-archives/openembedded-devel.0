Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0075.outbound.protection.outlook.com [104.47.40.75])
	by mail.openembedded.org (Postfix) with ESMTP id 20F5978213
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rgT3NZY7wN9rzlryF2ejYwFAo6XUx41o/dDODUwWhA4=;
	b=Ta+DWZtwakh/iAuLefUX0vYwKL1US8/2jDsy9BMsdic1b431JELOdzEKOqKyZBT5JbZg0ogvvxh5Bxu6nsuGfD9FQt6KYpQ5DKAdrhONLOeGYRvsJJfZeSLcB5Icx7LmsA6NxqZmyr0FNpOc60c6wOk5My6V513XoxjR2wkT4Hc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:49:00 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:48:33 -0700
Message-Id: <87e7045b50fc10fc12792b8535033e1862825498.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29dd9095-1f69-4668-a340-08d4ba8a0a6c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:3umH3U1Wt+YoNituS1nZuiFuV/ss4N+MFfRY5FlBbufXlN8E1mEf36sMmdp6grM7RY4VAfmc7IOtQRwp3Qd5bYmpLEcYjKqREstsLxYJrm8GdwlpD5uShrPQ5kTej5bSdZNCcw/xOBpWAur4QsResPd3Yq+x7Iyw7ndVP3TY+DegcNcAYpdjw4/OjiGAqwNsOe5vBKSxJbh6GICSuaTZa711VnpI+eDHG1VVgJoXddp/vaBRHtP79T8YC9jZ5tKATuEriswFntOdZlTa48KHK3sGzQAXxzsJW5aZAXfjH34R/NwFlW0ADeEcMeKa2VfkPKvWBQrrGVinlDFfx6JzkgHllPyZcEJ5OPQOQ3gehpQjNT0xrUygnuKTcrl0L7Jh22PZNCieJWOx4yr5pIgvOE4lmFb/NGZhDg5h0/do4bqYxmKvRniIbFhyBFHlkvbKrD5vjKtnx9caEN7PQYYVwIlyG/y7PZwIC6PAtlF7/mhC7lS0FACjl3oFsc+P78DFt1/cYiFH+VhhJMyzJbrQ4GBIuyDx+DylG7ywlJ8BBLOoTiNB4PSZfPW4WaI8Cgwi1sb6bQ3VJGhw+EA0I+R6xC3XqepwBKQTgHMha5rw/JiBrQkoAYuFBs4MZpXKpdVdSCaqWUm5emlI/DuiTxaPziQwh+QTIg6O0YOc0FnU6l+qfbmaJ4zYSwO4wJUFi0OkQ/3ujtTIcEBHCGjghfVQMDi2JbyGOtDNSyMwnW7vv/w=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:EDQF3HcKz0Nw4URR+Trzki/zTBhV4PyHJbh4Vj3SzdmCtD7ikPJr2CO8w5NCWMjtXsdlqGBpmyXFDhZMLK8b3ao23agqHjR48hFcnmKRl28oZ/kcCJIZwCPqH09cbDK3HAju3tb3qxTOAbFti795MxihekBO84b1lBcn46mia3wtieuaMh1AwSGcJL6ETW9wph2SsCQQQMzXI4+jQaJN0J2MgElYJyQd4ZY4+FKXDn1pAvJj9mg67/w+ySEFHqbowk9N4G03t20tLJCL2+n31t+9UXgyoOrk07qYQ1rAqbFwGa8rwIaoG1n9xvgtzxM5R2DrP92V8Wl8VgxZ4qApblNYGdL4vnAu22RzRbD6tNDPH5IOyKs7oANGfW2NbIbU8qs3DrhR35ny4ttMH58ZamvtsG1cHRUX1xqWFtAUrsxjhkEF6Ilq/9diw7dEXkqt0Mtc+3GWMJ7K777dxW7LVcCvGYKESGfv3nJpT6ZYseuPwrx2tORmYeoO+u/6qUgbZ8CexqdQQr2CKnmvSf7DeJnJ6+S0DNnkF7v8BnkQmUa8mSklpp9UeixF6O/K5bsYbenVKZwxAywdYaPjb7fe0L4UJQCw5Z0W3s9Qpw/BiqLwWp1toIQAQamyfEQ2jZsz3L5Bj/ghorNqx4sBjBIrW7GQlpNM4Sw2Q1uIkqCtjiF+38zJl+KrVxReGq5VBMiSO1BnTronMVKHerLewJnpFxUfjzb45zl0T8v1rVSR2VAPO/+vfWtevuIkJZk82bjpEuCKmxnLNUx0AjI1BrC0MXkOozgxaLucaEHohKnOpAluetmTadZy14GHvtdc7nlBNH9DTU0eqjMZAXa5t3WhL22ox19xgmAnZj/3IaB0edV4FPY5X1COmpcOhrp5tVOiL79yKKaMGvHQTqj4jb+Q6FtgFt6/KuEhm1pSX6oPf9c=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:c+S1jjGM9LVRIPVLtnaYzSg89BRqJ+qpY1sIx1/XGBzxnadWYZ8AEHGeIgGrkoUVygf8tngyWR+7ori6Qb5FJOa/7AbDkeWpLAqyOQMM3lHo8SB/811zLLHjDe2ijJy+tY17ehdsBEsHOpg1e5mEPijw8zCMkBao+kgOuk/4qkXcRmxOOGnWlYfMPtA4ZdO3cP40jh2BWqOvp2j5/3nTPFnPvK5R5pACxxOH/ERbq6kETT6B7pPDaQCAOIc242MBWOrwO/NLqVj8BSRHRHlfWeVaPeokgGzcTx3aEewfIEGghleEBFyLWgUxOyvsZ9/CAXdjHnTn8Awv8NJiemUOsTrIO2Uxu4ERvqfdXzIhQZhLGrdBGUdLe8johnZtG0bldxicRiGUdR9UZhJYfop3WS3rzFhoDihczFQjJrxeV/uA4xL9h9oHzwRMKTdw0YwnAFIegibAqGOA4zKMRRIb/hzAped6NpzohO6WtZNFAE63bs2oqRUvkRyDqgDuV+3a3vwgACqD41W4v14Kixc4Vrjyw2NqTeZNQMb8iXJ5I4P0npIktFkQjnVOsvSjM0oMwmqjAthLxbxaL1xlRzB4twVe/ewTLLeqTInJ385m03aFDlfr1U/xuHdOIsNvD2RMtEyRLRkQdKbAdZSqf+CbQ80srmj0mTIztoYvBvYJUP9/xrLFutEOEEYDnEp5a/0LYWj/XLTMfWHJgTlB7fwgyQ==
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:sNGsELsuVliA9V307FBwTzZ5tLXDN934cre8xbn6JMNaTxasPzpir/GZ9e8DQHlwdsKL1OxBm576AkQft2uTosd5arULlaLktJrd6a2YEIh7zDnDrg8gewh1/GoTuHBoIcA8fyd38vNMtQBOW4Tn5io/+IM3bC6260ibgi6xlkDICTHXMwdGjvqfYE8XHdcU1VqamTxQs514x8h8XMcnYENcpIOQlUTR7m7M/sBJfM47Ay4HDS2d6sQigoBxtZOPFAlM6hKUFlWDWQf+uuEldeOW6iF8haZ3PsVyLXb3/pF0O2+XB51gV5xklyAMzkjHWMVKWkQyOstyhMSMRuHc3w==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB2935D33A312EAAEEA2BD8C55ABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:y6ipRu5FTNdPAQ210k6bD9vTHfgcaD2xyNkkdb4+?=
	=?us-ascii?Q?vHhHODenbYf7ye+2LNadFpMWNKzrRwWiiqRsRHmd54VSU6c3vQ6EkhwzWIgY?=
	=?us-ascii?Q?XjKTHEKS7+romQ2ywflDz2ZKRfuyAF5QN/q6vyKmFO3Xjxf+njGXQSXd66Nl?=
	=?us-ascii?Q?PeTiLs+j19x6uF6uYPgJXWI/sQg2tJg7W7/QG//UbU6cgKdIKfqbjIaCopgx?=
	=?us-ascii?Q?louWKEmQGtb5/JWIeDvqLkW4PNR/uD9IOxoEth9lPP9PPntPhbEcSdlhalTb?=
	=?us-ascii?Q?6AptSx6SE7o69+3h7bwbICzDJQFCW75a6hVDTqLBGb1iWQy1C2Xmy72YDbR/?=
	=?us-ascii?Q?uoOFGbZA9yAROq7PyUGE2qFkLtnNQKEtofN5tQJe3oW2ZA6WlMv6tKMGGE5s?=
	=?us-ascii?Q?hznswIyeQ6Mdk8KKxQ4AmdMv6tOqH+6qXQJhM3eU8HJqC33nwoxXMSLiFDSu?=
	=?us-ascii?Q?iVfytErxCB6tlyl75MkfWFBpImNVty5/jOyDOwhFxtgfCT4iC8FvGD4B+l9o?=
	=?us-ascii?Q?3K0ySClD7xS57vsxz8/GiWO1vqfyC7W4JqO+bTHDIDoi2K0Bl5vUpsCMM6nO?=
	=?us-ascii?Q?8Z7H2EZ4vGz4sucL/E1GySyJH0HkfaiGCWYjGf/2cqPpjjZG0bDooFV87DfU?=
	=?us-ascii?Q?DE8T/+WdUquF2MtO5RMihHzzPcuLK9qLCX9pzbW+1tXckBneCAs5kkQ8ZmYD?=
	=?us-ascii?Q?l5vT3+BtmaStqN82TWq+mQD52HquD0bK0LMQJz63UuJ1wyi2lkAPi7sS2VYe?=
	=?us-ascii?Q?3qOoeASUxpEy6Odyv+57XtUPHQf20GrGR3IMS5V36UhpdiKpuKmDkacAMw/m?=
	=?us-ascii?Q?s/REt9VeJF4Mut1c8btwsVF7+42ER206ygfem8cirjhkNnEwvDtASyxriGSe?=
	=?us-ascii?Q?LyAzQkaRNfDBziPYqAuDB7YqLBpsWvoX2Gt13vzvGJvi+jmmICMaw9nOUxTT?=
	=?us-ascii?Q?DCDrVfjmJ/IoyjIoh4kPgKTaafN1ozrnYzx+mAhbWglKZgvOnVUmIiU8KBgG?=
	=?us-ascii?Q?9rVZd47fVef8iPjNRn2n/CnhLq/2DEtsx6ad9T4XnoovIVyFywG0akHJumc9?=
	=?us-ascii?Q?xXJD/QNEMAFiDDUfXdfd2rFGXXx1q+Awbb+52Ot+ZPx+yDRE+CnXN3IZoZSW?=
	=?us-ascii?Q?ztPirUIVEk/0S0XMoFP6EqrGhE3Rl6JVfd1jSAGHniy29gCw9yEsp5IcDLWN?=
	=?us-ascii?Q?uNV2whcssegNvxE=3D?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(107886003)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:Aw7yvoM9fQz8FJ4B4VaKaza/fAHWiY+d3c81pWM?=
	=?us-ascii?Q?najSj2YBm9Vg5jSq3alskYPJGDMvrZ9qO2poUiP76/Hm233OO5iyJ278DMC3?=
	=?us-ascii?Q?hoQ30zSu14eMga9zd/BgTmilofBxJwI482txvaHp4jyEa4UKdZRQDkZ+EETd?=
	=?us-ascii?Q?ARstq2AJTWVXTz4OtiamoC5DupJDFSXMsynTKCgEdkDkg/uV5oI0VLPAgbEO?=
	=?us-ascii?Q?rIbLQVUJfPdDeV36bs926YrAFiGjB4HlTnfJhvk+VhleLFtq2T/88gB9UjF5?=
	=?us-ascii?Q?5ubdAKS83tqYQXr/6IvIHkhXbfe+jobesFf6eX7a5gb6vUtKDyrVJkFwHErj?=
	=?us-ascii?Q?wjeeXTd6xONqFQ+fRQq7srVpa45pYb6YNB3LEaRHQdOsg/NDwT3yUDpze0EF?=
	=?us-ascii?Q?z29aszyzf1gNRPKeK5bgsREwJHzgu/Kn6XuqKUn04UK1rZu8HKYIa1Wqaghq?=
	=?us-ascii?Q?2KfrXClQiFRGbvlNWNIDn2wYfVnOGFsLM1VkRY8m7ykE3BqdRditlG44VHGX?=
	=?us-ascii?Q?x7mymHqEa15WSbrq67iZKCe/Zl82zkFX9/z3sRHqHwsaOXbk+bC5jcTAix1m?=
	=?us-ascii?Q?9KlLhnfVyGd43PnYK+riiyLfZ+GPQESZ5sGBRPQ8qkoMrsocoEuBMlLUBKmK?=
	=?us-ascii?Q?O6eWAGOluDJavNL0sscKN2hbsX0HjoLWMiotdhuU0yVLvRlaVxNzh6GgTBSG?=
	=?us-ascii?Q?WU1+PfO/5l226FwzrvTyoSKVJSQw76Xx14ZZGq6abXjap+voT8j97tP02ywk?=
	=?us-ascii?Q?btLgCndoRoF/oMgcXf41W1t/1JEGfOKeih0hMmNKBa4tWLBHxkG1+AWI7kS2?=
	=?us-ascii?Q?F0QauOS2XbyTYomOUhPYpCALmo9bdLXtxMCse9rJpVmW5YBSPu7vCIySOt0g?=
	=?us-ascii?Q?xpGezAheSNS4srKGQqSTYVGuYqSKw3Y1lznJpugkC1E+KSWktfX6SPOBpEqX?=
	=?us-ascii?Q?bdCh2FRjpz8NlxunT3lRviJ9Xb6iLvSxnbajKx1fbixcN+djyFLeZOdv0Eyy?=
	=?us-ascii?Q?6KJDNGVlwwQF6L5oz9XqLmEO0s4v0fhC9zdTbrwtTDZBUUW37lcPqR0BzZo0?=
	=?us-ascii?Q?7N+xGAhD7NP7sjVjrHjhGaGotX+3O/mXEw+GCKEleaDnou8mJmg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:fXFjqpTx6j7dAWeehqRmN/px8ZEieFsom4TPUALC?=
	=?us-ascii?Q?0DfI2LlhO1QeU38ohcPabP277xidaBSgmIgNyND7ayRbgihzbPvgvy0Wl4cn?=
	=?us-ascii?Q?xm4Y/48jbUXV6ylfQF3vzuA7jfFRr7olzMCG4Vuj6kofroGZhTMWbEeoQ5r2?=
	=?us-ascii?Q?WvtFxS/nEvoCb+MKYlDSnfFkcGTG2RrC5qyUQB/VW9PhzcSRrVrZkTh69E7S?=
	=?us-ascii?Q?4z6U/xK/VocozIE84a1SOZjgo5n56CjnS/vSeOamcWkxoFE5fTpFAD4VH+eV?=
	=?us-ascii?Q?DCWlCLswtcAENYKnWbX0KPtHexgUKEqpucuLBRAoPdPhUTP5dOuqkUxSBOqD?=
	=?us-ascii?Q?0MySAsvZ3Au5rTfMSUbo+TAwcnrwV6PAlCAubevO6d4Xbnj+nQ/euC+y1lOa?=
	=?us-ascii?Q?pxr5yPB7pMFrifn3dfRtybBC5yniI7Od+9rYep+AEYbmHsOPKrESQHFU6PKW?=
	=?us-ascii?Q?8dyDXGmim0M3Pkf9+j9RhaRTv+ihhHBQ9T6GBSpR07onS8A9OvvFwuO/dSOs?=
	=?us-ascii?Q?D57QOkFSm1QTdz5qDHh7fWU99vYyi6mQKFt+YvdkZX11I9YxS7XwlMRPgdlJ?=
	=?us-ascii?Q?QdzM3CYV99KAkuMparg5Q/TKGBJZX4NJLfAKIEwYSaQ6QRbwDWswJAdIc5e+?=
	=?us-ascii?Q?xQ7118A9+Hgu39LA1RvE7lQtrVgCLEMGoCgFQ0yGcjozhCzSJCjU5v324F39?=
	=?us-ascii?Q?VzSB0x2AZjl5wnmg08vikfAWjoBRQ930rAhJyAmahx6VLtH7gwuLKBqKFLlc?=
	=?us-ascii?Q?2zat3gGYEenmlYS/iIZhVMyKWL1jT5ikZKhwME3qWuMQWN4pUQ8VnvtDEdSf?=
	=?us-ascii?Q?uDrs0V7JU1KoiU2qw7mrSyjijuhFGPfQofGVZMhU1COziv5BckABQYrS3QEw?=
	=?us-ascii?Q?Ej9NuA6E/AWA6gQKuaVG3edjT56J17qzdr1IrTQTSJDg8Uhi8NgKUsa45fHV?=
	=?us-ascii?Q?pB9c5JmKtmEL29n16GI+Mg+fg45PQgoIBL0I04SHzs4BIlLm7w0e1oL1mgAs?=
	=?us-ascii?Q?DOo=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:bKoSmlWJvpsI70BXAHHU6DtiAuFeFDOAgBinZcmM1U/z+4AztMZhEBggLlrnDvk3jOGKSvkwlR5+dSE8cWpquY68DDlCwPITRfXbk87I8LlLByQYta7M5i4pBTsUyaMH2167DAMFC49sTVwALZ53+cUU+84ggPHODwgyui22fzgS1ZYJahXoSWFCvn7OtrHSOKNf71rDx4XZg3FtKkK1y9CLom3CBOsgbLKIcQk548rnDH2bXFW4+5k9D+hGNkAtUwQrstfBT3Up6uHwIy7u6FCfGtoRedfFGr5MoqeTUwONi73IdJdltMVABFfoGBStwNuuB6g1gAWau4WQEFyQMxL0b+N+mZnUGTKul8IYzvQjkDg9JQIoD82iEcFeqDIQhToT0F71+RA7Lmxw1mWvAZJHx3/7H55hwonLGbShAmdiiK8AUSUOhvwxHhjCvSF5lNOsPPlvuh/hetXl6vokOsPhwz1t/e2AhP9ksYeTlB7Ccz5tlR+3a2WDw4RjTa4k;
	24:GvoGH0OECd1bZ3+JsaFfLa1bjd8PRrk833Wu6RVJBHo1BznLScbHQIL4ecCrp7IxuGE2oxiJdLPEJPvxT+3y1MWH883UmNZOtRVAEB7rPEg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:pKBconCKvwCvNmdVcDxpE1TC3tnzoxBpo8WKBBwmPEyuRYC/MqMUBYYW7pssmqLPWnh9qIEfwnBD0cwfKwCe6bt3db2zugsx5xYk73O2dv+vSb5M7QuOMpR/cPReI0ZhkxYNvdxJ0d6cWNP29neRwE9xt7phtXdzeljWY7HA0MUbhctuU0x8D9u4YHFU4HRKaOOVo8vAqJ0OAIGi4soyNvW9vnafwLDl9speXhSASGZx6bAP8Qe5trnp7HV0bOyjYJtktLjQPkuKyAZ6gb7ivklhffvEiIqHuS5biDy4I0AJ3DUKXJPBLXF5fyr7bDjT4QATWfZNOXLBKTMmTfDsTMuIwD/z9n0w4HccZQxWVcyAeUMGKqbWNJRetBYM0gAavAqxfhyK9nxfIWoSYmAMfnJJr/l59jMAzpz3Z9wWtQknfAM5j8gK0eiS/hm87517ao16nHYbF84VGe5kp8aKUiwBgBflK9poXlsU4eCqqsX8T0pnKnu4FrzyzA2yPIw7oT0JYaDpi8ioEUBAkoshvRZRztI1hDd4tfhxpMnVGvtgVE4J2rosqckDmtuOnWzAruGFvRBctrHiI/CAOv1tJ84IhSSbD7PdwWUSRGpu92ybRYshcyRc18ZvsgdXftFIL5ukHZfGN77y6gKA0nHwmdCbZfDrP5tTVMRl9SoIT/tcy+ngO6X41pBq7EwLkA9dxeE/uqFAXSvXuqkS0MAW8R9s2/efIkcn8gkkSi30LKbEyzCr0YaCUpeYx5qMwZd8Mn67W33fgPR/WN0QCMFZgcIIRJjNsbysT7dgBBnFMoM=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:00.7416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 02/17] open-vm-tools: add missing pkgconfig dependency
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
X-List-Received-Date: Fri, 23 Jun 2017 23:04:01 -0000
Content-Type: text/plain

The configure.ac script uses pkgconfig but we didn't depend on it, so it was
silently not using pkgconfig.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
index 4dee03a23..a68d48574 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
@@ -29,7 +29,7 @@ S = "${WORKDIR}/git/open-vm-tools"
 DEPENDS = "virtual/kernel glib-2.0 util-linux libdnet procps libmspack"
 RDEPENDS_${PN} = "util-linux libdnet kernel-module-vmhgfs"
 
-inherit module-base kernel-module-split autotools systemd
+inherit module-base kernel-module-split autotools pkgconfig systemd
 
 # from module.bbclass...
 addtask make_scripts after do_patch before do_compile
-- 
2.11.0


