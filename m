Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE47C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:06:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.218.1634749605132470300
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=W6Iy8WC0;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5927a4c3e1=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KCZUU4000453
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 17:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=0g9fDPXKtav0OH2tLGFMmR3H5QX16hum6abmAwr0tls=;
 b=W6Iy8WC0Uz+GRXAWeKueS5RBWgWJX4NNm4P7woKE9lg3ufgvVnk+AM+WPGJqO/rS5IDg
 g3fiDOBI+OoFaX4Qn6nEEd+Zy6fLEXMhdFXB1PDHM8JLjGzVjK7hvmeFqRaUIKgAHfBG
 8VJcheNbSbJ8FStCVXERWYwdzSxAXw3QChfDZ1hMERFhsZYcvfhkrkGd9E4q/wYTesJE
 uy/3qhiMWTHbVfbMcaaO3oSEGKTGg2gJxS+ChfY1YJZkRSIbxsvKGnJ8ln/rYlIdkXsl
 1eUQJ8dUg6n6uHQV9vJtetc6EskmtHQWUuxyunuZ/yYF3t7Fonfy2GfSC/tL6UQiVa0i TA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bt3d18wc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 17:06:42 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19KH6gss007850
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 17:06:42 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bt3d18wc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Oct 2021 17:06:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AC3FRj/2NfwVbooxCliZ7qF1xBy6ud7Zj/GeQ7gG4gPuSAtNAZGBsVNUcNdKJ3OdgmK3MRwDQLIydBQDo40caWwam+kGoDiOhuGwzB6QpHvi2/tE2ykDeXZa+rL2V1w5OujevOcmz7pRhqn5z+cfyrLMucs7eeY7dfNWfyNkJPieUs3PeIiqFj4eCoJHmk4wkB2fF4tEAzyH1DkBjaSAxmzQTAfgtKK0ELixoLqVs6iuxqmWrDHsGiuqWLolRPDDFyg+nFnIGbZMKy1MuRNlwzkvZproWSrUlrkqESCKxfczTMNbHQS5jqAazUH7HHk52KJXplXD53xQIJDshsTofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0g9fDPXKtav0OH2tLGFMmR3H5QX16hum6abmAwr0tls=;
 b=eAg5SnJsUEjGYDj8G+Yu4Eb3MgSSCt77npzqQNS4sUozQrouXhHRPEtPALf2Dg5K8Exe+HMMrNuY9kHTchCJxpWi88BzgVcPpZyLgh6jX91NZuisnK49Ti1Lfb6cRjtU0W15+/dLU3+lPPKGF2sdZZdeyFPWb+ct8fS69BbQ7LH5LuYuwWeYkwi0ll+HL/jD0Ct82SEXVRlK2UGBGafpI91+tADr6Q4GNtT6xplo2Fu7g7VdtsbH6R1NmejjZFXhU/nu1CL6Gw7wb4KqZsL5u5Q8jhbcuycqxXJk+i5CjG2NH43s0zWcpiZ9xPV48bxTlgmUMMXYiuXFVHY55YmU0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1435.namprd11.prod.outlook.com (2603:10b6:4:7::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Wed, 20 Oct 2021 17:06:34 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5021:c72e:2201:1a62]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5021:c72e:2201:1a62%6]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 17:06:34 +0000
Subject: Re: [oe][meta-filesystem][hardknott][PATCH] ntfs-3g-ntfsprogs:
 upgrade to 2021.8.22
To: Armin Kuster <akuster808@gmail.com>, Chen Qi <Qi.Chen@windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20211019045923.51357-1-Qi.Chen@windriver.com>
 <b73a6500-6db3-57ec-2ccb-4616a719d276@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <4d0ea54a-fb51-982d-2936-027fe91c4d9d@windriver.com>
