Return-Path: <mkelly@xevo.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0040.outbound.protection.outlook.com [104.47.33.40])
	by mail.openembedded.org (Postfix) with ESMTP id 8C45B78216
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=k/K5C+rsYRdL5EgErAWbS3Qlxb7PM1jy43V5WMwxCgA=;
	b=ZhNOxxh5rG5qh5dYBlU2eWFml91wVo00Qzu7Z1QfAqbwX8AooOe1cTiN8k7Skx20rMi1s6av94tNhWfoSrTXEIDEkBtLnLsxADJtwAhWvIUIQ/kLRtQX5woXBCgVi9F/gF8Exkm0E0Kk8AJ38rvxhYsKC7vWTyMAj+67tYaxS50=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:49:05 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:48:42 -0700
Message-Id: <8971f01062cdf0e581ecdb937a7ab6782aadc129.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12f5bddf-a443-4d69-dcab-08d4ba8a0d42
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:BFlR0BB4WwoegQK64Z2xJQaiuCdxNVDnroZtOXPgCC9p/1lF63aUybqB1x0c0ax3q660toRrE1pUbxIMWv33UObIDShx0GSXuij+o79dwC0qit4XXxAoHGNqKkzMlzAykxrHr1U08yTswr1gZDEmOVYKO8ed4XzY142oNOE2aO+HheiDxcfN/zz4lmo4nDEyCSXJGuG9Dyk3PM5DTsXHc5G6BdbwR3989zzWm36ubFXqSkG0yCcfo7Q8rPUtm0QDLjr+05oygBWOr3/w9kBHoiiZgVasOj15dYO1E/t1pKs3vlAWh2QtSjBJhOJjotykkptYeQN4DDc6961CfYQJlvnEcfBuqwZFwkE16e+ZjhCHCsvXQEQ+YawSofUuy1WpLlJRuxI7lMzu10jv3KVlMDqqXeMNffGQ4DTIGWht2GzpQfDSRE4q+MCrsw/mV77uQL5DqsNw4xv9s8GnOOCEJWAi64mzqhxEQltMEYvE2a2GhlFcjmA5LcphUUumRWTPIUpcbIrBbawWyMnNtxOi+AuIqxMQlRHEcXLWthoij0mRAnOLjRKlmFlMLK53ivGjc1Y4P5qbCQ//raHLQwVUeY0dSda73QWwh6vrUwZjjBeKEXL/PohDiBL1YUvut4SKpsNosUZNxHzAnqkVFRZ/aMHaeIXGc+chhOTXKteh9OUXfew+dNnAyt/SwbY8+zq5V1g3yJPNuE7GM/oAH3m4nPiaYzTKq3OLRZ+l/K56nqA=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:LUU1nNBBvKyM7ivW0vUhalO89mh71wCqln+jUdI0EovoTWmu24pF9NLbcnozzonWYCK6U5uLwFtKHjSffDHgAoKkFFqYVU6/1A2B/V4BZ/ihlJ0Br36NvKDDa+CUKa8SEnmEVO/7EBM2XvPNd1Kn3oy+PaHf/jWoolgKxEEAt/yejkhnERLWpvNti/EjNfFnjdo1GvaYMWDSaM9BvM2nPS/N9zYe8LPbodEoLigRLZHpcmCG8gMzoWczLO+1XkE/jgw546PhHI70Ki9y9JXwwwKE/ol4lpX/y35bHNAPIOkIYlojPN9yJ0MvJHBLh9xpb6mG29pmL+4ncVhwvOudWa2kNvJLsPnvuqZzbpYyZq5T5hzueDoEy2WSsvO6S6fRt8ticnlnQZ5jMROyZHuQ528NVKwK1W3T2zzv7WHuDmL1lwEANZuxFmAwBC4t7gjlqlvYGkyk3dMHlLqovzDlCbSRXAD6cL4H0348KoiCFzJ7UOQeZoO6augwXY+OU+yXL3yRudOZ+rJjQ5WIBbgTtfhoKYP9iQF4sPs272GijOYVjaMCXBYl8dQGoGfgH0nufjVnQ3dNG8ayHoUQwTAYq79wuz4DZQGdEstiVQBKh7cKrIX99oHPEtvk4ghUgzpxPJOcfA/F1wZzqT+SUtaAIDMkCKbfsZgkNexzALQBW3hP2SfCQDhJlUlOvErzohDd/x/HvS7Gkevihp+LzS9Vy4Hi/zeE8oigJIu50ZuVTI4DUmBSGLI3+Gdkuka2+m2+d2LEOHTK2JXHGlPuqZieaa5C4VJpSBYCFWCAYa9A0f/Tn/O2NYoHKjGyuFRHQ0VAjEQmYjhiQ4ZnnJSy1TTDVorprwqw6qICDdj1iPZcBrGy8cpk6/qoDKavENOzz+EcV32qrWY7+MgkjM+w2Caomh8EJ1728a43GDElZtjypaU=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:ypQefn6ADpSnS9g3GeftT5o9lB0NwqoUTx1I8o7WrAqNnTGsQ2Kvw0wtiweojnxbiGo5yLGeP4BBd3tFOmsWCVfdA49yqmwyFNstZyMjHx2YgBZn0mzeg/WjnCR+YWAEGfxMV9lR1/Drh55/oe30v+JsLQgjxJ558XPQL/ipEwa69bJdOBpt/UqCiGN9zaxQw2rsseYFRXWbF9xzSNG+sqqNM8jX7oHlPRKd0gUgdo+ntn+oZjF5fZy3feXUO+N5kQp8xFH18L+KmiqeGVQe4x1JMSCXbYP+sfw+5SRpKTA9/ZzcnSvRL9OEiGjTud41Tsf9VDSDgU2n6gtE0OWF69ftpG0ecVsO46T7ogpcvz4UvVOfA/7Fp4GrRSqRVQtGQbHSY1Qj32OM2Cna7CX8Hds26E/n9cUdoBAwLaSBEMTTew1cJtwzaefoiey72QY21ejUTSBQFvKKukxrqxoNpl/zcMLsXOolqrNjNnpcYXofvHdp5jN3TH0BvduYZNfJDzaNTc+HMznfqG/CI0YK32PWdxcTaxUizpdU2UsU2u7zHHPaba+rxpZ6e3VCI7XywklWET+VRKnmVzBivrTm1IxDzxsrpu3HD0gdtfPNoglhaY7B1e/Tv+WiOkMscprE8PMRd5w+YjBF4MHkbyNONREElJuQMRg0vFpWHfXChEQ=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:T+NU82dYJUsX9xSgDMKoDGpQcyvXe4ezxkEsNEAvFSFrfPfTjg3iaR8X1u3SgXg8CJ1DkBChRSB1CeOspTma3plxwLzbpQN63B0L3Ot+Ktuz9Jw3qSLj+F88rIFfe/peeNUCyPdcEOlaUZ9zG/Q7JqmcuOWnxBELUypAEGqA+kwjf6wF+i9Gt+i6tTpnnukBgkKI/fgrutw7ssYqcim4Uwhdr8I5QyVrgMawr1spAycgqaKfj8hIIfwWnTuCSqd5YexHuojKgSTWy27UEnAE+UAWaKPMkYOYQjMQID3RMdTPL00BL/v1fNR3x9vBnf5HUIGnP1PL0CJpkLGBsuNNhw==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB2935530796681A8A61E4ABF4ABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(227479698468861)(166708455590820)(236129657087228); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:bU5vCpFoUFQPmDl5/rB/Tv5ZjszN1kH04MTTyKVd?=
	=?us-ascii?Q?zTo+cxuvcDsje99/7PbsVMv1/PHgNkmjisYJffRG0vCDsRqoXiuWl6Khiv97?=
	=?us-ascii?Q?Q1egFTK1UZNdZtpzlI2yJ51P2+eS8Jplx9jDzrA8a5nw1ybQ3kd5iv6XGLTD?=
	=?us-ascii?Q?LBPKE7RIDB1hHSYOnRub0xRYCgGpzQVBazqD2MFNHhYY4UUYvDszH8ILLYF4?=
	=?us-ascii?Q?mqsmxLEMggHiTZ+RRrEeu+TLIDfCv0FYTIvGpj6X9X+O28byJnm2ptLhV3Jd?=
	=?us-ascii?Q?tLw4/IdwVX7CCFdjN+2ueZ2zncw1WHNO1l2RzgKvfco7QaFFHMg1aMwCvNX5?=
	=?us-ascii?Q?Oqzrv5ZvJptI7QsnyW7GybtcN+doB01zautGdl2Ki5z+595tfzplV+4+h6sJ?=
	=?us-ascii?Q?ta7VplJspONDaOk4rPAw0S0awRhs5wackP3Zx05ezRWb5Nh0VH9bGBCeA2SR?=
	=?us-ascii?Q?pIdbIu2Sf0zkxrAWKTPv8+TSzkah+NFZUjuyfGwd6HINTef5Z96GtKM8lyrw?=
	=?us-ascii?Q?OaGIYuOGRqMFAvRDzIR1o9FeEKwe3rilTS6bCaRSxVUqziTKAV1vM5b3Xujn?=
	=?us-ascii?Q?uedwcZMTBKOeGyuA+tV04VvAsLmdQc2nBwy0TfYrLouF6WJwB1oNyMwNx80u?=
	=?us-ascii?Q?Kw1+ZdHXzksYyobyo1wwV5jVDXf/wgNVMsSj0fJ/c3lwl9nXPZOA8qZkWJmg?=
	=?us-ascii?Q?+dO1y/NpXxQn6pbyrunZqIOw5oLqDdG7fqJ73Wg8rXgFYMS59cvEGoFtqMOQ?=
	=?us-ascii?Q?Ojoj04d9jiXOD6U1OXtBZpxArO5XqoTCx+zboKNA2tdf4FxCVtN54PuUDQ8E?=
	=?us-ascii?Q?s3tA1y0ueAu6JwkWIuJP3o2pwV48RfJTiRnEN6jhJ9SVpbvbYTWMJBSsy1Nj?=
	=?us-ascii?Q?qDXavsHhCBtHjs2n00ZcIA+Lhe0CFrbxCuUndcXZPYG9m2LhNrHDzMIe0e5y?=
	=?us-ascii?Q?KhfDVvkGH+yhz/ywzuFPP6Ex4CJ6aSlYmYKRZv5FYHK6wmRUW+xcCoejVsCH?=
	=?us-ascii?Q?xMxbWU2yr/Ew0I176yRV7dQmFXUMlBDo2VEupZrogQipX8dRjTzx2TSNoQZu?=
	=?us-ascii?Q?tRHPj8sTuy75tG6v2CH963l6xVbzdZTU2vtNtvITr6n248OKW5BhsfY81EXo?=
	=?us-ascii?Q?hPko1rnooEGEKWGsFO2FXBht0zkQGIBDA3gjgwZ1XdZlN8H5px3TxyMZPdFF?=
	=?us-ascii?Q?p7uLXdkysY/cCAarutg59ma8Yv5fAQkz4yMMSLvdjZuyhWXgJu8EhnLBAzt0?=
	=?us-ascii?Q?rtFv4AQmZjRmDGENI1c=3D?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(575784001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(107886003)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:eRJEoYxZ3O+SlZBnbaH4wALf/Vdd4qPu8BFyM1C?=
	=?us-ascii?Q?mpOT3icpjkwrpI/jbh7QG00+XSh+A74p7g1XDw+tFUggoROTfqUSBnHvr3kv?=
	=?us-ascii?Q?I6svRYBY0ktAsnAIv7DprV3HmujXRIe6eWLkVq+4l/udauBJzWDY5g/MSWeo?=
	=?us-ascii?Q?y7kTOEI2+/xyVapU1Iw+x8dCGPx7wvlNRJPhU0VmScYaS0/R9W2m82cYDeEN?=
	=?us-ascii?Q?jG12TX1iRMa6HslLmCLB9w+Dx5SNIkP4sVkjY2+UF6g6oflPWbTKLkuBJJr7?=
	=?us-ascii?Q?VGB3KrbTXVQGQE4q8VJbHOlOpTEdfw4ZxE10INPo0XAGqPya1EeZIFbLo7f4?=
	=?us-ascii?Q?h73Q0g6aw7KxhSEgNK5fEXXqlZ9+TvcBQcno1BAsRFdTGdaWmfnsqp8jhyaY?=
	=?us-ascii?Q?rffCl6bDigBnK3cu3aaukBjt2gdm/3iLr0Z/mAtTFzX3hhAOeCsBf3CPkFO4?=
	=?us-ascii?Q?8JGHKw09FLJa9MHINoQk9XyuRqfjowXejQbX1tQPn5IlB4SUsyZR02eKv1c5?=
	=?us-ascii?Q?bMjQY0TxkjZKkSeIWqxysTjNyGfWQQIoDidcebfYk+LLQtmUQnWk9HtSfdwO?=
	=?us-ascii?Q?UJt9PkcJhk4Da2RSEu2n1mXzlJZJ6KJ6/UCOPR0pAR6UT3je0SK0YUv18vR/?=
	=?us-ascii?Q?wndUVlc+yN+RkRNoJfL0Hc/q2ePpNF01PtmOuEGKgapDqXPx9fPgrK1jPEsi?=
	=?us-ascii?Q?T/tqqLqsoPSwcAfynlYjMCjejvVCd6WGQQx/VNUtg9cVzux7zVZshlGBS2BI?=
	=?us-ascii?Q?MIminiYgofmbtnVeZsCQJB1pThdZAxgPJrP+O4RmbOCVq7l5GkFZ8RkcjQB3?=
	=?us-ascii?Q?z/1SImgnQiojXiIr/towefN0/a0x4vCYvi+RpBiIrQUkIN1dkuPQH4QJQ0H/?=
	=?us-ascii?Q?plY93U2JQhQmUC+sbWQnDIhrIagEkvx/3sPJAqwQuhT/Fp6m0V5J7X7syyE7?=
	=?us-ascii?Q?WFfuyQr/Z0nPO7Lkzp5AbIJRIFQwV8ENwTEgSCB1It2AOuffpkHUFFYf4LfH?=
	=?us-ascii?Q?kxqcC6eaQmz8NdfPwx+300oOgHqfYyWuaa+xzPR4djapWbhE4x5EUMUIJS6N?=
	=?us-ascii?Q?r7X45KwghlYtC9NhtQRy258+zW0Gk1CCOrqfWOqBLaU3tAkQS+s6eatYh7ph?=
	=?us-ascii?Q?46eTHhXiOr6A=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:uBZPo54ORHGwPgXNCyN8x3fBhrSk30ooZoFhqXvz?=
	=?us-ascii?Q?TdjRKAtELLNl1m5OQf4Z77igLB1F8GQjg5//Y9n95WOCwqN4eThkQ2rwZebI?=
	=?us-ascii?Q?jQOESu2EpyMHP6jLl3Jd9C0q45SDrLbwSs1+F4GI2tZVMHZQxknckDnKkp1e?=
	=?us-ascii?Q?NVskJlJ7u1zMhsN7UtvdZEHKAfrXOg9dNq3jFFVjedK5FyHVO8BtSCPzJZjY?=
	=?us-ascii?Q?lz0DvUwX+9K5wQdHV00MKEXmVwKRRWC4bYRjTpnctivE1qe/g9SJAA+kcn2j?=
	=?us-ascii?Q?0BhRSK1thyxkmC0uy2dn4DHLtGpTdTCN1wGUQoH1PPHtnps039Lr6ghTjJtI?=
	=?us-ascii?Q?sHwUO5f3/2TdKYezV/eQiRBRN1HDkUm/8CxWQXbKqZ0f2vITNJGgUfEyH45X?=
	=?us-ascii?Q?PLXLu5DyGg8KCOwGwa6PWTew7IbByKQ/xGc9AM1tXTeHcvqXFtmyeBbQToiz?=
	=?us-ascii?Q?+LbFLyFsmCEvhyA9np3NjRybyVXyT8vn61rE1M7LdzlG5yKpOJGjW+yS8VHZ?=
	=?us-ascii?Q?lwk2kIvtCGxaPxCBx9thi6W2Uv1KSuUOt0ZSjHnzB+hMqQXYbO85z6TcMd0X?=
	=?us-ascii?Q?CNzH8ZpaCm//W0Rn4Yuo+I2Z7GNRK7JQAYnDiWTkr45MjND6bxEVvP8QJ5Dd?=
	=?us-ascii?Q?7KT/Lmj8/GgeaNsXGwTNp2DhBN0LRilJFTStEJdcopjE7fawr31y+UUZNqAp?=
	=?us-ascii?Q?47o9CXFsAm9V6lGr7buZSDRjno6UL6/Iiv3ze3BgCz5npaoZjzlrBJBhZdmv?=
	=?us-ascii?Q?CY8BExPIidf+RWRiuFdDpNfWl3sjVHjcxUWn3dFU8RYvPpydJ9dksaHKJmC1?=
	=?us-ascii?Q?8RbkP0Rvu+EenYb9LaOb0jZuPXYBW+kjZDjnoK/eGVTesosDbhcrNBA111oW?=
	=?us-ascii?Q?Gl9SWTf3req7WP6+txRrCuhkpPVGK/FQ8q/gIahZVmsVy0LgXht2u2c1ot0H?=
	=?us-ascii?Q?FPiqkofZhyM7DBNso+I5qWS73sSyDlpN1n19enmJJp6J0d0VER3Pq2RNHb1g?=
	=?us-ascii?Q?MdY=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:L667+R4r6GlgsYQqvO743P6UNmQoDYWkJk+hZ3F5G1FxOvvMINL0rOAzaPdX7JmIJmpES4Pf8RlCNouaENgvJFIysLuiafEqVUZlSGad1QlzfmV2MwM8hWExi4D7xzaOzo8/V8o8uGdPa2K1p9Eu7WWt5HtqrhHBdBa5vPuIfu3HIX6ktfnyW33bFQGBzIDBVMN6Gd9O+jdrpXqmFsZeHsJUVX6d0/45lDqFvOh6j91MSEitLFsFcFMDNjbJ+1AAI82BJp1I5jDffK2vDIGdfQCglnNYt21UhOW8eZvv+V5NBa5igRkk/HCdqAnagIGLe7MonaMWTSEGHwbnKSdOSNEilKslKgKfb5d0cUkPh4ZWd0IuS7mAoq622Yszbr7NByl6+ojt1lpeffsXgoroZz+cTFztw29EkeU3GoDm7nezUJwrJGTuEdiLZuSK1xBX0SdZfqLpGpoZm4TGYfFlQprPq590yDI/ND7W4Dmp41Cm+8xTzmzTzuYsQP0jlu/4;
	24:ieJfVpLUyxkUqNVDUO4TM6ogAilrGOrZPn05iyKpOoaIDyMX8HGPAAHYHi9cQPbEzvT+IlDHUfGwPrj4jioEUYWt5QtHwA0CdtIM8TE9HqQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:3oG8zyUslvA5Z2wvdjE2ZrukjKr4pPV4Wmzzfw3pmgZNhRBZ4JlN4B7wIiwzk2bJH/OIJBF59X6dg0Czg8AYHBOsg22/RE6iw/sQ3Ne6KIuh8eYup4CwQ+DQPLrHnxej9o9hlsT65vb+mkGfbvSSxlxLO0GWa7wllp9xi/TrrwTAceI+bGTk0L+8oBx6pDFW3AK0ZzFTqVSVZsLCANpVVyNDaIOxcAhNv6ot/Cvqthqbrgad15D6Q3i9SFfkdYddlJirdC+cFyj3AU8H0g5HXhR8qi1lBexvOsCGjCBghYeT+4lYb7icgipskY2j8Hf30xQUDhYmx8zgWJmHaYo5sgbsRpe5ln3ICsiAvAO7X9XUBQWMX+Eavh7UwDoOmvIasLBMVtQ4p5bBSjBUGajgR2PyhP4E5P3SjjQfH5zGB3XIog4L+5zbyvVF+eYkzqsij1uOceCWTH7P0lHQbU15dlcVv4YFjdJLbxkGC3ezLg/Yr2AFP1sXxm+LWDJufQxT6JNmw3+7ZtA6TH1/cEUeZpAkgVmxu+hGpfCKbPO3UmyOQFwWRoXQGcGeCICAetOI/TDnqW/0cdgjfmBW6oJyaZXy7cC4IEIFLLgXUhx11PDvj3OJXVJ87+vGmRNFoe6me6v/aVEBZxa2meq7rKUqzEubVU87AF5aX4Ktb/OPBtYoOqXjzz6qesX3/oCz/WvWfTdQ8q/Iy7fCwJdVK/ZP9OAEjvjFeHxnbFxCLiw2MESdYeiChmGCvYpmfHOnDfxxy9gz/crzg6jzMLFT+XSFNPda7Vo1AxCc0UoOOuVH/co=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:05.5010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 11/17] open-vm-tools: remove kernel module logic
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
X-List-Received-Date: Fri, 23 Jun 2017 23:21:23 -0000
Content-Type: text/plain

