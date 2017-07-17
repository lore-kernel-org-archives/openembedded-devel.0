Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0049.outbound.protection.outlook.com [104.47.40.49])
	by mail.openembedded.org (Postfix) with ESMTP id F2B8960670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 18:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=TsPds309fD5yQskiAapwq050kIWO7bo7VDxjY4p5w3o=;
	b=YlsmdwUzcCMzOlepJDO9qc4HG5eXeRRgcFYV9uqOupefklnB3TlJLzg2pSA8cBgPiTNbs5FoAX8Cbbx+GMI6NUMT4pyKxGCDLCHXuEhTEpXe0hJVWMa4NMq7DTaIPh9NEXBleKGuwvWCiGYYz3jq8qoOjCfD7OoFNad5DtIsEzY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	DM5PR0101MB2937.prod.exchangelabs.com (10.174.183.12) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.13; Mon, 17 Jul 2017 18:21:46 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 11:21:25 -0700
Message-Id: <20170717182125.21329-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR14CA0025.namprd14.prod.outlook.com (10.171.142.139) To
	DM5PR0101MB2937.prod.exchangelabs.com (10.174.183.12)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46224e4f-7190-48ce-cfb0-08d4cd40af0f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM5PR0101MB2937; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2937;
	3:UQ1F8KEnfoJIPc9DAuZ7TsjM3xM0I1hybnRJqcDz0G7yoLCLOceMs5lMlkoe6qom13BDJGaib1eoh82jBs+yuTIHvNWi0qcWZ809puDVTd69yVBsrZUgAtl/5dEgg8+2Vu+oIUe+cj6HI+yEZwbsi4/ZOyDHvNvyTgcwajN7TgtlYZwSqelLouYEVxEGYgKwT6i3WUk2nL+G1WVS4vRy+1ZoqvsWWDh7Vnd9+3apgUvOi4I4EEZC8hvxmEfTdh/bStb4WI88o5FOb8WThRiM2A/vZrdNhg71y1Dnny4iIeN3nyQ5UYrfN7RD+nf51MLq2HSnesKFpU/BTS6sCiduXglmHwyHL0d1Xl6HaB/WvgJmyqng7j2JB8Xy2uYW6w0olXy8kgHDC6HYeuVK1CDs5ztkOdFQGYhpG7SZbz5j9YOSs3NIfQHWVNFVEgMXGlpXyOb1gcaV5M/2mWqoPnDKLdEbFkmvylljG/r5JWTOXqPDzqUxV0dlNA9SYi7xvG3sfeyvc+pkZQSKu1mPncpFCERjcJCDhOXo1/ZDAY5wUteUsfnL1cjyP3doNZzfiCeh/5UcBp/2LdsA4UbS5SB4toQjk1cvcyP4yS2JiQGKmS40N1oiADjR/rDKdbDIBovov9eDm4y4SgQmQ6+JyfCz/3v1OBT5/HPA+QbElfKx9aapuQaVPXlsrkKCgbWMneWyW/CG2hQGkS1t6c6oB2hihxfRBBashNqut1mpJEjmxYA=
