Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.112])
 by mx.groups.io with SMTP id smtpd.web09.8807.1611923638283867298
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 04:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@studentsecuedu66932.onmicrosoft.com header.s=selector2-studentsecuedu66932-onmicrosoft-com header.b=aBd/7Xle;
 spf=pass (domain: ecu.edu, ip: 40.107.93.112, mailfrom: pawluchm@ecu.edu)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrTNR6CXnRqHdFaKQQIym73GG3AVcuCm/1zVg7cgmKU6ypFrVsuUCm8nSDzHqDLqUFg1GBjNheolsOtq1tafKAdBlPsL413UHRBQgsPnkDwSSJKlWvU4JNraOtpm5sZYMfU+JOUWhuzmAjYrckazm76Gq/6gvco4YUp/VfjWSxytIAhLgyGNgwCGw0JcY5AwuXX2l7oSh16P8K1BpqDU8G0SOp9pv7yNWKzyth6LEs38j1SYtJcyb5BrYMjIs0A3R7QbiPyTbC74LtNxgJ1w0J5lAzvaG7GzMsqnH1ybb/PZQY0P1xtcuRLoCnRZHJ253Uv+7IgE3In9oUgS/Zi+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHz1dxaO5QY+VfXSglrtvYNg1XeXodwM4tqNhkmSIsY=;
 b=BdR03qHLpGjSfVu0HqIYjgQ5UjTIacdzCUfOcQNP8JXNuMRhNMEH9HqvDrcIWBRUGctcuM/faxFaQOXHeGWbkRyqhrUwA1sBpkTtBsCLkszpJb+P9GEVuhE9GWDj9BD/9j4cjiwh9n96keKUfpztLKyKXm9L9zMynxGBerf4suzWHot9QKvojQVnnyDrdio85DwvMoKUOUfLGDMKSunD9+ME+vNSfC7t9V1CDmToS3uGyE+xaW8LCPdmVSMnXrj4sW6E92AXEDaRNhbOXfxfzUTq5ixzonndPoXbENDaNOL2cu88ir1HSx/QgtEyGv++66DS707AnCU88BZ66FORFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ecu.edu; dmarc=pass action=none header.from=ecu.edu; dkim=pass
 header.d=ecu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=studentsecuedu66932.onmicrosoft.com;
 s=selector2-studentsecuedu66932-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHz1dxaO5QY+VfXSglrtvYNg1XeXodwM4tqNhkmSIsY=;
 b=aBd/7XleBW0MDjbUaAaho9QXOsyZrYSKtuhxE84ZQ40ILY95FMp6O3+q10/s4XGbqHrvUgjqa00dh4dGMxqfXnqpnslEfmcn4CGxEVqCMIGuOb5Ithr8boVKcm0skk0ss4xuTWwn9f8pe50iT1QPI5eD4M4f9V+GmHE2q2bCM9o=
