Return-Path: <Changqing.Li@windriver.com>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
	by mail.openembedded.org (Postfix) with ESMTP id 801B361027
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Mar 2020 08:18:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=BiloOm3N4naHoAWMvBbcLZy/o1NF8JuRfjrtrMjujpW7zkTDkZ/VUbBW8L1ryexaWF8JrAVkWWkOCdK0fr3ONvTJRlR49eh6o/PfNElavH2/V0rqrk3nIvEMXbItZM1D9G/JRJOWk1SbFW05pV/ABrmaI7OM3LHvTWrASPhdq6lOhXnzSq2/oCgNsezNnRoxXv0Kev1dLkYQPrLZQ7Jxgaq+RUAMutCYONX8GRhvKUCKElpZ2/neAm7aVc1JJqG4aORuD9mQE89oJCDss1RZxy42+Q7hHzDO8jzFppPaRkkK9QS8FRlAt8JOfLGBo+s4lCeOYwr9jaDPWNNO30MlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dAAuXCNGt258UtFtfCwSctRvGJP08vNPV+Z6wNkM7rc=;
	b=BIrFOVtBhct00epGxo4H4heLsL7DdE/s6f3zUej4dgbaxS9ODAmCBTwyYKQ5b/PzMkzP4hj7MZ1+KgjPrXeDb44znCj7aRmENN1vuCVTzIKZNBVnFWORWOYUgjird8ocp8DBM+GdWdiiIZA/Iq8Oc13A/78P2VKcCR+DRlFhYPrqPltRDpep8tktBWslQxpps1Csi4K+vI77UxXxgd3TTzzGz8iie6zOwP+zNn445v/u+TdWN9pcgdwso97NMl5iFlb1pt/U4qXMj5bWC3pzCA4ffFmsfd90V5TB93Y20ELRC8FtMp2ZQ3Loq5T49EPjmFmliIMFedicsWzkSUOdWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=windriver.com; dmarc=pass action=none
	header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=windriversystems.onmicrosoft.com;
	s=selector2-windriversystems-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dAAuXCNGt258UtFtfCwSctRvGJP08vNPV+Z6wNkM7rc=;
	b=ZZtW2LAZAMfonF9YKhM2b56T0enZhAQxCzn3W5A9EkN6+f5F06AbnJxJQ7aNT5eqzmhiEuaNtFmQFz2a7scSxWGswTCqNgv5YsHDhuDfdWmgL7kfGB6fGbSix70XpXiJ7UFLSzsxKcDpZHOUshEW0PWS7QS7V0fjt6ae0ChaJ/A=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Changqing.Li@windriver.com; 
