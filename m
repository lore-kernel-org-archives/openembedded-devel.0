Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC77C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 05:59:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.4301.1665640740962479559
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Oct 2022 22:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TRbfQ5yu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7285aaf693=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29D5TDkA008628
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 05:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=3NmuxddXtSrn9QLfO2qHqTmpFmPa6dR648PeqmJNNf4=;
 b=TRbfQ5yuKmn5cxzwIrSOKp0Qc2qo/wm5kYaKnTvl7BiR+aj61ZBZ8d412A89Otx4hGFq
 OH756Y9H72PQ4At/ht6zEnBBDS9vCV6cVPS2c/FYmJD0cVQrGFaNmg/+yV/gDs7TzDbQ
 d3KUiEIeoqOEtBFbVskzz7SFJWYwU2SeUI3IrOXfAPXCdp91TJELr7pbkbrOyozgJ504
 JlBCGGmnnRxA0qn1cL4iIztSrNb29erl18QLDIOJezX204ScJ8JvtE1xV8BUHflvN5S1
 QtqEep6HiUVQTe3qmi1C/lRbPk9OcG96B3NtmEIA9/vVTW4UEM2XBJAxmPG4PIWZ5ndj Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k2ybs3wkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 05:58:59 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29D5wxNR031914
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 05:58:59 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k2ybs3wkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 05:58:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImjKDTa+kdBHEZ7KiLI2EDR/0NJB1EY+JrSQnS8UrqeFL6maJyz33rW9f7lWlkYopQ6emkz8w+DjlSxfXQUQ3AiOuArU+uDroDgSwn9cNDhDEBCxAm3Tk9Y0TlEup3jkE8anxVpBqwiO0//aMyW+qFh2yffbOzgisfTBN7aYopbIE5Z2xo0TS7Y06iNyOH6G08mky58P+8MrGXyXItQdF0740HCtsmXzctk2jsVt7qLPQjWk9VslWDQxxey2YxMvcQsX/tONv0/OTtYrW3kx7CD4VuHSCXuHIKx8ZdYUMIzIQVB2BIDxoTePs21TZx8EDqKKU7xgk26wxsS4BnteAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NmuxddXtSrn9QLfO2qHqTmpFmPa6dR648PeqmJNNf4=;
 b=OFeiaiviXKP5ndZkg5Dyb8xcXRXrc/BqTDraOxcZR0ZrjiK7/sCnnsDtGLGiA9BajlDyOO1g/U1zdCQRG0JpczwGKhIyVvAnD94PLW0kDBnnqEaxcVvFOsCA+3NeHckl2bpjnYIXKG4Q/lx9ON69S4gW/idbSb6vzjiFxP2q4+MZZhNCAk3A7aA+eN7MaqslESU4X3jzcNehgmU0q6eOWI8WduT0haAHoeoMUaBk1Llaf9iu6XKjEHeiRD7Dzh62XBlOguuKAQgzvgP+PAE+tJZ4V0lWiTfEUxRLNqigCzgn1LdtP5bJfWFmxHnGjQO83o5jofMl7As/1Ydnhm9y5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by MW4PR11MB6787.namprd11.prod.outlook.com (2603:10b6:303:209::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 05:58:55 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::9d20:1c29:a0:d61c]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::9d20:1c29:a0:d61c%5]) with mapi id 15.20.5676.032; Thu, 13 Oct 2022
 05:58:54 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] Security Advisory - yasm - CVE-2021-33461
Thread-Topic: [oe] Security Advisory - yasm - CVE-2021-33461
Thread-Index: AQHY3l0F48+iUohY1E6KPYZcZIXOS64LV66AgAB8s+w=
Date: Thu, 13 Oct 2022 05:58:54 +0000
Message-ID: 
 <MW4PR11MB5822CE51AA941EF0BE37115284259@MW4PR11MB5822.namprd11.prod.outlook.com>
References: 
 <MW4PR11MB582294CA64F65F30BD08496984229@MW4PR11MB5822.namprd11.prod.outlook.com>
 <CAMKF1srMzGA-y8+6mdV1gtYWfsJYvafhKkwvUu_HN-M=NwBfAA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srMzGA-y8+6mdV1gtYWfsJYvafhKkwvUu_HN-M=NwBfAA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|MW4PR11MB6787:EE_
