Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39329C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 18:50:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.540.1645728611396871418
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 10:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EpDHih7o;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=90546d8fae=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21OHRFZt023591
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 10:50:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : to : from : subject : mime-version; s=PPS06212021;
 bh=uwgy3jOaECE3jpyW3F6UXiOrJkzQyeNqvxfpuAeZoic=;
 b=EpDHih7otRZb+ta3qAXkveesDfiqiBz4yaIiV2rV/Uz+obOLrlhyTnR0bFWlJnbeqwK9
 79Lam4B+XX4r9sKjcq0SWJa/oBDHWETvccR97l48Jtqrn0LXGjCPGGftMstkKK1rIcwt
 OgPWuq9eNqhCCnD7i9NwM/+tD6WqbleubzvegwEcq68C9igLUv6SbcYk9JgE219I+jzG
 hfq2y0L0FEWlpDl+cUiJLP0gUoW7Wf8GY+nTUmjxf9QBhYuR27K9nDFbmOTWiw0UyPDX
 eW9Fh+wCE/hwKG8xBBq4JEew7WxSSLdeylImWsaU4PAdV82N7RMjgIIs9P6Ql6bwFr5m xw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ecs9uaqwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 10:50:11 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 21OIoAvd009507
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 10:50:10 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ecs9uaqww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Feb 2022 10:50:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRb90t8W1nqc9Zof0oZicONHh1Hz8iYRNOYdRuk5ijTYOY98Vp9buXGuWxh0V3FWz1h7y13ud03myK6v5zX94p9dRH/n0oCEJrqwUBiFmtnj1d6Aid4bVQlA8nsu8Ns6CMpseLRsdq+s98oqednQMvTRtCsyYzw0JruJEa/VXFaQY7UdyQJuc9m4/mmBhds5+02QdK4qseotL8hAd1ONSAY5QDwJ/sozs+MvlGlUWjyPWaR+XfWCFtkX/zM7VHVDj/J9hLBoBhOywRj2JGZA++iFcTTAv9ZxHU/pQyxVfznQUZd2RsXZlOVzZCEu60xLI1G5KI/UCIFcPz/V5EDpKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwgy3jOaECE3jpyW3F6UXiOrJkzQyeNqvxfpuAeZoic=;
 b=GMNG+4/iYw3bcvuOuKR4cKrqTK5onYiNl2Q5KwTTAupdPSLXScUDyfwiW+8Ar9oHU3y1TSlfaqTV+v01+6PLMaO0K0lKxSVB7PM5fSZhTiwuklzmBSwnGyztV8Dvt3a2r4cuXO+eLOo6TbXIHxyC3wvINQqOBxLAbTC7Us1l94AiOPhJ0HNsvvyP2YfntEazdd+PNZc51UmoV6SGJaR3ZY3cJXMiMfMJ9NX0u/njTjyaASA03qmshu8c5pSgppwAbpSLlmnL2otX828erNKbV9OXm/Pv0Y1Tp4vGCNvNJcMr20tSo37Cduo4ghHDXBXbGwXPsji9HD0cSai8fEwMhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4044.namprd11.prod.outlook.com (2603:10b6:5:6::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.24; Thu, 24 Feb 2022 18:50:07 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::fca9:1fa9:6fdd:9dee]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::fca9:1fa9:6fdd:9dee%5]) with mapi id 15.20.4995.027; Thu, 24 Feb 2022
 18:50:07 +0000
Content-Type: multipart/alternative;
 boundary="------------dAtgWvio5VxqJ0q8jeUOXZ2R"