Received: from BL0PR0102MB3377.prod.exchangelabs.com (2603:10b6:207:1e::19) by
 MN2PR01MB5887.prod.exchangelabs.com (2603:10b6:208:193::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17; Fri, 29 Jan 2021 12:33:48 +0000
Received: from BL0PR0102MB3377.prod.exchangelabs.com
 ([fe80::b586:28bb:d36b:487b]) by BL0PR0102MB3377.prod.exchangelabs.com
 ([fe80::b586:28bb:d36b:487b%3]) with mapi id 15.20.3784.017; Fri, 29 Jan 2021
 12:33:48 +0000
From: "Pawluch, Michael Mila" <pawluchm@ecu.edu>
To: "akuster808@gmail.com" <akuster808@gmail.com>, Dan Murphy <dmurphy@ti.com>
CC: "Openembedded-issues@lists.openembedded.org"
	<Openembedded-issues@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [Openembedded-issues] [RFC] Issues with mariadb-10.4.17 and aarch64
Thread-Topic: [Openembedded-issues] [RFC] Issues with mariadb-10.4.17 and
 aarch64
Thread-Index: AQHW80mcHTynbOqvQ0+iUbuvBADZfKo+hZgDgAAIS0E=
Date: Fri, 29 Jan 2021 12:33:48 +0000
Message-ID: 
 <BL0PR0102MB3377423C4A7C6B380B390A4BCAB99@BL0PR0102MB3377.prod.exchangelabs.com>
References: <6cde28bf-c69d-1d42-785e-dc228202e357@ti.com>
 <d7ff8010-d45d-6274-ef69-1fd482314224@gmail.com>
 <1539367b-171b-d8c7-ec99-dadbf27ad598@ti.com>
 <5b050fe2-cc18-64da-7731-1855fede0eb2@ti.com>,<0d4a5b07-db19-65f0-2edc-362c41441d3c@gmail.com>
In-Reply-To: <0d4a5b07-db19-65f0-2edc-362c41441d3c@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=ecu.edu;
x-originating-ip: [150.216.21.56]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21e93281-2bab-4e2f-be7e-08d8c4522061
x-ms-traffictypediagnostic: MN2PR01MB5887:
x-microsoft-antispam-prvs: 
 <MN2PR01MB5887E778DA696424BE5BD25ACAB99@MN2PR01MB5887.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yiPNMAnME8ff3XC6sK8XRlO4q8buuOs4yftsnBYyd9SDjC276LH+f/xChN6WTT83GlJzH5RP3qhboyant25KP00wh14D9USo463MrmyMyRKiawhlJhVqRTWzkZIb9NQzCc0mTLJOh1zd5sryj6so5Lwb34MWSY2Y0cT4CROINgvtonpJ47kJxihfr2xDnTmv2mP//RFXnmLfe1VExjkk++2z0zeHelkUjoAnqkr1U8aAqxM/cz69Gy/UhKy001Nv0j/90uiNUyGA1KHwCmmWW1cwUxLR/hpQDYGVmDFduSdlnn3WmZDIMK45JRCciPj7hIq6DArdcLWtJlq9trjI5trmR1PaL0zoI++HFkYYlZO6CovRkCHoA2C5G6PsXMLATRqsv0DhV1rfn/LRSqnGB3XSJY7zqxJ3FN65QEtKhLTLfN0eRzfjQDm/QkqiVARLCG1d1pJPe4jUiO8jpxLlv6oln/YeIXJK97CaaATu0q4M8bkHIwkAuBt5J+p13UlWfffkpwHzD5FGbAlfDwjmajSfIFF8dhJ8e/mPXzwoU2K9Qvq4Z668rXq2xudTRaZs0gV+xNcnAChjAQNBkPntHIYgona0cEKTmEmDYFUvBVY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR0102MB3377.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(4326008)(26005)(6506007)(53546011)(186003)(786003)(166002)(8676002)(316002)(66446008)(9686003)(55016002)(86362001)(8936002)(66556008)(83380400001)(66476007)(64756008)(76116006)(66946007)(5660300002)(110136005)(7696005)(54906003)(75432002)(52536014)(33656002)(478600001)(45080400002)(2906002)(966005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?b2JknTdkJysVF2zxLwBs6aaqrEb2NAAfHfxlx++4O+3stYkrqJ5/+drL6D3/?=
 =?us-ascii?Q?oor88pvXRxIvq17VQeIGfrHuiRRHz7VsXfCakIWJB55peguk/4Pg7r6aTggZ?=
 =?us-ascii?Q?u9Syjgz3bUDTDADjuO7vc8FAAeH4TVNFNBDjrWO+U1KDxtLxqRZEVpR8EG5s?=
 =?us-ascii?Q?F98P9elVrpZ5SwFSUgTR/1IDT6UWr5UpF21MlcP0UlyyPrehlJRn6P/805+e?=
 =?us-ascii?Q?8YuWU6KgPY+qSwBLP+gOQjqOpDAbbknzQLRHOupVahtNz6RBiGx4WQgAjtej?=
 =?us-ascii?Q?SfFslNINMe1CiaW/LOWOsGJV9xCnp7j1PB0xV5GNMc8dTlhru9AhQPME2RD+?=
 =?us-ascii?Q?4E/Ov6EErOa3sKSejGYGIFW3ZIOW4igeNchZUcHtXNmAIJgysVyVWAwn3Pqf?=
 =?us-ascii?Q?maZ+sJcDiZhCCCDF5oIj0wKSOCu8x7sk5MICi0Jy9JSlibPncBhD31j9V1Wt?=
 =?us-ascii?Q?uibIHHMVqYO1z/4gETymv8EEsjeoeoloaEOvf3JDb1arlu9WW3hOzFAoiMYh?=
 =?us-ascii?Q?QcAr1wa30k2M18jd6RzLX8kbeyyyFUVqHpVc7lNk7sF/F/a/fM6QVfb8+jHb?=
 =?us-ascii?Q?YGHNJS5mQ2Pj3rVrn4yVo4XgEKaWqnnYVjlMDqs0rv7eHbjoKGpCupx5B6tu?=
 =?us-ascii?Q?bfOO12L51f0bRAh3FeNKMKZN1wopByy6agKZpq3JwKuHGOciU4MpDJGTcorj?=
 =?us-ascii?Q?O9DHvFuP9npyxpcjHIkAObsf+O82boJQM4JvP9pGPCWWPxdDbMfHgJXV7GBs?=
 =?us-ascii?Q?b4oZy74ELnphfIGkUoqBbzR2EUiYINb8FkNmn+yLQNpQHphllyIMMXJovKV6?=
 =?us-ascii?Q?v+YMnt2aNftvXPG2X/lH7SV1JDWmwVvzQ4iObRQXDY66vEqxU+Fl2SFejpnc?=
 =?us-ascii?Q?NjEDC/F1iSELKh7qaRN/t+4s9O3kGKcqavYlEomZvKO6Wx32yQu0vyaPsUH2?=
 =?us-ascii?Q?IiN3y7AACZVrAqYMpLjfFlqeRnSFmwTWbqgrnI/CTOTl8M/dzI7TrlgR84h4?=
 =?us-ascii?Q?HI4YKsq57UvB9jvvKuNAVcKIIjCKvCYdq+ibYqDO6q9iovltZtSnN6w/8Rkl?=
 =?us-ascii?Q?233l31Fr4W5WZlQQfEhyxDhR0T0FFQ=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: ecu.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR0102MB3377.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e93281-2bab-4e2f-be7e-08d8c4522061
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2021 12:33:48.1804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 17143cbb-385c-4c45-a36a-c65b72e3eae8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7xgqm2V+MsXA8nHA/otoVbOWlRLtw/pY/hD1lkIeLol5s+KtyaEZ0PoU5Qvu4Hr0FJpEQIB6PBb3ghWLRplXCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5887
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BL0PR0102MB3377423C4A7C6B380B390A4BCAB99BL0PR0102MB3377_"

--_000_BL0PR0102MB3377423C4A7C6B380B390A4BCAB99BL0PR0102MB3377_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I)                    I AM not ASSOCIATED WITH open embedd , NOR Dan Murphy=
 IN ANY WAY

