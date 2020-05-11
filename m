Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.49])
 by mx.groups.io with SMTP id smtpd.web10.8729.1589188596862063394
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2020 02:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TRCNGbbG;
 spf=pass (domain: windriver.com, ip: 40.107.236.49, mailfrom: zhe.he@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcsY/80wXdMh5Ne5WNP2tHZyDyHHK2R/FnO5l1EkRJYYufv3UM9izVzRyqltlM1CDdkQ924B1eL3qQlyyUEjRz3XRGiZUwAoEf9CJ5VucrpShZijJjmjh1c6NcmQuGuzH1QvnHkz7k2HMX+abDKV4iufP10drtPwz5c0lPDnEFMNkC1yKqmlPLHL/kbs8AhBgLTPC82Bgok4CDhxMsE1RfKs3xNbSPSyMJO5GV3ojsfODObsP5yQPiDKUaUq+j4ZqBhrjgPU+B6eK6DOUYCpHaG4Xhj12O3iFXwF1ORrEg3e5SXyXt+l6+LatLrNEvo6PQrCtpkcxn08ySNpwuI8bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91JMqD73RinkaBSjX/tAstkD6kzAlhekizwjh789Ygk=;
 b=fVjgEG6BdDFWWijgT3TLmuegHT16JeyaIa/TX9l2PcKv+5L8/Mo1yUrogCKj6kxumbMprYWpFldAkIEYOIQYxl+hdvRo/9sePyHdGbkFk+lWqIdij+HvSaDRS/cx7hGTWPTWaZ0Timl4bfCv+k6s5bqfXTOhvhrNjK+iPVhW7EpXZn3KMdPO39pk88V5gyN6ugyWPocGSCo1xx5rGguwvUlByFu0YnR7KFLTbjXwNR6+0+zglN2jRNpsPOhyOv7fFgTIt5JL73/oTKhbfvI0XSNxji9BxGvzq2xFctUZZQQagKtW7pmZxPWCi23RVCiYVOvF4pfpfcSX+l88xuhX5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91JMqD73RinkaBSjX/tAstkD6kzAlhekizwjh789Ygk=;
 b=TRCNGbbGAg7SIBLC/pLKPWiw1KWNrKL+HG2EaWjAK+CZCQjncFBoFjJmLzhqJQYvk9aqgVntTVFAx7iZ+wVI9Y/swM/MdYalLWfiuEhM4NwArXUxRjcOD3lCMzEiFi4gGX0KsLxItMlskewvpghFy4+uaI8RxIKT3YCGWui6pk0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3355.namprd11.prod.outlook.com (2603:10b6:5:5d::21) by
 DM6PR11MB3291.namprd11.prod.outlook.com (2603:10b6:5:d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.26; Mon, 11 May 2020 09:16:35 +0000
Received: from DM6PR11MB3355.namprd11.prod.outlook.com
 ([fe80::2943:7826:91a0:8754]) by DM6PR11MB3355.namprd11.prod.outlook.com
 ([fe80::2943:7826:91a0:8754%5]) with mapi id 15.20.2979.033; Mon, 11 May 2020
 09:16:35 +0000
To: Khem Raj <raj.khem@gmail.com>,
 meta-oe <openembedded-devel@lists.openembedded.org>
From: "He Zhe" <zhe.he@windriver.com>
Subject: luajit for 32-bit BSPs
Message-ID: <ef0bf1a9-c5de-5dd2-f00c-9704fc6101ba@windriver.com>
Date: Mon, 11 May 2020 17:16:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-ClientProxiedBy: BY3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:254::11) To DM6PR11MB3355.namprd11.prod.outlook.com
 (2603:10b6:5:5d::21)
Return-Path: zhe.he@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.175] (60.247.85.82) by BY3PR05CA0006.namprd05.prod.outlook.com (2603:10b6:a03:254::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.11 via Frontend Transport; Mon, 11 May 2020 09:16:33 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30bf5c10-4436-4793-cb99-08d7f58c008e
X-MS-TrafficTypeDiagnostic: DM6PR11MB3291:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3291C77B05B34A7E3D0AE7D38FA10@DM6PR11MB3291.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 04004D94E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nj23aU8ymT7fUnmmvfbzjXG9BOMUd1QSrdyvziBRKBK9G43o8FzxHEZYrxdARwbw+xA6gBnjMpPOJlDP85azJtAxyK2j+kk3jgYNWrqth4K3w66lPBg/aD8+7VC7UbrqJpkJA1XQERIApIjdePNRDarhlBTYoUAb3e/gJBRIKn3P3/zEdHJerW3jdMETPzRYxHIzu0cgfAb2fQcd6VPk05rHu7yisAdlqumtw5arMTIvnp85G79FCiM7tLo4EG6cLx9XZ90IGAwT9kBGsPS1A1EKX0/LzwcumftY/wdPbD26AL2g7Kje6R9TIz3h0gJKfeB/q003EpdH/pZXaLCmqoJrs+re3gEzSj70dBVtrO2l3qtCdgF/hHbFoxa9RrJYtYrde858Ts5c0AbiEZpzswhOUagyFfDit3rvPp/VcWAZRu5auQ0EwOkjfcKjag/VAky55Uliv8azzVpysQ8a4BYhsgEFgf4sMRoFX3VclyQ3NN24KjhBBhhA10pxr/0JcxkZzCFV5/BqjYJ/UBmILEcwDed7jRDB/KBDiuaEjcrSnbjcGy7k2p4V6MtNGw9K4iPdNCNP8OWObOhXLCIhyY3MuypHxXBBIYEU/MRkj59UPuNZctpzyWPvrIvXw7xG1rnoROpH3L+AAiwmrrQOqIYTEq/m8+eA4714cBq3TahdWCtN1zZXDUsjXVgQqegrravpx74Q6jB/RtUu49yFDrwQSaBVnA/bfamsHZhmaSzf8ddfMGNuTrD5vvgLaOhm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3355.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(396003)(39850400004)(346002)(376002)(33430700001)(316002)(6486002)(478600001)(16576012)(33440700001)(966005)(31686004)(4744005)(8936002)(2906002)(31696002)(36756003)(86362001)(2616005)(6706004)(956004)(66476007)(8676002)(52116002)(26005)(66556008)(5660300002)(110136005)(186003)(66946007)(16526019)(78286006)(43740500002)(15302535012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	hZZfQvGXdEvXjYgTEviilDExOcbhe7h4doISIx8vdPTfFJz4bomyQenkEj49K2SjK8JbKb22kM7wdpnigaH6CO+waGevxMDWj7LNtpI7KtUMJdr9C89AmWrH8P3AeDQjRmgmJbuBp0FpkQz/kjB9y0ihxeWLqCGCEtBqlnKb5gAFRrop4OMySZEwQklqAown6eP0NhPZvm5JScU87JJYQT0Cmhv72YbHzVG7xU+RayhcgGZ3W0mQOyvN+AJatJr41RWjDyVHOEDwQVRMwHMBS4pH31vH/4OJ5x8dpaPXTYJjxpx7L3ZmDKQCsVx/rvQhdwrBnqZQ1qmpPPr5HpfjFhSu9pECh8ofRq3+uH6pwPALulGTzIysXCkgHlSu1Ta01Bwmtm+lu+x/g7YHmUnpEyPmStOWfkv+htcS579X9hEWdFH8elxktcZaUbs94P9kqOMnuuZE3jgSaQIkMxuvfyUpzT83+KP9KMsKhQHO29U=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30bf5c10-4436-4793-cb99-08d7f58c008e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 09:16:35.2319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNTtKBX1Sp6uuHfrq+I/L4Fdjy0uuuXzge6bLYm8MRKu0T87Q4wdsRb21KE/WMBRhPcUhKtgpUhr0WwSX159gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3291
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

As commented in luajit's recipe it requires libc6-dev-i386 on build machine so
that it can build two 32-bit host programs(minilua and buildvm) which are used
in the process of the target program building.

http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-devtools/luajit/luajit_git.bb?h=master#n19

This makes a target package depend on a build machine package. Not sure if the
32-bit host part could possibly be done in luajit-native. Any idea or concern?
Thanks.


Regards,
Zhe