All the modules are upstream for Linux >= 4.0, so no modules are being built
anyway. We can safely remove the build logic for them.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../open-vm-tools/0001-Fix-kernel-detection.patch  | 35 ----------------------
 ... 0001-configure.ac-don-t-use-dnet-config.patch} |  0
 ...atch => 0002-add-include-sys-sysmacros.h.patch} |  0
 .../open-vm-tools/open-vm-tools_10.1.5.bb          | 23 ++++----------
 4 files changed, 6 insertions(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-kernel-detection.patch
 rename meta-oe/recipes-support/open-vm-tools/open-vm-tools/{0002-configure.ac-don-t-use-dnet-config.patch => 0001-configure.ac-don-t-use-dnet-config.patch} (100%)
 rename meta-oe/recipes-support/open-vm-tools/open-vm-tools/{0003-add-include-sys-sysmacros.h.patch => 0002-add-include-sys-sysmacros.h.patch} (100%)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-kernel-detection.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-kernel-detection.patch
deleted file mode 100644
index 63ea45324..000000000
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-kernel-detection.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 5d8814f4b4f016a633984822a6dfbc9426fef333 Mon Sep 17 00:00:00 2001
-From: Diego Dompe <dompe@hpe.com>
-Date: Thu, 7 Jan 2016 15:06:16 -0600
-Subject: [PATCH] Fix-kernel-detection
-
-Signed-off-by: Diego Dompe <dompe@hpe.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 04e3bac..1ab3f29 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -151,7 +151,7 @@ if test "$with_kernel_modules" = "yes"; then
-          if test ! -d "$LINUXDIR/kernel/"; then
-              AC_MSG_ERROR([$LINUXDIR/kernel does not exist])
-          fi
--         LINUXINCLUDE="$LINUXDIR/build/include"
-+         LINUXINCLUDE="$LINUXDIR/include"
-          if test ! -d "$LINUXINCLUDE"; then
-             AC_MSG_ERROR([Can't find include dir under $LINUXDIR])
-          fi
-@@ -1034,7 +1034,7 @@ MODULES_DIR=""
- buildHgfsmounter=no
- 
- if test "$os" = "linux"; then
--   MODULES_DIR="$LINUXDIR/kernel/"
-+   MODULES_DIR="/lib/modules/$KERNEL_RELEASE"
- 
-    CPPFLAGS="$CPPFLAGS -D_FILE_OFFSET_BITS=64"
-    CPPFLAGS="$CPPFLAGS -D_LARGEFILE64_SOURCE"
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-configure.ac-don-t-use-dnet-config.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-configure.ac-don-t-use-dnet-config.patch
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-add-include-sys-sysmacros.h.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-add-include-sys-sysmacros.h.patch
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index 76d3840e6..24c8e9300 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -23,41 +23,30 @@ LICENSE_modules/solaris = "CDDLv1"
 SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
            file://tools.conf \
            file://vmtoolsd.service \
-           file://0001-Fix-kernel-detection.patch \
-           file://0002-configure.ac-don-t-use-dnet-config.patch \
-           file://0003-add-include-sys-sysmacros.h.patch \
+           file://0001-configure.ac-don-t-use-dnet-config.patch \
+           file://0002-add-include-sys-sysmacros.h.patch \
            "
 
 SRCREV = "854c0bb374612f7e633b448ca273f970f154458b"
 
 S = "${WORKDIR}/git/open-vm-tools"
 
-DEPENDS = "virtual/kernel glib-2.0 glib-2.0-native util-linux libdnet procps"
-RDEPENDS_${PN} = "util-linux libdnet kernel-module-vmhgfs"
+DEPENDS = "glib-2.0 glib-2.0-native util-linux libdnet procps"
+RDEPENDS_${PN} = "util-linux libdnet"
 
-inherit module-base kernel-module-split autotools pkgconfig systemd
-
-# from module.bbclass...
-addtask make_scripts after do_patch before do_compile
-do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
-do_make_scripts[depends] = "virtual/kernel:do_shared_workdir"
-# add all splitted modules to PN RDEPENDS, PN can be empty now
-KERNEL_MODULES_META_PACKAGE = "${PN}"
+inherit autotools pkgconfig systemd
 
 SYSTEMD_SERVICE_${PN} = "vmtoolsd.service"
 
 EXTRA_OECONF = "--without-icu --disable-multimon --disable-docs --disable-tests \
 		--without-gtkmm --without-xerces --without-pam \
                 --disable-grabbitmqproxy --disable-vgauth --disable-deploypkg \
-		--with-linuxdir=${STAGING_KERNEL_DIR} --with-kernel-release=${KERNEL_VERSION} --without-root-privileges"
+		--without-root-privileges --without-kernel-modules"
 
 NO_X11_FLAGS = "--without-x --without-gtk2 --without-gtk3"
 X11_DEPENDS = "libxext libxi libxrender libxrandr libxtst gtk+ gdk-pixbuf"
 PACKAGECONFIG[x11] = ",${NO_X11_FLAGS},${X11_DEPENDS}"
 
-EXTRA_OEMAKE = "KERNEL_RELEASE=${KERNEL_VERSION}"
-
-
 CFLAGS += '-Wno-error=deprecated-declarations'
 
 FILES_${PN} += "/usr/lib/open-vm-tools/plugins/vmsvc/lib*.so \
-- 
2.11.0


