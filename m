Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 877 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 Jun 2017 17:07:35 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0053.outbound.protection.outlook.com [104.47.34.53])
	by mail.openembedded.org (Postfix) with ESMTP id 35AC8782B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=I5s/ULwhofH973TdbOl+j2j76NPN/As+hct/gOXKZxk=;
	b=koKzwWDXopui41GNFJWiTeSx9bhHe7u7kHvsvLg2L/qDTL1H0bvuvg6AOp6Az3+a/IJcILd4riYErI7+FIbMII7hcZeq64JSisCM8tLVUG/G4lYJS1cgYgpPk7FIx8YBiVjtJLYL2qGP9/mKwJYVMBW9Oe44UGrqaD3C5mPi3cg=
Authentication-Results: dominion.thruhere.net; dkim=none (message not signed)
	header.d=none; dominion.thruhere.net;
	dmarc=none action=none header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	BN6PR0101MB2930.prod.exchangelabs.com (10.174.87.139) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1157.12; Thu, 15 Jun 2017 17:07:35 +0000
To: Martin Jansa <martin.jansa@gmail.com>
References: <e0efb641-fd8b-a8ff-e952-7b32805cc45a@xevo.com>
	<2ef4f2a3-48e9-f3fa-a55e-01522507d86d@xevo.com>
	<CA+chaQeUWj=4zxG1gdk0pwg_U1GUdMmwr1F9DEL_7pT8S0UUQg@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <7c692d80-c09b-798b-6fbe-1edc78572080@xevo.com>
Date: Thu, 15 Jun 2017 10:07:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQeUWj=4zxG1gdk0pwg_U1GUdMmwr1F9DEL_7pT8S0UUQg@mail.gmail.com>
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: DM5PR2201CA0025.namprd22.prod.outlook.com (10.174.180.142)
	To BN6PR0101MB2930.prod.exchangelabs.com (10.174.87.139)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2930:
X-MS-Office365-Filtering-Correlation-Id: f433f8f2-84e6-4aa3-b9a9-08d4b411056c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:BN6PR0101MB2930; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	3:i2yWRMqDeAr75kYvSWTxPHUmhGEpaN7GaE4MyRVS135FXdvx14LTz6Hpw4EDXdb0w3dJayE8bW17iPS4qmzaaurwAU/odYr+3CLvo5x3V9bsK7LkoZNdZ3EPBmoKaWPO/E7jmVy78l2c/LVxA1J90FO7wUeTToUMgz3+mDVre3Nmc9tQioRPNQPJ9HZf8MtVe3vi0e2MRDwSZYDP+6W5m/cUeV0iSfvVPi8c9WWNr6WA483zwlPHJxhjKuI6040BAEXAk+RrkzQmvfmJOa2gdjYzzU727362VQ5FROU6vLq2iWkEDhoCzbze9uYJ8uCdofkZtbP4TC+rQjAnekeNAw==;
	25:ngH7xEI+USJScLTNAOTuRCpAd9Z0FlHRUAILTbwFzrUqIpS8X36rgnqtrtuPUDlvDpfnxWgvGHZuhBvdFlv9HPmD93s0OZllD9hZwMg5IlT/lXC13h7n0c0bcgJwF3RMirf/tk2u3BQEiJ5CywjWsd/qmd6hgKTEz4KztYvj1zWBItkGZaoS8r7LgXJPQI1gUiaNjvKtJolyh2T5RJ2YFZszFgKWfrwzUa8V+aXUNlhcOmDsSLjPufy957ErCsx/uKMNkPjBmQqqSYW4X/DDauqPCwQjixcE26m0shoF+ODeVb+syCa/QY8lr0OYgmELEQMOO5fa9Su2xezF1CVkQ2TUAu/CifStPxZpqPHshGsnnhStXUvD1ErdjgxqJccbXEj5DsAV3whki86fv7NlGtg+wpSGEdE1ubFX7leuKdpKU1x7cOXY6OJ1xL0zq6xMboSYEJAqumvYFxzRMXpqUJPIdj6vdoS9hs8/U5MYqtQ=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	31:4u4/X29lkbm45C8JL+aCXFZxVXZBO514g048Ox3BYIttW7GIITOROSPIfGMTbJp8RmufgRz4Mru3ncy8UU6fmGHfkdMf0/T5WN2N7v9mWKchL3nzPjo5kjyBaTqKSp9BSSgLJxscoEY55aaxi9R6USALbxqmMpTgoc2nq2qGC9g6VAGTrIJg3Fkgl0zIRDVyeZ6YazXD7YOLAbQz60n47vuqlXyz64YYI0eOVN57a/H7KKumNyYOezdNzrDz/gA4uZTqirdXBEbSiCRnMt0/NA==;
	20:soL3v5JJDr2jwgu3LdRH87DDC8AB0Omr/LHcDSAthsEk1y7ie2RDIitBbUYjX8UexjzVxVPDCm+QxpoUwL83VAqkI3LtFgZ+YyZlWAHR72GNhrpii1XjNp0EOOggB16A7qNJv5Bl/NNZVnR8HiGqkFXeymaCS466j9W4YEDr3PVFhmGeDK2h7uYFeOaR3y82tcT6lugbkUBWcPUrWy68tnhS781tglbaBZDWFsakRxrLH0p10BcYzmboF8xT7/gJkvuBFlag5RgjGGIFrADQeQ3wBPLrWDEtDQAXxF5Ilgge0xBA/NQAoZTW63cln2XKiwezZqFJGRtMf+SHdDmygA==
