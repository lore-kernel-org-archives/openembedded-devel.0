Return-Path: <mubin.usman.sayyed@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0040.outbound.protection.outlook.com [104.47.34.40])
	by mail.openembedded.org (Postfix) with ESMTP id 3299A60053
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2OIYfCgI6qYsp+HUflkhaL53zXVUrjOSRO83QK3Frl4=;
	b=EkMyv4aZm9HlHC0iE2861biZs9qrb/a8tsfzYeQxoocfd4CjH61M7YbzLBe+o/X7DleoGcC2bHkr1ac/BKZzbv8MvFZwgFWZjfkVUMbe55JmEchycvwih5d/O6jQb/Qfd9/UVS50dONOcFMthDK9y8ScK+CFe7nrqSgPVCFjcyY=
Received: from BY1PR0201CA0012.namprd02.prod.outlook.com (10.160.191.150) by
	CO1PR02MB096.namprd02.prod.outlook.com (10.242.163.28) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.587.13; Tue, 23 Aug 2016 13:02:43 +0000
Received: from SN1NAM02FT025.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by BY1PR0201CA0012.outlook.office365.com
	(2a01:111:e400:4814::22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.587.13 via
	Frontend Transport; Tue, 23 Aug 2016 13:02:43 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT025.mail.protection.outlook.com (10.152.72.87) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.587.6
	via Frontend Transport; Tue, 23 Aug 2016 13:02:44 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bcBLm-0007t4-MC
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2016 06:02:42 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bcBLn-0005RA-F0
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2016 06:02:43 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u7ND2XuP030292; Tue, 23 Aug 2016 06:02:33 -0700
Received: from [172.23.146.171] (helo=xhdl3763.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <mubinusm@xilinx.com>)
	id 1bcBLd-0005OO-8h; Tue, 23 Aug 2016 06:02:33 -0700
Received: by xhdl3763.xilinx.com (Postfix, from userid 44329)
	id 57A172CE0885; Tue, 23 Aug 2016 18:32:32 +0530 (IST)
From: Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Aug 2016 18:32:20 +0530
Message-ID: <1471957341-26005-3-git-send-email-mubinusm@xilinx.com>
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
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(63266004)(42186005)(626004)(2351001)(86362001)(2950100001)(5660300001)(4001430100002)(229853001)(52956003)(76176999)(90966002)(15975445007)(586003)(103686003)(19580395003)(450100001)(106466001)(87936001)(33646002)(11100500001)(50986999)(92566002)(7846002)(8936002)(46386002)(47776003)(107886002)(4326007)(305945005)(2906002)(110136002)(5003940100001)(50226002)(50466002)(36386004)(45336002)(356003)(81156014)(8676002)(36756003)(189998001)(48376002)(15395725005)(19580405001)(81166006)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO1PR02MB096; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT025;
	1:GUom1UIhis4vTi86JT05KnC0UM9Lsl5QeHdOv15vz73c6Tj/ZNC1H/ekRdBKShYtOnVvpSbH7MZ7dXOcmfI51emkFfA/LznwYDxb+xuhanBi/bmZsvu+ZNz/9RoKWccGwxkmJ2Me/Iecg4TyDnCgJkKzsU0csXwocI8vNxqg8bszc7ODapUx92yYFvtS1HFd6RgxXxod+miPaLqwD1QnLLh1qQ8kSjXiU22qx5yORQP2E1o2qc/MwDNxgeeW+CFug8VTpdVZZpnqwrAc+OPtx2yRDdTBJL8i1eLBc2vJSONZv7+v6nt6cV8lNX4k82bH2ATeQy9fMd7ZBqBlwfvM/1eqJKnStxj2jzD/XD3jttPz18eUCrnoKgLK/YI1bGwtOMbHlxfROqIkGyhzgdkh8dL5maR1w27FEyjMlIKh11ekieWULzP3YMkx0KX6mzLLOtbSi0qEBBRo/cvJtQ1FfhUoK5Yu4mbaW6TyWVlsEYXP1v3NyvbYSxMNMI3lEWFPsrsO7CmPcJlS/rGvIMwmZWoghtdYkJWiBVr1Tp1YWdfAX4fIjNp7lH6DMbjcA8oz
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: e450ebce-c08c-48cc-ac27-08d3cb55c626
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB096;
	2:WODgzrMZHkN37VMl7Pdh+0Iwk2Z2PRJE+T6pZMAFtnDpXIb6x9hs+arI7BJUL+pitdFvRkhR9BRtu6GXtWdjeclp7qL+2K5vZWsdrpVRMg4fZA/qpDUTQhK6LYUBchexToWUpae9LFKFApMra9hFtN3Bh4L8D3KazxxlCfUl1czC/XV5gj8QgUnDIM6DeZxo;
	3:I3h3q0VtTXFvRl441TyACsz2fZgxRyrPeqs2F0JvkomyT4FmAXpIR/YQeWC/Ph7C1J23AUQSdIfmgyiZS0RrLimFnLvAm/WZOOO9fqI8Ul0tcc/Xg1RBe+XDCSA+71+NHvBqZ1d8ItEY08ijQtUCARlKfDKTRz2c7pQhVUBKzukp2xM4sJmuHm26k8RyUVMlI8dD47ip/c6YwBbx5yqonWnZJhxDlvEkAHoRn0mj5YIitL8kd3v0UTxTY6V00ZiUJbxjjEvYonku60lGuruDdA==;
	25:TwpHV6knE7LDGchFGxv29qjiiexGCDWR9QJP4QLDKJ/D92YAQFobleCfY6zC3vsU9ycEsQBzwiplmR+MaaYLNNezD5XX44UOKvOvSH7KfCLePNgcHJaWZjlQmz6rgkAD/vitUDkWzrxneYtQ62ZwJNZ4oDgWYXpGdf4WcszK1SCgWER51adNUURrsPDrWHIa2MeWBp/AWFnlStD6aScdoU7fzQJZC12w2LVMkRABzRxQ/b32d7cQgJIdV/HM34AGKpiL7sCzg4C0DN8zDwbiytscO1LtubmESBzB08wNJ8f+QjX668jJObCAdhRj96tl/8HVxXonXC2JzzkXv+OZGDe/MH9KIzrg/EuAhn172FUWfCUVcd8VyCveO3a8Pi3dKn7ZleC5lYjJ7Vg3CfN4sYFxdU74J5yFllERK60fP84=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:CO1PR02MB096; 
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB096;
	31:Gj1ldFLF1R0Sz3TfQQHl1Ygqs4v2o8Y08KTWy0krULSNVgLAWubAXY6tNyLN2cjoasrj+q4pp9ImB9mLRgPJphAHJ2HPaKT6bifyFgtdIxmrN2YXn7E8UeVZPKt0Soapyi3EHYgi8Sj4mkzBBNFY7vAEeQJJ8/NMoRc2ZWiz2h0JB4pdRRNl4+IugSHSyr1XVQM5hEzMm2DUnKfnNrRc8R9E6EbWpnCUBScAjKs78CE=;
	20:E6zj/SWL7pY2tBKwFZ3pO+1A0Js6/QMs7QIocUPVbAQgRYZIBV3qvKTOwpWSj2ZpZ4hrew+y39U3dOPL7jjDauj5WaiskWq8iJTHJeqYe05miTt14u8cOOAHlHa9YLROHEzCDLqG2lsXyuiN423ubV8L3vbnmruS9kbCZNZJOXsbijkgVQyTdBaQDqod4jhTqyLXNyIOWYwsb3ZZIxqHLciDtR6+S/u9qSmMZHYot4TkDf2JGx99mYQpFdwHZWpdUPeq39VsvH9YyE1cEofOjoDmkC1bi2z37ZNt4nWgJSkYu4UDaey0nBJh1SWDzRtqm7ugdTITSQt5OocFWXzdPGreqkk/7LWfCXHOEtVwjWhmyVlscDYYVh+M4gDafDlR009kp+FPGiKZwaCUas5qZ8tKajEyMrIarVPkqrAJFhnBXu/JRXkxGe6FBQb6wIiu0q0TDkQlL2yrkc2KM/EgmWNP1blScWxXkK6o5l1+cD79eXFF5BaFmOfFsxDhr88q
X-Microsoft-Antispam-PRVS: <CO1PR02MB096176EE7E51FE04ABFEFD8BDEB0@CO1PR02MB096.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:CO1PR02MB096; BCL:0; PCL:0; RULEID:; SRVR:CO1PR02MB096; 
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB096;
	4:3yI5kjU4072EEdbdAID4tFM5mzgaICEO0ICTdLd5tC+nzWxJpI2rDKNZ1aPya+xLqj9OA87Yq/bzfJlcCKpC7qnd7J7moOaCkiajEQ+NcY5Y+QWXtrgzASxH8CJR3jaFMOa0wQQQMOjyeU/xmYRcUWl300CdvmzS6KZpAwCeRZPdeD8B/OomgCPakFHUyL6PZhFLnV2ViJEOecDgGrYqzuWxdY7DF30eZ5emxdlOHprsF5iWzQq0oOtRGXkf3Uptk1rymsMSlncr0ahp97hX/ocO2wZblFHZDjsajbe7iKTh/Gj5ZvhFxrE9Lj+iNk2PNBOj6TvRMGcMEjRe6O2C6wASTRYrv/AKy7PvaWc+IqcAD8sR3j6xwAx7dWeVJjpZ5XxT9ZlIQ7pfDqB/ZwxYZvCHoU2H/U3G1d+eK2opU6x5LHqfz8OjBTwdtS6TpVU47POUs9gwtfPfivNFIGqTFn2h8GpMPHcskW1eJceWYWIWEHCx4Xwq7zU86L3BcxkQLdPTItwsu24HRAb7NDW84vBQoU5CM/yuA8m6BlM0vSE=
X-Forefront-PRVS: 004395A01C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CO1PR02MB096;
	23:RSgoVfq49FATRVnafuRIg56sZ56oqenoXSW16gfPM1?=
	=?us-ascii?Q?Stp420pnYCMzScxf4j3UtshaN/tGnrZviw6G2rZid78OMbbRJbvaxVoheVdt?=
	=?us-ascii?Q?eWONps0wxi5J7N+nqp+/+wACrsiGvIjpeyxmeNWIhwqcsooznmTFEua59ut7?=
	=?us-ascii?Q?bKIwsKjgElzs6UlLoPgARngcQNYRKsVirLMxrCpxGmUK6/kI7SvbwVjvOCu/?=
	=?us-ascii?Q?HnJBmDzqy+bFuV12GDxY0tGgy+Dq1b4n1Ouw8CurPiyLDVN+qVCqqxY4a54Y?=
	=?us-ascii?Q?ooPlN0mEbouWZQkAQeCQAIApWkfISqpBWgmlQOLpYdfQDcsICjU0S456Pwgi?=
	=?us-ascii?Q?vd/5r/b+oM4bAt9G+Gb+RM451ZGNCgiZcEmGg8o97Hcq29CenNXZ/vmT9ry8?=
	=?us-ascii?Q?4lnXJPuEpcNYSnCmasJynMtQ/OAPUIMhemPj0JzPSEzG/Zkq6LSBAQd7MMzl?=
	=?us-ascii?Q?hsiMvBNDx2us1Zkgg+9CNXXhOL9h1ytsGqQ7e0YjoIFiWvnd5yV0YsganmUW?=
	=?us-ascii?Q?Q8Vgr6EHiMQ1UJQb9PIuHU8vtp2aQSAQLouYxHot0UsZRHlSV7aUNH6/pmID?=
	=?us-ascii?Q?J1+4IR3ch25svHnttjw2Agtw+9MkIjYOWK1izjsvy2Vt3mBK4Wy1tqhhq/iE?=
	=?us-ascii?Q?S6ClBdPLFhBJBUSXex+SfTPGViN7AmhZrur62zHbg1OwLltTR3cHSwwVhSjE?=
	=?us-ascii?Q?V19H1ql8DdvW5v5u5c21atndsbwdydj5ghYSiwW5fbWJcWm267BE4dZAsx/e?=
	=?us-ascii?Q?YBo3Rdb48iF746EvkjGJUzdbAE2haP4G0UdmgKrV8nL/kzxzEvS69kQqO7ZL?=
	=?us-ascii?Q?3oU0GMBGxeLHIcfjNCHN0HBTRBbkCTZuKxhNZfNSjRp5lczcwZELEeRZkFMn?=
	=?us-ascii?Q?y/nwcPMnGZEO2DcS9K3iNvXkuy3HSkOFydJr/wUvrWvx+ARYGCTneZefED9S?=
	=?us-ascii?Q?/40hKXaoI0Fhf+Bh6G2l98o+6GNMXSuVv9BjCAS6cbfye0nWnMtVx0H64lCo?=
	=?us-ascii?Q?rQCef45jxu2i816hIzxjHhpDtvJzdeApCPNXFa0fWUhQ35PNY3MvSm0NcveD?=
	=?us-ascii?Q?qLRnpkN+mJBXeg5uhXpuJFyoahr9Gn4qNE84RbMbSJYkkRPGFZQeZJNLE7H7?=
	=?us-ascii?Q?1Noy2f7TnlesG4avzbs1Ty4NXSXw0u0UBfMjf/Bt6gqZIQWGfjUABa7I1xQ1?=
	=?us-ascii?Q?oMeaASJAuIaT+qHxlpxKn9H35LEI+KHl8YRnlW4K0UmGRCIcw0JPJ9grrKKm?=
	=?us-ascii?Q?Ao2BiMkzz11D73C6FUa9q2o2kmg6ABbp20d3PsfAsrEYs8a7emK2/m5wYNiA?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB096;
	6:vAoLiTHAPiPv965pu2uKk9zm4SMJy6Cye0UZGdJwgwWxrDK0IIwF67QfVfS1xRG43SBxotwnM7n0Dac5wG1kCG5Fi7mxBAzZCJl/iuWb4+/HxFCEaBOlqIFCNx/irTpWizTutCwVcZiChW9Es7HYkaS0L3db4PUuGcf2kVadsgxQ7AwQl4aoQSSe1VBGZeqhjM9t37/sZEiO14T2s+3hLK2/qHuqiBAxfguPqBbTgsLEevet9XLWHVRlCZGQml5DNhqXdqlzBoCyBUriORPgmPjzFDl9E57bUTRvHFXqWiZ5mlcYDLDROuYQoiJINX5ynqunsI21MngK8iEkYinRtw==;
	5:qwNOIfW64QfYDsi/wHFHl/vpdsC36FRGX1cn2o9wp3SfJWt6658RMgY7byabvlU5laPEdJeQLhZ/M9S/woBL0CMDDn5NHl8I95YNCtPHirrhnVVtsBtKG/CC7IQVadaMyvr1wKdpAq6Q/iNeZ4zi0w==;
	24:K76/XFW6+L8hYiRs2oTlP5cPFpFlhI3axXiEBW7gj0ixavTNVgAI1jJzZ2GcCM/Lp+HRPBwcNKBf8I08bHtBKdPKQhty73aX3r29XbJW+No=;
	7:IiAnje1MOcLicm1TVaRfembjAJbApcxvnAOVQWAs6OarbKIaCzRMS0LGAugsOdEKqOufc9Pl6EqPFNQuHWSfMZYuBnkcT9x6x8vk9o7720KWDDzrSVn1OYBoywAVXRue5lbENKvD+E72v5HWK8aVWbg84Sie5t1IzR6aV3Ij9sNETPZ2Bk2I4OOz6YQLPi/70cyhnuNyxwSAgAza09q9Muh7Qh1SXos/gDtff208JtHgEaGM8hBeMoumSrFddoTf
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2016 13:02:44.5047 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB096
Cc: manjukum@xilinx.com, Mubin Sayyed <mubinusm@xilinx.com>
Subject: [meta-oe] [PATCH 2/3] benchmarks:Added recipe for dhrystone
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
X-List-Received-Date: Tue, 23 Aug 2016 13:36:41 -0000
Content-Type: text/plain

This patch adds recipe for dhrystone benchmarks.
Dhrystone benchmarks measure CPU performance.

Signed-off-by: Mubin Sayyed <mubinusm@xilinx.com>
---
 .../recipes-benchmark/dhrystone/dhrystone_2.1.bb   | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb

diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
new file mode 100644
index 0000000..d0026d5
--- /dev/null
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "CPU Benchmark to measure integer performance"
+SECTION = "benchmark/tests"
+HOMEPAGE = "http://en.wikipedia.org/wiki/Dhrystone"
+
+LICENSE = "NCSA"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/NCSA;md5=1b5fdec70ee13ad8a91667f16c1959d7"
+
+SRC_URI = "http://fossies.org/linux/privat/old/dhrystone-${PV}.tar.gz"
+	 
+SRC_URI[md5sum] = "15e13d1d2329571a60c04b2f05920d24"
+SRC_URI[sha256sum] = "8c8da46c34fde271b8f60a96a432164d2918706911199f43514861f07ef6b2f1"
+
+EXTRA_OEMAKE = "-e MAKEFLAGS='GCC=${CC}' 'PROGS=unix' 'TIME_FUNC= -DTIME' \
+                'HZ=60' 'OPTIMIZE= -O4' 'GCCOPTIM=-O'"
+S = "${WORKDIR}"
+
+do_install () {
+
+	install -d ${D}${bindir}
+	install -m 0755 gcc_dry2  ${D}${bindir}
+	install -m 0755 gcc_dry2reg  ${D}${bindir}
+}
-- 
1.9.1


