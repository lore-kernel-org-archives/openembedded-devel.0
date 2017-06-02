Return-Path: <mns@gomspace.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0098.outbound.protection.outlook.com [104.47.2.98])
	by mail.openembedded.org (Postfix) with ESMTP id CB42677B99
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 07:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gomspace01.onmicrosoft.com; s=selector1-gomspace-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=k76CGwbRMo+hHlKYaJ16lCmCk+Rf2FgbCvwo4n6WXfA=;
	b=R6EqRXmiqXsBTuXdtyF6QAL3L45pKAmBgsPXwUUGYSZuYLR7ryo+uFjDjOYUZt+Q2RVlHdV/URSptFZVN3sVXyjOOwIPLH7ZXsKJjZTUhk3KhSp73VpzJF5YzbN0txZx9GMDgYD0x/v5tPdvS4NiA+wX3VHVXL2YxvhqM6aKsRQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=gomspace.com;
Received: from martin-Precision-5510.gomspace.lan (77.243.61.136) by
	VI1PR0402MB2783.eurprd04.prod.outlook.com (2603:10a6:800:ad::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1143.10;
	Fri, 2 Jun 2017 05:56:12 +0000
From: Martin Siegumfeldt <mns@gomspace.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jun 2017 07:55:45 +0200
Message-Id: <20170602055545.20448-2-mns@gomspace.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170602055545.20448-1-mns@gomspace.com>
References: <20170602055545.20448-1-mns@gomspace.com>
MIME-Version: 1.0
X-Originating-IP: [77.243.61.136]
X-ClientProxiedBy: AM4PR0802CA0017.eurprd08.prod.outlook.com
	(2603:10a6:200:57::27) To VI1PR0402MB2783.eurprd04.prod.outlook.com
	(2603:10a6:800:ad::13)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2783:
X-MS-Office365-Filtering-Correlation-Id: 7216af4b-7ed1-49df-d25a-08d4a97c12cf
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(201703131423075);
	SRVR:VI1PR0402MB2783; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2783;
	3:8pjYHO90BnKmorY6Fhj5C4tp2j8qHi29X+roqiDhu1YrW9ZTyGF3uFc4yvC9cuiscmTH/k4xwhK19/K5ZkGkbBraGKOmH9fQSOzUdycj+P1CiSeQpbyDpztkyPN6Y6SiAIaQ+m8OmPImXu3DWK12I80dU0cg78dU8WgYDS83Vu/XuFpsnm4EmXz7Flppl98d5tulhxu7l0QwHNUx3ybroHql/GK4uYIycmse5fMGMcG7rTJU5qa51cw72edi86liJvfhDF5FbyD/slIKc9eWKX6OqAMogHBOzdoLvoPXTZo=;
	25:ve1L18cNXKWHQGjZ1CH5fbTu9NvPG52wNDZSRh0r8Du+sMc6T6iFozPnxd1bRXELoAjI4z2MAeOkBFP08W92R4XuWD3N0UGiodFI2donegPxL7sB3wf9lyJKW45TqMJNNFBTKnhClVMvWOlJDJ4XOl+GWcli/HYA4W5AzJr+aaR6hJdzEAY4MQQWERWNEhxXRkwxBw/coQGIIv5fMzjtmUbstwO6IhbbaRCxsby6c68BRMa6JVoXagQEAGQ/YW5GdHF8BB6ThfXGaBIcKHbKkI7B1TrsH8A2418zOB0munE6L5Y1KWNy/GTgrPW+P2inR2W/9NQAy/z26rB1G6XYdgHdSAguOjhTHko50k8PI3qCE9De/pID3VRxAPWjMMIWCajoln/ykkJ5h+KFADoGRhENpzRyDZbSWwENFXh4ccYQNKpf932Z+AYzQ1zMggi8iPh7Kw6xGcGoF3vjcOQ8esQtgbihACYvU4Zo1CqtpBE=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2783;
	31:+r48Ezq2GH916rI+M8/1BZFM4HX2Uhc4V7SVJTn21mqhRUTszPkJ39/o6mo8EOMCeRafcB+oh9WxMIzgGAM2qfT0K0A4uO6zdvuk3M5OMt9RUaNsULqdJvYNasV8ikwfVPQ6kU4v8t0sy5v3GEVmU9JIQCFiHyDTXNgIMxz2hU9HrCMozvFDwcq4rf7CdFWQvw2zBJLg2TTiPwYesad4PGnaYK104xoZn6siCRGt5QzrZlYCv7c9x9Eveht+EmKHITRMouvCWGm9xcRIYpUTkg==;
	20:TVEMj9puWnNdwxRD1AkD6yXPMQ8mCBh4hs5DFwPflUqBxBtmHbOh1gAFYQaWPC0oRAlCvamkB3fybeGvFIdYbvdihhFDFeoXj13PMwqUFZ3O46l3/u6S7SSxeLc5aLA4Ji7mpW01/i8LIwZLq9anM4r/jXhuJtBiIWZ5+3HEB3sQit4zm/nGSz/y732CZdD2LMg49Lq55gmc4wCL7gUGCSr6/SNK1aNdQF5QqchH4iCHzYhzKvFO7f9n9nuXMgAJqLsqo1IJFeXnuQLrLcegnw0CBaXl86B4bWVQgYb/T7++VAoQ7cAwNleaprMC27GhYW5RpKhhB1dJU3MRpO/QU6bEIMGOH5Q9Z4j3I5vbPlEuvAuILvmxd2W2ZmkXGMVA9ym+vPGmwDRJx0aUNJvHC8z8JfnSEu+oaZDP0cmPPb1RQssxiFFnJYRX2cOI2EpB
X-Microsoft-Antispam-PRVS: <VI1PR0402MB27833E9C0624DF8986272AEFC4F70@VI1PR0402MB2783.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(31051911155226)(58145275503218);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123564025)(20161123560025)(2016111802025)(20161123562025)(20161123558100)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(6043046)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:VI1PR0402MB2783; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:VI1PR0402MB2783; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0402MB2783;
	4:2hK4KQ1csDcv69O3aelV67LjE95M1Y8osNCgqwtj?=
	=?us-ascii?Q?/9QiDsNXAi58VBDjtoCeSfpWBYro5B31H0pYSB0tjwqQmDoEe7W95yGiSo8W?=
	=?us-ascii?Q?LX+gK6xq3VAWtRkmdjuJ/X2AF2oD2LrGpso8y2hckjUb2VEAC8QWTHz73dfJ?=
	=?us-ascii?Q?oXWbfDz9AxtON77u7pDR20yhtFttDeDRZUmlgODs4hoCPKgmiaeQuIJWpDZc?=
	=?us-ascii?Q?foJWRJwSjFZZowz4bBQLlTMU83P0vW0h0eo2OmXqx1Vz9G1QSCX3d8USEv5b?=
	=?us-ascii?Q?Syn8m5vpOrQ+j2cAqEZ5AwSU+ozeX1eb7k7crEegsJpHJJolfZuMMQM8QvNK?=
	=?us-ascii?Q?SHH8ORao9X43jiMDQSi5vHGrUi3EDSwYWUQwoPX1VXa362i+JSnsM2A1jTmK?=
	=?us-ascii?Q?kgk3sMh6NkmNov3ECPEg2CYboNXmRC2AMWzngzuIbpjTxP8FuyakIZTgGJZ+?=
	=?us-ascii?Q?sbmoo2KbaOZUcWHRKw0yX/KqxT5WYF9kIhxvp3xO4US+n1sNviFTqAXmv2HH?=
	=?us-ascii?Q?Im5SwT9NPjRoK9QCa1ZS1X+hoDbgWFIedeyd2kIdw/LAfPgZIJvFaQMg50+B?=
	=?us-ascii?Q?rb/XLl4faQHFzTLYNpgV0skxeLMvW2qutQDzT+5In77F8o8vCk97f6CjEyyd?=
	=?us-ascii?Q?1dLt/zcq5+A1DuFEHQF+FvmJywPVQMFNvCmfLCHeghF5WT2mXPr6CrakwCoJ?=
	=?us-ascii?Q?0IBZM0sf+OdEBr5VV0z1WoW4iNGTCB1xFCSutwd3MbhUjMagxid9Zbe/Im1Q?=
	=?us-ascii?Q?+QvodLFeIaV0gfMtQjkUElYPv/SAnDQ6OW/YvLAq0JqgSQFwayIH18t3U7Zx?=
	=?us-ascii?Q?oxY07Qkbp4fn4myxaK5FJlje7SzXvo5MHwvnNoSy//KCM+WqFTIb8KwjY4q0?=
	=?us-ascii?Q?A4mQF2lk9TFXBgI7uFJHTzmhuvxy5Fm4g91kKRcKSCMD0Kg60yOkC/h/dStr?=
	=?us-ascii?Q?becwrOuReJD1LDhU2/rp5apAae2IbjSPWCLQylRYYNOxhMXS6tEaYOkJC2oi?=
	=?us-ascii?Q?uDnGI3f0cLLgF7n4tS/Qpn1WFZsaofh6Dpdj94knBL6v9pykxoHMTBS33Cs7?=
	=?us-ascii?Q?rhc0LFFtMteIOHjNQxAchl7ACdFQr57e5BGVLo+XHjk9tnv876gRWs5qATq7?=
	=?us-ascii?Q?196bW2+JBwYVPmHyK7oNxK5vcI0qZ8X0CIVuMiXmiE5+cN3MQwbJLtRUqvbS?=
	=?us-ascii?Q?DFCmh6sPVzxHb8U2rnDTOkwoK0ETGy2rVa6JB6XLLkmQ99lwKMwCkE6fpJ+p?=
	=?us-ascii?Q?v38fbpF3d9LMxGUA5tuCwuITJPnqAnTEvZ6GaMWL?=
