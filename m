Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1914.1793987667897398003
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Nov 2026 09:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DAJT40PC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5770abbce5=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6HrWA42673743
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Nov 2026 09:54:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=1GaigGSyO
	Ng0RbkcjaONdW9vblb56aqpmeaN7FWp4qk=; b=DAJT40PC7u2g1zCPn0rkCE/Rz
	U1kTG8TBJVEYcEsyCR5nWaNMA8B1ezlByyS4M5fgm5/TgFGpLF4Usxeht2lZmfxv
	9p+25BbhC/NAQ07xjFsh7gb6A1vTznprERk7F30s9H/RHuvl1CWlQrvTIbEjkVC0
	Qqdg0FtNCGfEbR0u1Y3nPd7YmptX+gTzxAWWtbpgy6QJrC8z6jUcW6CdFpVSI0Dw
	QZ7shHc7kQ/SBSpPeYwx9OO3MDTAeLj3/MN8Zdzm0gGGoerCpqXa9O2f18xMWROC
	HfqbXp8TjY2kL/eohjzldOVcQGjtgVCbLVPYzXgyKi+xXUKoPRszSLLaxiYyA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022135.outbound.protection.outlook.com [52.101.48.135])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hs3prhfs2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 09:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrBrIT1hQqPKSUBLef1Ij+xDMYf87ybWRrJ0wC2D+++jNRFC/cGjnNo7o7tw/5xzU/p+Z1xxAyRXfFSyKtn+/TyF6x2GcgRyRowMrETbZCZyh6xv4xBBm8//GVtJRY24n2KCKCB9CR/syFCLj6bOliM0pikg7+o95AvI9EEk8/sJSBFPNY4XOgEt1OBZ01Nyw0A0ADB0X3zZ13PnwVClUZtgCDW52PotI9ENnIgGvldMVeZW/K7Ybo6I5jFgPWWQphGcbY0JlIYQRrw16U8VhklveF9YjLn6jbmY/A133UendS5QEb3bef6oDQNW3uhBANCuLlp5jQKzadF7GiMSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GaigGSyONg0RbkcjaONdW9vblb56aqpmeaN7FWp4qk=;
 b=TFSBOrvaS+ybx46z1ML0+Y7ihJ1Na8MsbuKOB/lLsrwfRIeuv/SQ/f6Ju4qonAPSltrHNz699rrgbsEzryu+cUJ9QHpAa5f5DXN2tw2tDys8t+WLEggdyPyk9HgNL+cK5f4XEjPLIDsgejLYPpZ2JP2KGKmvP8z0A3fseshaHkodlmf7o6KxUEsh5K2Pj88Uz50eRxBW6FDlyzOVprFT42ys82wlT0rm3Vr9F/yZ6rpvLsrkVi2hPrPB5mUb/MYkINHyPDalLPnYUDfMADW3dO34jrpWxlv9xu1KuwKvzuvaMMmqmy3hotlT/IyyiZ9IDNJmIhz9mqOWMfYkQttZAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 PH7PR11MB6554.namprd11.prod.outlook.com (2603:10b6:510:1a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 17:54:24 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%3]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 17:54:24 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [meta-python][wrynose][PATCH] python3-pillow: patch CVE-2026-112393
