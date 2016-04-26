Return-Path: <johnny.karlsson.2@volvocars.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0113.outbound.protection.outlook.com [157.55.234.113])
	by mail.openembedded.org (Postfix) with ESMTP id CAEE260088
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=volvocars.onmicrosoft.com; s=selector1-volvocars-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=pJ9aIgKpT7WSn0eKVngIN5FlmEYB+6UT71l0/FfttqU=;
	b=TuKJpVgd3xR2KQ2uKzhg3YReZdClBGGxS++tZZFleNWaP/JZbLPa0IEKkhFKgqkrtdCJdYCx9YS+IdtqEtHfU+3V8XNSw/ACETeQVR4PbaXoah5PRGF6CwyLpLf9ihIyUZaD3Y7qClfwoM3BgIWhbfBkbxIYfGa9GRIaS2mzYcs=
Received: from AM3PR06CA025.eurprd06.prod.outlook.com (10.141.192.143) by
	AM4PR06MB1713.eurprd06.prod.outlook.com (10.165.247.16) with Microsoft
	SMTP Server (TLS) id 15.1.485.3; Tue, 26 Apr 2016 12:03:15 +0000
Received: from DB3FFO11FD028.protection.gbl (2a01:111:f400:7e04::198) by
	AM3PR06CA025.outlook.office365.com (2a01:111:e400:882b::15) with
	Microsoft
	SMTP Server (TLS) id 15.1.485.3 via Frontend Transport; Tue, 26 Apr 2016
	12:03:15 +0000
Authentication-Results: spf=fail (sender IP is 23.103.247.84)
	smtp.mailfrom=volvocars.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=volvocars.com;
