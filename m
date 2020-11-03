Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.57])
 by mx.groups.io with SMTP id smtpd.web09.4791.1604371803615974318
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2020 18:50:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CjZVHfEi;
 spf=pass (domain: windriver.com, ip: 40.107.237.57, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldFwoYRkiwD/8GzUn8UA9Ov4co209zwyCcsnlALuZS5e3wl0H1jjueulUjAGk8R9XuFnFCME1E+wsSFTeH9rhBx+DrmP2S+Yw01Arl/E68VRbnU9k79ZiDpEGeC8KBpUX4vDZhJXQIzBojYgkalGawEcyzchLMmXkmbEBLbZnxs9rcA/1hEYYj7aEv7DxfKMWaSnMg38RCxvPVkacSgAuJAPKhVq396jYYDuawr1BOUKvj0WzFJU8g8kQRM2Nzt72OzQMzXqAB+fSiPr6liuqBfdfTZE3u0sRAuh4U114LBdV3gND0O6CYJEsAtbmM8g4IInk5dKYZKil16wpiRe9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QP/MVqLB081jexzh22v/cRSwmMReAql9lR8oW1rGLU8=;
 b=UXGXER/Qfnf8FeXr3EEnawXjclYTiozuZo8QpAVBYGnQbX33nZhclYSJkkkADU7+aWGVcOOusIWRo/QF2MIVI8Rj4Z6zPQ2m2HUo5/mZZ4F9XWjKMrIXQAWt1lLUDVhmjsqGOWyJh7gss20H8MlEMTQ6ll1F6SWI4W/6iQCIEkAb8rK69vB211RL9YQUWehsgd53mNkMlIONuQ9lpXj1N8Fn97Q+wyck1k5QqQWNO3HKhhLnhfkVc93a2/f6NUnMn4iAJxDqw2f3xUtsU51JCCc0VSnsppbyUKVBQUXEBLKRyxbrkDVQ8r/OCF2lnEYt7bfb0+kQkfIylTCuOuegeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QP/MVqLB081jexzh22v/cRSwmMReAql9lR8oW1rGLU8=;
 b=CjZVHfEid3UQe9eoPQoQHJk5wmmpeeXbJ7uVC5nG9Wmjh8FNtgkRpy9tHPxPvVdT0zc509rh1XMKAJbspkrOVX/v3vhWHdzsV1FxdYHnUPL4K5Fl1RlOFCxczjYKUF01dAQWXG87JfLvcrrX1zvrHoEyXd+CyzG4Of+Z1yF+V0o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Tue, 3 Nov
 2020 02:50:01 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 02:50:01 +0000
Subject: Re: [oe] [meta-networking][PATCH] quagga: unify volatiles file name
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20201102091320.15732-1-yi.zhao@windriver.com>
 <CAMKF1sr721emgcyE=+GHPPiz1VZThqjWOXe01WQndv4qVMKDPw@mail.gmail.com>
 <ced6967d-c807-4352-1d0f-0e239aa2111f@windriver.com>
 <CAMKF1sqHR3_UK42eLMxQM2Ue_YHguAaCCHgY__1_9yG7rUMDGw@mail.gmail.com>
From: "Yi Zhao" <yi.zhao@windriver.com>
Message-ID: <4b3ed683-da39-a447-688d-486af619c333@windriver.com>
Date: Tue, 3 Nov 2020 10:49:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMKF1sqHR3_UK42eLMxQM2Ue_YHguAaCCHgY__1_9yG7rUMDGw@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0006.apcprd03.prod.outlook.com
 (2603:1096:202::16) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.174] (60.247.85.82) by HK2PR0302CA0006.apcprd03.prod.outlook.com (2603:1096:202::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend Transport; Tue, 3 Nov 2020 02:50:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef63aea7-c807-4aaa-5bd8-08d87fa3289d
X-MS-TrafficTypeDiagnostic: MW3PR11MB4620:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB46208E36D1D6B13129430D31F9110@MW3PR11MB4620.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ee4Mqdhrwi4mJWsGoB7XqgOZhNP3a0vkuUkNF7E2pqqXbD7aa8T+2n7v0ShiKf20E9T6NozudvmGkQSl88Wbo/7snBB3HJaYK81RF3mi9N4dfNH6H7T0DvsVyTXYYnpD86qpgK+IVeEk/uJlX/AiZwOwty3jyYKER/EDUqJOouQmsJ0aa3WV9xsCFXMxKVKfi7k6fJddbvS3Kg4W66G3mjlLsX3G2hv7MMOinKqZoX0GUE/RWZk5rQAJsOXcZ4A/hdL4jsiA10OYZtoEEiq6o3f5Zz0k5COUYjcq4r1duTTMeH5Rfr5yXubJIWq3POvuikENNkrmyp2IxAD39P7Qx1GwVx2x+zbAn3RPB+zaTodd1gq3sMuyHW7dRAuooIec9GaQy+uj9xMCRPgPeq3u5+6SOOdV3c4Z/BEiIEZRUZOwkesFAxyL9PTHPQqkLdkw+Z7+LLAJG5kJp41uSAfY38caM7GI8Ev/AH/4Hcr0egw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39850400004)(376002)(346002)(396003)(52116002)(2616005)(44832011)(83380400001)(53546011)(66946007)(956004)(316002)(86362001)(31686004)(966005)(36756003)(66476007)(16576012)(2906002)(4326008)(66556008)(31696002)(8676002)(6666004)(5660300002)(26005)(186003)(8936002)(478600001)(16526019)(6486002)(6706004)(6916009)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	sNMk9B9VN2Mdct8SsFatwEh//k5VmEeismw5CMpNsQjePrYrhO9i1SGhVAbH6mPyiEBOSlLy6TjrzZiqXoEBhqKVlLKOOhKitBNhfI8/iqrz6c5r/uXz8XJzqswVesqpAoSGn3ppO+fwmQmK14o1npYOGZu69FvdlVBmHr2tuYyCxjL6E+/52DRYQhKFUByUuh/CMUtCX2/dxB5l/DS1lpmtOmO4P08c9+q2EVJqu0yoS4fv22OZok6otdfqwU6zWF3b+9bHJ03mCt6Tr0XbLHFHGeGkm2YE2nmmppAL6zQWxdKopIuDSXsOBY+vUlbuMWw08ULPa/duX00WsJcouSUMijxI9GdlKmQ/70zLCnJTICckgIu2HAKdN5DZIoBEDi5sAkSEBDFWfcORtz/2HQTXGSVQ9Gl/CwJLU5L1QjWBfaUhNaHkdmKWLReomerbN9Sxapk+nU+3P1CjPKqoIyoi5a/vWd8MmQFzMThOXUnGfLBScxIwLQPK/O/igJqNqmkfga3vTIBGIw7OktQhj7mMHRx0dxQqXZLcIELD7p8ZyWUyN6mTZ5A4ZAZyIb/LX81KFYAk0B+kEP+aJza690tHRT2XWFxIxcimzbXrUxMwotMM9A7HOgy+mTnlvFr31r/ky96Sj5ynBSl3gOJs9g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef63aea7-c807-4aaa-5bd8-08d87fa3289d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 02:50:01.1748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l796vLHCYVczU250ImGy25pH84+ZVN4OKhs2psFM5eXCqN8pSq9muLCjwWMg1cylFPjbe87Q31sqwzO+UcEUUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4620
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/3/20 10:33 AM, Khem Raj wrote:
> On Mon, Nov 2, 2020 at 6:31 PM Yi Zhao <yi.zhao@windriver.com> wrote:
>>
>> On 11/3/20 12:26 AM, Khem Raj wrote:
>>> On Mon, Nov 2, 2020 at 1:13 AM Yi Zhao <yi.zhao@windriver.com> wrote:
>>>> Make the volatiles file name starts with digital.
>>> what does this get us ?
>>
>> Just want to make all volatiles file names uniform. I searched oe-core
>> and meta-openembedded, only pulseaudio and quagga volatiles file names
>> are not start with number value.
>> $ ls /etc/default/volatiles
>> 00_core  01_bootlogd  99_dbus  99_sshd  99_wpa_supplicant
>> volatiles.03_quagga  volatiles.04_pulse
> this will change the order of their execution, is the new order still
> working without other side effects