X-Forefront-PRVS: 03264AEA72
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(39450400003)(39410400002)(39400400002)(39830400002)(25786009)(36756003)(6506006)(47776003)(50986999)(53936002)(6486002)(189998001)(76176999)(38730400002)(110136004)(53416004)(6512007)(478600001)(6306002)(54906002)(5003940100001)(42186005)(6916009)(2950100002)(7736002)(86362001)(575784001)(6666003)(66066001)(48376002)(2906002)(4326008)(1076002)(2361001)(5660300001)(6116002)(33646002)(2351001)(3846002)(50466002)(8676002)(50226002)(81166006)(305945005)(42262002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0402MB2783;
	H:martin-Precision-5510.gomspace.lan; FPR:; SPF:None; MLV:sfv;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0402MB2783;
	23:L/4k/rjFhDaF9qCCzIIFwBnnNNKEZXJZIsNuJNF?=
	=?us-ascii?Q?ZwrLq79GnBylWqxrchAkZM7F9aQ6URipzDn1Ux0IqAAyG2EhWiSOB9VxszUQ?=
	=?us-ascii?Q?ap88mOhLCORzMg+6z5/X7+h2ZmJcHpMcunO9XadLjd75TkN2hevjT6GJVlvK?=
	=?us-ascii?Q?KRzt9TIP8KxzVwLZcXycXs7OAvKPmkD0FJ0Q3UvOsPEFru0QK3WI2NhoSBJJ?=
	=?us-ascii?Q?QilUp8L/oZtj39vYrLPH7N482FwLUOso3b8mJ2O6CZxwqT5HRvGv2tAZVZHG?=
	=?us-ascii?Q?KJSkKIfMM506B15nDTqo8CDibC4o/J1GM6c2WdOLg5DryFtMnf7CWhRIs8Og?=
	=?us-ascii?Q?GfEPwynAC9nPTefaE5aqBuRbwwAdwcx1EGaWlu5wyYqrMAJhcMel+DA9ST/J?=
	=?us-ascii?Q?0pfCY2ERqFiH4mbj1lTlwZPprcnUnR0Xlb56dfTCWGnFMLMd/GZH328Llu+k?=
	=?us-ascii?Q?8CRalvwmQtKzrqLC71qIBSpwVbq4Zpizrn9jdRf6rkQ/a+A1uzMisIxueJf8?=
	=?us-ascii?Q?JO3pXBncLSmfvIdh2ykiRV2TnXlZ3ImC7SCN3IjTbk4sZ7PM5cNrJYFy6k77?=
	=?us-ascii?Q?7qOd8wJgiae2Cw7BrqiaFAtjpnmYBaAOtYTBm9yeZBEcqm3WSkZiFmrBTRHm?=
	=?us-ascii?Q?pim98eeyfA4LSpjQQC5jPTUr4pk5sPex4jt39Hsgk9Y6eYzUyzUAq6he3Ps1?=
	=?us-ascii?Q?bZv221UtzTDkFNuPIGphF/phTnDvwybcv0GyunO9PWaUTFNmrsjiA1BgOHZH?=
	=?us-ascii?Q?gAAqk2Qt8NigCMLgu7pr0yvSYmvvam/ATB1a7KrdI45tQinouIwyp0ad0fx1?=
	=?us-ascii?Q?b6NcKBtpUaEvqwZt2+NwDto9YxEZ63cJRh7PKO6Y6IGtWLmHlKEjv9/2gtfi?=
	=?us-ascii?Q?AQNXddsQWC2RXViv+QJaZZkG4iu+Lfpr3IFyNpFaXpyEwDiN945XzSFOPfjC?=
	=?us-ascii?Q?Lr3xMYRxKMzXeatdYMuDRKQFuyqxUIkF4Bvpum20cSJcF2eXURCWCMc2IjHF?=
	=?us-ascii?Q?knoMSliwTE13XY3eIQKqdZBqMo6dWhBRQ4MB3vw1+w3RP1al5KfAzflUF7M2?=
	=?us-ascii?Q?JILQWsu5MCpCatbn2JCgfX+EjRnxQopdxe3oMoWBQvtGOHCprn5froa1Fk0c?=
	=?us-ascii?Q?gV8VtAa9jawSxYDn3nmvja1yyE9zSuAlg1EqkN+Ka+UFMEwoJm1dEPA=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2783;
	6:JTALbLAJqiqs154vASfby+/spT8QYv3OLH4FOr4j4obaiUtQ3QjJv1LcdTmausQrpAiobGplZPi4OZGu2EPszwDWpdWiJBpwyKSTI7GFJs/rb0U2dckkynGJ3Qj5qeJhmrM8EY3se6d3U1PE6bDE7IodQoD1KAoJck7EZGdcU7Qlw2bNuXP8lg6IP0XpsbmjRPcflgKL9aYPBK11xN2Sygr9LGUUaJ/AizC+55Fti9i9OFv+/U0UJS8wMceE2x43LA1d7F0GyLX/pYxWSYaaD+Cl5VF+jnK24J5MKSoS6blrpUMx6RAtyodOeG31PJp8d5Smly/Ryjt78h0Uj4aKTVuvKMfwEirFgZ0umeGyA4c4Jon17NrCUUPV/kQv3xvmZEA1IW7c+jJOSnaPgfHbwa89IhDrb0GMRgobbbHJ7dMxMBLF58904KKdLAVhNAkytKDELRPB70MveTYpCHGFNnrINLqP/3GKwCsXW7sbt7yq3ql5OzOCnV/yh++C9BKWp+n0UU4I+SYqZ5fkOvQZSw==
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2783;
	5:mjFzyFil5dJflOEfRplDDZ2yqpy1Vlglywz6xJfk9Ar8pmwpxGcs9i7d0vLlKyzjtFlVi4QfEv7BDZZ04UKgQVgf6Gl5FT/AmvMAX9J629bZ4L9xpiPlQxlDBO2sYzOaToVgESBQx1yYBA+7gSrJvAZSMLmQwX/Sd1QMl3zOom99YtpzfhGdaDE7r1yrSeD7VYlU+u+ZCyvCIpT8JhwIdgrYuO+C2zpTRqhbm+Bww+YZgLA0MLfX/fo++hHysDO5xTRKXbueW1XhIK3sv0DnoN21M3ROivdH0TtaCzes+oJt0u76i1te86QRF11hmyaUCg+PbB5vDZjS63CK7doYYcXhEwEYiVus3OdaIU109IexcpSwBckC/M3xcsQnz8tiE9PMO68ZLkwI1tfiRYn2CViI7Xcf2Gyrp3NltFaxmi4GfSQdZAIJJAaDEDcuvBQzDCG8T1WiQQwhrBSji9JzFbT7pEs4+4BZVKV5SxkkKD16aN2xPzN7Q6hk7b1bWUzz;
	24:06knK+TMzQltBqqTaGBUY7hsguUzUtbzeYIkpKZvDsFFPd633gWp97m9vdFKbY8S1keEM8d6wNPNo5KTzGFB31bRNoPxSAPwwhOa+zKtHFY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2783;
	7:W6EkHSW/QhOpgyjr9C9lYOyMXZxo2qbeZHfF8780y61Qnhgqk4QG1JOXwLKJNYB3LF8/nmctqIoPE4kSSCRkSJsmjNqEtw/qMosl8qsBI8TTiclSCEPzxRtWYk0lYnIv7D9rBg9ScXS6B/PKiQZELO/TFhn8QPN+GBcX/qYgWJCISKKHLe7u4lmxWSDvY6ns0Wd8gJgx7SNOYNrjL6PqXmiTO7v7A2RzE/tMDkB3jMuwOHXLLmkIxbvxLX4JyxmBXZXN8TQB08BdEj3Cm9seIxImqBCrN0Bv50cOHFNhTNgZsv/FWIqSanEq9NwvbR4wO801jWUPmCPOEO0vYRT2LQ==
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2017 05:56:12.0856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2783
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-oe][PATCH 2/2] devmem2: use different filename to avoid checksum conflicts
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
X-List-Received-Date: Fri, 02 Jun 2017 07:29:25 -0000
Content-Type: text/plain

