Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.7625.1626447675904498741
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 08:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BaM2iDHY;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=28316a5228=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16GExH8G024476
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 15:01:15 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2046.outbound.protection.outlook.com [104.47.74.46])
	by mx0a-0064b401.pphosted.com with ESMTP id 39tw218jn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 15:01:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APQ+J5sqObYhNIgEzAuh6l8THUnpGU24WfX4182heo6575GldEiUWXjV/Af1oJh8PoGmnNReMHpEUBCp/wk5oZALV7VWSwwojv0ZmvEm4+oc6kuDWKhg9waKW3593CvDkOkeEolcgEeHLVb2WAzD5ClnLp1mFk7bURqqHUklKlxiEkq1vMHane7NyNCxRKJK+MRDgWWPivO8aox5en7O/aDW7DSdQmWyfprre+7mX7IDIehZkb6SQ9gyiBeMxVB4bxlS/GMq+6zgCcLyxhn14wW6iuZXuAOFDlyfAn2Y9l36TKQ7FndYvWj6FyKgQ/ORbIVwg2nzW6XH6J71P+yTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tegDn6NXk4s6oKS8hJ9ER1K7YdSeJGzcFenVIHgltFQ=;
 b=IMQXhaEBEr4eU6o15eSFe1e3PqbJn58dA3uEyaw/KF4MkJAuK1j1QL+FNHrGPjlTjZJaGNFXnpcTQeH+gmkr0wfudcVwG90j3CQD9IHRgE3zZYoSW9srxb159N1Ix7u2ReHFh36MyKs8suB5RVLPgoT5RYffdPjzWhEP8mSM1Xqi6H9tt8FNttPJKJZZiit5r3tU4fWAVxiPok+BSMZr19Ahbf4Dzzf0yeY/9H4fCFn1zbDh306LxXFx2BJiHQrHbauR8vvUvRMVPcAY0L4o6SVfXOHc8ffKwWPnAiRe0KV9oG8Xwqeg4LQUGEdzKqxJYGKvLxve37btLVZUPJELxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tegDn6NXk4s6oKS8hJ9ER1K7YdSeJGzcFenVIHgltFQ=;
 b=BaM2iDHYAtrNeeSinAunVo17idjo/8WjMjoL1K1H2e41hwVNOF2ZycjvVejWLQGc8w4fxOZd1eKuOvXY0lyb/hnwq+6K+F2Xcdnda6S6FsACDQnO7M+v38B0R4yHzlzu84+1o1ViBYcnELAGFqvG7UJ23lf2Jre0QLUfG8a2Wmk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 15:01:12 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e%4]) with mapi id 15.20.4331.027; Fri, 16 Jul 2021
 15:01:11 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-django: upgrade 3.2.4 -> 3.2.5
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <169248728C0986FB.4491@lists.openembedded.org>
Message-ID: <c7f0a759-5ef3-d2d2-ac5a-fdac2a9e43fe@windriver.com>
Date: Fri, 16 Jul 2021 11:01:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <169248728C0986FB.4491@lists.openembedded.org>
X-ClientProxiedBy: BN9PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:408:fc::6) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:c29d:d7c0::f245] (2607:fea8:c29d:d7c0::f245) by BN9PR03CA0061.namprd03.prod.outlook.com (2603:10b6:408:fc::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23 via Frontend Transport; Fri, 16 Jul 2021 15:01:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae642e39-9464-4a07-7de3-08d9486a8cc5
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5184:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5184E2EBBC4B1A17257C49E99F119@SJ0PR11MB5184.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b8J+a026r12J8HItKLXl2dAvMwCj6huSm8CJw+mlTH6k8e+4LFdQcDfWoip/2vzfIUeHdxFjltAqzCUD759AtjrSNZQ1dq/q94YQprPluCo0ZtApG7PFS9Yia8nciuQQU846UxqbKxhv1FBz1DJRjdu7/2Z5l9t/RlqHMWXbG2/cAk411NfEHnXq8L9EqnP6Cy+OQ08ZLEQLPaZtL4hP8WtHW7kbkHe9tmbcd+ZsGz4EofIwGI3fijUYXW7XcvqG9LtdvymlF/9I8jRAQstzZZD/0w/Cb2XUbF/A3z7pK6Ho/1C2CzmPsXDuwt+Fz3n4GTHgzzpl+RFJ0RBKf/UOHqiW5Ce3dgB2jefTHgQJAR4jZBrPr5RZraK0jAUyLIsL5bbstlqhNn5E49N4Zzw4dLUJW/iUfQWvEsPU8e5y2rMu0NjO25fdqGTherlnxzt4A3jzDobUWKNTo049LkDXhnbURmBOM3IKqH0CyGpdTTxq4DyI5YQRWFPc0VaAAT1sBRGvFXywb9xCLFrJ4WrYG7qF4eUd/WNjkeAJcJFDDPBFT0V1cs7XNFD75hm/m4vx5GZpaz8J+EiZ4ZPQF85BWCnc6L0QgOu55oEhb6W5dkPpL6aadehwdtNGhO/2GOEQ0xM2a/ILRSjIS2Kcb/HIAvIlCnzOYOW/ymWnPJaKOhIt0NDkDv8R0SqQM4Woq8WE+1bxx/Xg9YQmqosBAIGS4pArUDpyAjUzMD+/ZE4di7nSzC89wKWaZWyAbKX2sz1e3anAS7RnLW+38o6tjFmQGSJxFquJO3U6s1Ie1VazPSYwb/tu2ferBH59jor6z6KjdBpTWOSQq/nCdB5XwFpPISPiIzjWXWEYnr6eajvSLQY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(366004)(136003)(346002)(36756003)(38100700002)(66476007)(33964004)(966005)(6486002)(66556008)(2906002)(6916009)(8676002)(44832011)(166002)(8936002)(31696002)(186003)(478600001)(6666004)(316002)(5660300002)(86362001)(66946007)(2616005)(31686004)(83380400001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M3A0VWFpMTdaYUZNSUlmL0hNR1RDYjJXd1ZxNGxmdXlLNlZkVmNnQ0Uvbkw5?=
 =?utf-8?B?Um5yZk1tYUVCdFovUHBtR3E0WEFQdDZzVkpUK242YWFLTmpBTGFBdFAxSlZT?=
 =?utf-8?B?N3BwamRGZVdqd05QWFBkVXlPUk43RHVQQU4vRlljNnZmSFI2OFp1VVFSTFMw?=
 =?utf-8?B?MVp5WlpvUzVZNWQ5czY5NUxnNThlNlhOc0dhdjRRQnVBU1NCV0dCYnJwUEtM?=
 =?utf-8?B?OEIxdklMOWRPblltTGdYSU5XcFBnckQ1RjZ2eWppZ3FjMUNrcEJXZFVza0JO?=
 =?utf-8?B?bVJLeVhmQm5GVmZpUkt0SjdTcXBHcFU2cGhYcXhQMWRHZEJjNjdKV2hwUVo5?=
 =?utf-8?B?aFMrdHJNQjhONkpsUHFCTm0veGdQWFh5RGljWWszQXV0d0s1UDY3MHdCNksv?=
 =?utf-8?B?VzdNQ3U2VEJVcGp5dGxaOE9EL29sTFJFZkVuVlNrRGc3NDl6Nm54NE0wdXBx?=
 =?utf-8?B?MnN4NWlDRTNNN3RtamEvZVc0aW1wam13bW9rbmZHcDNTTHJ4bEwrR1d6amZz?=
 =?utf-8?B?b2pkZlJuUFVzUWhLd2xnR3B2MTVuV1k0TzFkUFQrZEZCamY5NVFqMWJYbkN4?=
 =?utf-8?B?a3duK0hacUUyUmlpd2dtcTBmaXdUa2t4YmtUMlN6TVgxTXR3VHpqOXlVcnhs?=
 =?utf-8?B?ditmSjR3TXAzcHMrNVUxNjVnZmE3dno1eEJ2Y0xLUnBGWkNCTGhYbDJmUG9O?=
 =?utf-8?B?MVByT1ZqZ2NvNUwzeWdEeXFSV1RrNDI2VnFWL1N0MFVIOEduNUxWcE9IMDFM?=
 =?utf-8?B?aHhmY1JMNkVTQ0thTEsyNGNLeVVPbjN0R2Q0VEREOGxTZHFYRmlsV2ZIbHUr?=
 =?utf-8?B?bFkzTkwveVo5VFpsdWI1ellxT2xoZXVTVHVtaDB3TUhOVEZ4M0N4eXVVSFVp?=
 =?utf-8?B?eVc4MEt4VkhhTWZlb3Z0ZUJMc3FjSFNhQzNoTENKNjRYTUoySDhiRng1bVZU?=
 =?utf-8?B?d2VSY0ZwcFRpWFUzYmZ6ZHZMeVFOazRRU2M2VVR5SFhlUVpUQnZ2c0Uyd3Nq?=
 =?utf-8?B?YnN0QkloYjhXdFNRWDUyTzFDM1ZGa056LzRXeFowakdJRWxuOURYRWtiL05k?=
 =?utf-8?B?WDQ2WlZsdW1BQnhncThMYnRhYUQ4MHlCWlhZTml1dklNdVBkT2xwZDBoNUM3?=
 =?utf-8?B?bWMrWFlhNllEVEZIS3ZRT3pRT2FDdk12WGJWOWZESDVlOExiQjVwRGx6c0Vq?=
 =?utf-8?B?SzNscURJeXVVY0VPNHlCTG1vU01EOXNhOHc0U3ZIbG1lZnVUQkI2NzFxS2xK?=
 =?utf-8?B?V1lnVCtmajJGaVNGWk9wQ1RzRUt3V0lxYTBvQXZMSnBCaGNDVTlNOGY4SjFw?=
 =?utf-8?B?TE1yR21ldXNadEpVTzFBSTlsZWVXb3JVcjR6eGtoYVBkeTI4RmF5SjQ5N1hZ?=
 =?utf-8?B?WkJkZWJ5OVh0bW8wUVprbDhQUGRYWlZQak41b084bEJCbEhlVjY4cXBqeU12?=
 =?utf-8?B?aFh0M2ZqdXNlcVRXYndhTFQrWWNoV09oT29uWWNzcVE3S0N1blVZUkFJR3FT?=
 =?utf-8?B?TnlsSkx5YXBqUTdjUnFlL2I5VW5MRVMzN2srV01hMzZ3U3ZQY3NzWXJxMXpt?=
 =?utf-8?B?S0NaYjdIS1RLMW9JWUV3M1dUMC9xdXNhWE5XK3kvY3pjTUNORXJReWRIb1Va?=
 =?utf-8?B?bjdVRkNVTDBsaDMwbVNtUy9pTzkwYUVSUkJyYVZ4NTI4aXFXRytVcFRpZmJX?=
 =?utf-8?B?dXhJZWJwTlZ6YjhETU9RQ1g0ZG1La004cjgweVRBdmk2dUlGbmgyeldaVUhk?=
 =?utf-8?B?eXZNWGpXbmMxQUtjWEZSMGkza0p4OEM1eWxpeFlKaUlHRnViS0NQTTFUV2Yx?=
 =?utf-8?Q?AatffALHKrchyf6J9CU/tihSlfICS6ntgTQUc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae642e39-9464-4a07-7de3-08d9486a8cc5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 15:01:11.7560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02TCUbgEEy+aYYEu2gp36/udtqdlirsD4AlYPt4WwCd8oieNSeZZpInguASgpIrP9PtX0qGaQoa7Il7m+OHjoEpAy1oL7s1Tf5xqDiAQ/Ks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
X-Proofpoint-GUID: nhlluOS8KbEpPdxwBsH5VPCI0aNt1pmo
X-Proofpoint-ORIG-GUID: nhlluOS8KbEpPdxwBsH5VPCI0aNt1pmo
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_05:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107160092
Content-Type: multipart/alternative;
 boundary="------------73121FC30D7C6F0D34AA0ABB"
Content-Language: en-US

--------------73121FC30D7C6F0D34AA0ABB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 16GExH8G024476


On 2021-07-16 9:27 a.m., Trevor Gamblin wrote:
> 3.2.5 fixes CVE-2021-35042: Potential SQL injection via unsanitized
> QuerySet.order_by() input.
>
> Additional release notes:
>
> - Fixed a regression in Django 3.2 that caused a crash of
>    QuerySet.values_list(=E2=80=A6, named=3DTrue) after prefetch_related(=
) (#32812).
> - Fixed a bug in Django 3.2 that caused a migration crash on MySQL 8.0.1=
3+
>    when altering BinaryField, JSONField, or TextField to non-nullable
>    (#32503).
> - Fixed a regression in Django 3.2 that caused a migration crash on MySQ=
L
>    8.0.13+ when adding nullable BinaryField, JSONField, or TextField wit=
h a
>    default value (#32832).
> - Fixed a bug in Django 3.2 where a system check would crash on a model
>    with an invalid app_label (#32863).
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Resent this by mistake. It can be ignored, but the other two patches in=20
its series should still be taken.
> ---
>   .../python/{python3-django_3.2.4.bb =3D> python3-django_3.2.5.bb} | 2 =
+-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-django_3.2.4.bb =
=3D> python3-django_3.2.5.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.4.bb=
 b/meta-python/recipes-devtools/python/python3-django_3.2.5.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-django_3.2.4.bb
> rename to meta-python/recipes-devtools/python/python3-django_3.2.5.bb
> index 52504885e..5890c8541 100644
> --- a/meta-python/recipes-devtools/python/python3-django_3.2.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_3.2.5.bb
> @@ -1,7 +1,7 @@
>   require python-django.inc
>   inherit setuptools3
>  =20
> -SRC_URI[sha256sum] =3D "66c9d8db8cc6fe938a28b7887c1596e42d522e276185625=
17cc8929eb7e7f296"
> +SRC_URI[sha256sum] =3D "3da05fea54fdec2315b54a563d5b59f3b4e2b1e69c3a584=
1dda35019c01855cd"
>  =20
>   RDEPENDS_${PN} +=3D "\
>       ${PYTHON_PN}-sqlparse \
>
>=20
>

--------------73121FC30D7C6F0D34AA0ABB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 16GExH8G024476

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2021-07-16 9:27 a.m., Trevor Gamblin
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:169248728C0986FB.4491@lists.open=
embedded.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">3.2.5 fixes CVE-2021-35042: P=
otential SQL injection via unsanitized
QuerySet.order_by() input.

Additional release notes:

- Fixed a regression in Django 3.2 that caused a crash of
  QuerySet.values_list(=E2=80=A6, named=3DTrue) after prefetch_related() (=
#32812).
- Fixed a bug in Django 3.2 that caused a migration crash on MySQL 8.0.13+
  when altering BinaryField, JSONField, or TextField to non-nullable
  (#32503).
- Fixed a regression in Django 3.2 that caused a migration crash on MySQL
  8.0.13+ when adding nullable BinaryField, JSONField, or TextField with a
  default value (#32832).
- Fixed a bug in Django 3.2 where a system check would crash on a model
  with an invalid app_label (#32863).

Signed-off-by: Trevor Gamblin <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a=
></pre>
    </blockquote>
    Resent this by mistake. It can be ignored, but the other two patches
    in its series should still be taken.<br>
    <blockquote type=3D"cite" cite=3D"mid:169248728C0986FB.4491@lists.open=
embedded.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
---
 .../python/{python3-django_3.2.4.bb =3D&gt; python3-django_3.2.5.bb} | 2 =
+-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.4.bb =3D&g=
t; python3-django_3.2.5.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.4.bb b=
/meta-python/recipes-devtools/python/python3-django_3.2.5.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_3.2.4.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.5.bb
index 52504885e..5890c8541 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.5.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
=20
-SRC_URI[sha256sum] =3D &quot;66c9d8db8cc6fe938a28b7887c1596e42d522e276185=
62517cc8929eb7e7f296&quot;
+SRC_URI[sha256sum] =3D &quot;3da05fea54fdec2315b54a563d5b59f3b4e2b1e69c3a=
5841dda35019c01855cd&quot;
=20
 RDEPENDS_${PN} +=3D &quot;\
     ${PYTHON_PN}-sqlparse \
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
    </blockquote>
  </body>
</html>

--------------73121FC30D7C6F0D34AA0ABB--