II)                  I do not appreciate these E-mails, I have enough unwan=
ted clutter, I do not need nor want to be privy to your minutia!

III)                 Please REMOVE ME,  REMOVE ME ,  REMOVE ME,  REMOVE ME,=
  REMOVE ME!!!!!!!!!!!!

IV)                Michael Pawluch

From: akuster808 via lists.openembedded.org<mailto:akuster808=3Dgmail.com@l=
ists.openembedded.org>
Sent: Friday, January 29, 2021 6:58 AM
To: Dan Murphy<mailto:dmurphy@ti.com>
Cc: Openembedded-issues@lists.openembedded.org<mailto:Openembedded-issues@l=
ists.openembedded.org>; openembedded-devel@lists.openembedded.org<mailto:op=
enembedded-devel@lists.openembedded.org>
Subject: Re: [Openembedded-issues] [RFC] Issues with mariadb-10.4.17 and aa=
rch64

This email originated from outside ECU.


On 1/27/21 12:57 PM, Dan Murphy wrote:
>
> Armin
>
> On 1/25/21 1:01 PM, Dan Murphy wrote:
>>
>> Armin
>>
>> On 1/25/21 11:57 AM, akuster808 wrote:
>>> Dan,
>>>
>>>
>>> On 1/25/21 9:45 AM, Dan Murphy wrote:
>>>> Hello
>>>>
>>>> I was wondering if there has been any reports of the mariadb update on
>>>> the dunfell branch causing issues with 64bit compilers when the 'pam'
>>>> is set for DISTRO_FEATURES
>>>>
>>> I am not aware of any.
>>>> There does not seem to be a compilation issue but more of an
>>>> installation issue in which the lib/security directory is not being
>>>> created.
>>>>
>>>> We are seeing issues in our arago distro with the following errors
>>>>
>>>> mv: cannot stat '/OE/arago-dunfell-next-build/build-AARCH64_1/arago-tm=
p-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/securi=
ty': No such file or directory
>>>> *09:38:06* WARNING: /OE/arago-dunfell-next-build/build-AARCH64_1/arago=
-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.do_i=
nstall.5379:1 exit 1 from 'mv /OE/arago-dunfell-next-build/build-AARCH64_1/=
arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/li=
b/security /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-=
arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image//usr/lib'
>>> I would be surprised if this was just limited to Arm64.
>>>
>>> Would enabling "PAM" and appending mariadb to an image reproduce this?
>>
>> Sorry I did not specify when the error occurred.  This happens during
>> the build time not run time.
>>
>> 32bit ARM builds perform the install just fine
>>
>> *12:53:25* NOTE: recipe mariadb-native-10.4.17-r0: task do_install: Succ=
eeded
>>
>>
>> 64bit not so much
>>
>> *09:38:03* ERROR: mariadb-10.4.17-r0 do_install: Execution of '/OE/arago=
-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch=
64-linux/mariadb/10.4.17-r0/temp/run.do_install.5379' failed with exit code=
 1:
