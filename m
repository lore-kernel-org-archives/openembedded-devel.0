Return-Path: <mubin.usman.sayyed@xilinx.com>
X-Greylist: delayed 912 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Aug 2016 13:17:57 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0076.outbound.protection.outlook.com [104.47.40.76])
	by mail.openembedded.org (Postfix) with ESMTP id 057817016E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tYRB2MFY9OsXrnzuRl8UbC61Acl1vY9US+cXGDBnPvU=;
	b=BGMyLfF5evMps0QOiJoZWh728XKEJQTLb+7ozkwI9MjKkgYFoTq4oxHo0I5sRDASIg/yZ4rjUj61DyF/4nRNMbdD2SW3zLWuhbqUtlLt3jQ18S4YCHiY/UJqqNz0Km1R0XiFWa5aNNmqwaItuVoZx1k1aqDufjveRbGSYBqrGak=
Received: from BY2PR02CA0072.namprd02.prod.outlook.com (10.242.32.30) by
	BN1PR02MB086.namprd02.prod.outlook.com (10.255.204.23) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.587.13; Tue, 23 Aug 2016 13:03:00 +0000
Received: from CY1NAM02FT010.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by BY2PR02CA0072.outlook.office365.com
	(2a01:111:e400:2c2a::30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.587.9 via
	Frontend Transport; Tue, 23 Aug 2016 13:03:00 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT010.mail.protection.outlook.com (10.152.75.50) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.587.6
	via Frontend Transport; Tue, 23 Aug 2016 13:03:01 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bcBLm-0007t3-KM
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2016 06:02:42 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bcBLn-0005RA-C8
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2016 06:02:43 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u7ND2YA9030302; Tue, 23 Aug 2016 06:02:34 -0700
Received: from [172.23.146.171] (helo=xhdl3763.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <mubinusm@xilinx.com>)
	id 1bcBLe-0005Oq-2o; Tue, 23 Aug 2016 06:02:34 -0700
Received: by xhdl3763.xilinx.com (Postfix, from userid 44329)
	id 1A6862CE0534; Tue, 23 Aug 2016 18:32:33 +0530 (IST)
From: Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Aug 2016 18:32:21 +0530
Message-ID: <1471957341-26005-4-git-send-email-mubinusm@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1471957341-26005-1-git-send-email-mubinusm@xilinx.com>
References: <1471957341-26005-1-git-send-email-mubinusm@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22530.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(626004)(50986999)(76176999)(450100001)(575784001)(5660300001)(46386002)(45336002)(86362001)(11100500001)(92566002)(52956003)(15975445007)(90966002)(229853001)(2950100001)(19580395003)(87936001)(106466001)(2351001)(33646002)(48376002)(63266004)(50466002)(42186005)(47776003)(103686003)(36756003)(36386004)(4001430100002)(5003940100001)(356003)(305945005)(110136002)(7846002)(107886002)(189998001)(19580405001)(586003)(81156014)(4326007)(8936002)(2906002)(81166006)(50226002)(8676002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR02MB086; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT010;
	1:x9gzL9bX8ZUASaXvv2feK7jihg5pmcBuqHZOAkP45AHrs3fsvJzO+7gKot3o99QJKm4OYA+DgHV3PV6OJg3Jdb6QDX0GAkh+d9yO5HxBFxvGFj/nQwl/xzxUF0TZ3MxPrDVjAY+sZSABlXymH/Q0L5+jMnDfFNFf4TeNBl61Pz1pG0y/5gZoyCJTzvpLI2Qi/4v3JZajqqlKYM5Aokr9zOPbDrlEkQrohYKwdMEkGRf0kV/LWWQ1hmo5B6dI067iU40HvzZVQCuf4sIs3Afd6DzcOj5GonucKtK5wyCks1dIk34fHpORPkUPAeVTnqBR0b0op1NswzuN3h1f6b0CYFrsdcmYMP/8TtDPubI4EcBsGxlEQtbBbJLQRMC4btesb4dLCk3Rg/EWokcQmTh88Sa49oBs5fy2IX2KBiAOWYzgC31TqJpsBIAAq8O8Bc95ZvKx4wnF2ZI+LcgOVyaWz1AaFl9klElJkGa584wA95Cz+RzdpWSAY2/ZXofdHt5KIOtGcQs9TW0SvIrE1sPeHmxsul7eFrKuUYggD+oiHfEJmkXU70cs8c2nvlc1ChNU
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 904fb9ef-cd81-423f-b2b4-08d3cb55d027
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB086;
	2:V7Fdl91gXV8lXvCfc/b6lHEBqPaL421f030n+Z71hNovZqKoSyyBdxLjCfNN07BLRc5JAl+ayBlnvPrNFuHUy0fr9As/W8bBPCpw5LpAVjwIIcT5zTJQ5hrvx6i3BhofUJ5NirHvtTaB/URDs8k86zQrPyGzStp2v1ePy7hl4UQ70cQOA7g/7QXPdNrc0ujF;
	3:px3+rWhToZqXxsIQuw40Um2WQqT3eiBAqPAwIgSxsd8gw0uGao0omULm5qt9cvnfuua6X1y5152JZ1s8ladtFLrT6E+ZNf09O1olD7K9daRSOm8728jbUPu+l0NPugwc+/XYNEBx7ix32m2xi4pKJb5qjVug65O6GCrr5g6XT16rO1sDkTbyjq4USb/y9Cr/wx3ZvcAuDjMktbZboDjTa5q4so5VXj/SWPLCH7xmwF++iN1dZ3GFeujUQab0MUgf04XBIsF2NYrbzlWYlHu9hw==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BN1PR02MB086; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB086;
	25:RR5oNXruQcFsv+/5oo83wl4MgxRMxjgRUXGKhcQ3rdvvvNRkH+t4jcLbQloue1F1Vpg+wwflbEkc3gppbU8aGbHn3wnrgLiR48Rvky0y7aEXuZ5SMCqNYnQBKlBF5R+f+IKvSzv0cXh+84gMDzfA7kMQ675VIEb55DNKWZHkXejDrM6zv74FDtRX5Q1+bFnkmhaWNNmGFQvSBQnWhqXKKMfODlv17hvJov5cJpgf3GcEsHkphaHlbm5EtyKq5JwhiIgejreObzc0y7wtLiRu58ZPOFDi8oDe/RF7PLN6SZwg+0bpwPM5mENiotyA5lDO3je0EwX+o5lTz1phjMIQW7edLTSEKzGo2H1SFOwNSHjV0Ppy1sGyzVYCMdT+WY26CYseYdKDUG7chEbLAojn3kjTAAiraMMiAD7QT4GtRVwZzVe6NjIfgAflDV8Q8iXUOvhSvYod+kR5KtpKFn+oGDe9fg+Y8NEXrcvm/2b7R83OKdjBmP39w/hCU2+o/+oKMzAd3euu4RkykvTEC90I1k5LCGsVqjT8diIA3BtUzsJkuT+6U7iOtRG92yb3LLu0DtYISZVQtV6e4wKrQG8osF9lVVCUm8YIjLK9jqhoZFTc2aORbXU4pBCjWwEV0mDO9DtwYtQA8Nfsz1A7povwhUvSaIOWcT+Pr74KHoQ0JLoxDYWmP/sy/hvHdfgq1HyZ3UU3ycwNvpAUI+HOk2FVLIoXpHk6mOGP1AWODF/ygB3bPaJk5dyrMEMkPDM+6ox7ndbLucgoztoW25g4weivt2Xc03iXELdZDcNjeJ5prVcJQtkOzrPSCEo58LqJKCduG8PWDrswlKiQT462PxukCbBCNSsG52rqN2Se7N3wnlUc3IfBFMphpq/ATO3PnTact4SoVvibqS26POc0WYwgyw==
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB086;
	31:eszis/+gh5+uuwCem2y0+UoPSGc54jCZPbLtjnYi4BGE4Sf6Wb3ewIKYcJ6WpRAWUnwG1FoF718Aa7lESVlkAfkX3ChCHA+EqoX5jnoMJaWJTpWsocbsqOL8/NPUOZjPJwe9sgfQ/w0fPqKr09ALyWyEtAP4XHHHUZwIp0/gE1ImeQBCKk+TzMHTH7po/OJ1Stee5KK64vN6w5L3b+bS9O9cu9e4BOKMfEPxHtqgljI=;
	20:0BYprgftn5YLrcs+zrD3rXazNskEgEMp5UJd/VNBesmgWf6613KkIWtvvUWJaleKbLInnThgtSpg3sUKgu00Exo3Tq1tULW3DNJCvOIBuwcJnsZnT//iGtSxzKYoLhqpKsXGYmiDHPch8acEq99g+JbkFhHTRsWC6we6k/65eNtRvr+P9n9B3WKKQ5cFBUhylLxS6P4KBcT2TsRhAj+YrjdPfEMGKvez6btrhVY+7djqaI51Xj2bz6yb7eHg3krix1HrNVb3FvKaT453stHjOluyoQTBcalTPBpcVJHN1466LJNnbv0UI0YAdATYKbJn+UMgBMwShgnUJjQbL3zZCFB96B3JZH0UK1pZX0xEXK3kGYLqfZJ5JI/IpLBjzQfXDV2ALCU/s2a98bpUEIY9PS1ISSugjHpRM2A1NC8OaiUR7s+1IIwlLcfVNpZKb598SKuUsca1GuSZm4b/EZp1hYVlQJhEfs82WhKVotbrl7E1tsypsCERcSG3fG1PptdZ
X-Microsoft-Antispam-PRVS: <BN1PR02MB086870926F2F7F422A096B1BDEB0@BN1PR02MB086.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:BN1PR02MB086; BCL:0; PCL:0; RULEID:; SRVR:BN1PR02MB086; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB086;
	4:gzJe4lbKbqf2+nzdx+iQdP1H5WhbVPXAKD60bCYJDpVQLqmX2e2gSAcWumpQYX2UXIzfiGfWvJGROhsAUKdjY1CtJeJyOW8kntUyMXtKGo9j4AaLzL2anJ20LQJY8VC+XM2meVXH5+DOd4Vej6mCOuYG4kizyhv7Yfsl1v+VTV9+gOXC4APcDFxLu9CPNVUfw9Tq3YljMHhqh7K4RVGaQVvmvKIwJz9AmahkqmlTpw+pDM6prvTIe3eaM52t4JqwBJnYaxT2bRiBa+RA1evuwO1h7u0fLrHkxMLnGJL1FKPhlN2V3lqRWaJ1+yYARK3GwupnxZbg8JT54ZxUQiB+voGIBkWCKDjf/HW4aSPD0c/UsMFYWnOkKbRZhy4hhfhQuCSTzUjf2oDplc9/J2HBnvEmCFg9D62fDt2+NRz1s/lEu8W5By3a6sq3IqMoaPOHYV/s7mqsWQTemIuc3NIl8p2XY59j/sUSs5gYsuKTW99xTIyda9BKiD3WC9m63/MdvacjbBxp+62vWI3ZORPsQwnjskNzcs4nibuuis7zkqs=
X-Forefront-PRVS: 004395A01C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR02MB086;
	23:T7H8ym1rE9B6nCSRNF1Ui0FP7QRvXLcdyxeSgKErJa?=
	=?us-ascii?Q?qxK+2uZ5Cf0V5oGmYYKIPWZ8E2M0QfwRwcOnMaYSRVEYLHMj25DJFMP7zRTF?=
	=?us-ascii?Q?TIwvGXuuSqp+rDx0P/MUMfraRrBQGqh75YARRwHMw3zwmIwB5cnPjzf5eaLg?=
	=?us-ascii?Q?FRy4PVknxfU19cNLx16mjM31pKl2foASUnaEQAY29a4F5wTlQaS0OB9T2Tqu?=
	=?us-ascii?Q?ctu1dfmvDl6aY6JEuunbBFPIJLpJAzoX015QSqffucvzA0QOagvKLxJYZfu3?=
	=?us-ascii?Q?iQnpRamTMQcZ6BrSJu4o571V/C2bRFsQaBnc3oCjmU4kniap9fFxyLi1HlmV?=
	=?us-ascii?Q?u3HNiG01HYLtTJzNtL7BZnhdVtK2PWsqL3HtNfOvVvZfXxThlsvOP/wCBlCF?=
	=?us-ascii?Q?rNyVcISiqu0rSlsVtIUinbOlXsYmuwhU1JpHeRyTP+9Ivz3Hyjt5UwCzr1a5?=
	=?us-ascii?Q?FZjk8qU3XfUnDDvmdvHrAbEdtL53wAwCFSiWomk5Zu80JUu5nh7UyeKnV6We?=
	=?us-ascii?Q?1ku+m78e8WulDzl+xBDwWhsTRT214S47hK9sJFPVL5PMUQmy3uPfRzyWblcK?=
	=?us-ascii?Q?xl+cgOVVu3+XMN1i63EJJHMr3WjbJsqTlW5n7o3HlhZq4pHvOb+yV7lg9hW2?=
	=?us-ascii?Q?lkTU3ehknDGg69i7LuYnVdC+pGDRQgwzuwobArsYIUgnr7VkzXpE21xAmvOQ?=
	=?us-ascii?Q?F0FeGdpDI5q39g6m2M84W2R80HqCdKYBmP1H0yCaH9P+kcqhbrWmZ/MfxtrG?=
	=?us-ascii?Q?pwicyZs3e+KijS3pExvRCZwFB89kG5xhxjCm+mKFYP11r7iB6AqRERWe50mw?=
	=?us-ascii?Q?XHuXVhSYyMnXGrmrnYnXdmLgrWEnfQ14GGXLbBmBwmxZcOCsMXYW/LJQrNut?=
	=?us-ascii?Q?L7uyA6lx4nBb+zHo2k9amt+Lutd2MytlKoZNTkebKtZw276venVIpFYdYoXc?=
	=?us-ascii?Q?KwKQLLWX6oowxY28NezfhS83Meam/AywkgKkEC4nDZbH3b8NwPTgocvw23Bw?=
	=?us-ascii?Q?Bo5KD4fa+6URBCgRZyU5CmNl+4Dd59ZSgDqOlKO2NNPGEM3r1pmASN/JTbpr?=
	=?us-ascii?Q?qzRIhIeiAX5kl1moc76evvbb/5HpBjOO0AfZ1mpV6dm2SG0nk9PYVqg9VjH0?=
	=?us-ascii?Q?7CxlI/cEfeWCK40Jh5uUcjlgpWLgXsG9y9eowc1cRnwOx9HWK/QYjQI43ojr?=
	=?us-ascii?Q?f9lXIw7SyWbZ9IZIWOhxAz9gXdYA9eTq/4sd/XLM/eCXXBbQfdRl5BUrBzqf?=
	=?us-ascii?Q?MS3ugqwpsT5frTgolHnr8FSbUhImQYNJB4q620kESVwO9UNab5bAHld2DwwA?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB086;
	6:dSRFLlm6vUS7BYhUiHnPLLa+aPFB4E1qT+YSV7Nu2lp/lCjCAWim8rmXwrNHf7bWIIy9lTsyj3uuRH8s/I22uXv2jIyOw+jtn4EuNkRwO7rOu5cbzVElDGR9IMyGsycB8Ha76qzPa6K4kGTiIWsyV8vGGdmsGQ2aVowihb29J8LmtWjHvKHFYAiv+fzt7UTH0nbTGyBga+1r9lKCfp0mUOyn1PprLDrowyeYuOlILBqBoVrcBpimrekf3lBYoflqQkbeFCYr64dcUypu4MQ11zo7NWDk80xh33EdTYjwkYXVURhmT5vpjqGNdndshP32+kmJw63WMGlYtB6BCNjqBQ==;
	5:NaG99cHGwbp2xZ98B86YaNWTT9aFCNMsyOH1HtAJhMApObb8pcMxx6Hj1AZLtBwxjVE+hxbSrI+zio0Mg5n9cYTE/E08LF7fNx8GhDpo3FQ2fHEEwINVPMdBdAADocXwgCdVqE+HfRx9BTOkUSCPUA==;
	24:UoDUe31RZdLHS+IpKtlYU9aEEo2oy9O0yfOEYZjnd7SL/kg5NZcSN2zASrpAmM+WaLe49ZbgLEEzpA5/1icQusjoCVMQhEyxjZ+dxcmuz8U=;
	7:M9ianS/eHZUosqS7B3t+iyrbLReTQg9YIcmt/HYK2nhmakUYoz9XSTQ75XAE0LEMvndmFHTHYk/mB3zRNxFB+36B+J6mLlf5qjm6OYHjJ1X0eR4SegM7Lv72FgFN5FWWZfU5CqvK7cXUOEINj1rXWGjjSmHQbqWP+kr/E6MktyLZ6Ryyd9J+dX8ivJbCKepqz1/X4Wo6jR4oxixEYfBZGzclQbrUbFw2PnBm2ydiMOqGJZLqHdAjtRz+MvBJdfCV
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2016 13:03:01.2886 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR02MB086
Cc: manjukum@xilinx.com, Mubin Sayyed <mubinusm@xilinx.com>
Subject: [meta-oe] [PATCH 3/3] benchmarks:Added recipe for linpack
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
X-List-Received-Date: Tue, 23 Aug 2016 13:18:00 -0000
Content-Type: text/plain

This patch adds recipe for linpack benchmarks.
linpack benchmarks measures the CPU's floating point computing power.

Signed-off-by: Mubin Sayyed <mubinusm@xilinx.com>
---
 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb

diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
new file mode 100644
index 0000000..b136358
--- /dev/null
+++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "LINPACK Benchmarks are a measure of a system's floating point computing power"
+HOMEPAGE = "https://en.wikipedia.org/wiki/LINPACK_benchmarks"
+SECTION = "benchmark/tests"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM ="file://${COMMON_LICENSE_DIR}/BSD;md5=3775480a712fc46a69647678acb234cb"
+
+SRC_URI = "http://ftp4.se.freebsd.org/pub/misc/linpacknew.c"
+SRC_URI[md5sum] = "11aec219fc065a4aa54b9aed3b2c6f47"
+SRC_URI[sha256sum] = "e21ab7b04732189b550070f346970db9686d2f33a5d0a1a3a03c4dc50f7af14c"
+
+S = "${WORKDIR}"
+
+do_compile () {
+	${CC} -O -o linpack linpacknew.c -lm
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0755 linpack ${D}${bindir}
+}
+
-- 
1.9.1


