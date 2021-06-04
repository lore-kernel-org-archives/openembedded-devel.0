Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6116.1622798765001586609
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KjttMQ8O;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17897079a3=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1549OOLC016573
	for <openembedded-devel@lists.openembedded.org>; Fri, 4 Jun 2021 02:26:04 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 38ya82g9my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jun 2021 02:26:04 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1549Q4ON020034
	for <openembedded-devel@lists.openembedded.org>; Fri, 4 Jun 2021 02:26:04 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 38ya82g9mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jun 2021 02:26:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f32bAJPzZZlvypUFYqyKy5cvgA8BadjO6tdC6J0TNn2hu4NfpFT3zlh9reWVZuV/nmcyXtCo1O1nd14gcLaOjUvajy4n+p9Cjz7Moykxpq8FeccdsbGgJV8NnOAgF6C4+1Huqq7rqbhB+KAP+vhD9ZpYd4pifJTuRGTWgoR8ewdMMfY4SQvC5lcTfXimCKxuOXaod8uNdvEbUyi4g/V9cPiYKxdJbtyXLOkUV8yTZqQktt0U6PINMfD0o8QvowDSLV+VcSameRroVrrRFMRFhjEofUlAziWiLoyeDEABZJy9td+gceouO95kFqfS1gdAWZwM1UWq+Nz4ISPFpSC8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiObVw2J5HTTh6QfETh3M7CIWvciNfDQVGuGjZSo6AI=;
 b=hX9+YyP1Q4MiNt0NFYhgvsqlojYLHv3i3t8j0450vOJ77MZv+KTnYCLi/pX9EuN271rd2hl0GDMVC8xo1S1FVmMrc3rh5davirNj2cqUKWbtQv3dvJ/WuN+2ihALPAt4MJES3NJ6vEt+bfxBVHhD6dWJvvFDgsrkquk06nHslP0Kg6vS7IzCN2ILGPeNN4ehdCC3G028neqHLU/tD/5W6UAbwR1iNR93FioVN8iD9ag87bivdmFjuGDhH0Edef/vsj2GOa1geKEhdsdAmJIms1IMm/vBSglOab2IYG2Cmz9dtzLN7fN7GTzToNHIGiZvYWjLQ6yX8Pt3CLnqY2rx4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiObVw2J5HTTh6QfETh3M7CIWvciNfDQVGuGjZSo6AI=;
 b=KjttMQ8OcQqUCM0Z9o21ryMrZQ8tBgpZkuBmFr6UxCM4VCHhSBywlD6D9vtmE0LkHl5/MLPabcwXICvMdXqtjjJ5UJqGqoRHmfZoihkl816D29qLL+grCjNDEjC+NcRnjxch11XZG4lPZLDwnho2jvNbcXMxPhnQLPG4Q2nno74=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1432.namprd11.prod.outlook.com (2603:10b6:910:5::22)
 by CY4PR11MB1880.namprd11.prod.outlook.com (2603:10b6:903:120::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 09:26:01 +0000
Received: from CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::7943:e41c:5fd7:a130]) by CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::7943:e41c:5fd7:a130%11]) with mapi id 15.20.4173.030; Fri, 4 Jun 2021
 09:26:01 +0000
Subject: Re: [oe] [PATCH] layers: set LAYERSERIES_COMPAT with honister
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20210604014438.33958-1-kai.kang@windriver.com>
 <CA+chaQf3SGiUJSg57umnwTQ8gMtAmrFLTSsTw=xeB2GYzaRSpQ@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <b47a52f7-6946-9be0-a22c-8526047215a5@windriver.com>