From: Denys Dmytriyenko <denys@ti.com>

The newly resurrected devmem2.c file besides having a new location, also
updates its header, producing different checksums, which would conflict
with any previously cached or mirrored instances. To avoid such conflicts,
use a different filename in fetch(). Rename it back to original name at
unpack() for devmem2-fixups-2.patch to succeed w/o modifications.

WARNING: devmem2-1.0-r7 do_fetch: Fetcher failure for URL: 'http://www.free-electrons.com/pub/mirror/devmem2.c'. Checksum mismatch!
File: '/OE/master/downloads/devmem2.c' has md5 checksum be12c0132a1ae118cbf5e79d98427c1d when e23f236e94be4c429aa1ceac0f01544b was expected
File: '/OE/master/downloads/devmem2.c' has sha256 checksum ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191 when 3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639 was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.

WARNING: devmem2-1.0-r7 do_fetch: Renaming /OE/sources/devmem2.c to /OE/sources/devmem2.c_bad-checksum_be12c0132a1ae118cbf5e79d98427c1d

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/devmem2/devmem2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
index c42eb5e..c86eb2e 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -3,12 +3,16 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
 PR = "r7"
 
-SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c \
+SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
            file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
 S = "${WORKDIR}"
 
 CFLAGS += "-DFORCE_STRICT_ALIGNMENT"
 
+python do_unpack_append() {
+    os.rename("devmem2-new.c", "devmem2.c")
+}
+
 do_compile() {
     ${CC} -o devmem2 devmem2.c ${CFLAGS} ${LDFLAGS}
 }
-- 
2.9.3


