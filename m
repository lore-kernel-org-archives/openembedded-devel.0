Return-Path: <johnny.karlsson.2@volvocars.com>
X-Greylist: delayed 3579 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Apr 2016 14:41:46 UTC
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0142.outbound.protection.outlook.com [157.55.234.142])
	by mail.openembedded.org (Postfix) with ESMTP id BDE7C73211
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Apr 2016 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=volvocars.onmicrosoft.com; s=selector1-volvocars-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rJAxpZ0D3FiLLEJ9vdxCD7p07qPFa7QQLJzxIbSiWfc=;
	b=RImi/8S3LpsBjCFbQjprZ+vP2Au6vy/pM7rtmonm4VTdwOOFuqGTVrZRk5ti5TM6tLP0fkas456U/uElYv2tELnM11CSO7jLVzICliPo5WAozD6cmFsWRD/r9kp4GXxfUykIh6naQ8XAOPdNxSU/okl5jvZsDOz/spV+hWr+nXg=
Received: from DB4PR06CA0072.eurprd06.prod.outlook.com (10.162.49.40) by
	HE1PR06MB1721.eurprd06.prod.outlook.com (10.169.121.19) with Microsoft
	SMTP Server (TLS) id 15.1.447.15; Wed, 6 Apr 2016 11:08:47 +0000
Received: from AM1FFO11FD002.protection.gbl (2a01:111:f400:7e00::193) by
	DB4PR06CA0072.outlook.office365.com (2a01:111:e400:9866::40) with
	Microsoft
	SMTP Server (TLS) id 15.1.447.15 via Frontend Transport; Wed, 6 Apr 2016
	11:08:47 +0000
Authentication-Results: spf=fail (sender IP is 206.191.252.84)
	smtp.mailfrom=volvocars.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=volvocars.com;
Received-SPF: Fail (protection.outlook.com: domain of volvocars.com does not
	designate 206.191.252.84 as permitted sender)
	receiver=protection.outlook.com; client-ip=206.191.252.84;
	helo=050-smtp-out.volvocars.com;
Received: from 050-smtp-out.volvocars.com (206.191.252.84) by
	AM1FFO11FD002.mail.protection.outlook.com (10.174.64.84) with Microsoft
	SMTP Server (TLS) id 15.1.453.6 via Frontend Transport;
	Wed, 6 Apr 2016 11:08:46 +0000
Received: from AM3PRD4001MB017.050d.mgd.msft.net ([169.254.5.221]) by
	AM3PRD4001HT003.050d.mgd.msft.net ([141.251.88.80]) with mapi id
	14.16.0505.000; Wed, 6 Apr 2016 11:08:46 +0000