Date: Fri,  6 Nov 2026 09:53:49 -0800
Message-ID: <20261106175349.1801644-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|PH7PR11MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: 4577d231-d2fa-4efa-b9b0-08df3c2efe2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|38350700014|260925022911599003|260925021911599003|260925021311599003|11063799006|56012099006|261021121427099003|261022115727099003|261022105027099003|261102123227099003|261022075727099003|261021123027099003|261009223027099003|261026140227099003|261028144727099003|10067099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: +DyIgh1QR/hrssCtxFdBnOHx8cIVtFOLCr96jLu0I+zUy9KoQuShx7QWWLKBid5WxnJSLt/Aq/uw4buRKDuCjZgcJWst+A8uxk4KkAq9QyupMQ7Yx0iK6FXASt78ywFzE8oLntRUhX3V3mBExaBWm5mxZw2yf2DEI34EDQzYK6gy4cbOkXFJSW91gnLJlzmHVA3BR5WMtA29LVT3mZqZlar74Y+/YvmPkU0DV2e+zKqyYzyMrBSnWCEaLrM788W9T7FeTcjksN2ue/a/k4CEXFAO1uQWUAOtgJgFFDVfoaE/DBTqztUx8AaR8OQJBPpXOCZbb/CGmnE5cL1LeRpNCNuXEeFnPKNGeXtuOlJuXWepKuJc+RsqUCUgNffjZBcHofiMj/qoGuC2VdFIGw1v2RioK12lv9Pu0cVY+/CnOct89cd0KI58xu02dPjeU1wWUMWVdPpzDTpvTdgth1xze0gRj2aHXfKcUu806oRTanR2kljuIithdUHingf4PRWtc5pYtrFeX68ZftVgM/xFdgUbxEbFb038HF71lPGPksl6CVNBLnRPR/gUnRlUH3utV/Wy1TEFiJYh5AtuZ1T2Ss+MZ3ZAQbkgGzxEIVvLZWs5xmdenvPzmsyfakqpdg8VB/Rj/sAzTAEUk5qYPParyWk6+L57EUtUKcZXyg0sotbHSGKRiMvk9/ds2I24higFL6RQrNzqKMJMxlnoSYW2K/YvUPERUB+Q4e0qctotlg0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(38350700014)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(56012099006)(261021121427099003)(261022115727099003)(261022105027099003)(261102123227099003)(261022075727099003)(261021123027099003)(261009223027099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hu31i2y9QaWn4QVZyhkM8PGn8i18A+TZtj4h7o3IE41PMkmFwzXHPjgAQboZ?=
 =?us-ascii?Q?1pMgGyMJ7brOcnlv7aNZ8/q9it5cpnEtJSslsk4mfp/AhaYRxjkMS5LUKDRD?=
 =?us-ascii?Q?oHfVp95cB1w+rCQLtT+SL3H/NTXqCzrfVfDMvhp0xOx5m16yWh/SdJkRbugJ?=
 =?us-ascii?Q?2UPFS2ggQ/8kkGsmMUJFtnvoMaNXI+BP7fh7ug5z5zrach7hXu3pZwGkHInh?=
 =?us-ascii?Q?BZx+oaIgUilOfquCMbl4jFTjvVbcN8u7lZ7tdCsrCEGPlBNszqGzG2je3/PX?=
 =?us-ascii?Q?NhGI2Pr5I0VQI4ZWy80mvffQR0XICh5UcYK0SQ2AYs7FG0ARY3jOPSGFIYBh?=
 =?us-ascii?Q?kJZrDohNhYEI1rCWdI5RnQrMloAA1kWIwHu+qv8ura8lBYwl8S0ShcvY79NW?=
 =?us-ascii?Q?gobrZXpIw1cBQjWY1WV+YjfxbPXD1cQtIbB0k9icZjwG+xtndWRip6eVEyRs?=
 =?us-ascii?Q?1sBqIriHDzfmirFXJmysm9Ett3M1ROc5Eri9kqHQ88ENi3/5yZVJxEWsv5ks?=
 =?us-ascii?Q?k97Q4WFfyUC05FKDqyAuxsGN0l1iLHV3U8mL5gV9YawQrGReDC0sDu9BFT8J?=
 =?us-ascii?Q?WQswgA9gKqKk/N+kPKY+xiwqHHOgzNH3S0jXjzuXmth0KEK3pGCnSXlwFn0I?=
 =?us-ascii?Q?CxekgV6WxYHnd7ZAL/FfifKZANVuV5bRNo6AWLUMlKpZ/1iFhMlICTbFvoh7?=
 =?us-ascii?Q?WYf/F/RN/14r4uqc7DEy33mzKM3Kp7y9qQmccq1+pNexQYsN8jvMUT/sLQpN?=
 =?us-ascii?Q?A1dTYsMDJRFJqozXMwD4illxSIscAtUZFkEIbJZK3XiDoUYDfHhq/EFVu2AL?=
 =?us-ascii?Q?MJkhgSsvYft9s4d1rsxhuJe4Z581nHpz5iyFevz6TyhfSqlVigXRYmWVZoPQ?=
 =?us-ascii?Q?o7MdLxyAR8to5CZO62AskSFL6oCVx1NMXqiBhFB/iw3rOrdDvC8cWvQ0anSS?=
 =?us-ascii?Q?3rsmCKxssakm25sf52Q8q8oB0x5nZ0cTvPEtIF+48TrqOPjeWTS5ur1dscdc?=
 =?us-ascii?Q?/GNMeia/5EVFZX9CuysuWlHpJmGlH9HHapHhnb6KcZ5tVU+zAafG0EhUBUYm?=
 =?us-ascii?Q?NsjosaIDWIJl8DFWwJB25ZXgH+7f2qjZo3aaYeh9saAeSs7hjr82pIFGZSnm?=
 =?us-ascii?Q?rJB0i5pOf/3+BpnyrGOHp5123QqBeVgtzGzPKqhAIUqhqlQ8Wko1OL7IF4M4?=
 =?us-ascii?Q?kZgEZRy5xUn2Z5kQq2bNrqd8JP5d8Z7eYYC0BhmpskfZII5OTXY1qNTxTeAX?=
 =?us-ascii?Q?gCZ9DlqDPnYEMXZdWbFBzPcBgD0ZSF1wXiQgG8zASI3ZxnOYt6iG38mJKQIn?=
 =?us-ascii?Q?8lC7WlDgy9CaC3pdpTEQkKQzumiRBxfyICykP+fvDbqmgzi4yuZf1kAKG5Zk?=
 =?us-ascii?Q?/gGX/Zb8P3GUaZca9n+IrT9mtwmluy53KkVG1tfnpuetJS5HeIpaq4vS6hux?=
 =?us-ascii?Q?gh0R/br4FbiZ2gWRV1UtjDGehhjxcbnCyRAt5mK9rQSv5zKx5hLbf8ertdeX?=
 =?us-ascii?Q?gDhrO6uHNitDSa2wGx3iVdvE7OPrbYoxp6mEIIvY8YeJ1pJMX/Op18IM2YdV?=
 =?us-ascii?Q?54i9jjYJN05wNF4lhodqCIO2DkLr0rYN2Ar78swShiqhr2D8rXACMvNShAFY?=
 =?us-ascii?Q?BtiOxB7fhIM9VcluknoUarjI0RGGAjywM+TGPBXlA9BXX1P58DiVQhKoil2+?=
 =?us-ascii?Q?Kd5mZQqhgkIMVJUuKiBuN0C0vy30zR79swIZVAuEZOuLmjfLRma5L+p0LNp1?=
 =?us-ascii?Q?z0RDoB0so/uYZ8nMCBlGfO9y+jXBuMQ=3D?=
X-Exchange-RoutingPolicyChecked: B2o4hWf5PhSUj53gS1pJqdTBDPySZ9PyfygJR7OHdRz1meQHThTeEU8K+wjrY2q3FAy5bWgkcvmPUJJSm9InYL28CnkA/sVDau3sYKZp1kREXlsSPGVZ03AQbjX0CZTYSMUngZBDJZnoS+QPEOdZaw11MI1200ohMuHs/aU1k3Sgu6V3UJpiACNH9WNxEFllL44qejhBUwWHLW+TZ+0y+f3fCFeuo3ed99azA4dJk4v8x9naITkiUD5E+w9GD1CJSxjxL3XNsMOxNN8RqXtYCaQseSlnUbE3sXEeHGSKVj2Rhd/LNgTPZBmuFsg7EUa41sUFs8Fsw6/CsS9QBSKWLA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4577d231-d2fa-4efa-b9b0-08df3c2efe2e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 17:54:24.1601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTyH9iCd//I3x4rkSzvgqOIRuZlFGtxqhBL5UIjvyVnqvmvAlJYvK2LMAIBDKRFRupBzKjiqS5ABxWQMoqNvAfkTS0/ckYqCw8r9Q56QnWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6554
X-Proofpoint-ORIG-GUID: el-K5lDoRiVzWX3w0GFGWrPGF6-OXih4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MSBTYWx0ZWRfX1lp+nlzBrAvp
 mMdMh++OvjHI1aHpjNMb7J0jqtaKhjVwfN6HpL9wrJqRLgPA4ADQ/K9MSa+9cLBJP/EWgLIHwOV
 thPsTDWewVPIOghlcDfYCbPpNv/+YEWfriXZpQdSg7YdjyQnSan3
X-Proofpoint-GUID: el-K5lDoRiVzWX3w0GFGWrPGF6-OXih4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MSBTYWx0ZWRfX4DXpmvbQlPLZ
 e/mz5DeEKNNHO96Ze11rIhawGumBbLNfhj555O1jH2MpykgWDNP5TvrFffh9A01TxlcZlwlW1kl
 gy2EsGJdqe80YR6kkR+3+OCkLORUItLjlqI1kvTrnc3lSVZyWDGGIdgyUnURHAYz8Dfy3orjrwo
 J1BsTq+GEeCt/XhCWHd/9Shb6Db+GUTIUj34O4uwHG7sSKRtPdKABViWgLkos/ChOp+xFaiMGWH
 Ulb2vF3msUNEsCckiIJZU5VyGCMm6bebGKlv0Xmrr6oCW81/8/faR0AEsom+TPopmkrzjtX3qco
 p9e2Efp0AY3dR4msNBgX7/pYFYDbL14wA+uKtn8CFdjWX/xjBFxEnT31+xvyOARCNj1iE4ub79Z
 E98R4Mh1GLir/c1f2mZljmKj2clhuH0aosDodFx4W2voQe82zQsTboloTTLO8RjWNEoElGQl0dR
 A8GlRBUwjLLhdbtoeqA==
X-Authority-Analysis: v=2.4 cv=T/kZ3PKQ c=1 sm=1 tr=0 ts=6aee1452 cx=c_pps
 a=t0r2+/30QIHS/RTi0JYnDQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=FvlJRdF6AAAA:8 a=6gl_cCoBAAAA:8 a=Gvz4uYy1kyGDn9j8a4AA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=QLZTDCKk5HCdsrdKW35d:22 a=Bor9z-CvbNo2M6AZn8_k:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 17:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131972
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix given by the commit in [1]
to address the issue in [2].

[1] https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08037f77465a61d90633f669013f4
[2] https://github.com/python-pillow/Pillow/security/advisories/GHSA-332p-7hrc-92wf

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 .../python3-pillow/CVE-2026-112393.patch      | 124 ++++++++++++++++++
 .../python/python3-pillow_12.2.0.bb           |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
new file mode 100644
index 0000000000..cb9be3b33e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
@@ -0,0 +1,124 @@
+From 9b693ea929423da2bebef5523881ae3850c3877e Mon Sep 17 00:00:00 2001
+From: Jeffrey 'Alex' Clark <aclark@aclark.net>
+Date: Mon, 12 Oct 2026 21:18:41 -0400
+Subject: [PATCH] Fix heap buffer overflow in _tiffWriteProc when saving TIFF
+ to BytesIO
+
+libtiff seeks past the current end of data when writing the directory
+and writes tag values there. _tiffWriteProc sized its realloc() from
+state->size + size instead of the write position state->loc + size,
+so the first out-of-line tag value written after such a seek could
+overrun the allocation by up to the size of the directory. The bytes
+skipped by the seek were also never zeroed, leaking stale heap
+contents into the saved file.
+
+Size the buffer from the write position and zero the space added by
+realloc, matching the semantics of writing to a real file. Reject
+writes where the position is still beyond the buffer for the
+non-reallocating case.
+
+Reported-by: carlini
+Reported-by: Tomer-PL
+Fixes: GHSA-332p-7hrc-92wf
+
+Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+
+CVE: CVE-2026-112393
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08037f77465a61d90633f669013f4]
+
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ Tests/test_file_libtiff.py  | 36 ++++++++++++++++++++++++++++++++++++
+ src/libImaging/TiffDecode.c | 15 ++++++++++++++-
+ 2 files changed, 50 insertions(+), 1 deletion(-)
+
+diff --git a/Tests/test_file_libtiff.py b/Tests/test_file_libtiff.py
+index c9849a056..84e4299a1 100644
+--- a/Tests/test_file_libtiff.py
++++ b/Tests/test_file_libtiff.py
+@@ -757,6 +757,42 @@ class TestFileLibTiff(LibTiffTestCase):
+         save_bytesio("packbits")
+         save_bytesio("tiff_lzw")
+ 
++
++    def test_save_bytesio_seek_past_end(self, tmp_path: Path) -> None:
++        # When writing the directory, libtiff seeks past the end of the data
++        # written so far, and then writes the tag values there. Check that the
++        # in-memory write buffer grows to fit, and that the bytes that are
++        # skipped over are zero, as they would be when writing to a file.
++
++        # 7 distinct bytes per row: PackBits emits 8 bytes per row, so the strip
++        # plus the header are exactly 64 KiB, the initial size of the buffer
++        im = Image.new("L", (7, 8191))
++        im.putdata([(i * 37) & 0xFF for i in range(7 * 8191)])
++        kwargs: dict[str, Any] = {
++            "compression": "packbits",
++            "description": "D" * 65535,
++        }
++
++        outfile = tmp_path / "temp.tif"
++        im.save(outfile, **kwargs)
++        buffer_io = io.BytesIO()
++        im.save(buffer_io, format="tiff", **kwargs)
++        assert buffer_io.getvalue() == outfile.read_bytes()
++
++        # odd-length tag values, so that libtiff pads between them. Large enough
++        # that the buffer has to be reallocated
++        im = hopper().resize((300, 300))
++        kwargs = {
++            "compression": "tiff_lzw",
++            "description": "abcdef",
++            "software": "xyz0",
++            "tiffinfo": {315: "artist", 33432: "copyright!"},
++        }
++        im.save(outfile, **kwargs)
++        buffer_io = io.BytesIO()
++        im.save(buffer_io, format="tiff", **kwargs)
++        assert buffer_io.getvalue() == outfile.read_bytes()
++
+     def test_save_ycbcr(self, tmp_path: Path) -> None:
+         im = hopper("YCbCr")
+         outfile = tmp_path / "temp.tif"
+diff --git a/src/libImaging/TiffDecode.c b/src/libImaging/TiffDecode.c
+index 72e0d7b30..e21327f02 100644
+--- a/src/libImaging/TiffDecode.c
++++ b/src/libImaging/TiffDecode.c
+@@ -88,10 +88,12 @@ _tiffWriteProc(thandle_t hdata, tdata_t buf, tsize_t size) {
+     dump_state(state);
+ 
+     to_write = min(size, state->size - (tsize_t)state->loc);
++    // libtiff may have seeked past the end of the buffer, e.g. when writing the
++    // directory, so the required size is based on the current location.
+     if (state->flrealloc && size > to_write) {
+         tdata_t new_data;
+         tsize_t newsize = state->size;
+-        while (newsize < (size + state->size)) {
++        while (newsize < (size + (tsize_t)state->loc)) {
+             if (newsize > INT_MAX - 64 * 1024) {
+                 return 0;
+             }
+@@ -105,9 +107,20 @@ _tiffWriteProc(thandle_t hdata, tdata_t buf, tsize_t size) {
+             // fail out
+             return 0;
+         }
++        // zero the new space, so that any bytes libtiff seeks over without
++        // writing are 0 in the output, as they would be in a file
++        memset((UINT8 *)new_data + state->size, 0, newsize - state->size);
+         state->data = new_data;
+         state->size = newsize;
+         to_write = size;
++    } else if (to_write < 0) {
++        TIFFError(
++            "_tiffWriteProc",
++            "Invalid Write at loc %" PRIu64 ", size: %" PRIu64,
++            state->loc,
++            (toff_t)state->size
++        );
++        return 0;
+     }
+ 
+     TRACE(("to_write: %d\n", (int)to_write));
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
index 33fd1d8872..f1d5b66434 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;
            file://CVE-2026-59200.patch \
            file://CVE-2026-59203.patch \
            file://CVE-2026-59205.patch \
+           file://CVE-2026-112393.patch \
            "
 SRCREV = "3c41c095064200a02672d89cc5ff629eaf4b0d4f"
 
-- 
2.49.0