I have tested the changes and didn't find any side effects:
1. The volatile file only creates directories under /var/run or /var/log 
for its own package. It doesn't impact other packages.
2. The populate-volatile.sh service runs on RCS.d
3. The 00_create volatile file always run first to make sure the base 
directories /var/log, /var/run are created.


//Yi


>> //Yi
>>
>>
>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>> ---
>>>>    meta-networking/recipes-protocols/quagga/quagga.inc | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
>>>> index 11b7d576a..6df72427b 100644
>>>> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
>>>> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
>>>> @@ -81,7 +81,7 @@ do_install () {
>>>>        install -m 0644 ${WORKDIR}/watchquagga.default ${D}${sysconfdir}/default/watchquagga
>>>>        install -m 0755 ${WORKDIR}/quagga.init ${D}${sysconfdir}/init.d/quagga
>>>>        install -m 0755 ${WORKDIR}/watchquagga.init ${D}${sysconfdir}/init.d/watchquagga
>>>> -    install -m 0644 ${WORKDIR}/volatiles.03_quagga  ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
>>>> +    install -m 0644 ${WORKDIR}/volatiles.03_quagga  ${D}${sysconfdir}/default/volatiles/03_quagga
>>>>
>>>>        # Install sample configurations for the daemons
>>>>        for f in bgpd vtysh isisd ospfd ripngd zebra ripd ospf6d; do
>>>> @@ -106,7 +106,7 @@ do_install () {
>>>>        sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/*
>>>>        sed -i 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/quagga
>>>>        sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/watchquagga
>>>> -    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
>>>> +    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/volatiles/03_quagga
>>>>        sed -i 's!^PATH=.*!PATH=${base_sbindir}:${sbindir}:${base_bindir}:${bindir}!' ${D}${sysconfdir}/init.d/*
>>>>        sed -i 's!--with-libtool-sysroot=[^ "]*!!' ${D}${includedir}/quagga/version.h
>>>>
>>>> --
>>>> 2.17.1
>>>>
>>>>
>>>> 
>>>>