Date: Wed, 20 Oct 2021 13:06:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <b73a6500-6db3-57ec-2ccb-4616a719d276@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
Received: from [172.25.44.7] (198.48.226.187) by
 SJ0PR03CA0075.namprd03.prod.outlook.com (2603:10b6:a03:331::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Wed, 20 Oct 2021 17:06:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 472f9574-2868-49da-c377-08d993ebf829
X-MS-TrafficTypeDiagnostic: DM5PR11MB1435:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB14354398ED218B861CC0F5B2F8BE9@DM5PR11MB1435.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:269;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FqsNPBqCAkYg75RMJuh/kmvKCgXDVhz5lgzKYqH0pYxLFRCzd37nO1yKZCOf+PSR89StOLibjTw0zCLJwU1OAicp4ERnHTb7HrSRSaszD9QY5JLTXIJmIDDd4O6WBvCgdIb7KB/cQGkGJkAAc7t1/Pvy76hq5YypMqioFRTijhPDxgpfkK3Hu6qRluOmtL4y3eut3jL2A7rguGqXePUQZgY9u4Ob5XGIuIDUxid7eto2r5N21gx9lvniDuSXAv4CyKrCfVMKt7Wuk/deaq3ZH113xNKok59PJucefC5AK2P4f0tuB0zs+DKfI5ednVo3I2KC1Q1kEl9kAkWwNKp3DBPYHsGHr/GsNkXr49eKgpyX03+VYm9rRQlj/sb/hC4PbSK1LDzFkwhwYW4XCEFtMyDFQMk2enexsYR2mQ/etUaYUgFh2ijJYNMGrDfb3ZidGNgsRLx+WwwHG0XtURIJakbguhagX5eKqMAiXdDRC1d9ltzxMY/e6dPQupSiwSps0Mra9PjXkpamBxrJFWMBY5b0QnKsSXjxdFeBOmc3O1F6xxBXij+FkqJIFI633YqSjQXP3HNpIr/EeWBKj9alz9TndeZtL4VZGEKzeytuBwJrV9YfbbmOmd6BC8c8rdIZB/W1PvMqDKrGw3h6zgnORIO3fpZUQBEjwn+cFCasR/eRoboWDkHR5QD61l9z2V37MCIHPDEKJWvFPwmKeUl3Ti8zMmmQ/PW0uiwpYncLPmLemONLTv+DdgWXTJXvcAzqzQhCo6mjpzs7rVdpFiS22Ahdw1aNsiD2uCNgUiwViLJHz068O3/3Y8uDyKXdELPtGV6YGR9rFVsykSmR3nBW9vja2bATvaWfeafhCA+Fverf8bG33fPouTiGRzIRqXJZc87L4HWbVsXrpaBG6MGCbg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(86362001)(2616005)(31696002)(4001150100001)(956004)(6486002)(36756003)(52116002)(66946007)(53546011)(66476007)(31686004)(38100700002)(8676002)(8936002)(186003)(966005)(6666004)(508600001)(83380400001)(5660300002)(316002)(110136005)(38350700002)(16576012)(26005)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cTFpSWM2bTJYZFJZTjkxRDYwR2oxWDhrNDQ5OHhkd2x4NWZJZDczdVFqOGVG?=
 =?utf-8?B?d0JIaVhDZ2NFYzVrell4VUtGQ3FXTnU0TEU2V3JwV1ppZE53allucmE3UzBO?=
 =?utf-8?B?U2xXQVBqZmxuWkJFdm5lNkdTUTVEL2ZkN0kwa0E0MTVLS3d5VWVyUElCelVJ?=
 =?utf-8?B?MnpEYThTMy94RGFjVzB6VlY2eWF3bHZyUm5QS1dLREVHMmVYNUdYbmUzbU85?=
 =?utf-8?B?Q0F6N09NdVY5aHBzZUF4anRaaDFkcXlwR2doTmQvZkExei9IOVEwVyszb09V?=
 =?utf-8?B?bkI5bDJCK1pMRGloQXppNkJSeE1uOVo0VkJwU2ZVM1lZbnRvSXMyR0szRktM?=
 =?utf-8?B?djQrb3JBUkFZR0F0RlRYMlFOaXo5K0llMHZESkh4QXJ2U1A5aFVLSGVydWsr?=
 =?utf-8?B?ZFRNZFZqUnFBWDNLdUh2V05Ra0FLa2VhMnJ0T2ZRcFZNV1ZZMDBzbTRDdStW?=
 =?utf-8?B?dStiWTNqTGd0MlorelMwWU9wTTVLL1o2UEZBaDlpZ01NZDQxbU9PdkdhdWRZ?=
 =?utf-8?B?Q2V2VzI3d2VudVhoS2hLK0lkS252a2J3YTkzWlRGbWRCV0lRR0tjcDBUSEs5?=
 =?utf-8?B?a0NyWFByUGtUZmZVL0MzWFFCUjRMcSs1YXQwYm1HNWVRS0IvbURUSXk3ejJv?=
 =?utf-8?B?R2wvOTFId3FjdGdQbk9QN2JxNHJHN0R2M3NvR1htS3F4L3ZwNDdKWUk0bzNF?=
 =?utf-8?B?bkdXWHZwWVBVWkJXdC9ETGFTL0pVMnZBc0M0dXZwd042ay9relFPdTdjRVQz?=
 =?utf-8?B?MmFsQ1dPcnhUdWNXYnV5bnFhRWxtczQyTFduSVV5U2Z4eFh3cWNnd1BrSTNW?=
 =?utf-8?B?Z1ljRHRjU1F2WHRHVFo0am1DbUVzMkpYZjVCQ21zR082SnBiUUYyQWV3Mm0r?=
 =?utf-8?B?d3JWQVhQTHdmSkk3SUQ5SW1Za0dlSVJ4R1N2bFNvUGFUaWhacXVPbGFIMHNO?=
 =?utf-8?B?RTkxeVNFc0FidTVFMTAxRm5pcEZRSWUyQXBHK1VvWEgxaWoyTTMzRlBBdFBC?=
 =?utf-8?B?L0lma2dZSVk5WjVZMFU3R3VId1ppV2ZKMWpBV1lnVHl0Zkl6MG0vaVJ0QUQ3?=
 =?utf-8?B?Z1krMGNCUWhYWnNlWmFQV01kTTd6Qk9aeXVnQkFxeU56QVFzS21zVXYwc0gx?=
 =?utf-8?B?V0RNTE50dGhGbDBodHN2Y09oTUwvUkExSnZRSVpaeGx5OWZvMmwyM2tEQUx0?=
 =?utf-8?B?WGpMSENSMHp1eHdZVnVjRkpTdGdqN0hHVnZjd3hvQW9SOG9Scmg0YjByKzhX?=
 =?utf-8?B?djQxN0NTVS9iSzc1aUd6RjhvRWdZVUNKZnBvOVJ5OTdxbVB1QmJkcXM4L1Fz?=
 =?utf-8?B?V2Z5elVUY29FUHU0TGlwazdYSDF1Ukw5MGlzY3UxVEdYMEhOU05heUlyRUVO?=
 =?utf-8?B?cy9BYm9ZZTUwSGF0aFdISnZ3RnUxcDRMTE9xOTY3bjJpOFV0cE1sK00yRlQz?=
 =?utf-8?B?eEFndGUrLzBxUHRwMEdqUkVyVy8xRnNqRlB2M1ZCdnhRWUgvZmxXSjNlSnhM?=
 =?utf-8?B?emhxS3grcTRUOXRnLzJKTGNLM3FMczRwRG0xNFNWRHNyK1crZGo3TFN0bkc1?=
 =?utf-8?B?ZGt6N2VBWllndzQ4MGNHZDZuazQ3S3MzbTRPN2pIbHpBVExmVklXWW1BZDdy?=
 =?utf-8?B?dWY2Z0x5MkE5dmx0NTk0R2owbm1TV0JybUVFL2V6VXZ0c3NyN1ZMbGJodDlK?=
 =?utf-8?B?T2RkUkRyZjY3a2dwYWE1d0hsUTIyeXRwdUNERlR4NDRRUDVMOGYxTnhzalhO?=
 =?utf-8?Q?C113FCv84sxSWrTVCw7dSdecD6arry0EvgZJT+j?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 472f9574-2868-49da-c377-08d993ebf829
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 17:06:34.1479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: randy.macleod@windriver.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1435
X-Proofpoint-GUID: _UfkeuTAP2CP-CVxBPfObDoauWTmZsOS
X-Proofpoint-ORIG-GUID: CspOovG3gGEfJNs4ul_ViYkDLy-dsgf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_05,2021-10-20_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1011 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110200096
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:06:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93486

On 2021-10-19 11:09 a.m., Armin Kuster wrote:
> 
> 
> On 10/18/21 9:59 PM, Chen Qi wrote:
>> This upgrade revolves a bunch of CVEs. See more details in:
>> https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-q759-8j5v-q5jp.
> Seems reasonable to me.
> 
> -armin

I"m tempted to agree but I don't know enough about how ntfs-36 is
used. I think we need more information and a more detailed commit
log explaining why we think that the uprev is okay.

Qi,
Does it provide a library and header files that developers use?

Debian has a patch that we could make use of:
    https://security-tracker.debian.org/tracker/CVE-2021-35266

$ apt-get source ntfs-3g

$ fd security.patch

ntfs-3g-2017.3.23AR.3/debian/patches/aug2021-security.patch


$ diffstat `fd aug`

  include/ntfs-3g/attrib.h |    1

  include/ntfs-3g/index.h  |    4 +

  include/ntfs-3g/volume.h |    5 ++

  libntfs-3g/acls.c        |    4 +

  libntfs-3g/attrib.c      |  332 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------

  libntfs-3g/bootsect.c    |    8 +++

  libntfs-3g/compress.c    |   22 +++++++++-

  libntfs-3g/dir.c         |  109 
+++++++++++++++++++-------------------------------

  libntfs-3g/index.c       |  183 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------

  libntfs-3g/inode.c       |   24 ++++++-----

  libntfs-3g/lcnalloc.c    |   15 ++++--

  libntfs-3g/mft.c         |   70 +++++++++++++++++++++++++++++++-

  libntfs-3g/volume.c      |   81 ++++++++++++++++++++++++++++---------

  ntfsprogs/ntfscp.c       |    3 -

  ntfsprogs/ntfsfix.c      |   17 ++++++-

  src/lowntfs-3g.c         |  384 
+++++++++++++++++++++++++++++++++++++++++-----------------------------------------------------------------------------------------------------------------------------------------

  src/ntfs-3g.c            |   23 ++++++----

  17 files changed, 818 insertions(+), 467 deletions(-)


compared to the diff of the uprev:

$ git diff 2017.3.23..2021.8.22 | diffstat | tail -1

  69 files changed, 3220 insertions(+), 705 deletions(-)



../Randy

>>
>> These CVEs cannot be reolved one by one. Upgrading the package
>> is the only reasonable way.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   ...-ntfsprogs_2017.3.23.bb => ntfs-3g-ntfsprogs_2021.8.22.bb} | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2017.3.23.bb => ntfs-3g-ntfsprogs_2021.8.22.bb} (92%)
>>
>> diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
>> similarity index 92%
>> rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
>> rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
>> index 6f5cb6cee..19b2d6ca2 100644
>> --- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
>> +++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
>> @@ -10,8 +10,8 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
>>              file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
>>   "
>>   S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
>> -SRC_URI[md5sum] = "d97474ae1954f772c6d2fa386a6f462c"
>> -SRC_URI[sha256sum] = "3e5a021d7b761261836dcb305370af299793eedbded731df3d6943802e1262d5"
>> +SRC_URI[md5sum] = "90da343e78877d388eb34cefae6799ae"
>> +SRC_URI[sha256sum] = "55b883aa05d94b2ec746ef3966cb41e66bed6db99f22ddd41d1b8b94bb202efb"
>>   
>>   UPSTREAM_CHECK_URI = "https://www.tuxera.com/community/open-source-ntfs-3g/"
>>   UPSTREAM_CHECK_REGEX = "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.tgz"
>>
>>
>>
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93467): https://lists.openembedded.org/g/openembedded-devel/message/93467
> Mute This Topic: https://lists.openembedded.org/mt/86433129/3616765
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
# Randy MacLeod
# Wind River Linux


