Return-Path: <alejandr@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790047.outbound.protection.outlook.com [40.107.79.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5CEC97F2DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 21:11:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=A61+F9DKHmuVZJjbh4jJoW9eH/O3MKvNJcI1BX2USK0bLyWu22AOeqxhad47ckHBZ9nv03AxUY1HgzDhWDKouEVyprm5/3s+SeanD2cIhsrKCmxRfkWAQWqaCfRd5Y4c6dkgGeDlPAapOAc/DTZm/8fFcj7aNKsUDOW4ubOCstsPKAhbRhIViDNwmybCtNFORxgMMutDrYET3JRxMB07H4YY1GWTxbmzQrY5UNxE3oUu+kr1GZMD29XRBszykkpQWseQEShiePvy4dMu2bUgOBLs5+1vHrLRV4KyfNhnK7SX5oJ4gMSvuBaaWtsKMURlHv8YPK1+yREXwTABcNRVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OPnJYMYLrlojWah4hQ2t9DTfLMXDg3NQgiY6JD8B15A=;
	b=ian41SIvE5roHDIJFzuYvzUzWe+WDssXVUtet5MPUUsQGm5LdJlhX/MWrRVSoo+no6bQJNqxRlIWj3tSTJD2Ubv04n3z/SItTP2jNg+VOCP4keRyDfataC1tZvDbgT7k+owodQbnSLPGLOnyca72swK7hAOmTYGFVhYheKJ/szlK1UDFdeWauA+eTNxGsYFdYgDwloF/3XHas2Lr2nXVJlDEsaP9QJu8fiw5gKkaqQtUVT31IJeiScou7aoXLCtuLKvVaFjdoBMQXIGJNLhCZkVLDVajl+6uiXcmLbRQhXwjMsz6gGQIx/9DBo1oPFnOd5A1WzSiNB4bH6HU6TZ+RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=windriver.com smtp.mailfrom=xilinx.com;
	dmarc=bestguesspass action=none header.from=xilinx.com;
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OPnJYMYLrlojWah4hQ2t9DTfLMXDg3NQgiY6JD8B15A=;
	b=YLCnKgnmayruqslypGwtyUXdAjAAhobn6rYHCSF/whaDXUmd+sNLp20bQHzY9BvDGvuNuDUQA+tCEeaYRJHKOhM2Xn4+kuA1S8Smr81d/pSbTlY2a7l5BYZgNVTxw3QBlfIy1DqtQr6IfmSj/NDWI7By4QKESbbZM5zxaRRed3A=
Received: from BL0PR02CA0077.namprd02.prod.outlook.com (2603:10b6:208:51::18)
	by BN7PR02MB5251.namprd02.prod.outlook.com (2603:10b6:408:27::32)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18;
	Thu, 29 Aug 2019 21:11:02 +0000
Received: from CY1NAM02FT064.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::202) by BL0PR02CA0077.outlook.office365.com
	(2603:10b6:208:51::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.18 via
	Frontend Transport; Thu, 29 Aug 2019 21:11:02 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; windriver.com; dkim=none (message not signed)
	header.d=none;windriver.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT064.mail.protection.outlook.com (10.152.74.64) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2220.16
	via Frontend Transport; Thu, 29 Aug 2019 21:11:01 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1i3Rh7-0000sa-46; Thu, 29 Aug 2019 14:11:01 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1i3Rh2-00036E-0P; Thu, 29 Aug 2019 14:10:56 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x7TLAtJJ017437; Thu, 29 Aug 2019 14:10:55 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1i3Rh1-000368-9X; Thu, 29 Aug 2019 14:10:55 -0700
To: Hongxu Jia <hongxu.jia@windriver.com>, raj.khem@gmail.com
References: <1566955456-20194-1-git-send-email-hongxu.jia@windriver.com>
	<1567094248-9489-1-git-send-email-hongxu.jia@windriver.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <7246b4cb-1358-8afc-eb4c-a80788bead19@xilinx.com>
Date: Thu, 29 Aug 2019 14:10:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1567094248-9489-1-git-send-email-hongxu.jia@windriver.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(2980300002)(189003)(199004)(65806001)(65956001)(54896002)(316002)(478600001)(31696002)(126002)(36756003)(76176011)(4326008)(6246003)(58126008)(31686004)(486006)(8936002)(26005)(53546011)(229853002)(2906002)(11346002)(33964004)(426003)(106002)(8676002)(81156014)(81166006)(186003)(71190400001)(9786002)(2616005)(70206006)(356004)(236005)(5660300002)(16586007)(336012)(37036004)(446003)(476003)(70586007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR02MB5251; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b17c55e-e9be-4109-0524-08d72cc56574
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(4709080)(1401327)(4618075)(2017052603328);
	SRVR:BN7PR02MB5251; 
X-MS-TrafficTypeDiagnostic: BN7PR02MB5251:
X-Microsoft-Antispam-PRVS: <BN7PR02MB5251822A7AA64953F16E2E3FACA20@BN7PR02MB5251.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:157;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /Arj3smhzTlw0unvNwi13zk/7LXPry03miFpsQncMXa+0XYJxY585/gMYYLdWXJRTWXGaBrKu4OUY+w3LJXJogfKlT7Nl0zmwmIxaL1BHmCZpuDowJOxfG5imBHT18WWFLQMDTy1kZwfRO9WjG0Gqpe3aO1rCEFILBmjJlxHSshELH+Ebw19oCHHmGWaF3iIbQQ5eJuzZs7NbDODO7dfuqQ9pVhNqbY9nwHKpKsHj0lUBolxw1RmzjvAS9KHmAbzvCnHJWtAwkjiWSMUo4d3smAwcSEWG61aAP1SedYsUZph+/IyYbh6sqQlqGInP+SljIl8pZqH1QGHv6DQio7Q8hdxtu0UX3/ys0GkR2ZQQg3v+UUzo3ux88rq/wm2oOcOuKAZrxRu+llEqtHhcySX2i5xZOL4aDF0lX/Mdjz0F7g=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 21:11:01.6074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b17c55e-e9be-4109-0524-08d72cc56574
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5251
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH V3] cryptsetup: add libdevmapper to RDEPENDS
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
X-List-Received-Date: Thu, 29 Aug 2019 21:11:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey Hongxu,

On 8/29/19 8:57 AM, Hongxu Jia wrote:
> Since commit [libdevmapper/lvm2: force recipe libdevmapper to populate
> sysroot only] applied, if recipe DEPENDS on libdevmapper, we have to
> add it to packages RDEPENDS to fix [file-rdeps] QA issue
>
> Skip [build-deps] and [file-rdeps] QA checking, add lvm2 to DEPENDS will
> triger circular dependencies, use recipe libdevmapper to replace,
> ignore the QA checking is fine.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
> index 6ebf1e2..194842e 100644
> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
> @@ -16,6 +16,10 @@ DEPENDS = " \
>       util-linux \
>   "
>   
> +RDEPENDS_${PN} = " \
> +    libdevmapper \
> +"
> +
>   SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
>   SRC_URI[md5sum] = "f7818082056e5bc0be12e4c7fc20345a"
>   SRC_URI[sha256sum] = "9d8f8cac2836a1623c075b5cba96032271dc81a28b2aa27fbd8331e831416bb1"
> @@ -85,4 +89,6 @@ EXTRA_OECONF += "--disable-libargon2"
>   
>   FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
>   
> +INSANE_SKIP_${PN} += "build-deps file-rdeps"
> +
>   BBCLASSEXTEND = "native nativesdk"


This is the error I'm getting at do_rootfs after the latest version of 
this patch:

do_rootfs: Could not invoke dnf. Command

Error:
  Problem: conflicting requests
   - nothing provides libdevmapper needed by cryptsetup-2.2.0-r0.skylake_64
   - nothing provides libdevmapper.so.1.02()(64bit) needed by cryptsetup-2.2.0-r0.skylake_64
   - nothing provides libdevmapper.so.1.02(Base)(64bit) needed by cryptsetup-2.2.0-r0.skylake_64
   - nothing provides libdevmapper.so.1.02(DM_1_02_97)(64bit) needed by cryptsetup-2.2.0-r0.skylake_64
(try to add '--skip-broken' to skip uninstallable packages or '--nobest' to use not only best candidate packages)

Cheers,

Alejandro


