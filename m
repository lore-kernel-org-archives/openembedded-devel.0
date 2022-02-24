Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3477C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 19:01:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.667.1645729238342843675
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 11:00:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=QZbPs4Gm;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=90546d8fae=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21OCCBDp023243
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 19:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : to : from : subject : mime-version; s=PPS06212021;
 bh=PrZOMtY8SmP2VLTji42a1Q7Ka0go99GMqz/n7hAa1qc=;
 b=QZbPs4GmrMEWo8DibU+6S2YfaMT5B6lAUClgfUkfvvFuBK5pNKvpoqeUEmex2nSzKA7d
 gCResI5aOduhQ3vy985PU7IQENFejsC8w8jyPevltnz1L/qlWFIvr4QpL5mot7pOdgoe
 nHuB/FM7j6DPipcEAtEdDOJI0qQSYt5TxSbDxS3dNWY1vA9qq5vsBZVfSy+jrUUq82ee
 ijtg/+71QHNKjL2SsjCzEbzBAB6/veaXvoXpU6YXUxC590LVXUwTTXYiITYd7u0r4AYb
 oE1Y3KU9GUoNHH2hF88cvVVn1p2BKIp9POVIWRAuv3722b6ARCq1lC1lFNqk/9fSlyAJ 9A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3edukjh0nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 19:00:36 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 21OIx7wi026670
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 19:00:36 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3edukjh0nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Feb 2022 19:00:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiH0+OAQA4iqEQIzzhCcluKGeyqO16towAvqvrq/COHQ1LdICnTUhczgClA6j7DcYJJp12cRAnKYJ8UFB6Vc4P29EHCuie0eJ8x1AdL/HPl2ZFxixXKkm+Q12b2y1cILuQZ4H/k/T23OcWlKoJz0Phg+MkVqd3CtwzFWyTs//t5DK8VdQ07HosmgqS8nbMU/eTU9NmbgkjtUf9Y9g8qJ0br3nM5zsWPVSVo6seOM4AXS5XyRYUqPRcHT7pAfV7DBf3UDlyjhWe2YIXSATMdzBcpjAvIQg8amq6fnr+TwIssT2DFFuQiN0GJZ8ROl4JhEj9wRk1ei0OxPl1CKMJA9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrZOMtY8SmP2VLTji42a1Q7Ka0go99GMqz/n7hAa1qc=;
 b=jHR8NyPD9eNghzqEtA6v9XogACwXBgmS9vWO5MYPGcFEPEkeYao46otyRPDbHixBZcz1HOiwOUhF8oNC+hdXoJflEln6Bc1kgUryAKpqjkSQDPbHQNO1MTtRl/KAHwXQ8Nj52RWWB75h1B8tmiGDrdekpSPCbl+mJe7ahwkjMGoM+amjrfbN6CcF9dvo6jnZILcWKLLcsh7DFoUP/3uas1z4f1E4Qx1OeC+/tPEv84Kz+MCLtFc2iTAd/nh2QKsRWpWIwiVGm1GSZNCIN3u3crc3d2chNrqCqyoWYyuA+fAkkauHCCtqVCh+jkBHrTZx1D2i3F9XgfndU83Q/oTBew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1628.namprd11.prod.outlook.com (2603:10b6:4:c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22; Thu, 24 Feb 2022 19:00:30 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::fca9:1fa9:6fdd:9dee]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::fca9:1fa9:6fdd:9dee%5]) with mapi id 15.20.4995.027; Thu, 24 Feb 2022
 19:00:30 +0000
Content-Type: multipart/alternative;
 boundary="------------m40jOuKrT0cbQa0SMLCZNwVG"
Message-ID: <66d48c03-abea-e9f2-3d98-3593a627778e@windriver.com>
Date: Thu, 24 Feb 2022 14:00:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-CA
To: Yocto discussion list <yocto@yoctoproject.org>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Subject: Please provide YP bugzilla comments when encountering bugs.
X-ClientProxiedBy: BYAPR01CA0037.prod.exchangelabs.com (2603:10b6:a03:94::14)
 To DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee00083c-00a4-4d0e-262f-08d9f7c7ed8e