Date: Fri, 4 Jun 2021 17:25:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <CA+chaQf3SGiUJSg57umnwTQ8gMtAmrFLTSsTw=xeB2GYzaRSpQ@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To CY4PR11MB1432.namprd11.prod.outlook.com
 (2603:10b6:910:5::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.151] (60.247.85.82) by SJ0PR03CA0165.namprd03.prod.outlook.com (2603:10b6:a03:338::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23 via Frontend Transport; Fri, 4 Jun 2021 09:26:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa26c7c1-7f6d-45d7-4c42-08d9273ac4cc
X-MS-TrafficTypeDiagnostic: CY4PR11MB1880:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB188086BFAC152D0498EA4DAF953B9@CY4PR11MB1880.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sjOrb9SFrH4zKYYbFlBUERZYQAEAU+K/IBU5TJmpOthZk6BLQlZuZQyTFiVw9yCNXHx5FuvmzOTQHHKo/YB3L8DZM++Osn8Lx2zUKTQw1ZALBQu/62Lm9zK1hAt67F3JW6X3h1ooUeAAHmnnlVADK1xq8h7D+nQ6wEw0vyW+U9eqy8xQErSPF+rJQs3DuJ0XwhvUPZUNUQDlHRx1IgtETDldzfTBjidj2a3qrWnomWshBmjMm8kwusegsURvZ/nxMywfIa6O5JCwFmbeiOvjg2sW9/5GLiWcUe0jBaZazHHOAuGMCnAh/Y2hF/evINftAiEfWz9RbJ/D4zjQ3F2tGKdiDZUGwe9f4uwsIM+kMAbxgTM1IUndGKjmC37YhkJFe0KVoxlHJzTi/6GCfooAWKxHNE+D75eAWADY+4Jx30z1TodV2AFEHjJgM86gljm1vsF814jJUJzQ+YVoIzzljIO7HN+g90zOwEa6dms4XCtbZBGmDtqnb11IWTr6rB0uYslkCAfPc//OJQx8MZS9j8JyU+W7lWp3glB15Yhy7wcM2afFVY3yN8hQUjZCvTADbM6Ge3K5O7ZnfuyZCbGOpG98JK60Tfz/tNRJEcxkjpmuAIDgz170I+BoP5VTutBDL7I8ruXcem7tg4uDw8sqo/Mp6LPcqZkpxfTi8KNuetbhouY8uBSNJfjwHlv02765WUwv7eBTWd9TWXDkH4InFG1BAR4sUyyDWEd1EwtYrmpeIJQI8h/iqgUerzUvZ3pbD4x2hQ9eIIrRx/pcfvZCOD8cXiCFFUXf++lrQdLavSHRvGOIGYzwIYUrCtAq8noq4IIdSNgFsZk3W9/s8vKfCdDAc43nnQj+MwAhwXFpmv4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1432.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(366004)(39830400003)(31686004)(966005)(31696002)(86362001)(2616005)(33964004)(956004)(4326008)(8936002)(16526019)(186003)(8676002)(26005)(478600001)(53546011)(52116002)(6666004)(38100700002)(38350700002)(6486002)(5660300002)(6706004)(66946007)(316002)(66556008)(66476007)(83380400001)(6916009)(166002)(16576012)(36756003)(2906002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eC9RbEpvbkpuRXQzU0lWc1V1dTRSRXgyeDk2QWQ5Zy9lNG41R1VEbUVkN1Br?=
 =?utf-8?B?S3hDK2ZUbHc4bGUyRnd0dy9XcUtkcWNiaWNRaW1nbjM5eFQ1blllcEhqdmxz?=
 =?utf-8?B?REtSZkxodkxqSWxnVUNxTEZiOHZ1enA5UlUwa2pUb2RVNlpGdnl2M1k2dENF?=
 =?utf-8?B?MDJrMTBwd2wvT0hEUUlDZFdKOEg2UStDWVJxSWhqNWNFbTZBbmxncjNTSUdy?=
 =?utf-8?B?WC9yeVhpOFhNZzQ5ZG04T0xoSzcvMDVHZHp1c29JcFVFSjMzREY2K1d2dThr?=
 =?utf-8?B?QVlyM0dvVHBPcXdrUGlhV09HbDhWWGJ3QlNIcmJveTJnd2FNL3BvRXRLSHBP?=
 =?utf-8?B?aU4zNXFxNlBOekFvUlRZTm9KazVCU2Vkdnh6RW9FdmV2d1JTWDZVaGphQlZ2?=
 =?utf-8?B?UWJJTkRzeG5mNUQ5M3N5NGFNL1lKalFFeWNsNXNVVWZxQVhUQTNpNmxGM3hK?=
 =?utf-8?B?VjFVTXFtSFR3R1FlaVJYYmRxeFlFZ2xQajRsOWEvM25QeWZUVUViWCszaDZD?=
 =?utf-8?B?WGR2Smp0VGE0OVRrN1Fra0xDbUlZV1NqaGNNQ1VDWGd1UXRCUXlUKzJBckVr?=
 =?utf-8?B?QlBvM1VFd0Yvc3RFL2cvSEhCU0RSdFlHYUVLeTFOWVppTzA4Mlg3ZnFLR0po?=
 =?utf-8?B?Nis1WDArbU9YTm5STUhmWFVIQnBtM3BhWjJpSi9IMnlxUlJnREhnZVBCSFZQ?=
 =?utf-8?B?NkZrRjJkYVhLWVVYT05sVGZDR2xZQkxmZGpyZER1cEZOY2R5RjRpZ2RGTCtX?=
 =?utf-8?B?SGFkNXdWMXZqWHNGTW40TVVUUXc1YzdsM2RaUWx6b1dDN1UzWDRjamZJanJR?=
 =?utf-8?B?c0Qzd1N3MndmQTlMSUdtbktzaVJ3OG5FRlFKL3FSemlJR2N0S1Z2czFvUndz?=
 =?utf-8?B?ZWJWbFB3Q05QS2J0SWVyZkY1ZjZuYWJENkNEZ2xEY09HQjU5NUN3RHFOVkFY?=
 =?utf-8?B?Y05MOFQ1MzRjbUU2K2FXSXdoYzNwdStwekNhVU4xWHpFZmlFcXBuYmg3eDRV?=
 =?utf-8?B?RFBwTUxWUGhmNERUZC8xQ0ZVbGlHc1VxWGlvQll4d2Fxell4OE1YaWZnRVI2?=
 =?utf-8?B?WTBvdDgwcXNJanNjWWNIRG5aOG9ORHJMMXBNcU03V3lOeTY1TGI3RXkwRWgv?=
 =?utf-8?B?UnpWRGZqcTA0cW5OaGdIWEZOL3BpbE8zRWVLVHB3SVc3TTEwVDdQb3c5S05Z?=
 =?utf-8?B?TG9pM0R0TEpLWEtRYXlBR0JyVWJDdExRNEtpYzU0bWlicnh3RkQyNVluZU1n?=
 =?utf-8?B?eWt2cjlBZjJaSFJuUi9DRjlsN2diaWVqSHAvR1diT3pWeXlGZ0dEYThmMXNi?=
 =?utf-8?B?aFAwY3VyZHd3T2h1QUY4dVIxMy9HR0ZPSnMzanpRNXhwcmVleWRFSlVYY0Fi?=
 =?utf-8?B?RFFqM29wc2EvbzFqb3VJdTBWaWxuUUhuUmVtRmc1VTRINEorNGE0L3ZDYWdW?=
 =?utf-8?B?Z3h1L1ZMcStKVGlyck1tdDllQ3BEMjZkWWtrOTF4UXE3ZXd6Q3R1RUZTeWs4?=
 =?utf-8?B?TmVaOW94NjFVeTZBOCtGTys1bXVIbVE2QW04NWtUTFlVZks5SGpMUmN1QWVJ?=
 =?utf-8?B?U0FhNzdsUC9ONFRFcE5TbjhtM0VrK0RaOTdkNjlTaDRXMGlNOW1LbjliQXpB?=
 =?utf-8?B?QlVmVTNSMWYyWVByajFYN1NkR0dOWDhCV0Q2U2UwNGh3MU1MemFESy9LRGI1?=
 =?utf-8?B?Q0dVbzJNK2d0ZE5ONC9KYWhJdE94em90UmxkTzlrY3l3VTM4Tlp2UWRWQk1M?=
 =?utf-8?Q?buf4r+0m2hqtsPy8x8wl8V3OdgykF4aGC2R0FlI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa26c7c1-7f6d-45d7-4c42-08d9273ac4cc
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1432.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 09:26:01.4224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MdNIE5u8xKkgNHc0XYJO+KvgyhEXjqOMnqEUIUuaDztV1lBzdfQuyaJ3Fk/gqnmX6BV01T/uUzOCAmJIFGMng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1880
X-Proofpoint-ORIG-GUID: kil9IvUd8cv0XJ5cAniIyUeVFi5DdqDN
X-Proofpoint-GUID: Io0BFP3FemtZv87jOrmyj9fRS1r4GjfO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-04_05:2021-06-04,2021-06-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106040074
Content-Type: multipart/alternative;
 boundary="------------6A92C37C2CE5646A84309B44"
Content-Language: en-US

--------------6A92C37C2CE5646A84309B44
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 1549OOLC016573

On 6/4/21 4:52 PM, Martin Jansa wrote:
> On Fri, Jun 4, 2021 at 3:44 AM kai <kai.kang@windriver.com=20
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     Set LAYERSERIES_COMPAT with 'honister' which align with oe-core.
>
>
> I think it's bad practice to claim honister support this early in its=20
> development cycle. It won't happen with well-maintained layers like=20
> meta-oe, but if some less frequently updated layer sets the=20
> compatibility with honister now and then doesn't get necessary updates=20
> to stay compatible with honister in next 4 months, then whole purpose=20
> of LAYERSERIES_COMPAT will get broken just by claiming the=20
> compatibility too soon (without even knowing what final honister will=20
> contain).
>
> Changing it after release freeze in oe-core seems much better time to=20
> do it.
>
> The same does apply on the meta-qt5 PR you've sent today=20
> https://github.com/meta-qt5/meta-qt5/pull/416/commits=20
> <https://urldefense.com/v3/__https://github.com/meta-qt5/meta-qt5/pull/=
416/commits__;!!AjveYdw8EvQ!Kd76LvM-JcgNBu85RB8Bu2U6MF7jgfI31fh0o1hXL0VPV=
FMaEEBpol_tM3o5gwAD5A$>
>
> Cheers,

Got it. Thanks very much.

I've comment on the meta-qt5 PR that too long strings in=20
LAYERSERIES_COMPAT will cause layer index complains:

WARNING: YPCompatibleVersion.name: dunfell gatesgarth hardknott: length=20
28 exceeds maximum (25), truncating

So what is policy to keep old codenames in LAYERSERIES_COMPAT? Is=C2=A0 t=
hat=20
ok to keep latest 2(hardknott and honister), please?

Regards,

--=20
Kai Kang
Wind River Linux


--------------6A92C37C2CE5646A84309B44
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 6/4/21 4:52 PM, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CA+chaQf3SGiUJSg57umnwTQ8gMtAmrFLTSsTw=xeB2GYzaRSpQ@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr">On Fri, Jun 4, 2021 at 3:44 AM kai &lt;<a href="mailto:kai.kang@windriver.com" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">From: Kai Kang &lt;<a href="mailto:kai.kang@windriver.com" target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
            <br>
            Set LAYERSERIES_COMPAT with 'honister' which align with
            oe-core.<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>I think it's bad practice to claim honister support this
            early in its development cycle. It won't happen with
            well-maintained layers like meta-oe, but if some less
            frequently updated layer sets the compatibility with
            honister now and then doesn't get necessary updates to stay
            compatible with honister in next 4 months, then whole
            purpose of LAYERSERIES_COMPAT will get broken just by
            claiming the compatibility too soon (without even knowing
            what final honister will contain).</div>
          <div><br>
          </div>
          <div>Changing it after release freeze in oe-core seems much
            better time to do it.</div>
          <div><br>
          </div>
          <div>The same does apply on the meta-qt5 PR you've sent today&nbsp;<a href="https://urldefense.com/v3/__https://github.com/meta-qt5/meta-qt5/pull/416/commits__;!!AjveYdw8EvQ!Kd76LvM-JcgNBu85RB8Bu2U6MF7jgfI31fh0o1hXL0VPVFMaEEBpol_tM3o5gwAD5A$" moz-do-not-send="true">https://github.com/meta-qt5/meta-qt5/pull/416/commits</a></div>
          <div><br>
          </div>
          <div>Cheers,</div>
        </div>
      </div>
    </blockquote>
    <p>Got it. Thanks very much.</p>
    <p>I've comment on the meta-qt5 PR that too long strings in
      LAYERSERIES_COMPAT will cause layer index complains:</p>
    <p>WARNING: YPCompatibleVersion.name: dunfell gatesgarth hardknott:
      length 28 exceeds maximum (25), truncating</p>
    <p>So what is policy to keep old codenames in LAYERSERIES_COMPAT?
      Is&nbsp; that ok to keep latest 2(hardknott and honister), please?</p>
    <p>Regards,<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------6A92C37C2CE5646A84309B44--
