Return-Path: <mkelly@xevo.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0058.outbound.protection.outlook.com [104.47.33.58])
	by mail.openembedded.org (Postfix) with ESMTP id 3B18178239
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=d+JBgK98fMTqaTkX/Mti36JU3W595Z0oIiyWS/P/kzg=;
	b=MMZGawGr8HQ6HjUEWqNsCft8eBldEZT0tV5ICdanv9U5CUzDeR/gn4LhfF7itZ0FPM8d3MEQI2nI7sanasBFw/0D9iXny3a2ZPgqqceBI4JpEamnlgWJaNQqTWAs1f1jFfmU+pFliCj6s3sQHqy88Rb30aLjgZMVAFz9+xO6HkE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:49:03 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:48:39 -0700
Message-Id: <d16612b0d2175a1ef1aa675dd423d73befa688ee.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df1d5035-e189-4cfe-b6f9-08d4ba8a0c19
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:zdb0kQUA9KTBEjC1zr4H+36qaQdI85rOC9HREqnPRw+n6Gtkk2oScWI5NCWDcqVax0huMfAE4YjOqMjHGYWSSX2XHfTZIsmOaP6XK0ry0Spm1ixdMg4tHXJ4d8UiC0qtkbHz4OhoNDmdmiLP67MINQl+5fdie93LLokt7yPq3Qp/2KI5961cO+PeK2AMVdXPXAMvsqZXtuB/KL3sSOjz6T3uChYs76v4NlozYnpoxx1268v+Yc6qO2nzLzCm1NcPEDY1JMbbsCGHwvfkXn6Zh9tx8GKMP1VkUeKJnQcgFyq7zR3ZRGtKvI7TiT9TxjZRi+UqGreNz3zRaLUgjkkygpfquyJRvxWU/7Kt3x5TaJEzzyleJZ2OodXKvN/hLtY7aVXToTjN6riy1x6SpX/HPSE2I15oVpLwV1NDyTG47rZMvb77SfgorNy8f32KRh8c+SbNsWc1SDeLD3faLjWiR4A8scmbpiqTSMNJl/zNuEFzPzK5ogFG8REY5vD9pxOvd1EydpabZFtPGw9UC4wtWf+AgseZqeLqWd6TlW9dgv21xdH4vkGZV0Xq6oyIlbcHLYdhLbuN6pKDxjJF9O724i2BBTpwxPMmWpeSYMbemmantEaVbzujswi1F1Yk5LX/k/KvSsHC1fi1iWRCx/t4QIrZEBptz8f7RWxpQYa/nKaozGhEPmKDzqeCKgaD8NXlGGwxT4nlfbDiFSeBVRFb8BZSkw33ODvnI/Qx4ZCDTZc=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:74F+H+RE5FqBbK4XnULCgBbx0M1SnX3y5gdvlZ5KNj/0+o2TAGgWXUxMC1/HZpbxb0MeKUflOD4DLQGRhw15bYW9yQsYfTPwa8EgTkCgaIW/6lCXzaS3fCF0ZFJeV9/knxoAcXDsJtYMf5w6EH0X8c1g57D8TAXVP0IBtMW70B62ZwjGU8E6hCXmertKP3piHIubEM0uc+kqxGxfen35qKnvD9KQS/IYH2ptU+PCBbAG/C1ijmh1GGYTH33n7QmnKYpvy06fUYGRYG3jehjhdRFI88D9Liii2+caDIzziOQxzMaWioskDoN0NuXcNrP8hufe/zlmb8h6CiL9FIlntRzSCSRgJTS9OTqRnc7eJFCf0zSrNayxQK7K2v9+6IkFEE/+by9WVQz6So+8HdKjTk5jyK4ze9oF2CMzpuD1gO8wpvitcEZnpDHTwUHrQycCgbLuEVPB8+HgB3BHfr2qwKiQLm8wFawcXtM0j2cYZAuoTY5Cj7XFZL4mQpSf6mbIpitWPNcX2LKmrVJe5T+Km07hwvJphGduGDXHcqs8VlcCAFgcu6leYprxnjVtop/Bq3PRdOBe1dPVzWqfLdQveTOEFqhW8XruZNCdeuXhMwAwfUVJKNlybfVLeCzVffXLsgso0TkVa2AfTgWxUkVshkFpgHYz8FcjSQwO9qOjtsdSf1aAZutRzYx6WSiMRuBFO6t2xoRAaCCMvlvw+OEomxcSpUbM+pVXjBFyITgyqjOy6X9UxNtIgs4NnOSFGHVjAcFXqevP4c/3Kwk+a4QBeShx4UyX2Q06g5G08Ur/kHhQclAujf3TUg9N4BU7JXKcD2uMvcJhAUgWppqhq3lIn6qt5dRMBAKy1B148S3p12cpV8Z1nay3Zf48TSfs4MoSlj8iy/uSRMRJqiy/63G4i1SL+J9UyR40UffPlzvCMaU=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:IaJ9o0AJa89x9BgInZ9JmEYSu1q/W6Zl+uF+FvKj+NNtoTcpuO1mYQ/UA3NNx24qc3sYOaIkWicM5hWT32F6cZD2FxDfnw2dxktPFkcw6020Q8OPuuYKrbCx0t/0I5cuModNVaKoDYCdr0lIj8pv1Xu/FdJ8jutc4TsiX3JTYCV1RF1xXP1oOuGI590r+4Xr7tkwWjWYuPJaOYAW4hk0R/7HwHca2uU8QRj1BNbQrp+u0tJhrF5l1BBwUjORgVXzRhcqHZHWcJ03s8nHxpj018+CwpoaXexIEIvtT9cjCiNThqdg0+fEuGI1AtKLNpCS5srDrw5bLaTKLm+0ezb8Pa/vVORDQSqj28qLOvT7RxQMgOmfHPLS6g2ywkXywdQbpaoIXIq4WINR7BpDqoMfbFGUVSWDsJU1e8tAF+5YXcAPhwFgfe9W/bb+za/Is46kEjIsBLCNhMJ4Kj3sbBKS+GpPceIyDOcOW/pE7iCOyI9I8NV8n+4uzwJrqAkni8BHJmv7qq3/47x3W/s7wDddcmz1bImjBQA7PtR69HorFe5TDnisJN/uhLDWAyFnlp7Xi4PpFyrTPOIPMCfHjDnDypSEm2/mM7uNEznP/oQ/Npv2NYwuEPbGL94KHzjGpMkO+/hBcGHCSQmXJUqzMbZCVn2s7vvM7NZxurzn84sxoNk=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:9tqhuOqGg6SLQdo4yiW2KgC2ji8z+h/txJ1hhJGhc3MzVhaB51G1NV5UlltDWiIVaQ69lxaOjrtIRc+6VDLz4vGV3S+VNUjWe8wb4OQOH5ql9Rc2sS91Ct3SEQKy5YaIt/cEIOyF1Tf0gxzdJqsyk447zOifj1bUh0QR0Po60CMiKKTXEeA1rxl1gvl0KZpKHWH6yPcRgz2h3pz0btJors5mmdRg13pV+YpBkxxG9X11PyW+7yEU25sH2w+DTWYVb0Th1fE4G7QKcUzCLidXMkFzMHKUXQrYDXa5Jmx8rwT1O2gyAyhPc2Wazd5B6yzF0eydONHD/JbA64DGuem99A==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB293538AE76D9904C5703BCECABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(42262312472803)(236129657087228)(48057245064654)(148574349560750);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:SjjPHveGwfkbKJ+Ak9wJybevqbMdQtJaybiyjZXl?=
	=?us-ascii?Q?A1gltZUFtRluuDygZDm1Q6cpLcT+Wq5uoMGdO1NOpWOPL4D2AJWMZnnUI2B0?=
	=?us-ascii?Q?HYUqE5tcylmajcx8TvuzGS8dpD6dFtbUNP60JNSuWzJuvYcA5L/bLbWpsQKc?=
	=?us-ascii?Q?AgFCAJmI2NXq1dcY2Ryl0Ubp9CAiemomPdaZWlBKByV+3urPzDOuU4b/v/P1?=
	=?us-ascii?Q?bJyRzofrhNxvr7lG34lztQiwMqFtOf2FrSZ/0bmPTaQOxjRlrWpUqnGnDRJs?=
	=?us-ascii?Q?YQAQuBckAcRtQcQMXmDMpNwoerRP5QO0lZCwERBlW8cJmJ9Ibzx7PMXOwgRN?=
	=?us-ascii?Q?gxvcKaUHXwT2M6eHflvhokKErAq/Kw8RxJcX6qsSmJFxLi8DhCDdWCeGAS0Y?=
	=?us-ascii?Q?7ipZ1CIRIIPjphXT5AUjLPB/V8DZPlRXxYi2U3wHgoCl+g+FwNAiIP7yvAC0?=
	=?us-ascii?Q?akB9js6ClfvLe2MjQTMA3qPM47R2ZHmd1Nz3dd6Wac2VFbNnSAmBP6pwh3m3?=
	=?us-ascii?Q?pH30jRR0U6aErC55BjjIpBO4odL0ak5asKv618Rmo8VhBhmRc3aY8cTCArsY?=
	=?us-ascii?Q?4IWf4xQYKDBDB74IYwNRcLGYHV8kPJYC+Pvfl6v6Ku+IT/5HZd+/29Pnjeza?=
	=?us-ascii?Q?Pcx2gnxXjbZrOjlMjdVt2nI/UW03iqGeDVpNmI6p+GJz8687LFUHy+pgfW/u?=
	=?us-ascii?Q?DTdBC7YFdYZZjViwGwcKRND96TMJV6rqfq20tkeJPcmdRI2BV8msuvrj6uy/?=
	=?us-ascii?Q?yrbeul24/RFf8MwX0i32l2U4Fwv/mioR9UZpgM7YYYBqcyDXQXIg5Gx6wG0u?=
	=?us-ascii?Q?l5EzTmP+XfgndjC/nWEaHDsbja5B3FVNLapCDMvOkLOGW7PD4JfMiVZsX2f3?=
	=?us-ascii?Q?/TSllWXyWfgnwnQWrytiaTIJdu/YWg6zmJ3PclC4nJYprxzjVFyIF63t1qKd?=
	=?us-ascii?Q?/5U+9N4vsKq80hM1AkOFqL/Mz8E3c7GMZz/kXc+bh7F55DwzRQsK2En1lTaL?=
	=?us-ascii?Q?ycZ+DnMf6zjHtKFGpdmoBSEp90TCRDlGUp2mGX+5yK0fLuib08EFoe8bLfQ0?=
	=?us-ascii?Q?tAmO0xI4WE9F7n1cKSb4XXMdoRA9ZNiw4Fl9iGo3/3H7jGctjAthADf0CrXb?=
	=?us-ascii?Q?4ldlBbsYWpnomF6OV2UDh5H+MwMKUdpzJ0sJw0obU4WGP8ZJOn+UB2R38Q7n?=
	=?us-ascii?Q?r+UO9fwhDghtmWqfK5mAobFHBHJbreXCOEMvBF1cy8XodKn4aMAoWpW+n2Jv?=
	=?us-ascii?Q?yU4sE2w1pKgdcK6H84psWSxcEk2M4cjKCFN2mmNWbGhTYmtaiGVWxSIRvFja?=
	=?us-ascii?Q?YSr3BNT7l75ZAwMmY61XWhA=3D?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(966005)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(575784001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(107886003)(6306002)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:3SsRKqsPVE0Fir9wQ2iyaLyYunsu8PqJTFXoDC3?=
	=?us-ascii?Q?B1H8IcLPLsy9fS5MCYjuzdhDsxvFIuLn13AUs1KGtk8LunDprP5/Yl9/dCIz?=
	=?us-ascii?Q?9hVIHp+Q9zoMzIyBi/dalCDo7o9lryXeN/e2aJoU0uHJZYSSyOhVpSUbQ2Dy?=
	=?us-ascii?Q?ZBAaLI4VtgtskyS13Mn5/plQt7TvrPh55MPPubFIy9GW8FTB0fTzj08p7x4Q?=
	=?us-ascii?Q?yWcsSgmVBKVzTk2Xkh+l/iB7N7rocGozJ8IHioCGEt/RzzLSBKttfhK+h6q4?=
	=?us-ascii?Q?Deb0FU+fFsbFVsXC6OfHyTiIBODdUJoeNvyVhrNzfjuRxsv3/RVmEoXczfer?=
	=?us-ascii?Q?GjcGks+7iFM4q68dNzUHewIitkVsVBF+X7ZdmaASJ107fMATTFN5oCZyxXMA?=
	=?us-ascii?Q?Lzss/IIuO4dXM/Jt9OuFxvgkoiWr8gTp0pq+jzECAfkbpS214oPkX0FGTxAf?=
	=?us-ascii?Q?xE8lBe3eaA4Hn50FGnm3d/gj+wYDvtYOLUxv/7btaN3iXdGpT9ru8z/ny/jo?=
	=?us-ascii?Q?K2rjJtZvNevj47NYTWxid6ZvO+wHJzvGCrMM/BNcBQ//2IgdlwyAZy89jTE2?=
	=?us-ascii?Q?O5HfFLQIeYb6T1zOFm7sUx1+UfiCODGNGWkHryhgRW1sd4NdwXbGKji5FAp+?=
	=?us-ascii?Q?7NlzbbwN46cnGM4EAzpXBStqAe7qI3YdQs5AfvPkgHRVtG//GrNOZi79hkPJ?=
	=?us-ascii?Q?3mwO0z7NXgqhk83N+05Th2XtaZRzYT+IKrPXiZHZlYky6CxOaO/cd1PhaiIB?=
	=?us-ascii?Q?uCeUpVxc4acuQigS2VRu1iRZ9Gz2691LGJivl51O7zhlyxNzrqJThmr2SSx3?=
	=?us-ascii?Q?pLXKyGe4GkE1cXd94D26aFNvLHVpLX2qfkPiHUzNwt4cwGv7D8zXN5kCmZTg?=
	=?us-ascii?Q?Yuel4srG7wUVQQuWgG6WUcS4Av81l/nh/bqHbsPEAx1aqQjwqSp/M25OFLHy?=
	=?us-ascii?Q?52R2lQTPDGgw5ud1/boiWHTdQqb46oiMLhbDMmxYAsdExkfqMIKwKGswxdea?=
	=?us-ascii?Q?X2B16iqZnaBB397MwgTHUWL3a2vHdzt0ThmabZjvfOrZ5803HsAXjITwhNy0?=
	=?us-ascii?Q?EtH7IdGk0yWSKmq/acnpvucmYkIY3rk8L/IXg8GBilMLQgdURHAw9EjIkONw?=
	=?us-ascii?Q?Cm//RPu8Cs7O7Od3DbnF9aBH7qfUN9lxC?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:Nuogi+wzl2H155rDvk9KWDmDHElsVFVNriU95m6R?=
	=?us-ascii?Q?R/mcaybDX8mPy7W2vL0gzRGlUzSYv64Pg/kfiDqFbmM5XoAvUcEVxodyAdCq?=
	=?us-ascii?Q?lJnoSLImeMkFTFkOzlOVGjk7ldiNv9b0VS2CaSRhOtLxCEZMuiSzEyxjGRO3?=
	=?us-ascii?Q?qoK7brEHs+u4Z9nyJN4BBu/6JLW1VP+/5iAcKsGN1b6BBJr6nSCUnRrHSx8y?=
	=?us-ascii?Q?zq8jGefY55lw0QsLUJonxh6R1JSJbubEVTtmGy0+Y47yW3xy4dqDOTgFNndI?=
	=?us-ascii?Q?PbzHbvfV2hpOi3jkR1fekaDLQMNQm2+6rUxyEc+Sxiqky81LWWtINIINUtiR?=
	=?us-ascii?Q?3fP3AK3Gh8GYZuT2lgepNlj1pyN9fbLxsYVN8pal83aDw3PJs8gLzDTUC6vr?=
	=?us-ascii?Q?43rzfJaECJktmSVP0YoXYZFphWlwTz77p6CbHDV4NMJXxIG9VFrvONK2pH39?=
	=?us-ascii?Q?9n9Hp0vtOOr6Sf8LisOQ5xqpV6Hjg4gakgGDmX2OA8vOwEfmcbzXuKF37Ou8?=
	=?us-ascii?Q?kdpqCyE544umjwA2yBU0qZ5WXQwL+TgKYGSfAYrBmxjvMu72vfFRJB+ZWhGn?=
	=?us-ascii?Q?UOJWHv7t5dDblT9L4ZUaJy2PHnRgz8+KCeDWML9HKpMYgNAH0CKes4lu/KMD?=
	=?us-ascii?Q?YIjeKVEGSg7QoUDLh+xHOTT6+OdsMWySd1fzBKmJzCN5ORci2vuDCjXXpQ6A?=
	=?us-ascii?Q?Tg3ueSOtC3svZ3/mXISbEknGaFRCoHngrMSj2wvGpNWluPHKspU29ziWE8WZ?=
	=?us-ascii?Q?OSdZVkQdwOqoAWLiBYoWwB7QLivTSYhXKOIHbrqQOMpBIVSIMcOao9HkNyz1?=
	=?us-ascii?Q?dNWoz/0gECqEiwlwq6qu60yW22wiKW8cbL6wDmXkAFjD/wYNgfgm6D+e6X48?=
	=?us-ascii?Q?UFrNobtUCRdOqx5+ct8GJpE+1fsL+KqGD/uiM6mi5Qc1bwRq7+BT0G4tlP2y?=
	=?us-ascii?Q?R6BM3d8P4qNrnhv7kAZ+M8eAqSd+kY3nzd3PVY58HwvAQKEiGZPWDwNbdkAB?=
	=?us-ascii?Q?72M=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:rjoNHA1duDvbeFzV/SMv5Kch/iC31LJQb30l2nxMuSn9g3/GYot97M9yN7Vy1Bc86ALHy8OOb8bs4z+ptOcrvTcYszxy10TDsBWR6JKveR5f9ObBUWktPRKZhJ7BfEU5Lp/Fk1yqS81TFhLeu+AWBDq69I9SpADYBIlcdov+4h9uUANyQOfn9i8MVRzMArBz8bkjTIf4rTCIifb7Gy5JV9oxiWMQAIO1xUDcD5/ihlZXWhaTrPeRDN3Yz3I5o7477FivhiCgHxhXBUKX3EU6G8PRCF1+HZZ0mhbIG57omeVvHiuVQoAHcUswmKcY6ZVDNGGNYYdRmk7TmUUD+ZY8Y8qLX0G+5PHZ0DpA3uvDXYM1WdvPGPd3RIfvBZ95emsFw+jDu35pohBk1Kbgn37f/AyYDVihXg/vi7k1QmyR2k1Zg41VbgvOGMzIh2J70zV2FRugap8OZ1N2c05DzIWLyzVoIO6kiP6WSrH0BeRJP0FAdK4d6vMTJQVdU+Qhn536;
	24:RQ69lj37iOo0wi0spEABP3UZwF07t2aCyQbjBG5sOXmF65lKex35THttrF5X/1nV0QNYEzxhEBq/3K5yWeZ4BAL3LUL9XWVtyecl+Wx+uZM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:QzzlQbHkJrAQN/ZXGtPsr+2RFjv0XrLcY81jj6ruYxV4/x12x6xaCMuqLLW6bu6sQpGi0FbrivN4O5lNQTukEY8Q97Yr3TakyVBWgu6cFIQXanF6cr15Dhw+4ZTQHwv5/B/80l8K8S5tWhN4FWHMzmVbOhOnAdJQrKFnlaibbbRkD/EXj30NgRsQi0P2Ku/vzUgQ4Fr5RyeNnLWBGUck5VMzzy+qCcQB3sxv1A5fYBu1Ajo3uFNKNkcYQI+RpogdxxpDEAiOw728xviEK0pALxrOWy2A7nr5rUB+//fgm5yBjrXiVwjpPGhUDlIuNX/VVOzrbHi8PPEusI568oDfBnPJ++fPik/G/PgO1my6WJX+DVF1l+Q5FJtdIL/BIDaW69/SQWHUNIBAWjLcFj724oeOBWd/pzkfVuahC+JQJii/+NmHxShVsnATHrPFNwNJyU2f3deACYFNABy1R9q7btjMLTCPzq9rEjUjus0VztmSnv3Zmi+D1x+AdYnpS0KrikbdSoDHg5TeQsSEFDIkU6wZB2v+lWvGAqQPXp4I9nfUZ3/Dq8wzSgs4PgnpLlkUTwVx3CEXN0WfZ6/G8LhHezZSx5NZ2dDIXf9Il2exTJgmy8J85Eiq8Cpg8O4O3DKQTdzqKfbJjQ2cvMez1yeWnqfsv9j6yAuTYsxn4DSdsORLvgLBiYEy3Hxef4q0JqjYAJay+szmDPLLa0FFiPKhaWF6qHUbsM/kbawNhHzcPi/nFpOnW5vWD4CxRMzXAV+Y2TQEs2Vj8I+olxYRWe7ZGqVtRKyoekWvPrpozZbgVjI=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:03.5546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 08/17] open-vm-tools: don't use dnet-config
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
X-List-Received-Date: Fri, 23 Jun 2017 23:22:33 -0000
Content-Type: text/plain

dnet-config wasn't found in the PATH, and it doesn't work properly for
cross-compile anyway.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../0002-configure.ac-don-t-use-dnet-config.patch  | 41 ++++++++++++++++++++++
 .../open-vm-tools/open-vm-tools_10.1.5.bb          |  3 ++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-configure.ac-don-t-use-dnet-config.patch

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-configure.ac-don-t-use-dnet-config.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-configure.ac-don-t-use-dnet-config.patch
new file mode 100644
index 000000000..e9cb873f1
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-configure.ac-don-t-use-dnet-config.patch
@@ -0,0 +1,41 @@
+From 929150608c16644695f19cd2e0cc8a06a41cd497 Mon Sep 17 00:00:00 2001
+From: Martin Kelly <mkelly@xevo.com>
+Date: Fri, 7 Apr 2017 15:20:30 -0700
+Subject: [PATCH] configure.ac: don't use dnet-config
+
+The dnet-config tool doesn't know about cross-compilation, so it injects
+-I/usr/include into the path, causing compiler errors. So instead find dnet via
+-ldnet.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Martin Kelly <mkelly@xevo.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3400b86..7d6119e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -942,7 +942,7 @@ if test "$with_dnet" = "yes"; then
+       AC_VMW_CHECK_LIB([dnet],
+                        [DNET],
+                        [],
+-                       [dnet-config],
++                       [],
+                        [],
+                        [dnet.h],
+                        [intf_open],
+@@ -952,7 +952,7 @@ if test "$with_dnet" = "yes"; then
+ 
+    if test $have_dnet = "no"; then
+ 		AC_MSG_ERROR(
+-		   [dnet-config was not found on your PATH. Please configure without dnet (using --without-dnet) or install dnet - http://libdnet.sourceforge.net])
++		   [dnet was not found. Please configure without dnet (using --without-dnet) or install dnet - http://libdnet.sourceforge.net])
+ 	fi
+ fi
+ 
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index 6793d450b..b3e0afca7 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
            file://tools.conf \
            file://vmtoolsd.service \
            file://0001-Fix-kernel-detection.patch \
+           file://0002-configure.ac-don-t-use-dnet-config.patch \
            "
 
 SRCREV = "854c0bb374612f7e633b448ca273f970f154458b"
@@ -76,4 +77,6 @@ do_install_append() {
 do_configure_prepend() {
     export CUSTOM_PROCPS_NAME=procps
     export CUSTOM_PROCPS_LIBS=-L${STAGING_LIBDIR}/libprocps.so
+    export CUSTOM_DNET_NAME=dnet
+    export CUSTOM_DNET_LIBS=-L${STAGING_LIBDIR}/libdnet.so
 }
-- 
2.11.0