x-ms-office365-filtering-correlation-id: 1dd2ab4e-2936-4780-734c-08daace002e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 t1uG/VapSwLdhi8+dGn/+lCD3m1Qw23Hgp59Ua0YkfDCrNw+UsEVWdN43gTpWrVQj2AxmLtPKIA6+TPuWkXuMfdnfaNNCWjxscpfYrEEZKctDnRyNgM+uM7xrabbnyp4jtL5OnEI3ipw0rA6aZfooN9M0gqpNUyuqOi1zQFVVmncuw6OGl6o3cEP9U3yoIamcwQJGED5X0sSGn669gLXz2fqOXiwK2CNuPwiZbJ/cJlhpjNi5wL6iV1puVmU97TbHh/GGt/iIp9+BfCHBZEqRMQ1a2zeD8HomUShdqEX69iS1vT7QMH9pUy1GTsV3kFwUtPuwgphNpsYbWCegPksdWqH5v4V7tVQwsq3KaF+6xS8ptphdW/dpPKezva7RoPV8FzrGW24mb73USbzf5TlzjRuwFf4kT9K9p6Z175Wv5qK099r3ElC3e4SJ3AbPFJSOvYdri6WGwzCVwGuU2R2XbNVwAP8+aNl4j9puQMI/TyQvh/3HdGwBp9GQ4lN2AHPdUJQlv8ti7XiFMgS8O8tieXaCqSeFeYcNlkd9VnTIJD000pCcnaD75jLCilfsRjFtqE05MkGWBedTHxh7nZnQbQ+FEqJzMSB+O8cKHBz1vYjOtMwpXxJRleB6pMwHI3Sevr6xGQZvHmZFBNuHmyh4LvyvN3aqmZ/LcP7fvzgh8l+PQecSImdS9vvxoPi8BHkXkten4mF+gB2YSqErGU1BJB+gJDwcXM1G1JdHvRoC8xsAkqLPMEwB+qIjn8yDLWQKypw7kFmicUbKfTguiIt+bCZUULsPS7bh4AtahsflwmG3YG0wfcRQThKjO0TXJxZFH0n0i42ygFF1/hHW+NLWA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(376002)(136003)(396003)(366004)(451199015)(66446008)(66946007)(76116006)(66476007)(66556008)(91956017)(38100700002)(64756008)(4326008)(8676002)(122000001)(186003)(2906002)(15650500001)(83380400001)(86362001)(7696005)(26005)(41300700001)(53546011)(55016003)(6506007)(5660300002)(52536014)(9686003)(33656002)(8936002)(966005)(38070700005)(19627405001)(66899015)(71200400001)(6916009)(166002)(316002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GBy3cqO5VheCpzsT+eItoakHh48ciErkQQ/MAD3uqYOYWc96STKnWxVygR33?=
 =?us-ascii?Q?gyTHalyrC+hB6TFtVJDW6rPm7B42MYsOPbFvYu7xI7FYQhKTfMFo9hK8NqKz?=
 =?us-ascii?Q?oB4fdNLsbMAYA4GGDKFcG4CCuCopv1b5vW6P+EP7bUtqdUe0+pOwDc8N0aVL?=
 =?us-ascii?Q?NgMFUZBJYbNJxeYC7FHvo4fyvfMctnEGbjws4uSiLxAzgUBcyvOAdgxgcpHc?=
 =?us-ascii?Q?NkYhhe79Ev1nJ/HqU6bR9P3DZqX9+wNCx+npia4hCZaaNTVHSLIJoqSiOlay?=
 =?us-ascii?Q?E5ieZZidgHzPxiOIkgSfc4d72A4zygRkaYI1swGQmyiOF2QSoAAocrFsTZq8?=
 =?us-ascii?Q?MYDIiViGIMmjJ7OSsHJX4OUI8LnuI8MdktiBFv5LkNcynkPQjv/oh0ULMvX5?=
 =?us-ascii?Q?u9A71zRrkm6kGXh8HBBFWnKr8EShnVurDZxeTmxhrPju3YSTRE/8WbASriTi?=
 =?us-ascii?Q?ocDoEZ0Y3D8ceFPeWg/mnGq7RdH+lZVKIWGgrtOMCQh2i2gSO/mmWURNfhDa?=
 =?us-ascii?Q?slP1oISW1jp2waBHHpS0CI8cXjMFQ4+aid+nICu7mBtgV0yYbW8emv6zTR/l?=
 =?us-ascii?Q?0yXkqKPBh38vfBPcv/uSlteDF36ZP9hTW/W7/roSH8ZunnSs8jGN7awKiZTe?=
 =?us-ascii?Q?4sMCeLbQw0/2S14UH8eb5Lf4NroN1EO8LUqPTEoZJdjH3ntt7NVDRqK3Jndf?=
 =?us-ascii?Q?D/nr2FRcdN5o/oxocxWsERPyqyV6AOAEn/UsOo+rvIMpxl+HJSmeJF7+Q5a5?=
 =?us-ascii?Q?SAsfZpCRJ6mGrxA+PDJlVFJ+fUZuZy7k8g9z0i6EMpdmQrj8LxlBRkX1NVEU?=
 =?us-ascii?Q?lJziglpHBcp43uT3hZ0D889/bvLJQi7PPlBRDM1TobXhyEkR2AlEbKr/0O/a?=
 =?us-ascii?Q?TGxQuOpC3A1lRwnTtLFf9bZAe3+g+Lx9UL/pMeZp33Nxr3eW5y0xrSDxOys8?=
 =?us-ascii?Q?86yzFcjf711rV63S+C6IdFlLhf5P1e1+DSiUQrRnJFB2ebTcLQwUub6KToeF?=
 =?us-ascii?Q?SDMOy/tsbiNFyjsClTfWXln+1pinx8IeJBlfM3vfzk39RBjd80f53n2+SbIz?=
 =?us-ascii?Q?b131mvjKzTUL86VEkIAZjwclQoBl3V/ofTOL2uP5MJA0l8W/g+b+B+vZH72q?=
 =?us-ascii?Q?vz7s162xAYPts5+HzM0tvHp8F3hjOQufhTumntHXGS0tyfVTdgov3WdA1Te0?=
 =?us-ascii?Q?t/GXv+btJzNc6pNNmz/sGxRCfyTOLxCVBu/E/9rc/+mCk9D2lPsh5Qz60nEI?=
 =?us-ascii?Q?qjvr4FWxXp23e+PY9ANyNsWb8Avm1Wf7FLQKC/4DSRTLpJouFzo1xRDywZmS?=
 =?us-ascii?Q?hd1z+l8AEj7PhSxnuyunCPj3XYZg2/GQhm7p2fbe4bn+u1y4Gx+ENI9s/5Ol?=
 =?us-ascii?Q?o8VPgVEpsCNH42hNeA54F7pqvGVeKU5qaplDHYiAL9gGden+6cHIsxyubf5v?=
 =?us-ascii?Q?zT3BT/MaK1eUnAA9DrJhzc4GM/NzJ6rettwjChqYRh2L77NI+RzJx2YSljRt?=
 =?us-ascii?Q?3/Pe9wAAMDs9HogeIV1HRmXKyUT3EBQExUAHdaY3WIpr6EfLnkFvhS+eILZi?=
 =?us-ascii?Q?VlTyxVztrklv4/8bMqyoC8k7WAe9gvW6gpFClRTClzKI659i47vkaZKyNqNf?=
 =?us-ascii?Q?EQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB5822CE51AA941EF0BE37115284259MW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd2ab4e-2936-4780-734c-08daace002e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 05:58:54.7030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tCSyPGVCUs9cAz26XxUoGC01XpBXfnByrgWa0ciZEINpV8TBlAeHGeObpgQJlvIf+hU64nPdKlZNKl9g2Cvoa+ANtToM02oDKO2nCeMmnZ2IlaAARONWNuy4NYdg+fgE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6787
X-Proofpoint-ORIG-GUID: dmgWf7zOiIqe4USITVbsv12-r1d-Sunx
X-Proofpoint-GUID: oZuYsQ0zX0CvPikBCp7ZN741tUX0cd_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_04,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 mlxlogscore=845 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130036
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 05:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99155

--_000_MW4PR11MB5822CE51AA941EF0BE37115284259MW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Khem Raj,

I Have seen the link, issue is in Open.

Could you please confirm open embedded is going to provide the fix.

Regards,
Archana


________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Thursday, October 13, 2022 4:00 AM
To: Polampalli, Archana <Archana.Polampalli@windriver.com>
Cc: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: Re: [oe] Security Advisory - yasm - CVE-2021-33461

[Please note: This e-mail is from an EXTERNAL e-mail address]

On Wed, Oct 12, 2022 at 10:24 AM Polampalli, Archana
<archana.polampalli@windriver.com> wrote:
>
> HI,
>
> Could you please confirm is there any security fix providing for CVE-2021=
-33461.

seems to be open https://github.com/yasm/yasm/issues/161

>
>
> Regards,
> Archana
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99147): https://lists.openembedded.org/g/openembedded=
-devel/message/99147
> Mute This Topic: https://lists.openembedded.org/mt/94286070/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_MW4PR11MB5822CE51AA941EF0BE37115284259MW4PR11MB5822namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Khem Raj,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I Have seen the link, issue is in Open.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Could you please confirm open embedded is going to provide the fix.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Archana</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khem=
@gmail.com&gt;<br>
<b>Sent:</b> Thursday, October 13, 2022 4:00 AM<br>
<b>To:</b> Polampalli, Archana &lt;Archana.Polampalli@windriver.com&gt;<br>
<b>Cc:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [oe] Security Advisory - yasm - CVE-2021-33461</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[Please note: This e-mail is from an EXTERNAL e-ma=
il address]<br>
<br>
On Wed, Oct 12, 2022 at 10:24 AM Polampalli, Archana<br>
&lt;archana.polampalli@windriver.com&gt; wrote:<br>
&gt;<br>
&gt; HI,<br>
&gt;<br>
&gt; Could you please confirm is there any security fix providing for CVE-2=
021-33461.<br>
<br>
seems to be open <a href=3D"https://github.com/yasm/yasm/issues/161">https:=
//github.com/yasm/yasm/issues/161</a><br>
<br>
&gt;<br>
&gt;<br>
&gt; Regards,<br>
&gt; Archana<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#99147): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/99147">
https://lists.openembedded.org/g/openembedded-devel/message/99147</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94286070=
/1997914">https://lists.openembedded.org/mt/94286070/1997914</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [raj.khem@gma=
il.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB5822CE51AA941EF0BE37115284259MW4PR11MB5822namp_--

