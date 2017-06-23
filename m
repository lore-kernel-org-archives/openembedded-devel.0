Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0066.outbound.protection.outlook.com [104.47.40.66])
	by mail.openembedded.org (Postfix) with ESMTP id 20B34781F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=wvx+SWhVXl9ouBBDs8z+HITlY9dDJR5tI+1Wc4daXd4=;
	b=fkGZtiKjE+TG/R0lCuDVTfhu/+ToGQRO8vzFFcC74LDSFHjTRjqOh87m75izASa/8YCDi4m0d8bjxqWo93jlm1Rc5hh/ss1NzkKrxQtxVp/IGHg02dCRy8GBlAXenYXCskYuyn/5ByGuM+pFdEa4QLSiFL3GAp6FSbADhR6Gty8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:49:01 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:48:35 -0700
Message-Id: <c5755ac2fd7088c2c3ff1f6bf41c7994f4745230.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c2da538-232d-4f2c-23a6-08d4ba8a0aec
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:QgK3OJb6lCbEEfxoCQOKpn7xK2CdGwEqn7XvIn1wgZAovzCTRpSdbP0rfsnT4LVcbhM5BiIp/BFBdZmLeSJN7hwp3MVUbZX2ur2gjnf9SjFA60GQu4WofS0KgSCB/5Fcd6FtzsiBH8m675//kaJJxxeo2DZm5wUlDg6olxmH5BbG6tQW6d/p1v3Y8oCD43YSwqRj1PeYxOm9DCxp0XcbQZaG2yEtBWP77lIfjQSfXbZdcHQop8bt5e5vJh8bW3mceKNkBbPN5cX+ULMnJrNYj+eE4/SmVWjbqNjG163xshkf0zYKlT26a7nOmWKcfpV8zl9sy960/blZTNq+bCp+r4jZTk6FW56vUsfXiVD/IecFOA/u+m6YG8FzOEfigmFpWkyh6jNwzQEbFHfY7OOmQvrn7tjBGikbQlbOCXGJ/qK03/MeqgRgyAGsLZ/CA7eCXG455/BxnwZIO20ot92aNXuDCOxUIoUYOO9UHjTIQTHib+2qbKC23WlAPxylzY7XBBnYo63d3umzz3jgfKfnQb1lLxguYmD9RCbbMwG8N9BPQwnC0KW6P7ZF13vywKA7K55eRR6ub/eAliYVkBO6WDpA27bnjvH+xkE3AfW2ibn3tsQwc+lZn7/Do53JixaPSijJTP/+i4+FkXtZJAjZbQMb94a1Y13D61vgGsQCkiOgEsQjP5UdJznTLBi7+9METMN1v3sarvAOjW+rnsUOnRSHEzKet4nGfxqd7ij+3q0=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:+//PzsdqgsL6tXoLByUMfegb2uo63EoOST5K+jpMQyA5ti65cGztIwXZOtqEOJJYznk3tFopO6w9R1kfgX5BtZxflF4OlEcO0APj8XtoQhQI8K5j9LQotqPiuxym7RPUD99zT5epGuO6ZfeGy6yqWmn5VvJawOiBGrEnpyjG00SyKA8xG8gLpL201r0B12GfZtIwp660fln+Yk9uRqrnZIf+UmlxAEMo3g29Mzn+njtspGvHqg8qD07mUi4Lyl13+Vu98guT2d3EewfNdhPT+VS+TTTy0mpthBKzpfw5rL6PZcRemKs0u2VYln9959NiWlEkR0YQvKYT9NhvvWH75fwPtFnWBP60BhaEzEpqQtlaB/vMzSJbxa4+ki+n36q5crWXzvLRfBKqeu4/muVwANivx8jIuhRiFytBydl3bBlCmdkj0WSgb4FOTfuP8q5DNg+XMR86sti5vH96pW9ipRgRQKcczD4UfeKzkRnlBUuiKjDvYQvQ8w2vyH6IbWv5K5f4V5iXOqNrSeXYMSpH8tj2wx46Q5jjL5ryzLQ3u6MN7/h0N1pGrRJ25zDYEjEMiXa14lWsafPvoJ5vfWyyXlwUmrRlYF+7YmVfSMfoGwoQ3nKo1CdgplpjRW11zX5VaHl7679P5W+IlXe8MeuTVMMBHddiBIs5Xu0LNfqm4JTxSWocWS7lwcIBloHLwjI7arL84qq26PT7jtnSBWcmkgJNVpUjsvdrGaKGQ/JyCRdLQadLv40shmPK/hoRc2yRgr/THREmUHektaltXZtMGJeKLzYMbbgE2TU6A7yd6oIig4EmbSgb+1aiOfGFgbM9zYHCdOelW/Tr5d2HeLrO5EsG7wnMWP0HZPip/oonaDUGVFsQ4hSUUI1p0k99I5sSw6Ph7TkdjOh34Jl4FoBeZz3IIrHW+8lSte5F3YqYnEE=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:FnTcPtfL7ADbnC4i9uAqpY0qXSLRdvgKIXOlp8wYeSHbHUeXfd4FGmWdtBum7x4qIVTmckb5R2B5kvSCiox/2N3MrB/Tx23CeY/QdQvfdjwQv3F4SI4R7m+vffMWY/cy3qUPGBa7a2Gfa7UwbPk6dt/mnEi8uMCnH+VmYTR/EZuFDXVxOeBH4Y7PK/sJAgaGZ1/oHV7rYkXkIhrdEfYBWMK/Q38omTdEJrVKyQSJRQe1E1Bgth6tdzi+H4vJnmVxpg6623e3q4IHG2rTForLTYfOBrNd5H5YwZVm0/HkIMopugKFqq0eCHMBglegqKMqTHfaegi+6UqpyqMfkcmuXF74msfVxMKYSVdSr27/3YJoY+N3iSHPhYTjOrzlNVpH5gbvhtJQZqvNmqMtgL5XjZ0E6iGDUgxr0KGhuZ2sWrlWhRT8crmdmNG9HrwIpbH6S2AUpvGjLB//7tvAnsmnC+bW5A1gP6eV/so6Gy+Q4lQhGArG0pu/cgIaLQ+9lKbqPkJUaoBnfY06VxIWuj8YUp1V6KAuvAHFUdlclUTdQhd60La3ovBxs0Ck7nJqyueuLLznLqThsZo0oFaa80izbplZn1sMDzQ//+e0GlAkh8Zj8z+Fn2VF5sk5jcDGMp7sx+Yg5eKR5L2BXrATO10Jhk3OKc5lap0kSs1rBhyKMrM=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:sGQ9PGEvF1mOR4+v9trFKaHtgrM+UyWdNCXwdW0Vr2x5Py2Sn8TSjXgiB0j7f87TCLMSzfKeUehnyYZWRs3m+7morf4qlRnALwKB5Jyedl7AtLQIBCdLLPfZzljFtAhJQ3IyZJrJlvwvOmGzhBFF9CNH6RAoO/uRdfxLFDC2oxEmGD0x2Jan134ygoZD/dVHsEqtIfqkOmgW9Tpw1XDu1TOB8K8c3op0CjlQUAcJDY173ruvQa01c0LEd1VkSN2BNWAjNQOtUywLL0ekq9o2kWnVLCMLe+xaa/tLnVeE8AEvT8+CXOLYD4heW2Oq7fVG4o2KSAoGg3Ebs5fvaRopHA==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB29354A52093B2009728660BEABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:ifmqT8eTijuY7EUB60wwkZb6MRHz6tWYgnCq5f85?=
	=?us-ascii?Q?ToDNWhJ9f3sdlpOJxuV1jNwBoN3LFkAfQ0w7XVzlyLM2GWpsJr+3MhTqfR65?=
	=?us-ascii?Q?GTjljeF2OYqI+4GvHRD0huTHiROElkEORvCJIK21prvZcqGoxsuR0pL2ZxMK?=
	=?us-ascii?Q?EYcxPLQK4RnVNmjWUhqRNKAkF1d0bc2xZ9tMN/j46SNLqWS+2kpVjBRzyLen?=
	=?us-ascii?Q?uM5lqNWtf7iYV2OdFM4WO92ZBRqouyzL10UVLcWNWmtsiY+ir5DjmleTKBgG?=
	=?us-ascii?Q?Q1aDW4Y0UI28Iz+yOWCgey0v135oXpzm7jSNjGthq8knF6usCqxZeJmFtTJl?=
	=?us-ascii?Q?zgK1fo8OBN9gl5Us5GR8RWND6xY5mynG8gEJl1a8/7nMJOArQ5VMjildU3YC?=
	=?us-ascii?Q?7XPJ4NITD/CbIWq1tbX5m0K+HiMP77MUHCnRgXn1RrnkIHb7B6CaUkc71sSJ?=
	=?us-ascii?Q?MgWJ3UfWQxT4fpoEfwI2JQS9dR8OPY3Rgz7+eEnCpZhXN8qYxxZJvZAcGWX8?=
	=?us-ascii?Q?QpfZrdYBByc0E1fQosF1tTDeVTJ+SY6Dbv8G+QIeFACItypm5Z6BeqYrAKfF?=
	=?us-ascii?Q?g4bLaO2ehGW/6v9ndQ1y1agFXygsnwD8jG7jwdlG6ifW6xpVRSu1jwpoIaHB?=
	=?us-ascii?Q?9GHqPlcXYpCZDLlrIlUiO3CdlDgI0NSJwIPfdIVUQmUZl9twvqM6GFwPPatA?=
	=?us-ascii?Q?Zo//x4ONNFhCM9abm8grSCg9pybc6oxvnupI/RAspS/ftPN4VRItK4aZlndQ?=
	=?us-ascii?Q?ZWWXQ65zmcnro1zT6Pn3CX+I4r4jIinpvn6OqLcbxyK9uNuL8XRfaCh2aPlv?=
	=?us-ascii?Q?C2mYL4NRyvP8ODpH3XnzHYENQBl+fjRBk5+s37EmZ6OfmIe4fEzAaRyCBtDB?=
	=?us-ascii?Q?ZyAAu9zcdkOUBSidsm09ZttfNSemmNK2Ij7GoxIg0kDO48zrmz+VSy6xixrT?=
	=?us-ascii?Q?6DHtYP418D9MD89HqBvrNiI6ex2h3OF2eyJOY9jkqnt3j/B6tDg9yWRwbZEW?=
	=?us-ascii?Q?ZVlp0CaYXKmYf2KX44/WoCv+aRdoP1wcBn1hMMjWGh8UxOaRGFgih6bOS03w?=
	=?us-ascii?Q?3nhz4fSzZHODco4gMqi0+ZYcMRM9YI8664NzK6b7qgLAAL06W98NwifK3kKN?=
	=?us-ascii?Q?Fpyf6Zcjq02a4OtHcPGSLYAD44Y8qrT2g4eWTtRXFtwNx3TUMJhlDKBDzMwP?=
	=?us-ascii?Q?S5f+JIXwukWE5hk=3D?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(575784001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(107886003)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:rxGk8RceDfNoTLb/f9SQo7yb1zyCKDMKISqR9nB?=
	=?us-ascii?Q?1muPbsqqUZCFV2Y9q7SSUgEwLYh9jaXpjc8UoQxM6PNpbQxbdvfj+4y82JAs?=
	=?us-ascii?Q?NjiT8bcDLSLBQTR8JC7UC7Ns4TCIvCuJiTKeUp9RQz1H0cGjXeaANd6LkBcC?=
	=?us-ascii?Q?GtEvnBhLtbbuLFNb22Rl/yaOwzwEtbd0zgT1w4PURfEdK/Ze3lO3k4qrVDHu?=
	=?us-ascii?Q?HM2/SYYhFEJGjhUDJzUtbPOp+3JDMfMhhdJt1tKgOd68zmu/wqmxv9es62Vh?=
	=?us-ascii?Q?YTp77+Im0wHBhkCyekrCBsfHAEEwjwPUFpOBO2Bir0boUmRZ1ZnmxbB3D23J?=
	=?us-ascii?Q?nb/5j7w0Y+1IxfSL5rCegAm/ZPrZlj8u9yKmEEB+0qnBTmyF0diZT2/7y/wb?=
	=?us-ascii?Q?XFBP/PVao+bumU6lOSqCOcWYa5+1+bf1rkJgv93GlogLimSbwtve94mElOkY?=
	=?us-ascii?Q?eXwPEbqddDJaYAOnF50pFwP3oxQrwKBH0sqfl3jzhqRsCeWzK1t+Xtl6Cyuc?=
	=?us-ascii?Q?QgdkagISWwoKLCPqPN3/7BXi0U2FFS6LblZlWO3FJbUUR+yAo+Sda9JSLP6c?=
	=?us-ascii?Q?Mx3Iyh1085x6NG1GYOWAbbGlwZvaAq6NUs+oRnF5EiIq8OQ2rjtuwQYdICrt?=
	=?us-ascii?Q?MqzAV3W5tVl3yVPqJoUN1FGnlo4oxi/fuROEdl5lWvNuDBryH/EwM3C5VVm2?=
	=?us-ascii?Q?K+a8IkCz+WmgYrLLSpVhRpbIBo0NIFM7Oq4KsUIjve2Zf6HHifYEt2MAyqZa?=
	=?us-ascii?Q?gACcxHKokP7zemEEMQ0HcKcInooS+UOF+zoKGzRc0WWw2Al2ROEfO2npfOvy?=
	=?us-ascii?Q?ibqnkqpMtvOg78QqByvtULQ8DqHvHiH1bxu2ErBd4K3YC85almNZbmqClecs?=
	=?us-ascii?Q?QfQKlV6KU4l5MmjcAjW4J+++S4vvVEqlzDy8Vqw/AYaE7Exiw2hFbi0ZzGpS?=
	=?us-ascii?Q?U35OGoZ0i+sPMy+3Okh28OQRUbOV1Yq4nZHphFXAwdyO7Kh7YEw5O/kOlWuf?=
	=?us-ascii?Q?QZcAJRQQjJmauJvgNnolRd4YH0SGLpdXJeAPHsTOZFWo9jDzQIWYufG+G5HL?=
	=?us-ascii?Q?whHAASiTIMDLnFuciVM2JQGNGv5SzaCvs7uqZFLBwoHTewUT4oeGrMdTvfKz?=
	=?us-ascii?Q?CYsEW2RREm8k=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:Fyi3yT5HCJ1Z5wMa768XIUAZBLn9uzoYfuFYNn1l?=
	=?us-ascii?Q?renpFnJkFW9GP40PkJX4o/cLRb0wGQgxYqDnelt/ZvK6oyeGF2AKAIul6taY?=
	=?us-ascii?Q?e/pWGbYIREyEpor1oGWR0tpqS2mSicr0RgZq739DLrEBbV45kcj9jdlGNfLx?=
	=?us-ascii?Q?JiswRGUswgrhKPr5q7LQro9FODRQjRnKyMJdrx9DrNsO4jFgDY5Paka/ntf1?=
	=?us-ascii?Q?TxI3l8+ov3XVztlb/mkuUA9OOE+8Cdxduzy3hra9qLzmA1fAOVSCzzho8ppt?=
	=?us-ascii?Q?kjMqX5hmHAQ7n/WuQMTywjIlVvEIXibXARpx7r49+YpcErfeNDGER0HPejnR?=
	=?us-ascii?Q?rooCytSrfrRmN0HK4o9tA9pcs3GItsNmGvGHMwSOxr1i7uFwHKoNLjZjCy//?=
	=?us-ascii?Q?Iexyo6u2p/yqYPcdbvZDyaDdJgIjvcSCJl73u/ZPxkOI6oqzZni/vvAmcyS5?=
	=?us-ascii?Q?yw4Wqn/HIsXb8GMSZyQ5XnOArOtTMgQvzz4rBSjg/v3BYauCn6En9N27fbDG?=
	=?us-ascii?Q?OSKXaxnw/9eg/VVUXxWGcZmMaoxholGvTcq7kdFSxG60njK9zsni1ovdmUb6?=
	=?us-ascii?Q?vtT3S5E9TFHh4LAS1DzPgLDsi4aHghqZDsTSu13uR+SCHvQ/phm20tJBTmEo?=
	=?us-ascii?Q?597ih6xZtUsrl+kO+uyONVEsBX3GV007YljCiMYf3eEt+yFbEn8GTHZ7fcYl?=
	=?us-ascii?Q?oXCqI/2GDtb3cdHDhOJibFuIdj9QBzQkG0v8RaNjRyWZiVkiC5HJT/1gxOE/?=
	=?us-ascii?Q?H81tcptoFzL/S+9HsmPdQeGFmvNMWfh5vDZaUcaO8Y1eap9UfyqwxkRohBxS?=
	=?us-ascii?Q?7XPLL3X/bufo8fMyaeExKK+F+cw959Nf6rxSifoGQY6fSP0v7R1ALll3Ulx2?=
	=?us-ascii?Q?WbvylN/q+Hw9A5sWB1QUHnSrytCiS97xjtsvHYiNKmbBeNWIkrvNJt9LV8Mv?=
	=?us-ascii?Q?QI7HAiIq5Xyx6qA+bJYD6BtLy7FCfjFfP5O9bLGwikMo83It9U4is2dm+cjm?=
	=?us-ascii?Q?M+4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:WhYa8UfVUxm/+E0uUvQLV8hg2QC/FGV6m+WJEwnIOO/tcaEQj1mywjsw7W7eHfcKZaC2JCzKGlOSlpKsIzwgsLCW3lvWl6YRONE/9WlQ5NzWpqNd7t5J/rEkZpTUbVOOvPnEabWU6kVKoAP5Djd928xAPjgTdMElcDvWmHu3fKV6DDqWUF7AzNJZ/OheX2qycinPQdCs469DC4WSOCzclWDSp7ACS4y8m1tF+ZIeMRawjMdGwrTgNjjbRvbJx72YXbQ1gmSmfmufI+Lr3ywq5jHMMa0Gxee8yYpDmVjS5S7QwLacZ5SGBq2/OqUCNDQdVe8MgB3x57euH5QPe8plvNvInJsb3de+7h6nsxw3xyGnvouIRz1bgnd3nYP34uoSbdXvMQvxEoqR11cf271xYuMJMgT6h4APO5N52xD065V9Idw0EaV+cU1wFA0q2QW3VeS0R9flpjxn203K0IfMyMoDOg4zpGQ0gemQxr//JDHc4XICDclk49J29nVbYkvv;
	24:XoE7io9EyQU4aVW0SYiOiqZiJcjDRJv+rwb1JIGzOY0dc0Ol+Vbdw8dFWE6s54xUBrR8KFbsIucl6cKYIHjELWwOZJdfJ6Z/14cM+z+PmLI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:KH0QmFVp7wV5Xgols+sl4kn3hWVI++e2S5I+yaAMFnjCWtGeZ61bLH77CuRzTFcoLg5H9SmiSfu6/fMwsifflSaa9pmWGhEr51mI4oUAdNgLgALJN1xWR9a4k1xZPYd65HLYb+/Tn/444V4LPqPjWN2zhvZ8KSwRp/qcx05+9u/DuO/OIQK3bsx6mB2+1BFZcrKLiAKT4L+yc+eqLK2jmdtb6YavoszxrUxnZETnAnl5+l/J89Rwd21cUw5D2TFF75WgHHDKR8B6OPfhJHpdWYe8xe6qSZ6MD+29ICr1HTN5lAq0yZkpjf5w481RO3XSJpflnhzL4ILXD8vTttKACiNT86laWtX95eHB77ubK3UYMRjQbqk4ltYV5G9b0tyZHqxQRj8cEwYKFdAxmAwbr+Sy4g4XevWQ4ZhoTAI9mhglmHpxG8w2HjV/Ga0xbsqVfCiCNGBcuVukItnN702DAbDSpB5v3csoQmyxFalFPYc9cuHAo57GP2gLxpyiA9tyTrJPZUUz9iuJ2mHnrKe8pF/avY00SnSpNMx9pEhDQYIPF1dJg6QevDfvy6NKMMKzyZXlyxFqbHiX9t1EsYjKnIcSeIP9I6eLPPs1WoyCNYKszFMd24LH/DiOQRMjzqEd4bTQVvNAJP1mbXuxEIH4gIkp0Vh9xhfmAxuh/tskY5G/nb8uU+81LFJUuUvMrp1uQylE8Y1nSCxYfmwfCqD0eE5Md/VrqHQDlWMCnVCGdV75SQ62x0MA+vVg1NtTM1Vvi5bkmKZzApYwEQWL4N8qhOICl0oqnQJT7yVLFhFxUWo=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:01.5762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 04/17] open-vm-tools: clarify and expand licensing
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
X-List-Received-Date: Fri, 23 Jun 2017 23:05:01 -0000
Content-Type: text/plain

Userspace tools are licensed LGPLv2 and the kernel modules are various licenses
depending on the platform. Clarify this and add appropriate licensing variables.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
index 683f34eee..1142399df 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
@@ -11,8 +11,14 @@
 
 DECRIPTION = "open-vm-tools"
 SECTION = "vmware-tools"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5804fe91d3294da4ac47c02b454bbc8a"
+
+LICENSE = "LGPLv2.1 & GPLv2 & BSD & CDDLv1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0eac46f0b7886425d7faed6aae5aef66"
+LICENSE_modules/freebsd/vmblock = "BSD"
+LICENSE_modules/freebsd/vmmemctl = "GPLv2"
+LICENSE_modules/freebsd/vmxnet = "GPLv2"
+LICENSE_modules/linux = "GPLv2"
+LICENSE_modules/solaris = "CDDLv1"
 
 PR = "r5"
 
-- 
2.11.0