X-MS-TrafficTypeDiagnostic: DM5PR0101MB2937:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2937;
	25:HhVIeC5SiDQCk2+LULuoY0DyguhxTOTZy8YSwl23yDfdmJodqBOQHejEzjAAJSVr8O1VnGm0fekmuvyRMrXQ8s7hh362dS/UM1WL6ahZ++IJDqd1NY8kawXif/xN3ZrVYrSXTJ+iLRUQgSDEzR6okIdzj5m3rZlkfFDegybHw1fgNmGTRMtQX10PZyQHwrucOa8E3POHnYl/pO97IiTPmCeQtK62iUVvQYH9+Gjc2j+JvWK8Cgb3HeuSLBCcMHfvLhXG8eTvFQKG/eLA2p0N0ik0Nu4r22CpdUSCIWCtRqtipx2BdupHfnCifVuliE0yIuPq8K+zJ5W/WCVldmxmVnjfYlVa05VJsfockXbG1s2rU8UsHgIYJN32TnpujWjALUoZ02uyHg5pzK90AEGfxVfvMXSYV8AiV6QdQQkGUlxSWAON/PtVl7c0MusUMdy4FXd2AZ1P5aAeaPw5+HyyIWLIKu1XPri/c/ulpumPY3pkDxIahV56LnIk21YzupalfqJaUAYFs34KlG1CuPwBYboJrjhdkMCgDpMpKhkEiFbkC8FwECz5Db8EFnooeLIrI4+A/cqxK+1t1L+ZG5VbqYmwUWh6E3nm438opzTttghPPz9wifG/q/wU/ExhVFMKFPbLgLwAQLab8FSeUJtpm4aJuG0rRhGl9WfbTA/pEK/RM1MtgTFih1sSiZS9hbsYqOlo0I8JsVuDDbBMMJdapM7hrDuTEykYMSv691GQaRaoZ4T/SqBfvg3uO5bg7n4xDA8K0diDw9hbwMAnuTM+k8+lOycJkjpEsUB3PsONvqqngRqASbAFuf5r/699Sz4C0DJzYRKdkojPtrA0QSS54RkSbG+PP8nx+yTzmbQJYoL0SyvCiLPLMxoxj0DvNiEEmaMwgtPn+M+csyFY090URoeZ59weIbstpgR2LYe10U4=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2937;
	31:pzJftZVy0Iul1svdrsFJBayd/Z9KiUOC2YPj2IfXe8aBaOmAWwzfrkxod6v/DS/tiUeL5mkEwLEBYOPWI8y67xI3Agu98bEtvAfoAqWbOIrl/4vRary0w8lAcYq935lGslcF1mjM28ztGjhscRRioPs2Gc48JBa2LiiZcnD/AqsmiMtJf1TQgHWNC1qXt1pC5LXL8XB/HCN18kQJbNIu6e34YXqmIv3e8fnCHK9OpQt+ZBrWnQEIENP1c19FiV8eDKeQCQRIl0EiZsCx7B0bPrM/Cc7SNn2nRTBFw22Ue5FEKij70ysb2hWJ5tY1YcJrDsnGXVS5VvOioAX9ZPzEgjCjPeGqkCfUMdnqLPDKtKkZr6BPx3kYqVW5C5uqVTQ0xweZavXQx8xMvkYUjnyFdAhXvWVucn8CxYVweDj8gojnYBR9lznWooPANdR1zDFv3JwR6Hbj0KD5l0xfJZoLq6zryc4k3BCa6ytXZmLDmQ05FwfbOx0SuTB+lqmq/V3TCF1RgpLHKOowgSb6bzdT6vXokXMo5MmaNbhkRTPSyoY/TNfHkBvF5A7cZcT+sT1AdOkhae8BsQqS5Ii80u0o2DTa+iPcdfEifDnsDO3MjZ00+cC8ziZE9bEm4TMqfvVmuou57b6gGxY2jdgBHn1Vsq9k/DDji3kc1xgAsVXrils=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2937;
	20:ciFB8vzcoElXlJgORWKcGXf8JmPKCDALHrNL8qexk6EPY/chqFvn/dAPLtnGIjFTNQCDW9g7z1qfHVBc106SNzk1ZCRBQtad7CooGXlxi9blLJK9taQnuDyqsH1yRPx7Dnv3e5XrZgh7s5DKLwNZuoY62zA72XYzIGpthsrvh37My7J/Ia1QxnSpIJT6zhWCOKP2v5HQWagMwtqoXg2WEDzSDtO5R0PPWAJ+seTdQw2y6PJbeyyvdoi7AylHvxYmXHb4Swp3QA8SdN2gxn0UqWD7k3pmzAnVfX2sPjfHPBvXQkVLktdlqlIGDPG2JWk5KATg+mh04Y3SV9DiADNWraHHqImYgIVJ1haG0lGTtFoUGw1cErn/UWBu4lStuIhwHnSuMArmrqAR2ck5G5vxdY6GJUS5LAnYnTL7fSsOtJ4=
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <DM5PR0101MB29378A1B6B97668606A98F53ABA00@DM5PR0101MB2937.prod.exchangelabs.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(6041248)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123555025)(20161123564025)(20161123562025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR0101MB2937; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR0101MB2937; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0101MB2937;
	4:ajRXHiAZTCI9ZC1oJwF+7mpmnIyhYvfGJiasmiSI?=
	=?us-ascii?Q?9JDbKimDTbKZBRfF8K3lXdFhEnGfmBYjfsJ+FrXBkGWAQ/jI9jW24NE78U7D?=
	=?us-ascii?Q?BRyov2hVLkDFDpagzh3spztWTVhKcBuxV6WSJUYgF+0fUGPeNRXw7t8mUCIQ?=
	=?us-ascii?Q?0QDC1u57Zw+GFnuf0PAenpNs1DdKD3jKV9c/KnbuV0z1/OiT4HKRD8+iXt+t?=
	=?us-ascii?Q?IK9vILwogF4vMm26o3ZafYPtBTmui7rCKWd8zbYP04c5kSWSYE+lp3U6Wgqm?=
	=?us-ascii?Q?yU+uKHdx0OeS3smialoTlWnhKkKPs9E9y9wL2UVc1VYUWI4IZgRN5zo2oZtR?=
	=?us-ascii?Q?WVyVBDB/EtXf4nEuE1sLVXdthmY9t2I/eQjXp34z71aKyLgCcLGrEqJPJQiA?=
	=?us-ascii?Q?sppIJBaBmeWuMMukcLdkH3Syrb0ZYlVqcqfwONRqy5YRUfxRfkuun6PY6Dbc?=
	=?us-ascii?Q?4xJ4MRgIDzUpTLn1njBg6P1qll4a0F98v4BKE9RTKfmVtyj9qvF9cf2Rv7GZ?=
	=?us-ascii?Q?txACAjsdkDtBU+Ux93ZwR+wmFm+XIMNCC02OHLf7x1tEw1/JlwcbqfkipKpA?=
	=?us-ascii?Q?eu+1tLqPq9XGm4Aku7cW636ll71IV/N1hSFuqYr6eVi1LY+PLdk3EKdaHvvn?=
	=?us-ascii?Q?BMMDzIRTh1HOTvhNSMJE3udAYWfkux4CXtQkKB7xAre5jjzPhYUYE1x6r5PP?=
	=?us-ascii?Q?rC4oRFuQJLk9XkvC79ITfwdhLVIHtTEOv0N7VzqPLM2jUrIj1fXDZkGMy6ER?=
	=?us-ascii?Q?DSWddVmv/anRd6LB870f+zqTV77gyoLAvUdkP6wx7n2Kv/XaXMOjeUv0vZXf?=
	=?us-ascii?Q?Bjdmf+eJCgm1o+k5dginG7tYQfPXK+5m+aVVdF4HG4Pr5TvQ8T0YyE6g4Bqu?=
	=?us-ascii?Q?w2b8JyAy+xkUSiMONj0M9+7MhuzqOVoVpb+J5iCD0gSl2WsMF70m2PdF6TZy?=
	=?us-ascii?Q?D7JufVmvFi4FRZvUkz2FIjctfUkEOlrXH4lJD/wUYKf/Oi9Ti5tekj2x68QK?=
	=?us-ascii?Q?MBatEOf/+z2BGExMzSgkBrJxLlVXbZ61x6qsortjYobvLhiv4wKUuCmIGHVA?=
	=?us-ascii?Q?NrSVc3GshzdC0ObH/ivxlnSDAMYFEJ3AOcYnqdxAOGkOqRPXkwIFvHz//InU?=
	=?us-ascii?Q?7mUsHvXK+xw=3D?=
X-Forefront-PRVS: 0371762FE7
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(7370300001)(6009001)(39830400002)(39450400003)(39400400002)(39410400002)(8676002)(50226002)(305945005)(107886003)(110136004)(38730400002)(189998001)(7736002)(230783001)(47776003)(66066001)(53936002)(81166006)(50466002)(48376002)(5003940100001)(54906002)(50986999)(6916009)(6512007)(2351001)(42186005)(6116002)(7350300001)(25786009)(6506006)(6486002)(53416004)(3846002)(2906002)(478600001)(33646002)(6666003)(5660300001)(2361001)(4326008)(86362001)(1076002)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0101MB2937;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0101MB2937;
	23:Pj33sfi4fasPr0+fYhp2/zR+DX2oNMMUxYO0Zkl?=
	=?us-ascii?Q?zTLA3lUkJbb7Vzhzav/OtLBNTjJh58/h8PqF4P4wxFqSvIdYvQM2fwbNcCiN?=
	=?us-ascii?Q?zXDkpxgDI5LW2htV5MKe2WNr4m+cn3hqSqrF4tH7bCov3UzWLlaoylEpFeDD?=
	=?us-ascii?Q?utFLQIktYdlraSoOnd7QwqaiKooWakAw+LBoKz9oVhdsBvT/xfJsWL5BztHr?=
	=?us-ascii?Q?Fk3own/N3JncDHJaWurTgrOsLWvCrcmuxc6TIlyn3eXQvLrnu0IRQjqYaK2a?=
	=?us-ascii?Q?MF/yJLWepwDnl6DziTW0u2V08mxTW2qznLGcT9zhP/GmohBPCIfAaY3bxN+z?=
	=?us-ascii?Q?ZfXeBNrbE9Jq8/sOxMNNV4m64w6y0KNA1DtQlbvRivPjc9ohASUglPZyr2QZ?=
	=?us-ascii?Q?lZwxLCMAxyJjoFuTYwDwIe9Hsyp0zv2+g2DXCnuI1iB7CgKkbTX2sy07ejON?=
	=?us-ascii?Q?bXVAq5jC+mSSMZ1n0tGQXQIuWEpkxLunRrMCIDAH4ToLRNZiRG9v/xgSFJBb?=
	=?us-ascii?Q?edC/lg4BFOKb3TkSUq6V9nSdpF1a4iT5Hm+FjXNpvRVVel9x2YZetwc9Xkj+?=
	=?us-ascii?Q?8adsQJaNmRXVSiTJmbVozQAqzXxlx8S3pkZs3nUzhUwzbT7xSAq2bdR9Ev+f?=
	=?us-ascii?Q?Gh6h9rQKd8di308st7uzNywdyq+CB2mjam54jnpEpjnLncaUQHQme4wTfa72?=
	=?us-ascii?Q?5WCN/s5v+38fHvh8FYYHmai0eay3RsmjhK0rOEpnjCERyF8BkMjXoRh/hfaz?=
	=?us-ascii?Q?pI6dJj4EvG0Qf05RVQFDm0nET9wZXFFCeFY64K/h1NpdqwaANLKlA7ZczF6w?=
	=?us-ascii?Q?DsfPt702zTqwPM1ANtDi/cEmM6L1+uax1WYxycRKejsA4Gpxe3Pycv5vpKT+?=
	=?us-ascii?Q?Y6i/13neiP+forXX79wbXfpOdtIUzJ11C6oodKZ8jQoqBVcN/RuurZLTRGu1?=
	=?us-ascii?Q?opcc+cjGc2yREP21T9lFhpwP8XeMyVp6OcjbswAKTUHH3rREj+g9V9OwGHyy?=
	=?us-ascii?Q?pyBhGbq9GIULW15mMkOxyeLAJz2h7Bh0b7QGzTT/zfeiGz4MT38qUKp1ad9X?=
	=?us-ascii?Q?2kLJC4GnIjmRz7H7HAj3tX2SCWcncISK9DOm1AGgOcWruudS3LaEWC/OSTz7?=
	=?us-ascii?Q?i9N3jm+I067tCbm+FCsB3m08LcKB6DzA4?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0101MB2937;
	6:cVymrmqzpkKjphzB+K9xw1UMMVvOhz3k6yPmuuwH?=
	=?us-ascii?Q?fQmkNZN0eqN1ImC4prDVqC2D2DCMdKnNSjuXpFKuYKIDR+irICsxaEc2tefs?=
	=?us-ascii?Q?xjGlJOEgGALT09LmJiAnkjMRYknWTkA3kUY0s+HRuA8Z576myHboTEVDhzKF?=
	=?us-ascii?Q?3oDCMUJI2jifz20WB/XO6Nl02bJFroV3hBY9RjbXi412PIfhsPRyZPObPdap?=
	=?us-ascii?Q?UnBGa5YR8pqnH5IPqucjjYFnT+Se4d4oBacrCFXklLRVMuZ8tHQciHpV0NSp?=
	=?us-ascii?Q?w2+BULpdAhLE5aHqbN1TX15sj+1bUkw1N/oAAENY53nzEKvr3e0iboclduBa?=
	=?us-ascii?Q?/xV4rcoHY+yZbStzC+cbOITPevSFhlxpB1DxI5Vqh2XZ2dGNbGKPwoJwTPeI?=
	=?us-ascii?Q?fu45LtAP/vjVev/4OtvvBaCfsPzfjUpU5RXyS0ZBZGJFKEX/Ava41fySF1it?=
	=?us-ascii?Q?Qs4EjqNeIWY4N0NFohofxwNH+fQ9llfRyaPcFdxzLRcERWk1gGnok17iFz/h?=
	=?us-ascii?Q?b+Z/dk+Ohg2PTEqBd2G8JTdrpioo30VY0/QY2uzGnhi1taGqtm72+/oKvI4+?=
	=?us-ascii?Q?H3QzwYL9bnF1YVkdNLxdW3pI8CAekFODMoPeUTSWfdWsWfIGgD/6y+H9/swN?=
	=?us-ascii?Q?kC9rrpXjSVfM52urQ0urUPT6DCbcbAlwokL5RWwk+LGIeAYsWUyjrOeH8du+?=
	=?us-ascii?Q?XjKtnT2kHCbTkelLwB/Pnr3OlW23kyuAsYO0y9nLdhyi5uRouTQZgWBw9yz1?=
	=?us-ascii?Q?E7m2DuGkCRxFfItDPukOaHx0d64RvBUC4h4JKNuIKvBNwlPaSt0VqrXeWL/C?=
	=?us-ascii?Q?5sqM8OA4G8bbWEQZcIu8P1zHc+uMqV6kLpl1lUCvFtQkXaZpDK7DA7h43FXn?=
	=?us-ascii?Q?qR91HtETfYqPavBkP2AdsRK3P4Xfib2DlNovEac7YGFzxgNBQN9hPHPzG5CM?=
	=?us-ascii?Q?1eU7ZIf1mMzxxa3fKlxKb83BvjJE6+lvvDCYqHsuA67GlMxRnRipK4jwtOFU?=
	=?us-ascii?Q?pL8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2937;
	5:JK91LUosy6IaY8N5BKebOZy50CivngsxIYBmqyIoQkzpO0SsgBmjwSvaDOf/1snuv7BAr5kaxNunyN+g2E/iDE2RCd426l5CCxBZlU/t2BSNpzOFoK0FKYW+189wLvG1s9VE4TZP3/vcNNvwqRyiYlCuxncPp6vGiuhD+6iJRMAR3XLgHn1zZWpGA6AcOcSYBXHuZxtU9dteMcYIX9lXVjrkQg47dNLZxdB7+DXTvT+9tz0cRz8CiM+rFLcYtdM3YmFxClOl3xFr70zCAuepHyvc6MBBUJGqg5RAmbgcEOU8kaSVCQiLp7IPl29D+/jhHjk+6oFUlvpXY0mQpr0Z7CRn9C1a5L/o/4OiWkWHNw+njdcyh8FDEqhOL3eCG6llRYNj6dSKhly175BIFA/6fi4KPN7hXkj4gDQ935jQTpd3WblO48c8aPCD494TFsUieUd9ShePX0tijUW0Gf/oVx8/J3SF4cpC4KHkoQHqfrzluYcfoG+pc/4MlAXUow39;
	24:Dx7OZdTKnMF2kQIWpy2kDHJ56+AlLSMgd9i5+ey70AMkeDfV2aWLbIGAgNT3n71u7rXpxftjNDB+mChTuU1VgFh6O0/glN836+jFV5NOPy4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2937;
	7:l+qUhUjsQNKADTcuODYF4zFdhHbtcg9RjUus8V3SHyTLF4JU2NGA7uQJvxgahqZQwZwiTaAUIo0kJZPPgVT/i4OXksH0Z0HfqT53RWPO+6gb81m8hApvisBZHqypFQEa39Yi1nZUgnzMBQRK+OiUqePe3XPvB4KEE58wzAOQi88bZXVJmnPrQNazEhPTBctDAxhgW7dmSZOdWpi7ZRKv418NGrwIQDkM0kX6y46pav6hG3vgbzO9NmPGi0dWTHD3s0oNof/YIhx7kH1Lb5IkYPD7Nz3pjdt28FH/6I3zlgATeumDTFeiTrPZcrd0MmUQO51PpKQzKSkNF3urqmVSJJjqYee0K9KKpREfWxCfhKZSrZRhUhcChUkkd9S+5H57lSHIQwIV6acmxUR4Q+dTGLUn3JdGKzVoRedWEm0tMwPms8knip+cNepcL+PnxQRM4OFHiJGyb+7mcqZSyf+cMDt45JPnDZRydr9CDw2Mk+j/46BPBMvO/l7+O34Zpj8lnoFa4g7bk58nn/CeyRapX7Gam+XXho0RY2C9eqbNKwmLxRedSJSfDcN8YiB8nfniM59AuujZTP5U1ilpgxkDvkJ9bKRQedOecRpKr74Qh1vu3FCKlJjXGQrmhg07K5ogOeBppLqFLdv2yz9dquTDcB0c9L62fNwBYkfpMvCE/yjL6Z15OKOBlwnKF760+/ODBDUojfguT7Mi+gt9S/3rDmZBjP9YdBcCLaZ4epffvh4OKeg3TZYGkTykG/+4Nm/J3EKz+kBlv3aF2jjmZWr23HXQKFJ9k3QcDrvJyGoGA0c=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2017 18:21:46.2232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB2937
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH] open-vm-tools: remove custom procps logic
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
X-List-Received-Date: Mon, 17 Jul 2017 18:21:47 -0000
Content-Type: text/plain

procps is picked up by pkgconfig without issue, so we no longer need
this logic.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index 65fbfc9e9..5f93eb4ac 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -77,8 +77,6 @@ do_install_append() {
 }
 
 do_configure_prepend() {
-    export CUSTOM_PROCPS_NAME=procps
-    export CUSTOM_PROCPS_LIBS=-L${STAGING_LIBDIR}/libprocps.so
     export CUSTOM_DNET_NAME=dnet
     export CUSTOM_DNET_LIBS=-L${STAGING_LIBDIR}/libdnet.so
 }
-- 
2.11.0