Received-SPF: Fail (protection.outlook.com: domain of volvocars.com does not
	designate 23.103.247.84 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=23.103.247.84; helo=050-smtp-out.volvocars.com;
Received: from 050-smtp-out.volvocars.com (23.103.247.84) by
	DB3FFO11FD028.mail.protection.outlook.com (10.47.217.59) with Microsoft
	SMTP Server (TLS) id 15.1.477.4 via Frontend Transport;
	Tue, 26 Apr 2016 12:03:15 +0000
Received: from AM3PR40MB0052.050d.mgd.msft.net (141.251.189.88) by
	AM3PR40MB0049.050d.mgd.msft.net (141.251.189.85) with Microsoft SMTP
	Server (TLS) id 15.1.466.19; Tue, 26 Apr 2016 12:03:14 +0000
Received: from AM3PR40MB0052.050d.mgd.msft.net ([141.251.189.88]) by
	AM3PR40MB0052.050d.mgd.msft.net ([141.251.189.88]) with mapi id
	15.01.0466.025; Tue, 26 Apr 2016 12:03:14 +0000
From: "Karlsson, Johnny" <johnny.karlsson.2@volvocars.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH 1/1] Add simple-mtpfs recipe
Thread-Index: AQHRj/SvlzFJhBXwNUeTJ9ZAShd3a5+cRxCw
Date: Tue, 26 Apr 2016 12:03:14 +0000
Message-ID: <f1ec95a620434c3da4a039f85a50f1b1@AM3PR40MB0052.050d.mgd.msft.net>
References: <1459940924.3110.8.camel@jkarls39-Dell-Precision-M3800>
In-Reply-To: <1459940924.3110.8.camel@jkarls39-Dell-Precision-M3800>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [141.251.189.133]
X-MS-Office365-Filtering-Correlation-Id: 6e22a0cb-8e14-4632-0748-08d36dcabf89
MIME-Version: 1.0
X-CrossPremisesHeadersFilteredBySendConnector: AM3PR40MB0049.050d.mgd.msft.net
X-OrganizationHeadersPreserved: AM3PR40MB0049.050d.mgd.msft.net
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:23.103.247.84; IPV:NLI; CTRY:; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(1109001)(1110001)(339900001)(199003)(13464003)(189002)(86146001)(2906002)(107886002)(85426001)(2351001)(106116001)(19580405001)(110136002)(9686002)(19580395003)(81166005)(87936001)(86362001)(10400500002)(3846002)(23676002)(2900100001)(105606002)(16796002)(1096002)(3900700001)(5004730100002)(2950100001)(189998001)(450100001)(11100500001)(108616004)(5890100001)(2501003)(76176999)(54356999)(5003600100002)(24736003)(47776003)(92566002)(33646002)(66066001)(106466001)(1220700001)(50986999)(5008740100001)(102836003)(586003)(6116002)(6806005)(50466002)(15975445007)(22756006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM4PR06MB1713;
	H:050-smtp-out.volvocars.com; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; DB3FFO11FD028;
	1:1kV+dnq37alpahBZp/33npQvhg5Bx5OiGozlaWHREP6TAuG705bN2D19in6B+XFWH7YJoPprrJ8/FHZp7ZJEVo8FLLPsV87t1v+YaJu9jKdmMZUEZ3/M2Hbb4Z/Jcy90j8N9ErhfPFMiqclti6Fpqeyni5gIgJ+28cveaJ1gQt5NKQsBKde4chHR7uWznxzSy+WDOoGCA4LXHfFk8QJ2yyB8dmvfPKKn1BEFbQsKTOXafllRvKhPOdiAl/ANTQR6PhQC1f4Sx+HMrfMJ7kWSZOhMuvFNwIcv4wGO8GtRUUD1w6zz8US+4G26xSGZ4rQG0hQrrW/sqM9o+MBXspj8ZdTvFj6s7y81N5TubNDxzmRdXlHSMEL1bEDMf68umFcnqGOHW9Bb4N1yvwFy+2KY4NhZas/Hm9Y7EQt5LAmGyNvUmoOuwSMD8HzK4RnzWbcp
X-Microsoft-Exchange-Diagnostics: 1; AM4PR06MB1713;
	2:4VVVKf91STHRsNEBFPXjVN9dh0gm8gtLqMFzI5aQijLhGVbdBeArP06qd3eRtzeEIuQapTbneHgUjWknyxF1Gi17NGrDTGwgBVmkEZlE3f+W0X8AS/eVkn0xXPHhD17ts0n58LpUWt+UkfHQQNsYE9LOx+rcYtQv5vi8c6lmu+YaH3nAfSFPkcnUT1EnpkCr;
	3:CPFcfRDTecS/1NI7sPEFdA+sLsM2kilS9+bronkmDAvEcJqQODYY/4frRLanAPqLK4OJO+Z3OuXUC5WDWHRUNe02rzoj2XwMXPTq0cuMpCkI5kectMnsiYscNBVPYmmKckLbadcp0iAdDf1IbD51vKvmGttnt25G49RpFqLG3WfVxr009hhwuPtonLzYskT4IsK0440jHpF0/sD5Duxg1hMNIwSQ2iqrr1paVVLGlzU=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM4PR06MB1713;
X-Microsoft-Exchange-Diagnostics: 1; AM4PR06MB1713;
	25:DsLH681BiKbEB1LA1LlSOeNrQ1b7bM9OGLTrcUlgIm+lMoElCO7tQRkNysVpZHQzWrF3QWTHT9Jk62GMGMMYfYhbNXCmo4dlyV5Dyoeh52k9cm7akKkRED6vqpuNTAt1Aoy+ySuDGM4+DeaCa4qCSb7soXvHId6XKcjeQJJRLvHABeNbuI1ZkUVxKE0NAZbe3yOQCkGsvblVMEqUUcJBaPNfL2fX64FaumFn/VWxokU1iOFGPcNCP9tAz3uubj3X5B3v0M8YocAyi51lStVcXg7IRcxKsRMZC+TTsfLcsfJQUDQP9Lcii6BH2GlOSCGWjj2QjECoej6OdadpI6ezKjuuFP0mJZ62K3n8P2O3Q1CCC0TnPCXY4cuu1zbz8MONRiVAt6WojClHhaIfdvAcCnHnOaiG4yd5dCrFOiATyT+bzknEEAASgqQsujT5NiXcMTvcEFbF8oX9dXPpCEIT0UY9hIqCIii+DvZiyJVefe/R6kD8NVPztDoyL7cNSU4QYrZWprXWT1Tu9ilV0NUOrJze0LOOs7ltEDWSV2YY86t38NreqPBQx6GjmBz/3j4sUYJ0Y7idFnbKrJcoozWn3QRAiatYmrimjKUelfk0tvFRTKl7T4nOC3dMGclSKg+JtRFLTaSuc0H51k39A2pigRCgsZDN72S94XLbBtkYuccFQZot4YwX96fxJnKQIvKPzoeFI2FuiJ3vY0BIsZ9YC3jL/MwRvIC2X8uBJQS3yHMUiXT2+zlnQ5enZ9xJQ6/5e2MvDEXtkSz16gJ4l3CP1j5he7jH9cMh4lpRiiNdjkSbjgZjqKvW+Oc74mYcWzKpyfsLXu9uEINTYcUQCMIfl7Ba57hq7DLAPJ3AdXbOOkl+mlntDNA3B4Ipvb4kWg7ooOvMN4QsOV3K6w6Vo+L3cg==
X-Microsoft-Exchange-Diagnostics: 1; AM4PR06MB1713;
	20:lpNoAxeYYhrRfHiw5BKGzY9whJ4QO4DjqhS69Nooa2VwDejzbHF9TFGXoodJOfGP5VgY0pVRNCD17JB6crOZ9YCte4jXSZoEXSlbGxPjrARid+fu3xtIzLpUhdprtPYcLw1SSMzomF8HhVLA/fZ/s/u+dVCa2Q1bNn/6SXSYhp16k5Uckg2SCt7o3AzkZzCbEPSpmjfrFrOk7FL2Ipzld7f4W41ioFP36o+St8sXD0MvCc07F9y2wcJAaQT+bLYQfMBziQISAYooan9OSYsvPEM/M81vRP7VmkjrG8IpxTth6tMGRIj0JUdfgXGNMHY8W4MUzPtQZRqVZYgbymu6GCj+aujBaMgkxQ3mF+DQyBKsEn11KucdoH6qJiEh4hW3QD6137BFVA0ITfYUM1XTEy84B6ULe/RXQhAAXI/fx9rfm0Wk2yNqlYvdBqa0iuCzJQka3ovbhOewhRk3ERllihR74DyAqdwJDyqJ7g8bL1iPzQvLgzKXFm+HIX3jh/3s
X-Microsoft-Antispam-PRVS: <AM4PR06MB17139FF540F8E9AC7F8AC75FE9630@AM4PR06MB1713.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(9101521072)(601004)(2401047)(5005006)(8121501046)(13016025)(13018025)(3002001)(10201501046)(6055026);
	SRVR:AM4PR06MB1713; BCL:0; PCL:0; RULEID:; SRVR:AM4PR06MB1713; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR06MB1713;
	4:TGY1lWgLFspo16mdAEVuilwGVPOfrxnI29ERvIcaAwqDo1DnIKXcJbh0uhZCOwa6oumfZZdcGAklLzvzlkEIbwpxmN7tCQsWUgvFep7yyOsGhJHt3ke1FoBeukhT3mNEpSVuBv+baW9C7l4XZUTZWZ5BaEQzX1RAbdYn0UyXpZMLLeugi5RqO8CXhPEjFYvqYPQ4xhEn6VoU3qR1pnsyh2t2jdAeG6Td3BcfMCquaBAc4rINuxS3moK/nKF+QPA/1YJT0qpz+giWaGMR2vANFnelgLEPhm76SIGAc7O57XbNeaB7qz68UwS9o18jiR5YV9RknTc6P1dw68JUEBXgfkQcMVE8CwYEljhENpGyWd1Lrdyue/3dWz2tuTKLYLXXvQuBYCfPl47bmTHx8drhO16LmJKY3cdpIXaIMd4hRK9l7k3/qB4htm2iRHY3ydiSEK3+Ftk38Kz2TDe0e7SXIQ==
X-Forefront-PRVS: 0924C6A0D5
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTRQUjA2TUIxNzEzOzIzOk43ekFqZ3VsYzJBZXJxYkZGWGZ6MkRtWmJD?=
	=?utf-8?B?SXBrakJIU05xTGdTaHhpRUczeEJFdm5hUmRpcmNxdlZUaWpuell5SFc5dDlH?=
	=?utf-8?B?Z3JLSmFQV2Viajc3OEtQdGdDQ0ZubnhmdFNGK2RtSkEvdE05bjNITWYzYWhU?=
	=?utf-8?B?VWxEMG9pRjZHaEhNc3VsbFVBTXNRMVpxK3piSWIzY2cwWExtY29EaWJpNEdG?=
	=?utf-8?B?dnBBeTM0NFo0bElJN0hOeVlpdmNHcWdSNGtzU05CMzFJeGVEbWo3bTJ2RjBk?=
	=?utf-8?B?bk1QTFJsb085TVJ6RGJHdDJhNE1DcEpYcm1lS3pDT1g2SjI2bGRqdlJwQXFi?=
	=?utf-8?B?VmJRSlV4WXpLYkNDZzhqTWhiQzNWR2JTelY3a3lseFNGMnBXS0lPczdRWkh5?=
	=?utf-8?B?alVlNlVSVCtrSXFPQkxPWXRqVk1ER1hZcDhncERJZjN0UVl0b09mS1doN3ZJ?=
	=?utf-8?B?cWNBTnlRRHAxTDQ2ZTJBVDVzelQ1c3R1eGNwdzIwWllMVDdIc1k1bnBvRzY3?=
	=?utf-8?B?SHhjWmVjMVB5MjRCMjFOeUVNRGY2a0FqS1RNZ3lDYk1GeFNEL3BVM213QU1B?=
	=?utf-8?B?ODlXbWRqTnl4dDdQZXN1TEE1aCtrMjBUN0RrbGwvYWlSdXp4d1NHeldzaGMr?=
	=?utf-8?B?cmkyd08zOXNwd0REakJpbHJyRityUnluSGdrR2g5SDVHTHp4NXM1Wm1MTmsw?=
	=?utf-8?B?am5BV2cydTBrN0F2eTJRZjhBM0hKeWluR1VzQml0TzJ6dVlmcGI5ZmowbmEx?=
	=?utf-8?B?ZzBSUmZUdSt2UVZSUHZuUzBNQ3VDd0JHMmNRWWtkc3NlR3JmMGhCMDVkaFhE?=
	=?utf-8?B?UlNQN2cxRXM1UzRkWTRyc2xiTXFnU3pyMlhvbXhlazVaUkt6LzZ1MCtxeVVW?=
	=?utf-8?B?ZVkyNmpGbGMxbWh4RVp2alBYcytoL0szcTRTMEVkd2hOaTBhdElRSmVTRURp?=
	=?utf-8?B?eEw4aG95cjBOTlhVWmZXZUZpLzM0MGxUVkN0enVvVjhjWjBSSlpadVMvRksy?=
	=?utf-8?B?M2ZiMklPcFU5TDJZdXY1Y3ZkU0lpN3JBK3ZUN0l0TytQOE8rYUF3cW1FeXEv?=
	=?utf-8?B?S3lZTXlaYmZJOERPYkgyZzVrenIybHpOSTVYTCtiSGRFWGxqN0pYcUdQdDhm?=
	=?utf-8?B?Q2tUTXU5TGd4UGd4MDE2dnRvb1N3djh2d2xlb29vN0Zua25QWTVGTHkrbmdj?=
	=?utf-8?B?Nkp3NjB5TkUvc0RlSHNPTVBTdzJOUlN3WkkwYStJQjFlNWZsOVBNT05PVXps?=
	=?utf-8?B?Tm9zUDBFUnBqUW9mVmQ0eXlDSkVjVTNUdWNtYWk3WnV1UjZkTFBwdDVrVXpZ?=
	=?utf-8?B?bVpJb1pkSG5sLzQvNm96WlUzVGlReHZmQi9sZXdOQTZRa3hyRndzTkdhZ1Ev?=
	=?utf-8?B?aTRyZHJXYW1NT0I0eGFDZDdhYlFxV3kxTDFmbmcrZzIrYzRzUGdCUC8zL3oy?=
	=?utf-8?B?aE41Y085WTk3cW8yeFluWDZDVDAvMUw2L1BqdDRzMzVJMHdGK3VkNEVkOWl4?=
	=?utf-8?B?a09EaUdWWXdOTWFvRENCcERFQW90c2lHYVhGbTJlV0RneklOdGE3SlZhaEc1?=
	=?utf-8?B?dDMzVEd5RWFLL2N5dlF2RkxzaU5yRVYxYWVyNkp2RkM5NFpmSVQzVHVRcmlS?=
	=?utf-8?B?NUQrdWJVdFcyYkszcC84MWw4dy9RV21WY1llYmFwZzRPUm94UG4rK0JENldZ?=
	=?utf-8?B?NmlUeUpoWEZ3NUVDTTFmRERxME85Y1Zub09xMXpUU0N4TSswdTByZlV1T3RQ?=
	=?utf-8?B?c0wvM3pIVXZaQ3FlQnpDMkNaMXh0aXZUcWtKWmh0RVZlZFdjbC8xeWxwOGpR?=
	=?utf-8?B?SGVQcVlLbXY0eEdaMnVtbGVZTUN6OWlSZmZYMW5NbnBiZEdUc2R2YXBQeGlX?=
	=?utf-8?B?bTh0TjJFbTVmRllObkFKN0lEdkFwdm9CTE9JOHNDdFNteFZ3VlFCdnZpTTYx?=
	=?utf-8?B?NHBXbGcweWN3PT0=?=
X-Microsoft-Exchange-Diagnostics: 1; AM4PR06MB1713;
	5:4JDRheJN9iSBMsM15ZGhb+KDXmAYpERiUdRXs97iEBNYsi7MpVZwN5N+08CPW8Jz2rTIBQ1xagi7/AE+46ty2uz/5inJKC4hhIXaMNDVY0UnYnP9VFQbhl1J34pyGb9CRbg/5uaxFZTmSV4xlw19Pw==;
	24:9kGZ/XaRV3Yaa4ocFqil4L8C2Ixjh6tI/t+i5XzH0dxRuiw0ECHPw/+XK4ic39emRFhFnwQNVMJc71nmAFaOkcfJdBjP6h5yeRI2qEtttSw=;
	7:JSibvH8DT1tSnt6YDU5WPizIuuF8otQxHMhH+lQfznfC9RfnGL9HWVlvHwP+iRH9gl8OPPrDvT0YEFMtJhKHTd+w7z4MMaMef52k51oBkqJDKJBAEK5D54V1y35zA9wpz+5Q2u2mf3PWkh3xXx+VFINdX0pJErKb1UVIv9xGHZimmBzN8TRK/O662KwUo5D1
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: volvocars.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2016 12:03:15.3153 (UTC)
X-MS-Exchange-CrossTenant-Id: 81fa766e-a349-4867-8bf4-ab35e250a08f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=81fa766e-a349-4867-8bf4-ab35e250a08f;
	Ip=[23.103.247.84]; Helo=[050-smtp-out.volvocars.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR06MB1713
Subject: Re: [PATCH 1/1] Add simple-mtpfs recipe
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
X-List-Received-Date: Tue, 26 Apr 2016 12:17:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGluZyENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthcmxzc29uLCBKb2hu
bnkgDQpTZW50OiBkZW4gNiBhcHJpbCAyMDE2IDEzOjA5DQpUbzogb3BlbmVtYmVkZGVkLWRldmVs
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFtQQVRDSCAxLzFdIEFkZCBzaW1wbGUt
bXRwZnMgcmVjaXBlDQoNClNJTVBMRS1NVFBGUyAoU2ltcGxlIE1lZGlhIFRyYW5zZmVyIFByb3Rv
Y29sIEZpbGVTeXN0ZW0pIGlzIGEgZmlsZSBzeXN0ZW0gZm9yIExpbnV4IChhbmQgb3RoZXIgb3Bl
cmF0aW5nIHN5c3RlbXMgd2l0aCBhIEZVU0UgaW1wbGVtZW50YXRpb24sIHN1Y2ggYXMgTWFjIE9T
IFggb3IgRnJlZUJTRCkgY2FwYWJsZSBvZiBvcGVyYXRpbmcgb24gZmlsZXMgb24gTVRQIGRldmlj
ZXMgYXR0YWNoZWQgdmlhIFVTQiB0byBsb2NhbCBtYWNoaW5lLg0KDQpTaWduZWQtb2ZmLWJ5OiBK
b2hubnkgS2FybHNzb24gPGpvaG5ueS5rYXJsc3Nvbi4yQHZvbHZvY2Fycy5jb20+DQotLS0NCiAu
Li4vcmVjaXBlcy1maWxlc3lzdGVtcy9zaW1wbGUtbXRwZnMvc2ltcGxlLW10cGZzX2dpdC5iYiAg
ICB8IDEzICsrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQ0K
IGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLWZpbGVzeXN0ZW1zL3JlY2lwZXMtZmlsZXN5c3RlbXMv
c2ltcGxlLW10cGZzL3NpbXBsZS1tdHBmc19naXQuYmINCg0KZGlmZiAtLWdpdCBhL21ldGEtZmls
ZXN5c3RlbXMvcmVjaXBlcy1maWxlc3lzdGVtcy9zaW1wbGUtbXRwZnMvc2ltcGxlLW10cGZzX2dp
dC5iYiBiL21ldGEtZmlsZXN5c3RlbXMvcmVjaXBlcy1maWxlc3lzdGVtcy9zaW1wbGUtbXRwZnMv
c2ltcGxlLW10cGZzX2dpdC5iYg0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAu
LmY4NTk3N2YNCi0tLSAvZGV2L251bGwNCisrKyBiL21ldGEtZmlsZXN5c3RlbXMvcmVjaXBlcy1m
aWxlc3lzdGVtcy9zaW1wbGUtbXRwZnMvc2ltcGxlLW10cGZzX2dpdA0KKysrIC5iYg0KQEAgLTAs
MCArMSwxMyBAQA0KK0RFU0NSSVBUSU9OID0gIlNJTVBMRS1NVFBGUyBpcyBhIEZVU0UgYmFzZWQg
Zmlsc3lzdGVtIGZvciBNVFAgZGV2aWNlcyBjb25uZWN0ZWQgdmlhIFVTQiINCitIT01FUEFHRSA9
ICJodHRwczovL2dpdGh1Yi5jb20vcGhhdGluYS9zaW1wbGUtbXRwZnMiDQorTElDRU5TRSA9ICJH
UEx2MiINCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT03NTg1OTk4OTU0
NWUzNzk2OGE5OWI2MzFlZjQyNzIyZSINCisNCitERVBFTkRTID0gImZ1c2UgbGlibXRwIg0KKw0K
K2luaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZw0KKw0KK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS9waGF0aW5hL3NpbXBsZS1tdHBmcy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rl
ciINCitTUkNSRVYgPSAiYTdhYjY0YzdlNGQ3YWNhMTU1Y2JjN2NlOTQxMmFhZjY4ZWY2ZTQwNCIN
CisNCitTID0gIiR7V09SS0RJUn0vZ2l0Ig0KLS0NCjEuOS4xDQoNCg==

