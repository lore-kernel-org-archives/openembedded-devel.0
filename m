Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.72])
 by mx.groups.io with SMTP id smtpd.web10.1772.1591855785708974437
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 23:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OPiloZtB;
 spf=pass (domain: windriver.com, ip: 40.107.220.72, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTyfjKQxiad8q6Q9C5/jdeV+WXvhm/av8KKuv2gS1FpMfbgi7QbZG0RQCNWHgSCZ6f1vOcOhiE4qiMrw8WCFlM4MmOI2Lx2K2DbwG+SQLjhKwVb0PxLOGAfDQjQUpXFw/gFF6ZQSTpSzn8DCsU9V0L14csCEkBKighv0g56CIDSxsUCCWa4sROkPo6T8LW901zyrWda0A5NyKQk6GJrBBDI9tzM0BcDJnk2AsW7xENcHqbnezzcFu3jAeCMK7CmpH3t46J2gcq4j4C5/5AEumi7QrUxD4/rp6WAbm3o/VjuGeDPC0oiIPoE6IZpzhk65PxctkiyfXXDUHXzdIz9OSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCNmVA86xaC5Bhmjonzajnhwd6T96s1rXWA9X1pX9rY=;
 b=WEXRYuXBnYkBWsJDlMLGkSRl443ZwaZx/S+SVNqyY3EQzzaO/zHIBrxVlpBHphOMykXJo2oN5HGYTuioehrOCYw5+FR3cy0+fu2h0hxvpNBt4iG3B9q+THCoML1vSbof6/ScpQQWlq6ws3xEo/V7VM4m1V8j95vIILljvZlzk1vRbnc3FQV6l5Ul44urZn4HI5YCz+T1vhYDz9Dt629eIHxyjaNy3RUtyCkejxfcGSCyNmm1cy+TiLgW/w9NmLHPtHBNQCZ7SR6Jbygc0FoKI5a9Rvar9F7U42o5Jljq1pzHflV+o/GEMYSuECdl8l/e9jPbqK7avIPWvLWTWrxNaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCNmVA86xaC5Bhmjonzajnhwd6T96s1rXWA9X1pX9rY=;
 b=OPiloZtBzHxqv53xND9b/kKUeNfDFFZjDDYNmHCGqj858w0oOdp/egkIPXscWNtOgUe5GYEJsLBjs1XWZKnhI/NbP61739pNgMLpRM1mlKiILsEMP6ZenpcDE+yBdS0xv73fSIwBLCLW2ebwBGNyeAccVBU0S2PLIpnOpTR1NxY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 06:09:44 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::ddb1:52c7:c1f9:a70c]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::ddb1:52c7:c1f9:a70c%3]) with mapi id 15.20.3066.023; Thu, 11 Jun 2020
 06:09:44 +0000
Subject: Re: [oe][meta-python][PATCH] python-django: set CVE_PRODUCT to be django
To: Khem Raj <raj.khem@gmail.com>
References: <20200611020739.37612-1-Qi.Chen@windriver.com>
 <CAMKF1sr7rjynL-AqpjV85Joq2=boXDnRHNeH2vHbSiMrP2k1Sg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <f5d88d08-f20d-4460-d8e4-7ff1b6f1546d@windriver.com>