X-Microsoft-Antispam-PRVS: <BN6PR0101MB2930808C3B36B5622E0D6D95ABC00@BN6PR0101MB2930.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(3002001)(10201501046)(93006095)(93001095)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123555025)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR0101MB2930; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR0101MB2930; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzA7NDpLSE5wRVJXcStET2NpZzlvOXQ5Y2F4aGtv?=
	=?utf-8?B?WDNwMFZrc0VRSVhVQWhvNVl2TG9JWnA0R3BVMGNocGQ5NThDWjVYQ0gyVVlX?=
	=?utf-8?B?bnlPRVF4L3NqY214RW1kWllFMDY3b2tpZE9VWXB5U3pKemNHUCthb09Id0Vn?=
	=?utf-8?B?VzNvbS9jZGFqVTRhMmVtTmYveW9iaDkxZlJXN2NtNHE5YXU0cnk2T1FTSFRx?=
	=?utf-8?B?bXhGZ09jUkwwUlI3N2gwV0daQVUxUy9WUEVjdzZHR0RTNWQ3eG0ra2VkbktT?=
	=?utf-8?B?RVNNaVNZMEt5b1BQS0E2YkllTUcvaGdYL2hONDJQRk93RVFDWnVNME0rSEtT?=
	=?utf-8?B?MHEwb3N1WlV0VnN1Lytod25SZDFGdzVJTUpwVzh4MDBoT0tKQldhU2hFdzlW?=
	=?utf-8?B?NkwyN216WVlRbHFPMmxjQUZRa09ZR01xdnVEWUc2d2hwY1RmUnluSUp0QVhC?=
	=?utf-8?B?aEl5cGNnL0VTWENkK3RBbVZpdFdSKzBVSTZ5QisvajNubFZCOG9BdCtCS1ll?=
	=?utf-8?B?QTdlYndocURhVCtRUzZlRTN1b21qSE9LVnBMWG9jZkI4ZFNkdkduSUZKNU5P?=
	=?utf-8?B?eXA4TXd4Y1JlYmFaOHJRSDF5TTNzaytMeWRad0RTbk1CQWcxbmlDNi9ISU1T?=
	=?utf-8?B?ZEV0MG9rVXBGMTVmQzFnNHhQdWlyVFh5dzNZa0NHVE01QWJ3NkNGcFFqYXNS?=
	=?utf-8?B?ck1zb2tId0g2WjBOVWtWNDJpSjlyWmJOYWtkWi9UQmJTTFE1UGdrV0FGRkFS?=
	=?utf-8?B?RUZCMmh0NDBZZG5sczc3eG8xOFd1TXg0VWM2V2NUdE13d2V1WTdUb3h2aXZq?=
	=?utf-8?B?S1FrcUpnaW1WMEswMlFnUHhHY2pNSkkwZG5oVi9NdEJIUno0NTJvdzF4NFRs?=
	=?utf-8?B?Nk1LSG13ZXdFOW1GbFhDME5DNm1EMWNROGtoYW5pRk90VVFjcUxKaFhMZVI2?=
	=?utf-8?B?RnEvSTZqSDBQVVhNMkdsbi9qMEIwZ0Rva2FuMk5PN1JZaDk2NE4wbUFCZ0lZ?=
	=?utf-8?B?M2FDNHFTLzcwZlREUTBRNHBpdjZ4SXlLaE10dzFyeUtpY2pFT1g3d2svTEt1?=
	=?utf-8?B?bDZFME9TSEpINGdXeG85V1BPOTdzV01BUjNYYjZhdUhPcC85Ulh0YkRnY0RN?=
	=?utf-8?B?RzZCVS90KzBUdDdPa1BJZEZhaVpTNkhXRS9wSDJRRldVWFZCZUZCVTJUcDdU?=
	=?utf-8?B?MS9EN0VmT3FqR01kRzZLYklGMGFCdFd1bHVUa2NaUUN5ODdLQmpLQk04S0Fk?=
	=?utf-8?B?Vm5lR0ovNzdubjRaOVpFdDNrVkpPcVUrZkxCNTJoUVdTUlkwWGpCN0twY0F1?=
	=?utf-8?B?Nzh4aUc0ODVoMnphNFd4elNCMVBLamNpaEIzdFlkQUZDKzdPSGtZcTNvZit4?=
	=?utf-8?B?a3FWZmpSTkdndnIwa2cxZUh1R3JhV254VXFXdlhGY2dJeEZ3M3h5RXpIeXhL?=
	=?utf-8?B?enJmd2ZQajI3Qkt2U21ONUFxcUJNZFczUjlHRmtnQUdtdldNMGNJbnE5UUxJ?=
	=?utf-8?B?bytkTHFWQlQxenNUdXdnMTVzcDAzTUVBaitCeXE3Z053WUREV1lYUUgvd1lk?=
	=?utf-8?B?YVFhczNRLzdvWXVra3FlOFJtSExDQ1NneDdrUFkvREFnd1JsTG1kbWw1cmp3?=
	=?utf-8?Q?=3D?=
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39400400002)(39830400002)(39410400002)(39450400003)(377454003)(53754006)(377424004)(24454002)(7736002)(23676002)(53936002)(229853002)(54906002)(6306002)(38730400002)(110136004)(81166006)(6246003)(47776003)(8676002)(31696002)(77096006)(90366009)(6486002)(86362001)(230783001)(117156002)(53546009)(50986999)(25786009)(230700001)(54356999)(2950100002)(6666003)(6916009)(83506001)(66066001)(4326008)(36756003)(76176999)(31686004)(2906002)(50466002)(33646002)(42186005)(966005)(3846002)(305945005)(6116002)(189998001)(4001350100001)(478600001)(5660300001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2930; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzA7MjM6azhkRUw1YjlTWmNkR3RjNTRHWldBU1E0?=
	=?utf-8?B?cTdpVE1VT1Njd2dZd044M2M3QXJhcjUxTFNyc2dhQVlMaGU2YmpuOXdodDFs?=
	=?utf-8?B?UHhJWDJjUUJZNjB1N0xVaCtKK3BNeTFKYllyVDhnRWM4Nlc1VVU0Sm1EbHNz?=
	=?utf-8?B?cU4rNUtKbzNGRTZ1bnNIUXg2Mnc0aUpIVnd1UFlPU21DREk4RlkvbGkyL09p?=
	=?utf-8?B?MFgrMUtXT2JQejEzaFI5RWxnTkFNZzBkNTlZbzIrbjNQTS9aenBVZHJRaXFK?=
	=?utf-8?B?bzFWOHJ1OVZSSlVqRzZLYXh1T0U4TFlVUWdrVm00Y2FaaVlSZ0lZdnZsVjVi?=
	=?utf-8?B?MzNjNmNRSnh6cXFnNWwrVng5cGVZRk9rczFHaktNYnI2ZzA0TWhjT2NNbXpz?=
	=?utf-8?B?Z0hNakU5dktEWFNjS2t5czBxdHJpTHI5aDVFVGFtRFRMNUpuQmdmUVFnWWtF?=
	=?utf-8?B?c05RT2dnc0kvQTBZWVRZY1loTnRqT3k4M1pQVFgwRmErR2ViODNSSlVaSFdr?=
	=?utf-8?B?WmNyVlg3enI5WGNZRkJsTlNBL0FRbWZ6VTJ6MlBIQ3o4ZmRvYWxNbm1wYTE5?=
	=?utf-8?B?QnZJUDlucE1LL2FTWWlCVXBPY1dHVlBISGVoclF4QXcrbDk2QjNHeHRGWWFQ?=
	=?utf-8?B?Q1ZmWlB0NktrKytyNUNWOHdubXRvQkFmWXFGNitQaWdDaHEzOU5vcDQ5bFdF?=
	=?utf-8?B?cWh5VWE1ekF4QmtrdEdEd2s4ZzBZYWFBbGFSS2hvWGxNblVBelhmSFBaZ0FJ?=
	=?utf-8?B?VXZPdHRWU3luSzFqU1E1aldmdTFJZkhxMXNwR3ZGbDEwUjVIcnQ5K2lKSWZH?=
	=?utf-8?B?NXRPMmxFNU1vcnB0VXVsMVZDUzZJWXg2VlZHQnl2dGVEaXlkeXJWLzgzSDFr?=
	=?utf-8?B?UWw1NHl6U2x4OTBoQndXUkd0TDEvLzAxRHRvRTJBd1lNVGNYSDRRTHV3WWc0?=
	=?utf-8?B?aXg5Uy8zR0dSQVlQUHExb0k3bXUrR0cvSDRmemFYVWVMdGJzU0RBeEV1cmxm?=
	=?utf-8?B?eXRnUDhIeTNjcnV5VStZM1VBZlhtclUveE45MVF0VVM2aEpRcUlkMjRRczNM?=
	=?utf-8?B?WjdOelp4QXR5Snp5Ti9PT2cwRU0xeWJUOWdPNU9IOTRxZjBZaThDbVFlT25V?=
	=?utf-8?B?WWcrbHhvK3A3aDJNMXU5dnp4cU9OYkxqdlZYbUg5Yk1CQmZmTzY3cEh0TFk4?=
	=?utf-8?B?Zm9mYlU5Y3FWa0Nvb3NUYWV3NkYvTGZ5TWZCY2tIODN5TUdBc2o3T010c3dS?=
	=?utf-8?B?SGl2WFBXdjJLZWlCc0lFeXZEWTNVdnRGUFp1NkxLN2kwMC9sWVZTYmZYS2JR?=
	=?utf-8?B?VWpUQmZzVUhKUEJVbEdKUkk0OG5ZZnZtM3p4L2svWGRSaWt0TUFFdjRjcG52?=
	=?utf-8?B?RU9CVndpYUNtY0hhZnY1UnVPaXYyeXZOS01FK2xFc21DMjZpZWhPdGdleFFZ?=
	=?utf-8?B?WXdCeXcvNFpjYXlHNEQvemdIV1hRcmpseDhrMUx0cEVSbHNRdnZXSGJHaVVu?=
	=?utf-8?B?dHZ4bkVqQVlQakprYjdrd3JjMVhQU1ZLU3oxZ1JPL3lxWmhpR1YzcDhROVJy?=
	=?utf-8?B?NGd1SXBGdWVJVzNBQWJnMmVvbkpPd2xYcFc1bU51cllsTWN4eDJySmVQeFlY?=
	=?utf-8?B?ZFhEYmt6a1FPVGJ2ZjExdVpiSEI1T2YyTzVrSU5tRGx5eGx1VHNkdWhLVXZo?=
	=?utf-8?B?NFFvWERVc2gzTENyeEF5UVVkd0I4Vm9FTTR4VlM1dTRNZlR1RitTS0JBVGVY?=
	=?utf-8?B?b0RrOWEyUHlma3Y2VUhVS1VkV1VXR2UrU0VBTnd5ZjBJVm9POWxsNElxd0dk?=
	=?utf-8?B?OHFQdnVzZFJmV2VreG5WTVlJUHQ4M2dkMHdOdmpJOGxtSzAzUT09?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzA7NjphV2VtRHpWanlVUGx3ZERpdTJQTXAveFUw?=
	=?utf-8?B?NHcrZFpnUElwUjR2SE1GRks3bDY3ZUc3K2dOcy9UZHJsNFYwemo1TEQ5R1c1?=
	=?utf-8?B?TmYvSUQ3WkJETnByaEI4UFRBWDh2dEFKemJtQnk2amhscHFKTDdFTnpTeC9F?=
	=?utf-8?B?U2VkUU1xYnIvVXNVdFVoNmtaZXR4OTk1dmJBZ1g3TVZsU3N6T0dYK29MRGhH?=
	=?utf-8?B?dHVjek5xbUdGOWhmNSs4Y1BVNkNGOUlCVUlBUG9pSk9YeGNuQXdUT1VFanRC?=
	=?utf-8?B?SnBINUhsM1hJMWR1WFBndzBJS25ET1c3NzdBZnQxMjRPdWsrU2VBbDJ5cGdJ?=
	=?utf-8?B?Z0ZHMHM3MnpDOTdPV3BBUHdkdExIWGYwR0RRV3cydkJLaFk1SzgyRmd3UnRZ?=
	=?utf-8?B?Uk5FakpOV0RuVk1uaStNektYVUxzSElpZTlGdXA2WGN1aGFSbitCT2FPWmo2?=
	=?utf-8?B?Q0lZY05na0pzaEhMdlFWUHU5VHlhdzE4eVI4M3hqbVdPNTVkejBlenAxQUpm?=
	=?utf-8?B?VnJ1em5XSUNqYlRpTElzOGxIL1FPUUFFa1lRUmFNMEU5M0JFMlRKaHFmYmQy?=
	=?utf-8?B?eHpRTGNmendZN3g2b1RDVFh6VU9YaGhHYlpvWlA2WWRvK1RwbHJuaHl6R2Fn?=
	=?utf-8?B?c1BESk50Vk8rZ21maEZyS21YLzkyUVBTR2IvNTFBM2Rqa0RoamdUZWpkWmhL?=
	=?utf-8?B?YlRvSFoxaktIempFcjcxeHZUMkZJMWpQQ1JJV2xCVktCUmRTMjZlTVlyNDRO?=
	=?utf-8?B?N2dqZWJzZVh4Y3R2S2c4ejVzVS8zOFJPZTZLVENhRG5jTkVtNDd2bkp2Vnc1?=
	=?utf-8?B?Vm54ZnFQT3Z0d0wySXMxK0FTQ3dDOTRDNE4wRFdSb25vZGw1WGVnd09yblZP?=
	=?utf-8?B?SStFYjJiaC9Ld2pnMG1wQlprSDJiTnlnQXhKMWNvbUI5OWtha1JDejRSb21Z?=
	=?utf-8?B?SWIxVTh1MEFPa01DWEt5UXRjMldET0xoaFB4aDhPZEdud3FjQlRkUkZ6ZkVm?=
	=?utf-8?B?TEt1eHNFLzdRN01DRUlDRWR4OG13NW1lR2k5TkVvdnE0Ty9EQlNMUWtqZEVt?=
	=?utf-8?B?VTlQV3pCNGxwQU1PMkZYL015dFRZbjF3bGR4Y3VNdzRndGJuSmxzZXZ3RGN2?=
	=?utf-8?B?MkF0TWo0Vk04T1ZlZW9YS3BNdXdnY1lURmVWRU1QSmwxNFJTeklKdEI5THFR?=
	=?utf-8?B?Z3BycHFQL1ZESTZ6b3FRT3YxMit3bjJPWGI2R3N3cjJlb0oxQmRLZnZ6YWZ1?=
	=?utf-8?B?cDRKbmhkYzlncDRUMk5xNHNOaDJEWDhjVGF4Ym5DbnNYTW92L1N3U3pqRnRr?=
	=?utf-8?Q?+aNF/YkKV1gKgnQzbxYU5ePsmOZs3kVu0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	5:SikvBxxt0R1nRO9iKluaH3VSOCUGPa51P+kEQUXK1HeAsQaLqYgExa4HlII0jR/zFZ9cLpF7/3H4OsoIGVouDhACVNmwjjRrUbV+gMiYawzpQ8kPry9gr4jRofWZitZJktJRhTG8d5zEXVRnANQUURI066hl8vt22YZGuT8XLkAfUbk9yj8VXfYJqdAZiJKnz40vaBlBo3TmB+EivO9mp2FTYyJpCNXtxM7c9wQEvQWtPjoo6Jnjp5zaVpRXsNYd1FRnyAYJ9GDb3FWrgGIeDvAnPj18t/nf2OHfmLP6EojwqNPA9egNAyMA33dfhvymtzaJXxYC2y6IRPkrSN2hxKNLF0FJMIqQk7gz5pSNDQsa0l9tK63e95bkk5vh1X1k8Jn+T8xBfdCMUlbRoimoLBrx5b/ou/ifrhlnG8KhlKPBsLs+m3VTohdBPSP4lLrlKTM6K/BH0xnxDxcQLXCpflnt6XmCzPggUHdkAFotnBzWCxI544Cplj7sIOSuw/c0;
	24:v3dGblqnK4FEIapiQQShjg8tK2/869C71aHMOjV3yFtqXalhTQuJ88Daac54CJrMyBEiuoSTZzrsUkqveKKaNdX4kqUpdXzeirvRCplbT50=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2930;
	7:lVkSt7yvkc8WS0ePXlujtHG08nxxtPyyDu/1Ma6jSWWYYR8OZEqzhJoTRMeroFP7dENZJQdTQbj6w6RvnPyhDHKiRriucHg6/BRoMYJmcjv17dIcULj+YGaSlOPx3U+jXPYKP38Tny+3eZpm4eCT7Ct4qEC+c3ZAqa1CZGbA5Tr1+E/bbwGcW4+2Vu5hlVi5A50dYdhk0Tfr33LTm3IE2kT+Lh2fM3ENmL9fEq7U3aFSK59dhMUhWPVwAL0Q6cs0DEBbWXB13jGpy45Bj2NsdYGrwlrhebGrl3paM+k/WpQda3oxjzPpVJD7KkEnSLryo1hGGx1723ze9BEsTSWPG4Iu7YPDHZfZvmu7uzjvuZy20UC7cfTGknVq5w1M4ilYIYjp/d5eRP8X5m/Cgu/9v2j1iG6ntFU+An7fntpHIFHfOwsvlwP/s3Ydd7JvENYruSA0lJ2cZ/5EA/iE4NOXlSkyhaOq7U5jLGYhFib+LlL8X//2zANNXzq4yn7SsYEm0aYuz/fMh3TaCAKzdSxo4jVWKmtAKgEKwkBPEpLQgJAAWxYiLrST85juyPAHmCKlHzlDFoDM9HjVd9PhSKybBMM9yyNDNd0ubG43Ed+lXKulzXCe0VIzoKVgMutem48sgJtt14KQDdHUS9otuRnCXsGqwqrXeGsavOLvVRmdH/KznmWkI05OYu8L6Xg7YPv9zpZadO+Xm6pO4xM3EdsF03RTKzod/MghWHzJ3PYFBkiAZLJmVxCNaXCwtldOld2X4P3KhjeGElxA3Ltg36WVABXMg3gm04uYpnzDCnEeZb8=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2017 17:07:35.3912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2930
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 00/14] new recipe: open-vm-tools recipe
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
X-List-Received-Date: Thu, 15 Jun 2017 17:07:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2017 09:54 AM, Martin Jansa wrote:
> It didn't make it to patchwork, because you've sent only the cover
> letter. I've added it to master-next now.
>
> Next time please send also individual patches. So that it gets more
> visibility for other people to comment and also that I can use patchwork
> to pull it in.
>
> Regards,
>