>
> Actually yes this is specific to 64 bits.  The lib/security directory
> for 64 bit builds does not exist it is in lib64/security.  So the
> do_install fails because it is looking in the wrong location.
>
> Not sure how to fix this.
>

I thinks this may be the fix.

https://nam02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.ope=
nembedded.org%2Fmeta-openembedded%2Fcommit%2Fmeta-oe%2Frecipes-dbs%2Fmysql%=
3Fid%3D4ebfa9afa4d8b608999338bf38e2c8ad596aad58&amp;data=3D04%7C01%7Cpawluc=
hm%40ecu.edu%7Cad95a2dff041491ca64208d8c44d3652%7C17143cbb385c4c45a36ac65b7=
2e3eae8%7C0%7C0%7C637475183215127701%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D1Yu=
rSM3FEwEoIdKC3VE33fUpiJLwLmOUt8g4trpS19M%3D&amp;reserved=3D0

mind trying it out?

-armin
>
> Dan
>


--_000_BL0PR0102MB3377423C4A7C6B380B390A4BCAB99BL0PR0102MB3377_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1617982366;
	mso-list-type:hybrid;
	mso-list-template-ids:-1928558834 -1 67698713 67698715 67698703 67698713 6=
7698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-number-format:roman-upper;
	mso-level-text:"%1\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.5in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.5in;=
mso-list:l0 level1 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">I)<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>I AM not ASSOCIATED WITH open embedd , NOR Dan Murp=
hy IN ANY WAY</p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.5in;=
mso-list:l0 level1 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">II)<span style=3D"font=
:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>I do not appreciate these E-mails, I have enough un=
wanted clutter, I do not need nor want to be privy to your minutia!</p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.5in;=
mso-list:l0 level1 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">III)<span style=3D"fon=
t:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Please REMOVE ME<b>, &nbsp;REMOVE ME </b><b><span s=
tyle=3D"font-size:12.0pt">, &nbsp;REMOVE ME</span>, &nbsp;</b><b><span styl=
e=3D"font-size:14.0pt">REMOVE ME</span>, &nbsp;</b><b><span style=3D"font-s=
ize:16.0pt">REMOVE ME!!!!!!!!!!!!</span></b></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in;text-indent:-.5in;=
mso-list:l0 level1 lfo1">
<![if !supportLists]><span style=3D"mso-list:Ignore">IV)<span style=3D"font=
:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]><b><span style=3D"font-size:16.0pt">Michael Pawluch=
</span></b></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0in 0in 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><b>From: </b><a hr=
ef=3D"mailto:akuster808=3Dgmail.com@lists.openembedded.org">akuster808 via =
lists.openembedded.org</a><br>
<b>Sent: </b>Friday, January 29, 2021 6:58 AM<br>
<b>To: </b><a href=3D"mailto:dmurphy@ti.com">Dan Murphy</a><br>
<b>Cc: </b><a href=3D"mailto:Openembedded-issues@lists.openembedded.org">Op=
enembedded-issues@lists.openembedded.org</a>;
<a href=3D"mailto:openembedded-devel@lists.openembedded.org">openembedded-d=
evel@lists.openembedded.org</a><br>
<b>Subject: </b>Re: [Openembedded-issues] [RFC] Issues with mariadb-10.4.17=
 and aarch64</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">This email originated=
 from outside ECU.<br>