From: "Karlsson, Johnny" <johnny.karlsson.2@volvocars.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH 1/1] Add simple-mtpfs recipe
Thread-Index: AQHRj/SvoUcL2ofsWEy1kG9pHdHxUw==
Date: Wed, 6 Apr 2016 11:08:45 +0000
Message-ID: <1459940924.3110.8.camel@jkarls39-Dell-Precision-M3800>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [141.251.88.69]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: AM3PRD4001HT003.050d.mgd.msft.net
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:206.191.252.84; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(586003)(3846002)(1096002)(102836003)(6116002)(81166005)(19580395003)(92566002)(54356999)(33646002)(189998001)(66066001)(19580405001)(5004730100002)(33716001)(1220700001)(86362001)(103116003)(47776003)(110136002)(107886002)(450100001)(229853001)(50986999)(22756006)(23676002)(104016004)(6806005)(2906002)(106466001)(50466002)(106116001)(22746007)(5890100001)(5008740100001)(15975445007)(2501003)(11100500001)(2351001)(2900100001)(85426001)(87936001)(86146001)(105606002)(79686003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR06MB1721;
	H:050-smtp-out.volvocars.com; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; AM1FFO11FD002;
	1:4DLkmgu+YkDdmBHT4+CgVDYivkUTL/q8u123TbRI0XCbp5e9q5HmOHctF0usMOVDT/XFkJudQyki+i15RyQ3jblCuLfuEDaTlwpJ5i5jIT0zB2lnwaZm65mJvShs0KsMBqOAvIyw0ySZumJO+Rylprvp69fj8Il6bK9ka3myHefCZn3RYhncphFEvGONLk8aOLcyglTy2+HzQX8OUhqa+iVQyrr0AknXEsohKH64f1x9JClCqwOFYN7hHuml0MqNhtsEeahwwAzscWzlN3o2wkiikzevBrNBEm9Bnyu/b1U5ZGZecnpc+BIu0IKzRmSsS8aKRRQlx7WEINkXarlfuIHmdiuwO8JQb4K88TOLYWbZAcKZCIuyHBo92r61qK/arxDjojlsRDuxyO40/QH35veLE2bo+6xg5I6mrUx4dvP9Ah+zqjOuK/ziGi8yym8t
X-CrossPremisesHeadersPromoted: AM1FFO11FD002.protection.gbl
X-CrossPremisesHeadersFiltered: AM1FFO11FD002.protection.gbl
X-MS-Office365-Filtering-Correlation-Id: 7a56ab74-f334-47d6-2ed5-08d35e0bd2fd
X-Microsoft-Exchange-Diagnostics: 1; HE1PR06MB1721;
	2:Ty3KBpZ0Df+CerXqXNTJ+hYBFtvNFzK6Q4CLvJkxAcYnRWeG0JlhKwy0clptbNl8AksTlDz1tMM5rRuYiePokDd/lahz9I5wSWP4siBnJ2e+rlJJMo3BwaWIS+1fiyxCe9HdvEurSjkfshho7jcg4UbdbmISpJqodrzJRfj8X2o99hXxvHjGeJqdI1xSqFwe;
	3:7XA4guobmJ+yW0mznZMBfN1+SSyuIdmdmRXuUMFSQ6/UFnbBCF5wZxIvhGwFbYfTBufJpRhpYCDrexalnOAsV5vcHk0vHJT8J4mGTkqAjwI5JxwoC5sJCGxp8nSo1mSil/aG8HYmuV4UJ8Vbq05ocFAixb06GTNG0EF6rZ5xHLjiONTp7FYqVYP+DZCeqx0TnE4tILB9FFrdU8qjaBI8ZnoO2/8puzmjoGe7IHErz7w=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR06MB1721;
X-Microsoft-Exchange-Diagnostics: 1; HE1PR06MB1721;
	25:UqIwxSPQHdYM3hMlTXaJDOFQ8rNZW76huWma6Kl3VmpxwIQOawSgmSezIaF9cEPmVQ8MI+kC8jvqdImIScGjgbAzdnrVY/HPbNmXykC+vzgKT8hANB5sp7vhnj1b1VrXW5TeXg/Zgv3MA2hFGzIEKpi3ehMI1UhVuP53n/wEJQ5a7uTVW/Cf/FwH7uXwXmAU7tKFQhIiTIbrG/Xprjmxs6Gb1q7slFqFFfRDCad9VaylMeYyHWvapRa0THEaHEpSgc4Jfu725L7z6plbAsAYYXAD4cCjPK38KLU0PfxpuwgJ9T5+oTctvwTMNFOsLYf0I18Yut9hoalBlUqCzwpZZZgtJdzGWOVy8NDgCt5yp1LvAe3YIzsb/BEiyGQvXMm0VmpTsEFDhA/lgINUoVMSuXrgG4ls7gf3modTM2BilsxmyiBV2Wxxq2++ppoJ7/5beybA7a3mDNukvb36g+iL46EyxW2tmbP6RtL8j6xrTHy68P+EK95qndLxilsOymEZ/wvGIaAdIUKFnUj0nnGpDWEEDWoF+UHPSv9RkOpKSEs/15yapolbPb9cJxlOidbiQg76li5ZkWSEBBsVSihoXorD413B9dGPxpqa/LHXTM6yfodpmMWsF8rhiHgR3Pxvd3USaVRksZbss6KwpRiFR1CYw1nKE4L2TLIeMApfj6zlg6+oLtgqe6LTFS8eRmFJNM1e/3vpvKhAVJY6XpRodAMYCIKDpVsdLiI007D8Nvw52OxJQkgH3mBOk8ausGEk
X-Microsoft-Exchange-Diagnostics: 1; HE1PR06MB1721;
	20:q4Mc2XujbV5z65rlojR3hj/NW8Sa7V3VC0x7Wgq7pSSYRDlxDEt8piGk6SN8MfBvWhXAyH3KG6S3ax8P9PjEYE1p1RLoQ1wNu+WLTFsTjGEswgP2e7afvm8R9HsT4tJCY7BhUVO7dD71HE7KGCQ226gDukZIOqBZcQSAADEpnp3/UZlfFwwmDCnrdZWDjlzIPYaGfgT4LLwiZsqxcJxVisVlWZodGB5/MhDdtyAtn6QH+5DA0/E0666ZBMsRaoz0LnP0VtrAZz4/v6rkiHtOdUPtw8NqwvIOkuKfnJHwaPXz/p98xrweXrn3VE+93u7UlPfFRzWredbI1QRR37EV8UXjp74wrZ2eKsuVzxdUd94Sn3V/7SJEGB1aHmxOvvpXN4+1c8on+S6WiN2Cb0E6cZ7KFA3XuEV3Y5nCZoW6qPcdCJeEcDBh9mo95qR5Hjt44gyqUcw7T/FAmUC39rmEjxaeyytUjuz2Zyy7zygnWWA3MObO5+3gUDAwb2nuRj8/;
	4:D2WADQhACHdnvktVBWwa5s7ynOvvUawVeUi8nv+AniaP5Y1LK2gBO/LFfqcVZmTqJrv+Tqj+Row2nw+iahTRHD+oHZnkdrmA3vmyfmc4NYnyfWT9nAP0EhQeZHN5dBfUYJ+uRSXOBMpoakIPOoOvRuWipYjCEKYGBUlptQ70eNROnoylDMHrseyocllNXMaeLL/tajFPJhQtYehE7tlNeEmpilwMJF5QfYQ4/qj1GLFTr3oFeF1aRi/JqbbM06dziMvvFmRY2Qd5HWMM//S2Wd4nJo2uO3yvZzxKdgV9kjiqkMRc9lB0FCC+ePgt6alXSKyNS1t9VymprkxTw1VZBHgdv8ITYAU2i0HhZCy7BkLBJeFMQ/TmKeJrKfmIItCMzb1dC5+nraIBFACrdcpFOHlkMIlgR+NIhn9SAqI5+q4=
X-Microsoft-Antispam-PRVS: <HE1PR06MB172100E420D7C4D501E9BBCDE99F0@HE1PR06MB1721.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13016025)(8121501046)(13018025)(3002001)(10201501046)(6055026);
	SRVR:HE1PR06MB1721; BCL:0; PCL:0; RULEID:; SRVR:HE1PR06MB1721; 