X-MS-TrafficTypeDiagnostic: DM5PR11MB1628:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1628C6ECCA20D660FD7E5AF6F83D9@DM5PR11MB1628.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rc/9uRyNZ/xAzra/Raw7A6kD1a/0+wzpQ/ISuVAEPzvsFGIOMVGWLIL4YkVI6l/qBwMkI1XwFwKqc1o0XYGyxD4jYyXPRd3oFDrpvnPtzBkyNuzbYgqaHi+CIz3rkqJLJw0geXuxcUVAEqYYjZXa0xtgVV9CuaJ0doD0OV06dJBD132Gi1FLLdwxD12y9jcBwDiEnFkySB6L4PkZvdPHQBTTH56uifPMsThzOtVrU8+/MaSUZC4mKZng1rhR54yQbdfClZKY+Oass4We7UxmoS2BRk1lEKNFIm09nrnXXFrZvlHXGCdhOhgyDxhTwKLaLALJ+idjXr3NDTQisA3qTfQXE+Hddb78dVujFWMtojIb6wS4G6Vd72kRxJXJjMZsaK6FzJLK/EZe2YLMAzBYDeLLSCSwEoOMFA3yHGdb/TIuR6g63AQ1MiFyhcO983BlPjaDxfeYx+ZQgM08t7EsG0eDd+wq6nc6+q3pnIVB4U0DASEjPA8m+quQofBjrbktYCeCz7nLrfHETa63LV3YstDJWaN313M3gjub14O6NVhTU5rS9jApj3KzJXNvuVziKpHY/nE50ca4qo8Pc97LLA5Xuu6p0iD2epjLgzmoYXkG9L6LOqLx0Jd7zdA3kcM9n592p/KTGZsJWAv03hiPmhyS/uI17iYv2T6skGuy+267YFXKhLhNTNqTn+konftly58N9Ua1+BtKKuKUZydb7tZVLOxT0d2BdcVh6gdqw2FvydjPX2MFPxFtbWcMaE6C2TTiwWWHi5qeTXmzOmchDKHykH4jDVdCAnQIFSJ1ci8ptOEy+5pz3ksZ7c/6NNUjKga7wxAgbqSgj9jhbAUdG1cqEYORrUSEw6h/qoFpmifWcD17fl6qVKqkUaQ09EsJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(36756003)(26005)(186003)(38350700002)(38100700002)(83380400001)(31696002)(86362001)(2616005)(6512007)(316002)(6486002)(8676002)(2906002)(5660300002)(8936002)(66476007)(166002)(66946007)(66556008)(6666004)(508600001)(6506007)(110136005)(966005)(31686004)(33964004)(437434003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UXNiUXduNWVwcTJMdERqYmJUd0VnazExeXU4VmVvVXNVWXVQV0VzUXpZU0p2?=
 =?utf-8?B?VWVMdGwwZW5HQXRKTEY5SlhsVTZqcTZjTU9iQ3FTTDhSZnpmOUlpYkhzRFRk?=
 =?utf-8?B?bjQ4YXZOcFI0ekZzUWZHUUYxbFF0NWJXMEVzWmlhTWYrTGNiQWp0N002bE5V?=
 =?utf-8?B?bytKbUVha3F1NWw3Vm5WcGNBSTZSZFZxaVRWOEJlNlVWajNpYzNaRGNyUktG?=
 =?utf-8?B?bW5DYnc0L0JDN3RnRS9PTXFLVG1IQmlFSkhsUGtzM0dYVUtZZENHRzQwVGlR?=
 =?utf-8?B?SisrUmNKK1Q3L0ZheDlIbHFxSzRPMy9QN2xValBOV2JIaEh6QUlXMGFTM21S?=
 =?utf-8?B?eFBiTTkwbDByVytHMk44MVVVd2ZkUlJZQjlHYlVLVG45UmFtYjlWTnptOFBW?=
 =?utf-8?B?T05aTmdHNjBzTnFTUlZhTk5WR1VhbmRCbTBxOG5GbUxkWWRMQytSNFpmQjRU?=
 =?utf-8?B?Y1FIN3ZPUzJwbzYzcHh0MkFoVVNuVlgwNUt0elZNN09VMWNMYlVMN0Z2NGIr?=
 =?utf-8?B?QkRuV2E3VEJpZ2x1dEZzNUxnWFZ5L1FCdEoyRHBHRTVEbGp1NStrTHE5WC9r?=
 =?utf-8?B?UWJualRPN1hHU2hab01Da1VqKzg0WXlhd1hSaUcvUzVRaDBjb1NFcFRoK1FQ?=
 =?utf-8?B?ZTBHMEo5bEdVRGdLUG5GOFRwOUZFVFJiM3dDTml1ajVnNnJjSE9CaU9hdmdI?=
 =?utf-8?B?Q0QwZXNvbmRqbDYwQVZxbDV5L2NzOGpJSmR6NXYyOXlyMlZRSndzV3p3Z2pv?=
 =?utf-8?B?MVJLVlVUZDRJZHgxNExweXVWSy9sQi9RaTMwZWl5dE5IOUsydE9jUFhLK2dl?=
 =?utf-8?B?WDRWbVNNdGhabXBmMUF5TUdRSng5ZStoWWxhMjQzOVhiRzZCOEo5REdGa3Ry?=
 =?utf-8?B?WlJzNEV5cFZQRmF0ZDAxT0FnL0JYNDZtUVZWWjhJQUNmc3B3ZFM4YkljSm0x?=
 =?utf-8?B?d08xWjBMWGpQNmlrNVFZbFdxOXFwK0F4Y2NxWVRKYWphbGgvOVd4cDd2Sndy?=
 =?utf-8?B?M2NzVEN2V21wUnNEczlnQzVwcGtBK2JMUHpKMlhVKzRqRmRsc1p2aldWYkp4?=
 =?utf-8?B?VUlSMnh0VWtSWUhZSktzZmVXVWN1L01ra3IrQXQwTW00UWl6Yks1OE1ndGl2?=
 =?utf-8?B?RmxDdHhKaDdMVGhtZndLN0p0S1BlTTFmZ3NtbDNUa3A0MzVzV1FaRGh1QXZT?=
 =?utf-8?B?d055Y2lxMjQxdGNqekhmUm9GR2xhN3hyT0lnVHYwS0FZZ3BlNnRrRXhaa0tW?=
 =?utf-8?B?aHE4TXRrR1BzSng4OThMNlBqZHBtK1d4RFhhcm1PUUJUSE5FdXpQUW0vS3hI?=
 =?utf-8?B?MlVZSHVjVldpckduNE80OHc1b2ZIalR0TGl1VElMM0NBYkVSVXpqUEZBcDRZ?=
 =?utf-8?B?NnNzY3IxeVlEZlVicUJ2NnVuYkJTc2NIeEZZNGtWYUtCZTR4S092c0dxVU5W?=
 =?utf-8?B?TkJWMGM0MlQvUmNUWExOUjh2cWFRVFNNdFZPbyt0a3JESFpadU1pUjdjVW82?=
 =?utf-8?B?SHlLYThtZUtMLy8zUEg2d3lva2JxUkIzQ28zUHhrN2Q5S2k5YmcyR2c4TlBS?=
 =?utf-8?B?R2tzeStUU0NESSs5OTBwL2p4SzdXSGUxeHVLQ3F4cmRaUWY0SXAwbDZtS05h?=
 =?utf-8?B?Vld3S0JjZmE0RFhORGVlS3FPVFlQUHN3clFaelZRK1dIOTd2TzNqSFVWQlZ6?=
 =?utf-8?B?dDJQc1JtNmM2WmZvTGR3ZnR2VG1BV21qanpFVzJ2ZlZ6aXYwaVZ3bFBKSURk?=
 =?utf-8?B?WWlmRlk5cTE5U1hOd3hRcHhQUlpvd2o5dFVsSE05blZyNmljanFwdndjdy9Q?=
 =?utf-8?B?YS82Y2VzZWVjS1Bac2oyUFVuTHM2SnFLTE9SeU82OC82MnZMaTErdC82a0Ni?=
 =?utf-8?B?V3RHc2d6UG1TNFd0T0t5d241WlltbTdLRXdHYkNJcTRhVUpMeUIxL3A3RWln?=
 =?utf-8?B?MWJkQVo4bS90YVJQbExNSkdENHorYlJoYm44bEp6STdBckFQemhGWWo2TXRO?=
 =?utf-8?B?ZmJQbXdYUmR3T1REY1VtMWtSYjM1TmFzdWtJWlFoRlJVRTBKMUhBZWVBK05i?=
 =?utf-8?B?L0o5Smc4b0VXSDBzQVBhSTJDR0M2WkdWY1ZRTVFFdzhaaTZXWlJFU295S2dZ?=
 =?utf-8?B?ajFROENWQ3hyOTYxb0hid0VFTFFWaGtyZy9SQkIwSk5aSU5RUnorOWVEdzM5?=
 =?utf-8?B?NTBpWUs5NnVJcnp3VlpqSG9ybkpsU25UWU5WNE54SU5PTExEVHVCbkdLSWY4?=
 =?utf-8?Q?jJwmS6EK1o9uTNV5cMTQ5RTE78/oPTbMi4UOXLo8ug=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ee00083c-00a4-4d0e-262f-08d9f7c7ed8e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 19:00:30.6798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 v0HUxAHcW5YvzKWOPr6k0cKOeXAT/2AcW5e2YD5S6DkJYmlBgDvWAQXP3cd7OofHZHAleCI8tTW7MIpMdScsk7pNs6edf01YMXaQwkK2aEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1628
X-Proofpoint-GUID: 0TCoglFy00tkNOE_zeAkZ2fHf8H0C5Oh
X-Proofpoint-ORIG-GUID: wit1wCTZo3u-sc2MaDBoZQWDa6880yLD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-24_04,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=902 spamscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 19:01:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95511

--------------m40jOuKrT0cbQa0SMLCZNwVG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 21OCCBDp023243

Hello,

Summary:
=3D=3D=3D=3D=3D=3D

If you encounter a bug when using a Yocto layer, please check if it's=20
already reported
in the Yocto Bugzilla. If it's not, open an new bug. If it is, please=20
add a comment
stating that you are also affected and provide any additional relevant=20
details.

https://bugzilla.yoctoproject.org/

Details:
=3D=3D=3D=3D=3D

Some bugs are only happening occasionally even on the Yocto autobuilder s=
o
we'd like to encourage people to provide input so that people working on=20
the
bug or prioritizing bugs can make more informed decisions.

For example, this bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14726
 =C2=A0=C2=A0 AB-INT-NET: fetch failure in fetch.Fetch.test_git_mirrors

involves a fetch error for dbus-wait from:
https://downloads.yoctoproject.org/mirror/sources/git2_git.yoctoproject.o=
rg.dbus-wait.tar.gz

It was happening intermittently on the Yocto autobuilder workers but=20
we've heard that other
people who are building outside of the autobuilder are also getting=20
intermittent fetch errors.
That helps because it points at the http server rather than problems=20
with the internal autobuilder network.


Note that layers like meta-openembedded, meta-virtualization, etc do NOT=20
track bugs in
the YP Bugzilla so you'll have to report bugs for those layers to email=20
lists or as per the README.

Aside: Some bug tracking systems have a way to just click a button to=20
indicate that,
 =C2=A0 "This bug affects me too."
but unfortunately I don't see that in our version of Bugzilla.


In conclusion, more input would be appreciated.

Thanks!


--=20
# Randy MacLeod
# Wind River Linux

--------------m40jOuKrT0cbQa0SMLCZNwVG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
    <p>&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=14726">https://bugzilla.yoctoproject.org/show_bug.cgi?id=14726</a><span id="summary_alias_container"><span id="short_desc_nonedit_display"><br>
          &nbsp;&nbsp; AB-INT-NET: fetch failure in fetch.Fetch.test_git_mirrors</span></span></p>
    <p><span id="summary_alias_container"><span id="short_desc_nonedit_display">involves a fetch error for
          dbus-wait from:<br>
          &nbsp;&nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="https://downloads.yoctoproject.org/mirror/sources/git2_git.yoctoproject.org.dbus-wait.tar.gz">https://downloads.yoctoproject.org/mirror/sources/git2_git.yoctoproject.org.dbus-wait.tar.gz</a></span></span></p>
    <p><span id="summary_alias_container"><span id="short_desc_nonedit_display"> It was happening
          intermittently on the Yocto autobuilder workers but we've
          heard that other<br>
          people who are building outside of the autobuilder are also
          getting intermittent fetch errors.<br>
          That helps because it points at the http server rather than
          problems with the internal autobuilder network.</span></span></p>
    <p><span id="summary_alias_container"><span id="short_desc_nonedit_display"><br>
        </span></span></p>
    <p><span id="summary_alias_container"><span id="short_desc_nonedit_display">Note that layers like
          meta-openembedded, meta-virtualization, etc do NOT track bugs
          in<br>
          the YP Bugzilla so you'll have to report bugs for those layers
          to email lists or as per the README.</span></span></p>
    <p><span id="summary_alias_container"><span id="short_desc_nonedit_display">Aside: Some bug tracking
          systems have a way to just click a button to indicate that,</span></span><span id="summary_alias_container"><span id="short_desc_nonedit_display"><br>
          &nbsp; &quot;This bug affects me too.&quot; <br>
          but unfortunately I don't see that in our version of Bugzilla.</span></span></p>
    <p><span id="summary_alias_container"><span id="short_desc_nonedit_display"><br>
        </span></span></p>
    <p><span id="summary_alias_container"><span id="short_desc_nonedit_display"></span></span></p>
    <p><span id="summary_alias_container"><span id="short_desc_nonedit_display">In conclusion, more input
          would be appreciated.</span></span></p>
    <p><span id="summary_alias_container"><span id="short_desc_nonedit_display">Thanks!<br>
        </span></span></p>
    <br>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------m40jOuKrT0cbQa0SMLCZNwVG--