<br>
<br>
On 1/27/21 12:57 PM, Dan Murphy wrote:<br>
&gt;<br>
&gt; Armin<br>
&gt;<br>
&gt; On 1/25/21 1:01 PM, Dan Murphy wrote:<br>
&gt;&gt;<br>
&gt;&gt; Armin<br>
&gt;&gt;<br>
&gt;&gt; On 1/25/21 11:57 AM, akuster808 wrote:<br>
&gt;&gt;&gt; Dan,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 1/25/21 9:45 AM, Dan Murphy wrote:<br>
&gt;&gt;&gt;&gt; Hello<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I was wondering if there has been any reports of the maria=
db update on<br>
&gt;&gt;&gt;&gt; the dunfell branch causing issues with 64bit compilers whe=
n the 'pam'<br>
&gt;&gt;&gt;&gt; is set for DISTRO_FEATURES<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; I am not aware of any.<br>
&gt;&gt;&gt;&gt; There does not seem to be a compilation issue but more of =
an<br>
&gt;&gt;&gt;&gt; installation issue in which the lib/security directory is =
not being<br>
&gt;&gt;&gt;&gt; created.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; We are seeing issues in our arago distro with the followin=
g errors<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; mv: cannot stat '/OE/arago-dunfell-next-build/build-AARCH6=
4_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/imag=
e/lib/security': No such file or directory<br>
&gt;&gt;&gt;&gt; *09:38:06* WARNING: /OE/arago-dunfell-next-build/build-AAR=
CH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/t=
emp/run.do_install.5379:1 exit 1 from 'mv /OE/arago-dunfell-next-build/buil=
d-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17=
-r0/image/lib/security
 /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/=
work/aarch64-linux/mariadb/10.4.17-r0/image//usr/lib'<br>
&gt;&gt;&gt; I would be surprised if this was just limited to Arm64.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Would enabling &quot;PAM&quot; and appending mariadb to an ima=
ge reproduce this?<br>
&gt;&gt;<br>
&gt;&gt; Sorry I did not specify when the error occurred.&nbsp; This happen=
s during<br>
&gt;&gt; the build time not run time.<br>
&gt;&gt;<br>
&gt;&gt; 32bit ARM builds perform the install just fine<br>
&gt;&gt;<br>
&gt;&gt; *12:53:25* NOTE: recipe mariadb-native-10.4.17-r0: task do_install=
: Succeeded<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; 64bit not so much<br>
&gt;&gt;<br>
&gt;&gt; *09:38:03* ERROR: mariadb-10.4.17-r0 do_install: Execution of '/OE=
/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work=
/aarch64-linux/mariadb/10.4.17-r0/temp/run.do_install.5379' failed with exi=
t code 1:<br>
&gt;<br>
&gt; Actually yes this is specific to 64 bits.&nbsp; The lib/security direc=
tory<br>
&gt; for 64 bit builds does not exist it is in lib64/security.&nbsp; So the=
<br>
&gt; do_install fails because it is looking in the wrong location.<br>
&gt;<br>
&gt; Not sure how to fix this.<br>
&gt;<br>
<br>
I thinks this may be the fix.<br>
<br>
<a href=3D"https://nam02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fgit.openembedded.org%2Fmeta-openembedded%2Fcommit%2Fmeta-oe%2Frecipes-d=
bs%2Fmysql%3Fid%3D4ebfa9afa4d8b608999338bf38e2c8ad596aad58&amp;amp;data=3D0=
4%7C01%7Cpawluchm%40ecu.edu%7Cad95a2dff041491ca64208d8c44d3652%7C17143cbb38=
5c4c45a36ac65b72e3eae8%7C0%7C0%7C637475183215127701%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;amp;sdata=3D1YurSM3FEwEoIdKC3VE33fUpiJLwLmOUt8g4trpS19M%3D&amp;amp;rese=
rved=3D0">https://nam02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.openembedded.org%2Fmeta-openembedded%2Fcommit%2Fmeta-oe%2Frecipes-db=
s%2Fmysql%3Fid%3D4ebfa9afa4d8b608999338bf38e2c8ad596aad58&amp;amp;data=3D04=
%7C01%7Cpawluchm%40ecu.edu%7Cad95a2dff041491ca64208d8c44d3652%7C17143cbb385=
c4c45a36ac65b72e3eae8%7C0%7C0%7C637475183215127701%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;amp;sdata=3D1YurSM3FEwEoIdKC3VE33fUpiJLwLmOUt8g4trpS19M%3D&amp;amp;reser=
ved=3D0</a><br>
<br>
mind trying it out?<br>
<br>
-armin<br>
&gt;<br>
&gt; Dan<br>
&gt;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BL0PR0102MB3377423C4A7C6B380B390A4BCAB99BL0PR0102MB3377_--