Message-ID: <f243d5d3-b94c-b1f9-082c-aded160d9519@windriver.com>
Date: Thu, 24 Feb 2022 13:50:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-CA
To: Yocto discussion list <yocto@yoctoproject.org>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Subject: Please provide YP bugzilla comments when encountering bugs.
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7bd44f4-4634-4644-fdc2-08d9f7c67a26
X-MS-TrafficTypeDiagnostic: DM6PR11MB4044:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB404409A5248B4F6444AD783BF83D9@DM6PR11MB4044.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+2YKDrM+B6gq3brI+3OT9yljxeOk1pI58L/v3bi/qqiCTDHcV4TcGPWz/6xliszRlzMwzbFoq2yEsfpUhv3b6GP7glz5Jl0Pq4K6cSOc+/tFYHCuuaQ2eixWGsC7EXodLCgTRrodOEpIBNwL6Jj3psc5p0RXfUdDlloU0KCZR8HNZ3RLKmmsqYAbvOoNEabs9io86P86aQ7vn3DpWlyxX34ykapZHhfS4L+HlKerRov041keWOHSq91C6Hwiz5RImgvimJe5mHtyHiknUjkkJn7skT3JgjOyyH03OVyt+Vfqlc+jiTwlAzr4HjLBEjc34FZXFx1Sst6KeM9jS+trqbblkcFYB3DeEbfBkdYBcLaEWrfZUBOdcsoIploaButo6vAMOxYqzOej80maaAqZ0G7N6O+Og3hnxQv0bqD9BZrOk5f+zDX51XcRiQmpMtlJfBZVKTrg3Ik2ghi0uznBlEA+mmsWJHLAdr2iqZ2zaWxVaMdOsvjK1BM7kcqY2fmxgmAeiZ+mSIiX2KLCih0oJEaIZe1v3JGHK3vTCAwUkb2RRJAC6drXOJ7+7gUG6m0Z41Sl/jxi1Ui0eSPaXJvt4CqqmfFGkFAqOCXsU1kz2CpRYHniMNq1HG8x8T9+J1oozeEdaDjmkgFxb1qEImHr+2vU22zAh7ww46PBGN9aFMatAuJM4QoF+GHXucxE+y2oo+OtdAH5I99LBl36yVNzYlHpfqlW9DAUdxEcN8sHpvCefvNP6drkQ7VKdNrRrS1/2kq07bQM6nWEHbF4IdH5Yy7QNqYWh/HTPcA5g1RY62MEbeRyxUQHukWoefQgGLCd4r8FwWwvkXXyzNi8EdYq2kYQebk6+FCQ6qFGDjB9mjE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(110136005)(26005)(8676002)(8936002)(5660300002)(66556008)(186003)(66476007)(31696002)(83380400001)(166002)(316002)(86362001)(966005)(6666004)(2616005)(52116002)(6506007)(33964004)(36756003)(6486002)(38350700002)(2906002)(38100700002)(6512007)(508600001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dzFjbHBiQ2cwTHd0NnRYL1VmcTlZMGlCaG9LeVVmZmRFNWFOY1FzMFIzbTJJ?=
 =?utf-8?B?NEppTVNuZTFHallaQTRyblBUaEpqa0h1aitWREdxVlpsZmdqVVBram5PbGE2?=
 =?utf-8?B?TzhOVyt6dnhzRjF0WGJlVFFhNENkZVgrNnJNVy9MSmMxc1lNU2J5TEtsQXZB?=
 =?utf-8?B?RFplakVsMlVVNGdWZmducVI5T0lVTnJoZlZQb1U2aTJsNENMOWtablhCZHB3?=
 =?utf-8?B?Q1RhMHV1N2kyUTFRUnBRNUl4Z3lRV0d6VVFTLzg5T01ZZHdzUnk0TkV0c05N?=
 =?utf-8?B?K2hyV1VqakhTUnkyUEp1bVdLSjNRaVVzRDI2TEJCNjM3TW84alpjWFVMNGEy?=
 =?utf-8?B?L0ViU1d0QnlEckVJTmtJR1NObklhN2VrY3pjREwxejgrMjJTUWlsNTFXMHVS?=
 =?utf-8?B?T2VkR2RsKzNBZm03b3V4ajI2YXFxUFdPSjR1dnRBR3hJc1JmQjM2MnVqSk43?=
 =?utf-8?B?QWRrYVNGN3IzL2M5RXVLRGQxaUQvNjBLRXVNTCs0MGxIWStRUytBcVQxdW9E?=
 =?utf-8?B?VzVMQWpkaDY2VEdVMDRmSS81RnpzVThIWlREVjhUSzVBSlVkSVVvZjhwRWZv?=
 =?utf-8?B?MVdJNEFGSEppSXJlcmNKOVpYczk5K1NxdFJWYm1rS1Y3RjEzU0F2OFFLRkk0?=
 =?utf-8?B?V1B2RWJnWjNyNFZOUklVSk13Y2huK282NDllUUxuOFlwQnNzY3JWSUM4U0NX?=
 =?utf-8?B?Q21KMk51QnlZK0xUSHVFYUxmWjI0TEMzRHVIenl5K1ZZVENRTXJvTUllOWhj?=
 =?utf-8?B?cXZDUG5NbVBXMmpQVUFXc0dqeVZvaVQ4a2Q3a0JFWWZ4bFhxaENYV1NzUm03?=
 =?utf-8?B?Q29hMmh1T3c2RHRvRGpBRFpqaW5RTDgySjRCRzVtVjFLK2kwYTdjNkZrVlpS?=
 =?utf-8?B?bStySmdkcjhpTytKOTY0dm5MMi8xNkhYVXd3N0VHY3ZDdmY3RUJmWXZGdG5I?=
 =?utf-8?B?ZVpBNktwOThIY250cDRqUG9jYk40bzFzMFJxWnluTTdRU21paE9aZUhxVSts?=
 =?utf-8?B?Rk9oZ1p5L1dtUjRJMEc2WFF0VkVaekVKcWhVZW5aMEgwcUphdE8vU2xaeFZW?=
 =?utf-8?B?eHZoWTNzN050emVSVUwxYmpmbStuMlJ4YUZtRjFIN3pJaWlVK3I1bVIrQUtB?=
 =?utf-8?B?WTQyakdyQ1owaGVNYXFaWmxZdXB5RE9wTkVvQ0IvR1gvbXFYRUxDbGVDa1Nv?=
 =?utf-8?B?b1FjekJzenFrQUZ1SEw4Z0tUZHFrSkRGaVdUT0JueENNSHFnNXQ0bEx5dkly?=
 =?utf-8?B?enF3cnJVS2ZpYjNqRUxHUWZEU0hENUxVUHRMQndRazIyTnNjK3p2dElpU2xv?=
 =?utf-8?B?QnlFbklTQmRLUUNlb2QzQnp3OE51TndiT1FpMVVITW93N01JTWxxa1cwRUJM?=
 =?utf-8?B?cnBVWjAxMFRaZ1BNMXk3VDVGejFDdkQxMDM5UWF3M3p2WVhaNU5Ja1FlVW5s?=
 =?utf-8?B?V3B2Tmh6TkpUTEtJM2thQWNkY1hqMC8xMlpsQ2xMcGFLUnFrbmxRb3k3K2xv?=
 =?utf-8?B?ZUo3UlhybENaTUY3cXZkaEx2cWg4MkJqa05MK0F3QnpsVlU4RXBUUEVUajJO?=
 =?utf-8?B?QURXRVNEWHpoVmFQREE5NWM0ek1nYS9iZDNNbUdlYWxtN1lzcVZtVU1DSU5G?=
 =?utf-8?B?QkNHUjZNM2cyS0xQYUw5U0pqYy9SVjFhZ0J6NWQ0NXRjOUdpUi9BR1FYSjNJ?=
 =?utf-8?B?U2d2SFpCcitVbytHbGtxSEdPdjYyZFR6NVoxUnNNdG5nd0NqUndCcVNUdmV4?=
 =?utf-8?B?UmdvOE9YOFV4WWFBemcySXVUL0h5akVzRHpVQ3BFUGZaTlF3V3lybGN2bENT?=
 =?utf-8?B?OW51bTBjbkI3WUdaV0dJMEJHQ253Y1V4MmdaUUR5dk56eXVHdkdkeldCZFJU?=
 =?utf-8?B?NXFlZFZubWRVc3FGbGFwSEFrRXh1VkZGMDJSVnBQVldvalQxYXZzTHVhWml0?=
 =?utf-8?B?V3lscVlhQ2xnZUJHVUdsczBkTlFNc2tJMlhFVzJhT0ZiVnNhVkxuT2pYTGM5?=
 =?utf-8?B?ZSsyVHpHRFRtUTdyajJab1p0eHQrYnMzTlpLaEkwbDUweWcvais3VFo1bjJE?=
 =?utf-8?B?Q3RIUEg3R3kyYUVraE50RjhZc1RDNXdVVjFrVEY0aDlaL0Uydnl2U1krRWxr?=
 =?utf-8?B?b3pKdU1PYnR5WlMyZnBWWWdOMGhOL3NNbUJ0MGZoL2w4OHhBRDRpMjV4ZDJ6?=
 =?utf-8?B?SFJLRnRqOHNyeTV3UE5icks0UmRnQVBQNnpHWGFHSkFwVjBrYWN2Yml0Qmpo?=
 =?utf-8?Q?qWHMnAbe4BbXVklRZ8gFlETAIHmOJYgVKp/9qaXrOk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f7bd44f4-4634-4644-fdc2-08d9f7c67a26
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 18:50:07.6002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1B7OPKecXhFm3kPsHY+NJqN6A7X9uTJt5vBm4aTL8RMZJphyUe0ayKuycJx6yzPbelcLlDrTzplEbX+FpIBwOTWJM665oa59DS/ReuYzlzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4044
X-Proofpoint-GUID: VdLnl4mDnOXVlaTJZiB3aQpGtVW8K2qf
X-Proofpoint-ORIG-GUID: 5N6jHhxTSaALLbmCzHZdpEjqlombVYqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-24_04,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=713 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202240105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 18:50:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95510

--------------dAtgWvio5VxqJ0q8jeUOXZ2R
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Summary:
======

If you encounter a bug when using a Yocto layer, please check if it's 
already reported
in the Yocto Bugzilla. If it's not, open an new bug. If it is, please 
add a comment
stating that you are also affected and provide any additional relevant 
details.

https://bugzilla.yoctoproject.org/

Details:
=====

Some bugs are only happening occasionally even on the Yocto autobuilder so
we'd like to encourage people to provide input so that people working on 
the
bug or prioritizing bugs can make more informed decisions.

For example, this bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14726AB-INT-NET: fetch 
failure in fetch.Fetch.test_git_mirrors

involves a fetch error for dbus-wait


-- 
# Randy MacLeod
# Wind River Linux

--------------dAtgWvio5VxqJ0q8jeUOXZ2R
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hello,</p>
    <p>Summary:<br>
      ======<br>
    </p>
    <p>If you encounter a bug when using a Yocto layer, please check if
      it's already reported<br>
      in the Yocto Bugzilla. If it's not, open an new bug. If it is,
      please add a comment<br>
      stating that you are also affected and provide any additional
      relevant details.</p>
    <p><a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/">https://bugzilla.yoctoproject.org/</a><br>
    </p>
    <p>Details:<br>
      =====<br>
    </p>
    <p>Some bugs are only happening occasionally even on the Yocto
      autobuilder so <br>
      we'd like to encourage people to provide input so that people
      working on the <br>
      bug or prioritizing bugs can make more informed decisions.</p>
    <p>For example, this bug:<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=14726">https://bugzilla.yoctoproject.org/show_bug.cgi?id=14726</a><span id="summary_alias_container"><span id="short_desc_nonedit_display">AB-INT-NET: fetch failure in
          fetch.Fetch.test_git_mirrors</span></span></p>
    <p><span id="summary_alias_container"><span id="short_desc_nonedit_display">involves a fetch error for
          dbus-wait <br>
        </span></span></p>
    <p><span id="summary_alias_container"><span id="short_desc_nonedit_display"><br>
        </span></span></p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------dAtgWvio5VxqJ0q8jeUOXZ2R--

