Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E2EC6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 15:11:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18407.1677769888015940614
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Mar 2023 07:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WuMs+ysx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24254468ab=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 322Cl35U019138
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Mar 2023 07:11:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=M+6Ind1jEZv1P5MDh0TgXSg594qmm3JrjEEto5Fsoeg=;
 b=WuMs+ysxOe4tU4MkDSXuaN9CPVgWRdh07+N+iLHGDPSdvwBxQmbCOfMvoVQCnGW4FSlL
 Mn5w6kqc0/NO7/rZ/h1ARo5EhEOLIW9JU7FDoDQJ1otGZOatLwL5CDlDRdYxeXUO/bAx
 WEixaeg4oJm3OViDRbWvI1jgYNkBe2143THAY3pTolkTYvRWfW91ZxzFWNjbl7A1eXU1
 TbK7Mvu8068Lm/92PfN9b50T514SznfEnApomjZA+O0563NlwMoh3MQ4uVRupNGmPFy9
 RM5cZepVMuZxRVwyd+oeMVwJD7gTbTJN1lCU6n1BEOM95NOkII6+Ys8Jy/gR8Re0VOKw 3g== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2043.outbound.protection.outlook.com [104.47.73.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nyjqrd94m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 07:11:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzyfEzRkYqf6W5QbSXu+BVlzkYPKKoBA3TFXejMURluDCvntl33FNHrq14i5WLF/mdomzWYEAzEYRq9wQu9VjleOhQE5WB3BSLS2xKnq9n2Bzz6/RCISDc36AO2u2mPRjiigkRRur1+S/8fYG1DwlZbgAEs6Nj1E+/ShhbQ/PopAm/cofpn0CqHYvow+Cx819b9hBTk/y9lbcozeBcWffLx21Xb+RLvYxYGJXs0mBfXJjhjL3aV3E3sJHlC3hi8LNmvwSs4QTS+DdY2cP1ebQYfSpv+GGcJPD7kcEyzYAR1MudevwU4ubjqroGHsENkGXEx9HGvQ47lDU1Ngvy4GnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+6Ind1jEZv1P5MDh0TgXSg594qmm3JrjEEto5Fsoeg=;
 b=PG1I8eGQZwOJlonbPwJy1noUZuYVlOT6rWesTi3faxpnAIIiuX5vIf8jhTmnuBfAAzd3kDumScJnS/yO5gB+9XpMj7SB+Ilwj/7/6HOfStID5DSIXEtmV+U8LekHqDBcDK8JGqQlF3boJcpMD6Zdpxi9qX5718VPF+ZZ8TiyxpDjbgDfUcRbCesoT0oEpfrkJ6keHO7PZBsFT+Sb4XnHW7rG6bRA9UZUR2CwIslEOG1+WjSJvDa43tAbK0QDji10+tK5tz3RSq5dF3BgTuryL3uOyvLWJxkiG5BiZ72fGuSyc5UWh9rdJV+e7KfJ7QxPdtxaQAOk2l7cBqtZbUbPRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH0PR11MB5077.namprd11.prod.outlook.com (2603:10b6:510:3b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.20; Thu, 2 Mar
 2023 15:11:22 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d%5]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 15:11:22 +0000
Content-Type: multipart/alternative;
 boundary="------------Et0uSmltdfQZuwRJuaiawEdH"
Message-ID: <72d5fee3-1972-628f-c025-2ea147a3bb3d@windriver.com>
Date: Thu, 2 Mar 2023 10:11:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe][meta-oe][PATCH 1/1] Nodejs: Upgrade to 18.12.1
Content-Language: en-CA
To: archana.polampalli@windriver.com,
        openembedded-devel@lists.openembedded.org