Thanks, sorry about that. I was trying to use the send-pull-request 
script and getting errors; somehow it couldn't figure out the branch I 
was using. I tried to fix the script but eventually gave up and did a 
manual pull request attempting to mimic what the script would have spit out.

> On Thu, Jun 15, 2017 at 6:36 PM, Martin Kelly <mkelly@xevo.com
> <mailto:mkelly@xevo.com>> wrote:
>
>     On 06/09/2017 03:22 PM, Martin Kelly wrote:
>
>         Hi all,
>
>         This patch series adds a new recipe for Open VM Tools to
>         meta-oe. This
>         recipe is invaluable for using Openembedded with VMWare, as
>         without the
>         tools, performance is very slow.
>
>         More information about Open VM Tools can be found here:
>
>         https://github.com/vmware/open-vm-tools
>         <https://github.com/vmware/open-vm-tools>
>
>         Please note that, as mentioned in the first commit, this recipe is
>         modified from the recipe originally found in the Open-Switch
>         repository.
>         The first patch is directly from that repository, and the following
>         patches are modifications to it.
>
>         Original recipe:
>         https://github.com/open-switch/ops-build
>         <https://github.com/open-switch/ops-build>
>         yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/open-vm-tools_10.0.5.bb
>         <http://open-vm-tools_10.0.5.bb>
>
>         Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9
>
>         Although the original recipe packaging was Apache-licensed, I
>         received
>         permission from the author (Diego Dompe) to relicense it under
>         the MIT
>         license for inclusion in meta-openembedded:
>
>         https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html
>         <https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html>
>         https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html
>         <https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html>
>
>         --
>         The following changes since commit
>         41cf832cc9abd6f2293a6d612463a34a53a9a52a:
>
>           Revert "rrdtool: add gettext-native dependency" (2017-06-05
>         11:13:09
>         +0200)
>
>         are available in the git repository at:
>
>           https://github.com/XevoInc/meta-openembedded
>         <https://github.com/XevoInc/meta-openembedded>
>
>         for you to fetch changes up to
>         402d1b3917195beb2ab7cac5dc94aaed8992b5a1:
>
>           open-vm-tools: style changes (2017-06-07 22:31:34 +0000)
>
>         ----------------------------------------------------------------
>         Martin Kelly (14):
>               add open-vm-tools recipe
>               open-vm-tools: add missing pkgconfig dependency
>               open-vm-tools: add missing glib-2.0-native dependency
>               open-vm-tools: clarify and expand licensing
>               open-vm-tools: base_contains --> bb.utils.contains
>               open-vm-tools: update version to 10.1.5
>               open-vm-tools: don't use mspack
>               open-vm-tools: don't use dnet-config
>               open-vm-tools: add #include to fix build break
>               open-vm-tools: add missing X11 dependencies
>               open-vm-tools: remove kernel module logic
>               open-vm-tools: line up configure options
>               open-vm-tools: support FUSE
>               open-vm-tools: style changes
>
>          .../recipes-support/open-vm-tools/files/tools.conf |  2 +
>          .../open-vm-tools/files/vmtoolsd.service           | 11 +++
>          .../open-vm-tools/0001-Fix-kernel-detection.patch  | 35 +++++++++
>          .../0002-configure.ac-don-t-use-dnet-config.patch  | 41 ++++++++++
>          .../0003-add-include-sys-sysmacros.h.patch         | 33 ++++++++
>          .../open-vm-tools/open-vm-tools_10.1.5.bb
>         <http://open-vm-tools_10.1.5.bb>          | 90
>         ++++++++++++++++++++++
>          6 files changed, 212 insertions(+)
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/files/tools.conf
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-kernel-detection.patch
>
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-configure.ac-don-t-use-dnet-config.patch
>
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-add-include-sys-sysmacros.h.patch
>
>          create mode 100644
>         meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
>         <http://open-vm-tools_10.1.5.bb>
>         --
>         2.1.4
>
>
>     (ping)
>
>

