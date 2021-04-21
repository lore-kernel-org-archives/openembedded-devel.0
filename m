Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.71])
 by mx.groups.io with SMTP id smtpd.web11.8560.1618987544132429420
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 23:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KQ6RXIuW;
 spf=pass (domain: windriver.com, ip: 40.107.223.71, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWgm4H5AQ3yFOqRCwf2lO5YhBWxxnqgFmqeptv70hcqn9FfruZf4/7KQm94UHDFFTyLPHMiERJau9/q2/zf5xhGsa/jehtw5qMU/P0lBJ3IGA+9F3Dpambdl0fK572OeYpWYoCzMn2P2dsMStA1agEt2zD9ha5P2tWPZ7jwf2anTzsNtAqyX0iwzZOgvUeE7aviHGbCl9e7wLBFy27N7r6V/wKXW0t8nnoTLiwLHr17DJIuUNm+fEYTc8POaH6/SeWVdvWEE8yxsjTciVFWUQkcXC3CV3xx+X/cHGE6yF2+U08Xphm/GJ8Y9M3G57nYhWC35naavx7BFa1y3+Jgk0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hvs8CiBeUrj66b/kO/NhGLpaJZbJ1JWBm5fdzk3Esvk=;
 b=H2lmvU1rzrA2nq1bLUMcRZiGHmoL6P5fXlOnbDj8PDI1/o3uFubqpoz2hEAcOJSMkkofR6voBKTeWoiBwnI6MyMJvlaDMHY+A25ACEUpLjoQAn9i1sGDhiFTX7hwLGOkvojninV/tw7cZii/uRhnwirousOn+P8A4CEkXF0wf93hdJp1SRXvXOlAjugHa8Awp2kVGdVu5iIALlKAGSf8mZZDTV1dRANpKJTL2np7AqZckq1WkPKjBxxHnG8NWpD7eEuEHc2CkGafD1VWsWghtLsdmlmaksM9Js/cdEx9OKRZSRGdiR1mhWeWz8/nC8ZjWYnWJpVecFzdhekoh+AzYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hvs8CiBeUrj66b/kO/NhGLpaJZbJ1JWBm5fdzk3Esvk=;
 b=KQ6RXIuW3TuLadaefwSTWcqxt5KnSk6XOc3uB6zh5/f8Vv8S/eyu9M2aCH1PARz22p5bYgTAHCEoXDeFkDxfV47YWKbnDFx6LYXmTKinPd9kVllZJ1CET2l01jMopK4+BaTlgaK2nU4724tdl1Ytvc6jQL1mxmvk3iBgAEq+/BI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2901.namprd11.prod.outlook.com (2603:10b6:a03:91::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 06:45:41 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 06:45:41 +0000
Subject: Re: [oe][meta-oe][PATCH] tigervnc: upgrade to 1.11.0
To: Khem Raj <raj.khem@gmail.com>
References: <20210420065508.16247-1-Qi.Chen@windriver.com>
 <fbdaa43b-b1e4-cffa-0a97-1da77679fc06@gmail.com>
 <d1ae4467-6051-28ee-1ae7-688a3db87092@windriver.com>
 <CAMKF1sqdj0ppi5BzbN4vSWXKrsvUqOohH8viPyrUp+LPiqJSQA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <358b341d-eb01-bece-1f10-3d940c707889@windriver.com>
Date: Wed, 21 Apr 2021 14:54:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <CAMKF1sqdj0ppi5BzbN4vSWXKrsvUqOohH8viPyrUp+LPiqJSQA@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0206.apcprd02.prod.outlook.com
 (2603:1096:201:20::18) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR02CA0206.apcprd02.prod.outlook.com (2603:1096:201:20::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 06:45:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 162e4323-904c-40c5-6619-08d904911433
X-MS-TrafficTypeDiagnostic: BYAPR11MB2901:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2901B5C30BDD00E71035C251ED479@BYAPR11MB2901.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lGMlm581Ew8TzjTqQqlzr8rptrM3U4V0k6U2hN2p0zbsX4h1Kc/616/SXCXhIEzAdY14OGT23MyCf2fhROh+Crxikis7VGWJHMrEUhWVWxJ69D/OSyGPMJRgrQbMnQgYSj2+EiNC3UXjPtCayHOG/WbAhJwpX8V3q6Y3cB24gzFRnmnAUPejl9B5I5NfS0Rf/MKxLXQCvGyO+s8yC/2rgF8paD2g0qJu9Or6F90zkTa0PZIhiMwjCtVQgnd0vibL7B59IUH/4qO3chR7n/hqWGuNqn4zgC4NorcLnQd9dk54vBB77L2OO+kIW4eZ63p1s/3/bKLNqW7LL8zWgm/sKW+wbvkAu71J4VFqLcn0PW+NWDRgGM+uTiEWMzby3qmLe1Li0RR2cOVjAHFpX9/HsNhsDjES3Kl2yhFbF6La97kXJxH35WQ8PbApmwMJKmHAr7su3/zPRAX/xZVjpkC39rb8SCqyIvJqOu2AHPmjV62xaPTSCKTixoGwgDSy375c260FoqOO54jnuxxLWhcmLvpfDjydUhnfqS3htrpRnnlVcL1D6V5Jw8/WGEFip5JodkrTsti/7pcwKYbZO7LgbhDRQIX6xywMOlQYMdC8ykfl9aVn8AElP7wxce2zw75M+KTtjoXqKtlvrLPsJRzyeJ4ywayIENs/BnfVETq6MJOV/s5I4bWXjVox6CzmmU3Fy0VNTe7ojSwVwgM+VlgXHQPuCeJDdlBMyH7YeyvfO6fA99e3fsa/9nEnS7lAMooeQsA4FKvNMJafVXfB4myizAZ4oaGOCBpW2LSEWWk9RSjONmp2DbeLW7U9ZLdyXXXL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(396003)(136003)(376002)(36756003)(52116002)(53546011)(4326008)(26005)(2906002)(86362001)(316002)(6486002)(16576012)(31686004)(956004)(31696002)(6666004)(8936002)(83380400001)(16526019)(186003)(66946007)(66556008)(6916009)(8676002)(66476007)(6706004)(966005)(478600001)(38350700002)(5660300002)(2616005)(38100700002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	7NBAXUCzYRZkcT9UoCp4zZW03LwLGGnZ4qTvQUaK0A+iMtkIGb1KpL1+Mc4hpNzUPMAIYx5+ntqK7eydLfbl2vah80zGvh4pqCykmkN12kU4KgQeJRqpOgmN3GPXWMVj7TX3b8z5Fps0mIW5CdaYzXBkzeL0HsnNCY75kVP3sq2XGvJyJPdmjrCekFQjH7yJBdUG1KJGohgN0TOEv4rtBx0rj+eZnvGy+nhJ5y6siWmyypV79WED5AJM0P+eW15Y52FUwR64+/9uuKTa5HVrbSRcyuXq5qa+hU690orX7IMFpynni/Suc3U3Q3iU4kYfEicGS5FfrhX18Nhsk+0ralhOCoARoRxf0ZmRKsp4IKst84aAcuCJZAaOcKEEGiybuWXNfIHPQS5i2Ev0eXTzAJ3gMbitmawMfiE/+xI+jDybjnXQpBYqXLqbT4lMHqv6ejlu7NGTsqlHr5dTUAmDvd8sV1hzYuAhfY1QRfArphOYc+XRR5euaoQ4cQdpFfJKClaoTU0tQhXVuKnl91/b3Vi7dfAgRmoyAX233Y84Cy0q3vlf0EQ/hJQ/+DQzOB6nar/R5dDBM0SIIDZhMZfgK/brYeiOBpBxRDGX2p1ekhf9IJ4PY2snDSdZInnJFiVA5otrJZ8ZeedzpaTbRDiunkFP3nzyQwFsVPJZiIyCyk4nu1/LMfx4KkvV+T5PxyLWaZ4flQuUrAnNPQSZNPHHgEpSvdl7thosaZQXi8fiXoyjOno4gMvSRtykdSFTevnX
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 162e4323-904c-40c5-6619-08d904911433
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 06:45:40.9605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y63+hA7C8gicjQF2Z1cOYvFPdl//AGU7L9NBKeZxyWIVpkS/bMATsMmvEd3LaqwVdcWX0Vqillk1oSoXdaC5cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2901
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/21/2021 01:36 PM, Khem Raj wrote:
> also check this
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1159

Thanks for discovering this.
The new version of tigervnc has made 'pam' a mandatory requirement. My 
builds enable pam by default, thus not revealing this problem.
I'll fix this problem in V2.

Best Regards,
Chen Qi

>
> On Tue, Apr 20, 2021 at 8:26 PM ChenQi <Qi.Chen@windriver.com> wrote:
>> On 04/20/2021 10:43 PM, Khem Raj wrote:
>>>
>>> On 4/19/21 11:55 PM, Chen Qi wrote:
>>>> Upgrade to latest stable version.
>>>>
>>>> The 1.10 branch is not maitained any more, it stops update in 2019.
>>>> The 1.11 branch has fix for CVE-2020-26117, which is a high risk CVE.
>>>> https://nvd.nist.gov/vuln/detail/CVE-2020-26117
>>>>
>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>> ---
>>>>    ...002-do-not-build-tests-sub-directory.patch | 21 +++++------
>>>>    ...vnc-add-fPIC-option-to-COMPILE_FLAGS.patch | 36 +++++++------------
>>>>    ...{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb} |  6 ++--
>>>>    3 files changed, 28 insertions(+), 35 deletions(-)
>>>>    rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.10.1.bb =>
>>>> tigervnc_1.11.0.bb} (96%)
>>>>
>>>> diff --git
>>>> a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
>>>> b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
>>>>
>>>> index 4e875ba82..5a42e67d0 100644
>>>> ---
>>>> a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
>>>> +++
>>>> b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
>>>> @@ -1,29 +1,30 @@
>>>> -From c3460d63f0b6cd50b9a64265f420f0439e12a1d5 Mon Sep 17 00:00:00 2001
>>>> -From: Hongxu Jia <hongxu.jia@windriver.com>
>>>> -Date: Tue, 25 Apr 2017 01:36:44 -0400
>>>> -Subject: [PATCH 2/4] do not build tests sub directory
>>>> +From 076d0e12a7be6cd2108e4ca0dcde1cb658918fa5 Mon Sep 17 00:00:00 2001
>>>> +From: Chen Qi <Qi.Chen@windriver.com>
>>>> +Date: Mon, 19 Apr 2021 23:02:45 -0700
>>>> +Subject: [PATCH] do not build tests sub directory
>>>>    -Upstream-Status: Inappropriate [oe specific]
>>>> +Upstream-Status: Inappropriate [OE Specific]
>>>>    -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>> +Signed-off-by: Hongxu Jia <Hongxu.Jia@windriver.com>
>>>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>>    ---
>>>>     CMakeLists.txt | 3 ---
>>>>     1 file changed, 3 deletions(-)
>>>>      diff --git a/CMakeLists.txt b/CMakeLists.txt
>>>> -index 94ec2ef..fb72a00 100644
>>>> +index 7bf99441..bda80598 100644
>>>>    --- a/CMakeLists.txt
>>>>    +++ b/CMakeLists.txt
>>>> -@@ -300,9 +300,6 @@ if(BUILD_VIEWER)
>>>> +@@ -304,9 +304,6 @@ if(BUILD_VIEWER)
>>>>       add_subdirectory(media)
>>>>     endif()
>>>>       -add_subdirectory(tests)
>>>>    -
>>>>    -
>>>> - include(cmake/BuildPackages.cmake)
>>>> + add_subdirectory(release)
>>>>        # uninstall
>>>>    --
>>>> -2.7.4
>>>> +2.30.2
>>>>    diff --git
>>>> a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
>>>> b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
>>>>
>>>> index 97b0a388a..5f14665b8 100644
>>>> ---
>>>> a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
>>>> +++
>>>> b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
>>>> @@ -1,44 +1,34 @@
>>>> -From 9563b69640227da2220ee0c39077afb736cc96d1 Mon Sep 17 00:00:00 2001
>>>> -From: Hongxu Jia <hongxu.jia@windriver.com>
>>>> -Date: Thu, 20 Jul 2017 17:12:17 +0800
>>>> -Subject: [PATCH 4/4] tigervnc: add fPIC option to COMPILE_FLAGS
>>>> +From 7f8acd59bb2e54f9be25a98dd71534700a9e355a Mon Sep 17 00:00:00 2001
>>>> +From: Chen Qi <Qi.Chen@windriver.com>
>>>> +Date: Mon, 19 Apr 2021 23:14:28 -0700
>>>> +Subject: [PATCH] tigervnc: add fPIC option to COMPILE_FLAGS
>>>>    -The static libraries in Xregion/network/rdr/rfb were linked by shared
>>>> +The static libraries in network/rdr/rfb were linked by shared
>>>>    library libvnc.so, so we should add fPIC option to COMPILE_FLAGS to
>>>> fix
>>>>    relocation issue.
>>>>      Upstream-Status: Pending
>>>>      Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>>    ---
>>>> - common/Xregion/CMakeLists.txt | 1 +
>>>>     common/network/CMakeLists.txt | 1 +
>>>>     common/rdr/CMakeLists.txt     | 1 +
>>>>     common/rfb/CMakeLists.txt     | 1 +
>>>> - 4 files changed, 4 insertions(+)
>>>> + 3 files changed, 3 insertions(+)
>>>>    -diff --git a/common/Xregion/CMakeLists.txt
>>>> b/common/Xregion/CMakeLists.txt
>>>> -index 40ca97e..9411328 100644
>>>> ---- a/common/Xregion/CMakeLists.txt
>>>> -+++ b/common/Xregion/CMakeLists.txt
>>>> -@@ -3,4 +3,5 @@ add_library(Xregion STATIC
>>>> -
>>>> - if(UNIX)
>>>> -   libtool_create_control_file(Xregion)
>>>> -+  set_target_properties(Xregion PROPERTIES COMPILE_FLAGS -fPIC)
>>>> - endif()
>>>>    diff --git a/common/network/CMakeLists.txt
>>>> b/common/network/CMakeLists.txt
>>>> -index b624c8e..6c06ec9 100644
>>>> +index d00ca452..e84e0290 100644
>>>>    --- a/common/network/CMakeLists.txt
>>>>    +++ b/common/network/CMakeLists.txt
>>>> -@@ -9,4 +9,5 @@ endif()
>>>> +@@ -16,4 +16,5 @@ endif()
>>>>        if(UNIX)
>>>>       libtool_create_control_file(network)
>>>>    +  set_target_properties(network PROPERTIES COMPILE_FLAGS -fPIC)
>>>>     endif()
>>>>    diff --git a/common/rdr/CMakeLists.txt b/common/rdr/CMakeLists.txt
>>>> -index 989ba2f..20f6489 100644
>>>> +index 989ba2f4..20f6489d 100644
>>>>    --- a/common/rdr/CMakeLists.txt
>>>>    +++ b/common/rdr/CMakeLists.txt
>>>>    @@ -27,4 +27,5 @@ target_link_libraries(rdr ${RDR_LIBRARIES})
>>>> @@ -48,15 +38,15 @@ index 989ba2f..20f6489 100644
>>>>    +  set_target_properties(rdr PROPERTIES COMPILE_FLAGS -fPIC)
>>>>     endif()
>>>>    diff --git a/common/rfb/CMakeLists.txt b/common/rfb/CMakeLists.txt
>>>> -index 5047e5e..88838ab 100644
>>>> +index fc5a37bf..7f5ce131 100644
>>>>    --- a/common/rfb/CMakeLists.txt
>>>>    +++ b/common/rfb/CMakeLists.txt
>>>> -@@ -98,4 +98,5 @@ target_link_libraries(rfb ${RFB_LIBRARIES})
>>>> +@@ -99,4 +99,5 @@ target_link_libraries(rfb ${RFB_LIBRARIES})
>>>>        if(UNIX)
>>>>       libtool_create_control_file(rfb)
>>>>    +  set_target_properties(rfb PROPERTIES COMPILE_FLAGS -fPIC)
>>>>     endif()
>>>>    --
>>>> -2.7.4
>>>> +2.30.2
>>>>    diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
>>>> b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
>>>> similarity index 96%
>>>> rename from meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
>>>> rename to meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
>>>> index f97c2b2d6..1e7160aea 100644
>>>> --- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
>>>> +++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
>>>> @@ -15,9 +15,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
>>>>    inherit autotools cmake
>>>>    B = "${S}"
>>>>    -SRCREV = "4739493b635372bd40a34640a719f79fa90e4dba"
>>>> +SRCREV = "540bfc3278e396321124d4b18a798ac2bc18b6ca"
>>>>    -SRC_URI =
>>>> "git://github.com/TigerVNC/tigervnc.git;branch=1.10-branch \
>>>> +SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch \
>>>>               file://0002-do-not-build-tests-sub-directory.patch \
>>>> file://0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
>>>> file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
>>>> @@ -83,6 +83,8 @@ EXTRA_OECONF = "--disable-xorg --disable-xnest
>>>> --disable-xvfb --disable-dmx \
>>>>            --disable-xwayland \
>>>>    "
>>>>    +EXTRA_OECMAKE += "-DINSTALL_SYSTEMD_UNITS=OFF"
>>>> +
>>> I wonder if this should be made conditional on systemd in
>>> DISTRO_FEATURES ?
>>>
>>>
>> Got it. I'll send out V2.
>>
>> Best Regards,
>> Chen Qi
>>
>>>>    do_configure_append () {
>>>>        olddir=`pwd`
>>>>        cd ${XSERVER_SOURCE_DIR}
>>>>
>>>>
>>>>
>>>> 
>>>>