References: <20230124155239.1124008-1-archana.polampalli@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230124155239.1124008-1-archana.polampalli@windriver.com>
X-ClientProxiedBy: SJ0PR05CA0140.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::25) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH0PR11MB5077:EE_
X-MS-Office365-Filtering-Correlation-Id: 030bc9b0-2d73-4556-2d73-08db1b306249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	taul4u/5uidSLXdfLndBGhWgOgu6NfKJEbRqBZsQQFW7mrIdkH1VQt6amg+xDfV0PqvoVPSlkpFIyS1EbZHBNziK2+kaMzsUFhuqUxtCB+X2DAPSp8OeRSAUj/1eFqjdMfKQ0Hrho5KKGOH0ZjOSK9SjJrv2+t9x3pVebJOX06Gkd4Ro6LoC/1DUvqRkfcHui4b3XFV4BQxsXA6CQf94yRA7pLkxtdf+qkVKSJPpeeXWi78baElwv8x1kTmqDD3oQEwosO/b5ZRBkdWmeYizuOY5lswiqERrzNKtpn+JfcdooD7TAeJe2k98AW28MvuQYFtr2kLtl653eGyuQXjz4OUTwdrqv9CxIU2z8IiVrO7W25CGtnVd+OLY68WZp3F0CCIH7Y02P9swvbe7SRUyC6jeaRx1DvE0kWd65vIcuWBxTSjdeCEeoz0Ke5QNV03mb1vwvkBEFfA1Ka+i3tEHKwb+QJeL4rAWhm24SYYB3hU5q4AMi2iGYOBmVcKhvDYiW/TUwop3fodoiK1v8a7colhfnnveo3R6W4S5sdyGiSptBlvRzTm3pN/69PVmtm1+wu5q9ED9IRVBHHcjKSENSy64IeedwgDVCcEPbS3eFxSpVvuF/13AmBmRg/h9hpgI7rXKNXv3URjkwT6WVeAZBN0FMSMk3fxpuU7GAaaxws/gUzx1chQ7lFg0bDYcKyt5V/D2qVeQixpXAJAMVI7xazc8EFqEmtK7qw7CSv98UK4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(376002)(136003)(396003)(346002)(451199018)(31686004)(6666004)(36756003)(8936002)(5660300002)(478600001)(66556008)(31696002)(86362001)(38100700002)(186003)(2616005)(6506007)(6512007)(6486002)(26005)(33964004)(53546011)(66946007)(66476007)(8676002)(2906002)(41300700001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d1pON3pDdlFrZUZNdk9JSnRXWFhuYlNrWjlBdGxYaDlBTlhpeDgvQTJqL0Zt?=
 =?utf-8?B?c0lBRE4ya1NqUlJJK1NSVWZuMThJdUVJSnNRUXNqQmNsWlc4c1ppQlVQZWcz?=
 =?utf-8?B?d1FHc3RFU0ZyaHgvSk5oR0ZLN1FSZHdUbVcyempmaWpmSjNHMjVqTlFaZzhq?=
 =?utf-8?B?UE9iWkZYOEJnYXQxSVltbE1yY05kV3FlOVhXRU4wbjlubGxOQ2kyL09wN2tQ?=
 =?utf-8?B?WGpRTjJpL2dydmloMHN4RHNkQXJLZ253QS9rMk5LY2QzcERIT2JueFNDQTRE?=
 =?utf-8?B?YmF6d0h5ckVMWnl3RThESjQ0QVdXTW9DQ0l2VGdXbzZNRSs2VHlYSWJyNGNQ?=
 =?utf-8?B?V0FNSS84bkRBNWdTRHhRRjJqTTB4SjdxWW81dzFYYzB4Qi9jZHI1Yk9pcDQv?=
 =?utf-8?B?SDVSSFVTWm1iOTRzcWY3R1pXb0RBUlB0OC8yWUpUUnRQVmY0ZHJJdTQ2YTh2?=
 =?utf-8?B?Z3dqcVNDNllPQ3dGQzJESjFZaEluRG1aZG9KLyszdWNLcUtwUGVONlV5ODVL?=
 =?utf-8?B?NjhuY1ZuWnVLek9FUnQ2UGlVSklDTlIvWUI1OURTRm4vekx2ZisvTVI5Y29D?=
 =?utf-8?B?ZCtpUzYwR1ZjdmtueWdvTXNRV1FTZWNYV0xOTUtTVFRqSXgzQjZPTFhwNTRM?=
 =?utf-8?B?cUY5QjFhc1RZMk0wN0twZTRDTHQ4ZlBUbmhMQzFKRCtBQjI5QjIvRmdJMmZO?=
 =?utf-8?B?MXpvT09CUDc2MDl4RDlEakhXQXd0MlpkZXBJeGRVTmZ2WnJETVh5a2JsbVFT?=
 =?utf-8?B?c2srbjVTZ0l4cnRqbmFHaDRRRDJQb1dLUlpwVzZmRHdaQjg4YVMzam1jUFht?=
 =?utf-8?B?Ym9GcDZqanM4ODVVZzE5K2RxaEtlTGUrbGFCRFdnVnpZTjhJVlp1K2ZodVFs?=
 =?utf-8?B?c3dKYUtIeFhMYUZpcmhUSGpGa01TS0swMzNlLzl6bkxBU0JUdC9JTGNRN1lS?=
 =?utf-8?B?OW5taThQRnc4STZwMzFzNDBJc0FxYWpRQXJMbld5Sy9GTmRPcUNMYnJiN0xV?=
 =?utf-8?B?bUJJVDBZMUVNTzlrYWxmZVNnQWFISUR5ZU16elRuanZNandQdEFaMm1KOHA3?=
 =?utf-8?B?RWFhVjNnQ3pWclNObWg1VVBxeU9oL1pTSFFVaVN5cUNZekVqWEl0K2djdi9G?=
 =?utf-8?B?VHBCcTNQQXg1UHpWOHFnRys5ZmNTaHFLa0xVdDBGMU9XMmU3VTllL0gvdldN?=
 =?utf-8?B?ZURhZUt3N0VuMzFjZkV1WUFEWkFwUVZEa2VRT3ZXK01XTnJYQWg1Z0Z2ZzFH?=
 =?utf-8?B?MjFLNGd0UFB3cTgyNVhYWmJ4YU5LRDJsRUVtY1VRZk0zSUEzM0tNemRwUUpp?=
 =?utf-8?B?SUVtWDJyUVNqRkpJQlVrczdGYmhyTzBnY1k4NXQzZkN6OW1MUnJSdVFHZFBV?=
 =?utf-8?B?UnNONm1lV2wvenZjbW93bU5aYVBFcE04dGE0anBGck9GQ2tIZVU5a1RjdTVx?=
 =?utf-8?B?akRqMlJyZVVGMzJQM0ZDZzJkaGZkeE5WUzBsQUcvY0o5TFc1YWM2clNzUU9W?=
 =?utf-8?B?NDd3SGtTUUtMWWtLcnJZYUtIelZBSzA2TUtBQ1J4aVZuV0lhcmk1aFZpV1Nj?=
 =?utf-8?B?cDdESzZjTlFsRDZOV1dSelZlSUVLQXZQUGFMNnFiNVpFeW0xcitzeGoxTmQv?=
 =?utf-8?B?amNZWEJhb1hZWk0xMjl3MXlFdVVEUEZqTmhUZlNYSTNVWDZiRXZGT2FiZWNY?=
 =?utf-8?B?dkhNZ014VkpsQnNSWng4MmpoWDBKdTAxdlkrR0JabHNoOFFYUkQzOTU0SFNo?=
 =?utf-8?B?elU1bkF2L2JDYnNGOGUydjlmdDZEZnRrNmZvNlZEUXJwNWEyemliNHRNWUxP?=
 =?utf-8?B?NUpzZUErejNPQ0NMVWN4eDZkNjJBbFR1bVNsQXI0bXQzdzBoSjI1WXI0bEI1?=
 =?utf-8?B?ZGNrNkhtYVRFK0hlMnRDYnJvU0dhY1lZcUdoVXdrdjlPdjh0UWN0MWFxMDA1?=
 =?utf-8?B?alhCWTFLUUhxV1EybmJLcmc2VWo4aHcyWWVPQ2tZNHc5QXcvSUlGN25Ma0xa?=
 =?utf-8?B?MGNyS213bWY4UWpRMVRKTHpjSUd0c01pWU5YK2FIL0YwcEllZUt2aWpxTHUx?=
 =?utf-8?B?ZkNaRU5qdk5jWUVMS0c4MHlpT3hERGdVb3JkMTZZMDBGTkhpZVlyeHo2elFL?=
 =?utf-8?B?aVBHYzE4bGVIWUZwSWJwVkpWYTAzSkpkb2MwRHA1TzQ3MWJoVEhPVmZIYzBz?=
 =?utf-8?Q?yImg5sl84Z528tYM2Dsav2Q=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 030bc9b0-2d73-4556-2d73-08db1b306249
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 15:11:22.5962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2gl3fHfIwewVAHupf6c3Nmt8C4p9keRYGozVc/3prARv+igHUt9A+Zw9mKVWaiqZtI/sRTEFQqPaAx2zo6StdT2JjXj9F90HY54HwmIp0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5077
X-Proofpoint-GUID: w7f2VWzyoglSUnxJoctyct5LYaO15yTV
X-Proofpoint-ORIG-GUID: w7f2VWzyoglSUnxJoctyct5LYaO15yTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_08,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 mlxlogscore=917 mlxscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303020131
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 15:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101334

--------------Et0uSmltdfQZuwRJuaiawEdH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-01-24 10:52, Polampalli, Archana via lists.openembedded.org wrote:
> * Add initial ptest support using ctest only, it covered 20% of the nodejs tests.
>    There are some more tests exist to add but will require additional work.

Archana,

Can you fill people in on where we are with extending the ptest coverage?

I'm asking you to do this on the list because we've talked about it 
privately but decided
that it isn't a short or even a medium-term priority for us.

We'd like to get the other ~80% working but it may be several months 
before we get
back to this work. If anyone else is interested, please jump in!


 From what I remember, at a high level, we need to add a few npm packages
and building some test data files into the -ptest part of nodejs. If you 
can provide
some but not exhaustive details, then maybe someone will pick up where 
we left off.
Please provide any work-in-progress recipes changes also as a starting 
point for others.


-- 
# Randy MacLeod
# Wind River Linux

--------------Et0uSmltdfQZuwRJuaiawEdH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-01-24 10:52, Polampalli,
      Archana via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230124155239.1124008-1-archana.polampalli@windriver.com">
      <pre class="moz-quote-pre" wrap="">* Add initial ptest support using ctest only, it covered 20% of the nodejs tests.
  There are some more tests exist to add but will require additional work.</pre>
    </blockquote>
    <p>Archana,</p>
    <p>Can you fill people in on where we are with extending the ptest
      coverage?</p>
    <p>I'm asking you to do this on the list because we've talked about
      it privately but decided<br>
      that it isn't a short or even a medium-term priority for us.<br>
    </p>
    <p>We'd like to get the other ~80% working but it may be several
      months before we get<br>
      back to this work. If anyone else is interested, please jump in!</p>
    <p><br>
    </p>
    <p>From what I remember, at a high level, we need to add a few npm
      packages<br>
      and building some test data files into the -ptest part of nodejs.
      If you can provide<br>
      some but not exhaustive details, then maybe someone will pick up
      where we left off.<br>
      Please provide any work-in-progress recipes changes also as a
      starting point for others.<br>
    </p>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Et0uSmltdfQZuwRJuaiawEdH--