X-Forefront-PRVS: 0904004ECB
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtIRTFQUjA2TUIxNzIxOzIzOlhIQm1RWVorQ0tORkZERVNHOXhoMTZiWEQ5?=
	=?utf-8?B?cWcwdkkxSkxlNjUrYVhhaXlpQm1FZ0xZUDZqdlRDdmxkS25UNksyZ0laMTY2?=
	=?utf-8?B?d1Zxek8zWmc1UnpMVEJUY0JOZFFJcGZ1TlEzZXF6NlRGZ1RpQW5TUCtveUFJ?=
	=?utf-8?B?TnBYc3BlNGd0TFkwNG82NEtFN3hIWWVMbUZMYUVQR1hQSzVzbmVHRlNmdmg2?=
	=?utf-8?B?V0QxUkJsNGh1ODhER0tUNUp0Ym5jc3AxV0svRURmMkVwRnNrQ3podTRCTGZl?=
	=?utf-8?B?bUxzdzlzUUlDNlhKVHFOejVEN2RmcEExc0VlS2VSeEFMSVAxeUUwdGJlTVk2?=
	=?utf-8?B?c2VkTlBlMDhsTGxZaVRmM1l5ekhoWkV0M1pldmxIREdvajdzNWVlaXZWdkgx?=
	=?utf-8?B?TXFYbTRLcldQZGFRdXNLL09SVm1JN2lrT2d4c1pIWnFLa3QweWRWVTZhRCti?=
	=?utf-8?B?WE9nK1FieUhFbmRmam4zNjVWZk4wMGx4T3FMSnZJMG5xcVhiZWRCaDZnY1dm?=
	=?utf-8?B?TWJWSzBWdHBsbEFnUnR4N3BxcklFM2dobDNudmFmam9IRGpHcG8zZ0VWSS82?=
	=?utf-8?B?ZUhNTURsRW0rdkVybzBLRzNMUmZTakg3aXNRME9STThReDdNS2FhdGVIQndV?=
	=?utf-8?B?RkVNaUVxWHNYZVVkSEM5TzB3VWJJRHltS3FiY2MrUUNGa1pKVE80R3JmbHUv?=
	=?utf-8?B?RWh5YVhTTW1LdDgvUnJKaWsxWmhLcmdqRWY1MzVEdXlOTFZDY2dUMUJHUmdT?=
	=?utf-8?B?d2pzRFJ0TWNjZ0VlU0MwMUVkaHdIbDYyaXdJenhXS3lMOFhkVGt5SURuVDlV?=
	=?utf-8?B?ZjdCdVdTUlFHRUpJa04rWFdhUnA2ZDRTZzgzQ2xiclZ2eDFXY3RzZzA2NVJD?=
	=?utf-8?B?bnpvNnJYZGNTQm1uc0RjbGVObFl1S2Q4MmVtaDRJeVNyRCtzYjV0SzlGalZO?=
	=?utf-8?B?UzhDSXIvZlB2V0ZiVzdabzdlTlNMZTgxLy9la0xLUXVaR0FVSHdCMUZFQjgw?=
	=?utf-8?B?ZEFrRHE0dCtzdVkyU0VUUEdDWGR2SFdGWWxXTUhqeWd6YVN1a2pYR0RGR2p0?=
	=?utf-8?B?cXI4bkxWd3Fpa1diT3JsRHEveFVsU3NNRkhlRjlMOE5rUXcvanR0cVBxTElD?=
	=?utf-8?B?TEt4Qmgvc2pvYkVxRklQaTdXdVIxYmtMb1lwb3oyWUxsZUhqRyt4STRNczBz?=
	=?utf-8?B?R3Q1Tyt5ZUowbGg0b3kvQ0pvM05TS0NSSFBOdVdxVTdpM1BtcURGM1EydWkw?=
	=?utf-8?B?SFl2MlU4U1NCbWEzSG04V1ZqTjdUNEFjUlpMZUR5YUFsbVZCNG5pckxqaDlP?=
	=?utf-8?B?RGNFMVFScnVtaGwrcGU4SUJ5OGNybUZYQ0VnQjFyd0RSZlA4U1N2UTU3MHAx?=
	=?utf-8?B?cHdZWEdiT2tkZHFiVXR2ZTBSdmxFVkpHeFJiOHNtS1pFeDFLRjJKMHF1WUpy?=
	=?utf-8?B?NllHaU1vWENDVlZiVjFydUZiNTJoa3c2cjZLNE15R2ZnYXpaWlVCYm5xQlhp?=
	=?utf-8?B?NXRCRm9IT2tCVGR3TTNqbW52MlFpWXNabTB3L3dYNVhzcUg4TjNac3FmWUVQ?=
	=?utf-8?B?dTBWbE5BazZhUUxSUUFWeCtEZUtZZmFMREJkby80OTRycXpxNTNIckg2bWVX?=
	=?utf-8?B?ZTE5SHE0Zk9hSEZxVDFlZTMxOW1MWk9GR1lrUnMwR2NDbXNtOWQyb1lpVXVP?=
	=?utf-8?B?ckNyelk2dXA4VVRnQ3puanNrTzFrV0xmR1JJWUl2U1B3cHFVQmNvV0JHRTh4?=
	=?utf-8?Q?ylwojXyg5VeWhsRPFKJPyKsZrqlL0gNom1d1E=3D?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR06MB1721;
	5:elYucM0wjpkEe4OrCi00SAMydT18Ae0FND/MTkLxy62dc7tfj2y8v1mEMR0+pdOkc58crB1u+0cCxnf0rc2NqbA0OKsOnF7RW0p5Usgzx33+uQ+B9X0aTkHREmDCh9Ib9N721uF9DTtMlzVS4tD/KA==;
	24:kvo1I62bMkDzYD3CQSUrN1tNf8rxbZAdIvM+4ARD/srT8qsUtUfiAxFOZOxno9sBxQ+FpWHqLW/pjwEwsQBeepMVlAEBd77dje1BekUwJ5c=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: volvocars.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2016 11:08:46.4803 (UTC)