Received: from CY4PR11MB1814.namprd11.prod.outlook.com (2603:10b6:903:11d::7)
	by CY4PR11MB1399.namprd11.prod.outlook.com (2603:10b6:903:2f::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.16;
	Fri, 6 Mar 2020 08:18:29 +0000
Received: from CY4PR11MB1814.namprd11.prod.outlook.com
	([fe80::b105:57b8:32a4:45df]) by
	CY4PR11MB1814.namprd11.prod.outlook.com
	([fe80::b105:57b8:32a4:45df%10]) with mapi id 15.20.2772.019;
	Fri, 6 Mar 2020 08:18:28 +0000
To: Martin Jansa <martin.jansa@gmail.com>
References: <1583473076-316898-1-git-send-email-changqing.li@windriver.com>
	<CA+chaQeyJH+C1u6bmi+6oLm5EqwTUyavb_E1WBz7RNJ4+Yf4EQ@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <571c8ebf-853a-a9d4-2e99-197860564d2e@windriver.com>
Date: Fri, 6 Mar 2020 16:18:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
In-Reply-To: <CA+chaQeyJH+C1u6bmi+6oLm5EqwTUyavb_E1WBz7RNJ4+Yf4EQ@mail.gmail.com>
X-ClientProxiedBy: HK0PR01CA0049.apcprd01.prod.exchangelabs.com
	(2603:1096:203:a6::13) To CY4PR11MB1814.namprd11.prod.outlook.com
	(2603:10b6:903:11d::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by
	HK0PR01CA0049.apcprd01.prod.exchangelabs.com
	(2603:1096:203:a6::13) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
	id 15.20.2793.15 via Frontend Transport;
	Fri, 6 Mar 2020 08:18:27 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06cd1dcd-414a-41ef-7df1-08d7c1a6f313
X-MS-TrafficTypeDiagnostic: CY4PR11MB1399:
X-Microsoft-Antispam-PRVS: <CY4PR11MB1399F48B4A9A778478D7126782E30@CY4PR11MB1399.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0334223192
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(346002)(136003)(366004)(396003)(376002)(199004)(189003)(8936002)(81166006)(316002)(6486002)(81156014)(33964004)(6666004)(66556008)(6916009)(66476007)(66946007)(16576012)(31686004)(8676002)(4326008)(52116002)(44832011)(2616005)(36756003)(5660300002)(6706004)(186003)(966005)(956004)(2906002)(16526019)(478600001)(86362001)(26005)(53546011)(31696002)(78286006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR11MB1399;
	H:CY4PR11MB1814.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: windriver.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lAiB9UMJ8rlr4yL98dgpHqsSbw/kBgysKAGzBmIxu9m48dtU/DXSt8KIUNjt2fBsQABRuHx0SxlU5CslkgIc6XdsAPatfIAFRgMto0K5MgSeipFd3zZCEZtZa0EDzAsUHz1ljOVXT9LY53s/2XGXcnpi3tXHJmQHccS4dugwCAYM2Nrv3YWaFssjkbfzDTBYYBoXFWeuJSAQWCyLzZ7RP00OCF25tzYsxOt4dk7UfozSrGwmCx+zXQk/5PWB7Gc4X6jxwHObDz0tWUuvLR6PmvQ0HHHREMuPHrFBt/y6OmnWM+eMUZ2Q42CnJEMcwKb+Ru6l0S5ZpH0j3U6i2MYSP8vfKqKqEHTvBDwBTR61Ko6CTS2zzjyncKe7yYiS2tQ8kOahgelmcNGNwYQzTVVo0/ctNjy4PC92qdGDtVzR7HpBvbeMNUqYF72DDuUoKdJNo656lT2jiswpsJFrab5PhNCykaQ1IMMvzPbKaiD1c9agNWzvJMLsLi/+rk6ToUzh8OUpm0wPat/ob4zBy684l3bwU+/N0Ktu7x6r1ozmRZpOQcG9tNz+flKPiV7J3iHsYbTfU+iQ4VSbv117E2TVTBOr2nTaUs2KMFXsN468MLI=
X-MS-Exchange-AntiSpam-MessageData: EOCMyI5iBwLVHZB72yg0XkQke6rvm1n7Gx0MbJ1xUchhoFlhpztfegarwkWyKr5lfQbE/dXb7quG9AL1ifJHhBujvUIfbjaPNods+XBnnD9hZFZSc8Hyu42FPKrcsGLsCiEU4LynKdc+wXNbt/AHew==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06cd1dcd-414a-41ef-7df1-08d7c1a6f313
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2020 08:18:28.5896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7qXn+XCg0QeRJyw5YxyWgLcdiD037ZEMcYuA3xJkbzk9Hu1Z/kPb4nKPlozuFCXguyu4I83DheYvVUegDso2Dj3QzKxAf3eV+2cPxDlHa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1399
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] layer.conf: add meta-python to LAYERDEPENDS
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
X-List-Received-Date: Fri, 06 Mar 2020 08:18:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

yes,  this fix is not right,  just find that meta-python depend on 
meta-oe,  so this will cause a loop.

I will find another solution for this.

On 3/6/20 3:54 PM, Martin Jansa wrote:
> Can we fix mozjs instead?
>
> On Fri, Mar 6, 2020 at 6:38 AM <changqing.li@windriver.com 
> <mailto:changqing.li@windriver.com>> wrote:
>
>     From: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>
>     yocto-check-layer/test_world failed since error:
>     ERROR: test_world (common.CommonCheckLayer)
>     ERROR: Nothing PROVIDES 'python3-pytoml-native' (but
>     /meta-openembedded/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
>     <http://mozjs_60.9.0.bb>
>     DEPENDS on or otherwise requires it). Close matches:
>       python3-numpy-native
>       python3-pycairo-native
>       python3-rpm-native
>     ERROR: Required build target 'meta-world-pkgdata' has no buildable
>     providers.
>     Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
>     'mozjs', 'python3-pytoml-native']
>
>     mozjs depend on recipe under meta-python, but meta-python
>     isn't in LAYERDEPENDS, so error occurred. Fix by add
>     it into LAYERDEPENDS.
>
>     Signed-off-by: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>     ---
>      meta-oe/conf/layer.conf | 5 ++++-
>      1 file changed, 4 insertions(+), 1 deletion(-)
>
>     diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
>     index c537736..0ce0ad2 100644
>     --- a/meta-oe/conf/layer.conf
>     +++ b/meta-oe/conf/layer.conf
>     @@ -27,7 +27,10 @@ BBFILE_PRIORITY_openembedded-layer = "6"
>      # cause compatibility issues with other layers
>      LAYERVERSION_openembedded-layer = "1"
>
>     -LAYERDEPENDS_openembedded-layer = "core"
>     +LAYERDEPENDS_openembedded-layer = " \
>     +    core \
>     +    meta-python \
>     +"
>
>      LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus"
>
>     -- 
>     2.7.4
>
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