Date: Thu, 11 Jun 2020 14:12:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <CAMKF1sr7rjynL-AqpjV85Joq2=boXDnRHNeH2vHbSiMrP2k1Sg@mail.gmail.com>
X-ClientProxiedBy: HK2PR02CA0152.apcprd02.prod.outlook.com
 (2603:1096:201:1f::12) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR02CA0152.apcprd02.prod.outlook.com (2603:1096:201:1f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 06:09:42 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5571111-6fe6-426d-1ed3-08d80dce0955
X-MS-TrafficTypeDiagnostic: BYAPR11MB2632:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26323DDC182266F6177B7C8AED800@BYAPR11MB2632.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:403;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vi5N91M0Hk9ehpkUavlHGV2MzcQCEABZAdl66X1/+VjX/7hOQ1Um+WrUs4MDVr1RzIsfX2szTOiPTlonfA5y1ULLJXVFQE3CNzf/PdFNBFXfztDObEw7z/5NpnpooP5tKEF2eWlzOAkiKPLZFCKroYEVPSR6CTvUwg25MqWIV9B8bdWWq3iBqO25IaP/CwcdR+77opMj4n6tBX4kAXIos7KQxFFN40de07HRJfJH9AMnyGRXLPCtZbZG3d8BDgQPjFtGIyAQPzmPstMxartWueOqCRxrSMQQfBRoTD98IZOfaBBYNP5KxB9VNs/bXbRvXHpDPloCiXijCz8CfVUk+Rn5xW8PyyI2UEwvmEalUMAHC+sq7Yq5MaW7QD9UeYKGLQtQ2QghCIBI5HD9wXzwiv8PFv5jBkYj0mXW4EL3EC/1vTECqrYfBfjqikimRVpSFLY1hoApluvhV032tyLwi1xvPKrd1euRvuKdckxEa2TIAn+ZWPSa7HvZaXcjX6Piwb7o8f9qasppe+oqrkHBRA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(366004)(396003)(136003)(346002)(376002)(966005)(6916009)(956004)(478600001)(8936002)(316002)(4326008)(16576012)(31686004)(16526019)(6486002)(186003)(8676002)(6706004)(2616005)(2906002)(31696002)(36756003)(66556008)(26005)(86362001)(5660300002)(83380400001)(53546011)(52116002)(66946007)(66476007)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	qR59W1Du2ukVODidqzciUetryUAnj4E6YlR+xUJE/EBqCeDi4wQq7S9h50pqFFRutbo/t+ta3TQ5alFerkvuD4bhbNOdnpg5J0/LYaIiwi5SLUR7xYoaoU8TQ1NPGkwtqGzPfiCnsbQEmKwbncWv0dgtW3OxM9WiLAq3LUDE4WpuJA1agRbK7SmYp82picM8Su+qr8NgosW06BIGtU4IlERKkM3T0bBhv0IdZDa/sLAzA7rqg6FcpE7zgZUy7kvEdNR6MSiMqIsdaglmHVP+RyHIdq2/wlwf37kZSdk/kND87HdUtXzEyN8yCy/zxL4TpMBvz4xv7TWKhJf7mHfo4Laco4e9zXivSqei3rHpq+KfAHk0PWQ1UuIHdLStyrnYoMjX0tXTp49DYukn1RXCJ35KDiDi+DbXS9ENlsKOkW/fpfTVyoPrjhOLmy5TOVJIvgtZQxsLPnTohfQpS1UqVXLkW6kuNY/As6IrfNn83KU=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5571111-6fe6-426d-1ed3-08d80dce0955
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 06:09:44.6081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppbkLGox9Tfo8ikfTWCSyudFNNfURaNjK8Ei55uGls9BmWSsnnnpXPEiDKJRzGHMEm9vWgKGAibzdtTiPgvG9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2632
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2020 11:43 AM, Khem Raj wrote:
> On Wed, Jun 10, 2020 at 7:08 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta-python/recipes-devtools/python/python-django.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
> Can you rebase it on top of master-next please ?

Done. V2 sent.

Regards,
Chen Qi

>
>> diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
>> index 54c77c827..3f8c19fb5 100644
>> --- a/meta-python/recipes-devtools/python/python-django.inc
>> +++ b/meta-python/recipes-devtools/python/python-django.inc
>> @@ -29,3 +29,5 @@ RDEPENDS_${PN} += "\
>>       ${PYTHON_PN}-unixadmin \
>>       ${PYTHON_PN}-xml \
>>   "
>> +
>> +CVE_PRODUCT = "django"
>> --
>> 2.17.1
>>
>> 