X-MS-Exchange-CrossTenant-Id: 81fa766e-a349-4867-8bf4-ab35e250a08f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=81fa766e-a349-4867-8bf4-ab35e250a08f;
	Ip=[206.191.252.84]; Helo=[050-smtp-out.volvocars.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR06MB1721
Subject: [PATCH 1/1] Add simple-mtpfs recipe
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
X-List-Received-Date: Wed, 06 Apr 2016 14:41:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DC92C26BF34A840825C37C9D82C7C75@mgd.volvocars.com>
Content-Transfer-Encoding: base64

U0lNUExFLU1UUEZTIChTaW1wbGUgTWVkaWEgVHJhbnNmZXIgUHJvdG9jb2wgRmlsZVN5c3RlbSkg
aXMgYSBmaWxlIHN5c3RlbSBmb3INCkxpbnV4IChhbmQgb3RoZXIgb3BlcmF0aW5nIHN5c3RlbXMg
d2l0aCBhIEZVU0UgaW1wbGVtZW50YXRpb24sIHN1Y2ggYXMNCk1hYyBPUyBYIG9yIEZyZWVCU0Qp
IGNhcGFibGUgb2Ygb3BlcmF0aW5nIG9uIGZpbGVzIG9uIE1UUCBkZXZpY2VzIGF0dGFjaGVkDQp2
aWEgVVNCIHRvIGxvY2FsIG1hY2hpbmUuDQoNClNpZ25lZC1vZmYtYnk6IEpvaG5ueSBLYXJsc3Nv
biA8am9obm55Lmthcmxzc29uLjJAdm9sdm9jYXJzLmNvbT4NCi0tLQ0KIC4uLi9yZWNpcGVzLWZp
bGVzeXN0ZW1zL3NpbXBsZS1tdHBmcy9zaW1wbGUtbXRwZnNfZ2l0LmJiICAgIHwgMTMgKysrKysr
KysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IG1ldGEtZmlsZXN5c3RlbXMvcmVjaXBlcy1maWxlc3lzdGVtcy9zaW1wbGUtbXRwZnMv
c2ltcGxlLW10cGZzX2dpdC5iYg0KDQpkaWZmIC0tZ2l0IGEvbWV0YS1maWxlc3lzdGVtcy9yZWNp
cGVzLWZpbGVzeXN0ZW1zL3NpbXBsZS1tdHBmcy9zaW1wbGUtbXRwZnNfZ2l0LmJiIGIvbWV0YS1m
aWxlc3lzdGVtcy9yZWNpcGVzLWZpbGVzeXN0ZW1zL3NpbXBsZS1tdHBmcy9zaW1wbGUtbXRwZnNf
Z2l0LmJiDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMC4uZjg1OTc3Zg0KLS0t
IC9kZXYvbnVsbA0KKysrIGIvbWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLWZpbGVzeXN0ZW1zL3Np
bXBsZS1tdHBmcy9zaW1wbGUtbXRwZnNfZ2l0LmJiDQpAQCAtMCwwICsxLDEzIEBADQorREVTQ1JJ
UFRJT04gPSAiU0lNUExFLU1UUEZTIGlzIGEgRlVTRSBiYXNlZCBmaWxzeXN0ZW0gZm9yIE1UUCBk
ZXZpY2VzIGNvbm5lY3RlZCB2aWEgVVNCIg0KK0hPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNv
bS9waGF0aW5hL3NpbXBsZS1tdHBmcyINCitMSUNFTlNFID0gIkdQTHYyIg0KK0xJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTc1ODU5OTg5NTQ1ZTM3OTY4YTk5YjYzMWVmNDI3
MjJlIg0KKw0KK0RFUEVORFMgPSAiZnVzZSBsaWJtdHAiDQorDQoraW5oZXJpdCBhdXRvdG9vbHMg
cGtnY29uZmlnDQorDQorU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3BoYXRpbmEvc2ltcGxl
LW10cGZzLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIg0KK1NSQ1JFViA9ICJhN2Fi
NjRjN2U0ZDdhY2ExNTVjYmM3Y2U5NDEyYWFmNjhlZjZlNDA0Ig0KKw0KK1MgPSAiJHtXT1JLRElS
fS9naXQiDQotLSANCjEuOS4xDQoNCg==

