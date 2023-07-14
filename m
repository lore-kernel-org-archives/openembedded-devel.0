Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D95EB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 15:00:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1020.1689346812854628688
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jul 2023 08:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Nbv4unhg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=655946fe48=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36EDF2gh019865
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 08:00:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=uLfPa3dYB+jXMg6Ppc
	KXEM2CxnKWu/76L068+1DrgJU=; b=Nbv4unhgulC3ZyVmICGlw+TjTKf7WptCw4
	cYJwdq51R02QUa0IU6pAC0JCf5BtnZ0+Lxbbxz30DV1GfBKqbKyzu2TyOfH7HmlS
	qz5QVMlDkPC451S+m8jzavi20pD9V0pisOFacAqeOcZWQd9WZ/eLSCJ5nvhhbXrr
	HY0QuNyyileNTzimjJS3xJzCOkd3NpupTEXwbvnOxzAxrOAGW2QCiSrkxiYevfME
	hqDEEVnyfdo4YVaU4F+8ZVDnLMKURdaq9Lu8hn7tDP2tql2mWaeUoEBUSTjOiyAe
	G9AVYQhh8V1zkXwLHR++S/1HzLqgHwU/gGvKPvqgfN+ct3DT+bfw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rtpuc8vxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 08:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljf/Exb/v87GsQar71abyndQlwAhngK3DXlQggiCg8zCXwu/dBHB00sFLvoNrekH1nbizd3+SJWfif9Ft0ibuXeo+np06N/eGRJuOQuSgZfyhZ+Gp5kY/XSzmHQmXTlVbFdtMByZ7iQ4qShgQ4nb4CN5JBX/FUqLi2w9Lv5Ld/viJgdK0L7W6MAeDfkzDgJztQLdrSr85hzo/JHqrOMPNh6NZCsqVZq/4/EHm6Poz2SFt31+0wdu+43KZsF5Bky2k74yOwWOEVrVwkCz1ubEbqHgFCXwX/xULhwGpNvfQWNGoEihHPfPqKztxonr1nh2j01Nt8Z2fErb/s7cU9fhsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLfPa3dYB+jXMg6PpcKXEM2CxnKWu/76L068+1DrgJU=;
 b=Lu+DOxONh9FJ3NVuBlinYDxn6dSnXBp1H9IijD4NQPl/9rQuRleS/VlkNoiRTNizLuJWbP1nMu+tldGPvuP4z4E0Kx7sqsIeE3MQYlzrWkTotedUU+dHAxbabQQkAhg6+p2WMz88sBlUI4cFzP/DLYrG3X/NFZQcZz/WKhPP9a++DN/xU7Z6+mE0bhaFv5dWTJW97UMhRfwF6iNk8s46Bf2Rg3qICicyPLUHL6SuNOkrideO/0lEinDhh9hDfkupudBIsu0YJVPwdF6wlUOxC0P7xBKDF2jdgHWvRcDNSJJ3hwadvoiaiCl0UsuaOWLFYkskSkdcMzeRbPb9fRT02w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB8005.namprd11.prod.outlook.com (2603:10b6:a03:523::18)
 by LV2PR11MB6000.namprd11.prod.outlook.com (2603:10b6:408:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 15:00:02 +0000
Received: from BY1PR11MB8005.namprd11.prod.outlook.com
 ([fe80::a8d:dd09:8e79:e7c7]) by BY1PR11MB8005.namprd11.prod.outlook.com
 ([fe80::a8d:dd09:8e79:e7c7%5]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 15:00:02 +0000
From: "Gupta, Meenali" <Meenali.Gupta@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Gupta, Meenali"
	<Meenali.Gupta@windriver.com>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [oe][meta-networking[mickledore][PATCH 1/1] fix: CVE-2023-1801
Thread-Topic: [oe][meta-networking[mickledore][PATCH 1/1] fix: CVE-2023-1801
Thread-Index: AQHZtkZOO8P6qnCBk0S5rwd7GXwnm6+5WwiO
Date: Fri, 14 Jul 2023 15:00:02 +0000
Message-ID: 
 <BY1PR11MB8005CB9F40F82DE806AF3844E534A@BY1PR11MB8005.namprd11.prod.outlook.com>
References: <1771B866FB5CC5C7.3749@lists.openembedded.org>
In-Reply-To: <1771B866FB5CC5C7.3749@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR11MB8005:EE_|LV2PR11MB6000:EE_
x-ms-office365-filtering-correlation-id: 3ba9f57b-a532-4b0f-7dad-08db847b0049
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PLqzGqo556kLdkhxVS80ns/zN10mQG96mm+F1KHs+P/yEUtiwocCMHKSoUx+iJXnT4gkTgOL4fJhWsqycEnLcO7CP3rkOtHFH1mY1YD9/xK9XWufWRKJ50S9ZrePpy6tIy0TKJ7OFfSZPmo6HvCaO+ajTA6puiQa/6JoRH1sX6kjQ2ef545umyeDgpQghpFz6q2qt0X+AMODJWquM+ChYxKW0I8pD/4ZYmSqOAf5h2c9JCXYY2KQR5Nr+v/oJJrAAeUoVeJFjXoybmezhjzHA7Lc6azbvdkgT6hNCwhK2NjU/6N3cIY4Sb6X/s1Crkbr8b+hyxPqrwKTq0nlYsFGTFS/xiC0CwE1v1McrInVOiYAR23vbBJCmkVtxYKXXSqZpvExl5/7Ax/C3rIh5HqvehJOdNzElvNpaDBfoABUDW7EypW1AZOtpH7Y3LrxByH8dV4bOSUw0/qf6M9TCTXunAe/cHiZ4izlogRuyQ5YZW2NaASbi5nalhXXGLLqZslhspLVl6oKeR/bEwdaQKl4Apt+gMMdJFhGPux6yEd2NPOM2TPPdve7w5lCjwg/IlMCqY4NtP5HTIOjUIR9xGvZQopE/rTYMn8QZYmf08GsqUw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB8005.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(376002)(39850400004)(451199021)(186003)(71200400001)(86362001)(122000001)(38070700005)(6506007)(26005)(41300700001)(55016003)(966005)(9686003)(7696005)(107886003)(30864003)(66946007)(478600001)(66476007)(66556008)(76116006)(38100700002)(110136005)(2906002)(45080400002)(91956017)(66446008)(83380400001)(166002)(64756008)(19627405001)(4326008)(316002)(8676002)(8936002)(5660300002)(52536014)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?FPjTs+0eVSX5kCrxZImD2uEjZNK6v1y1t9k7VriA7CBOiQD+zvMtXkOs/M/P?=
 =?us-ascii?Q?nPOxv1uA5Kai//8ynIhSFXfnyz/EtgUpC2EHIJgyNUHe3E8R1RUPs+JFOGyu?=
 =?us-ascii?Q?zlbVrMZ5G/joc8U002CRO/L4EHMjuM03SJVzti8ikajVw7h0s0l1WXr7D5GC?=
 =?us-ascii?Q?NYovWWf0LPymdwAuSbG2LiL+uhejaifG5C0xLzjPOUdrpn93roZ8Jrob00D2?=
 =?us-ascii?Q?Miv0dbKQgBYsyBqlQpsBuDYdnZJoingVui/PYYqarcLJDxMu6iLrOut2L/T5?=
 =?us-ascii?Q?MXz71lAWaxr2391LGG2ooLwwP2NC2CEb55y20MMqxggxJtPfOKTCroFLB2tS?=
 =?us-ascii?Q?FRWd5s92FLxXdv7arKKuoYYaNesx+I1kBK/Obp1PTWgQJKcwGPFFi0q97tt0?=
 =?us-ascii?Q?jVa1eOpQkWFEMRDzIHxkFPq3mRrl9sTMZO+3jAZy9ySnXsRIi+JsKdkIiW4A?=
 =?us-ascii?Q?090YFtC7oLlCQBUCAFabbelxzr788h7gnzKICZdo656wXAMPe2hQpmdKftAG?=
 =?us-ascii?Q?LhJGC9VqRavWylEhWbcoYNAWUlL9TCh9/rSAtjgCwrSJwb5TnxMZBQ/Stxqs?=
 =?us-ascii?Q?JwZH0s0YSc93WKxtdtADpnRd2ppacwOoN5vhDFVHyp+i4ovFOLJkS3fvqd8t?=
 =?us-ascii?Q?foqDH8yFmaiMgEUTmGK9HMHZX74ITlNzLrEDJYLdXlzw5rAMeuKV4zzG03jF?=
 =?us-ascii?Q?PMvKSHSipSnXhwNdPkHXDEshCPVRFgOYGAm0/uL0eYSAmBkKvTLE1kXifhrI?=
 =?us-ascii?Q?9L3lx1wVnGeWveEQkIIcLBN8NseFbZiQ7k1h+yK0u5HIB49jzypY4Zben0jZ?=
 =?us-ascii?Q?bL6eMXjbMDXvzEDXBiKYDQXrSRGLA6dgKf0T2iILZJWrAYldoWtV/+slnqcf?=
 =?us-ascii?Q?eirAb2yzzh0YnkkurMWHoWBT7E4N5c0D6d0H2559oiZSr/Kn4HymIWcJm9HS?=
 =?us-ascii?Q?KEz3dHnmZHBo2NkEWChsfWYwXUNgCaIPwXswhio9Y2AlqJc06E3+p54kKGa7?=
 =?us-ascii?Q?N2o05gBkltMfrP3EQYcILV7DWaEoPhLGl82gzEg2Xn+7qpP682N0VlSP0Kl8?=
 =?us-ascii?Q?XAhbpAE8Z6rO6fh6sPI7QzZ7PGEPe56lKlYWe+vi6Yj2jyhupgiiaBvutVof?=
 =?us-ascii?Q?5XfSTAWiS5H1jj5xUb3Ot8+PKdaiivOm0tOxDXrPLKz7FHB3cla8N4MYOCkS?=
 =?us-ascii?Q?C5eM3BaMfURCZ0UOmle68az1ek8x8FAms/9HNMHVK8D/Qzqzw2Jg4aKnNFTl?=
 =?us-ascii?Q?4R+3YSVzrpnOVKM/aG2bWXNIQUZX++LY3zuogZJMyHun81WpIar5ai2xSuH5?=
 =?us-ascii?Q?R1dYqVT3RpSAhFtnXEcSVmRPL4XUGMTLy6OydrazXJmmOT4D2GE07TUY4Jg1?=
 =?us-ascii?Q?pLkvD0CIgZOyS9AzZlqk6c9SRtgXLSe8bVlDFvgPqznvWRuy8hqYTbvC1jBU?=
 =?us-ascii?Q?TM/6RI7fQLRIZgYK2Ry+JWvGfLzqphsFcP0B94giwL120k4CP73pjBzgkg3D?=
 =?us-ascii?Q?yOVQMaa08IQ9szLnNekrXRYLqJQVdAnUowhlN4mZRQUVPkk5s2hinL8atkIP?=
 =?us-ascii?Q?WyoARAV/jfTr2VNnMKRcnUWSvnI6SDo3BFlxrhN4?=
Content-Type: multipart/alternative;
	boundary="_000_BY1PR11MB8005CB9F40F82DE806AF3844E534ABY1PR11MB8005namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB8005.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba9f57b-a532-4b0f-7dad-08db847b0049
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 15:00:02.3134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x7n3EeZpY10ypt5X6b4acP7WSitQG9Q/Q6Ez4/oWVpNZmDe6BOcHhlaPAebR5j9yFSR1RL5J+pWtZa5+RP9CtwsBFErd5vAhCbnSC+FVmOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6000
X-Proofpoint-GUID: 1f30CQu-1Bj7JDvHs3S96o03E4iDMwmC
X-Proofpoint-ORIG-GUID: 1f30CQu-1Bj7JDvHs3S96o03E4iDMwmC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307140136
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 15:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103868

--_000_BY1PR11MB8005CB9F40F82DE806AF3844E534ABY1PR11MB8005namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

Please ignore it .

Regards
Meenali
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Meenali Gupta via lists.openembedded.org <mee=
nali.gupta=3Dwindriver.com@lists.openembedded.org>
Sent: Friday, July 14, 2023 4:57 PM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>
Subject: [oe][meta-networking[mickledore][PATCH 1/1] fix: CVE-2023-1801

From: Meenali Gupta <mgupta1@blr-linux-engg1.wrs.com>

The SMB protocol decoder in tcpdump version 4.99.3 can perform
an out-of-bounds write when decoding a crafted network packet

Signed-off-by: Meenali Gupta <mgupta1@blr-linux-engg1.wrs.com>
---
 .../tcpdump/tcpdump/CVE-2023-1801.patch       | 342 ++++++++++++++++++
 .../recipes-support/tcpdump/tcpdump_4.99.3.bb |   1 +
 2 files changed, 343 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/CVE-202=
3-1801.patch

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2023-1801.=
patch b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2023-1801.patch
new file mode 100644
index 000000000..03a1c0aa4
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2023-1801.patch
@@ -0,0 +1,342 @@
+From 13336c4054015bef84d93bf51b50b15df6e265bf Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Mon, 30 Jan 2023 23:03:16 -0800
+Subject: [PATCH] tcpdump: Have a common routine for converting dates and t=
imes
+ to strings.
+
+Have a routine that takes a buffer, a strftime format, and a struct tm *
+as arguments, and:
+
+* checks whether the struct tm * is null and, if so, returns a string
+indicating that the date and time couldn't be converted;
+
+* otherwise, passes it to strftime(), along with the buffer and the
+format argument and, if strftime() returns 0, meaning the string didn't
+fit into the buffer and thus that the buffer's contents are undefined,
+returns a string indicating that the date and time didn't fit into the
+buffer;
+
+* otherwise, returns a pointer to the buffer.
+
+Call that routine instead of directly calling strftime() in printers;
+that prevents printing a buffer with undefined data if the buffer isn't
+big enough for the string.
+
+Also, when generating file names using an strftime format, check the
+return value of strftime() to make sure the buffer didn't overflow.
+
+Upstream-Status: Backport[https://github.com/the-tcpdump-group/tcpdump/com=
mit/03c037bbd75588beba3ee09f26d17783d21e30bc]
+CVE: CVE-2023-1801
+
+Signed-off-by: Meenali Gupta <mgupta1@blr-linux-engg1.wrs.com>
+---
+ netdissect.h   |  3 +++
+ ntp.c          | 21 ++++++---------------
+ print-ahcp.c   | 12 ++++--------
+ print-arista.c | 13 ++++---------
+ print-rx.c     |  8 ++++----
+ print-zep.c    |  7 +++----
+ smbutil.c      | 16 +++++-----------
+ tcpdump.c      | 22 ++++++++++++++++++++--
+ util-print.c   | 36 ++++++++++++++++++++++++++++--------
+ 9 files changed, 77 insertions(+), 61 deletions(-)
+
+diff --git a/netdissect.h b/netdissect.h
+index 5c16be6..b1074ef 100644
+--- a/netdissect.h
++++ b/netdissect.h
+@@ -423,6 +423,9 @@ extern void ts_print(netdissect_options *, const struc=
t timeval *);
+ extern void signed_relts_print(netdissect_options *, int32_t);
+ extern void unsigned_relts_print(netdissect_options *, uint32_t);
+
++extern const char *nd_format_time(char *buf, size_t bufsize,
++    const char *format, const struct tm *timeptr);
++
+ extern void fn_print_char(netdissect_options *, u_char);
+ extern void fn_print_str(netdissect_options *, const u_char *);
+ extern u_int nd_printztn(netdissect_options *, const u_char *, u_int, con=
st u_char *);
+diff --git a/ntp.c b/ntp.c
+index 4d17932..0a79f81 100644
+--- a/ntp.c
++++ b/ntp.c
+@@ -55,8 +55,8 @@ p_ntp_time(netdissect_options *ndo,
+       if (i) {
+           int64_t seconds_64bit =3D (int64_t)i - JAN_1970;
+           time_t seconds;
+-          struct tm *tm;
+           char time_buf[128];
++          const char *time_string;
+
+           seconds =3D (time_t)seconds_64bit;
+           if (seconds !=3D seconds_64bit) {
+@@ -64,22 +64,13 @@ p_ntp_time(netdissect_options *ndo,
+                * It doesn't fit into a time_t, so we can't hand it
+                * to gmtime.
+                */
+-              ND_PRINT(" (unrepresentable)");
++              time_string =3D "[Time is too large to fit into a time_t]";
+           } else {
+-              tm =3D gmtime(&seconds);
+-              if (tm =3D=3D NULL) {
+-                  /*
+-                   * gmtime() can't handle it.
+-                   * (Yes, that might happen with some version of
+-                   * Microsoft's C library.)
+-                   */
+-                  ND_PRINT(" (unrepresentable)");
+-              } else {
+-                  /* use ISO 8601 (RFC3339) format */
+-                  strftime(time_buf, sizeof (time_buf), "%Y-%m-%dT%H:%M:%=
SZ", tm);
+-                  ND_PRINT(" (%s)", time_buf);
+-              }
++              /* use ISO 8601 (RFC3339) format */
++              time_string =3D nd_format_time(time_buf, sizeof (time_buf),
++                "%Y-%m-%dT%H:%M:%SZ", gmtime(&seconds));
+           }
++          ND_PRINT(" (%s)", time_string);
+       }
+ #endif
+ }
+diff --git a/print-ahcp.c b/print-ahcp.c
+index 9859f76..d57edda 100644
+--- a/print-ahcp.c
++++ b/print-ahcp.c
+@@ -102,18 +102,14 @@ ahcp_time_print(netdissect_options *ndo,
+                 const u_char *cp, uint8_t len)
+ {
+       time_t t;
+-      struct tm *tm;
+-      char buf[BUFSIZE];
++      char buf[sizeof("-yyyyyyyyyy-mm-dd hh:mm:ss UTC")];
+
+       if (len !=3D 4)
+               goto invalid;
+       t =3D GET_BE_U_4(cp);
+-      if (NULL =3D=3D (tm =3D gmtime(&t)))
+-              ND_PRINT(": gmtime() error");
+-      else if (0 =3D=3D strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S", t=
m))
+-              ND_PRINT(": strftime() error");
+-      else
+-              ND_PRINT(": %s UTC", buf);
++      ND_PRINT(": %s",
++          nd_format_time(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S UTC",
++            gmtime(&t)));
+       return;
+
+ invalid:
+diff --git a/print-arista.c b/print-arista.c
+index 039a1ff..079ad68 100644
+--- a/print-arista.c
++++ b/print-arista.c
+@@ -10,7 +10,6 @@
+
+ #include "netdissect.h"
+ #include "extract.h"
+-#include "addrtoname.h"
+
+ /*
+
+@@ -93,17 +92,13 @@ arista_print_date_hms_time(netdissect_options *ndo, ui=
nt32_t seconds,
+               uint32_t nanoseconds)
+ {
+       time_t ts;
+-      struct tm *tm;
+-      char buf[BUFSIZE];
++      char buf[sizeof("-yyyyyyyyyy-mm-dd hh:mm:ss")];
+
+       ts =3D seconds + (nanoseconds / 1000000000);
+       nanoseconds %=3D 1000000000;
+-      if (NULL =3D=3D (tm =3D gmtime(&ts)))
+-              ND_PRINT("gmtime() error");
+-      else if (0 =3D=3D strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S", t=
m))
+-              ND_PRINT("strftime() error");
+-      else
+-              ND_PRINT("%s.%09u", buf, nanoseconds);
++      ND_PRINT("%s.%09u",
++          nd_format_time(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S",
++             gmtime(&ts)), nanoseconds);
+ }
+
+ int
+diff --git a/print-rx.c b/print-rx.c
+index 3f7589e..dbef71c 100644
+--- a/print-rx.c
++++ b/print-rx.c
+@@ -794,12 +794,12 @@ rx_cache_find(netdissect_options *ndo, const struct =
rx_header *rxh,
+                       ND_PRINT(" %" PRIu64, _i); \
+               }
+
+-#define DATEOUT() { time_t _t; struct tm *tm; char str[256]; \
++#define DATEOUT() { time_t _t; char str[256]; \
+                       _t =3D (time_t) GET_BE_S_4(bp); \
+                       bp +=3D sizeof(int32_t); \
+-                      tm =3D localtime(&_t); \
+-                      strftime(str, 256, "%Y/%m/%d %H:%M:%S", tm); \
+-                      ND_PRINT(" %s", str); \
++                      ND_PRINT(" %s", \
++                          nd_format_time(str, sizeof(str), \
++                            "%Y/%m/%d %H:%M:%S", localtime(&_t))); \
+               }
+
+ #define STOREATTROUT() { uint32_t mask, _i; \
+diff --git a/print-zep.c b/print-zep.c
+index fd74368..642b240 100644
+--- a/print-zep.c
++++ b/print-zep.c
+@@ -83,12 +83,11 @@ static void zep_print_ts(netdissect_options *ndo, cons=
t u_char *p)
+        */
+       if (i) {
+               time_t seconds =3D i - JAN_1970;
+-              struct tm *tm;
+               char time_buf[128];
+
+-              tm =3D localtime(&seconds);
+-              strftime(time_buf, sizeof (time_buf), "%Y/%m/%d %H:%M:%S", =
tm);
+-              ND_PRINT(" (%s)", time_buf);
++              ND_PRINT(" (%s)",
++                  nd_format_time(time_buf, sizeof (time_buf), "%Y/%m/%d %=
H:%M:%S",
++                    localtime(&seconds)));
+       }
+ #endif
+ }
+diff --git a/smbutil.c b/smbutil.c
+index 7f609f7..f33a323 100644
+--- a/smbutil.c
++++ b/smbutil.c
+@@ -768,9 +768,8 @@ smb_fdata1(netdissect_options *ndo,
+       case 'T':
+         {
+           time_t t;
+-          struct tm *lt;
+           const char *tstring;
+-          char buffer[sizeof("Www Mmm dd hh:mm:ss yyyy\n")];
++          char buffer[sizeof("Www Mmm dd hh:mm:ss yyyyy")];
+           uint32_t x;
+
+           switch (atoi(fmt + 1)) {
+@@ -800,16 +799,11 @@ smb_fdata1(netdissect_options *ndo,
+               break;
+           }
+           if (t !=3D 0) {
+-              lt =3D localtime(&t);
+-              if (lt !=3D NULL) {
+-                  strftime(buffer, sizeof(buffer), "%a %b %e %T %Y%n", lt=
);
+-                  tstring =3D buffer;
+-              }
+-              else
+-                  tstring =3D "(Can't convert time)\n";
++                  tstring =3D nd_format_time(buffer, sizeof(buffer), "%a =
%b %e %T %Y",
++                  localtime(&t));
+           } else
+-              tstring =3D "NULL\n";
+-          ND_PRINT("%s", tstring);
++              tstring =3D "NULL";
++          ND_PRINT("%s\n", tstring);
+           fmt++;
+           while (ND_ASCII_ISDIGIT(*fmt))
+               fmt++;
+diff --git a/tcpdump.c b/tcpdump.c
+index 78d0871..b0f75b9 100644
+--- a/tcpdump.c
++++ b/tcpdump.c
+@@ -843,6 +843,8 @@ MakeFilename(char *buffer, char *orig_name, int cnt, i=
nt max_chars)
+         char *filename =3D malloc(PATH_MAX + 1);
+         if (filename =3D=3D NULL)
+             error("%s: malloc", __func__);
++      if (strlen(orig_name) =3D=3D 0)
++            error("an empty string is not a valid file name");
+
+         /* Process with strftime if Gflag is set. */
+         if (Gflag !=3D 0) {
+@@ -854,9 +856,25 @@ MakeFilename(char *buffer, char *orig_name, int cnt, =
int max_chars)
+           }
+
+           /* There's no good way to detect an error in strftime since a r=
eturn
+-           * value of 0 isn't necessarily failure.
++           *  * value of 0 isn't necessarily failure; if orig_name is an =
empty
++           * string, the formatted string will be empty.
++           *
++           * However, the C90 standard says that, if there *is* a
++           * buffer overflow, the content of the buffer is undefined,
++           * so we must check for a buffer overflow.
++           *
++           * So we check above for an empty orig_name, and only call
++           * strftime() if it's non-empty, in which case the return
++           * value will only be 0 if the formatted date doesn't fit
++           * in the buffer.
++           *
++           * (We check above because, even if we don't use -G, we
++           * want a better error message than "tcpdump: : No such
++           * file or directory" for this case.)
+            */
+-          strftime(filename, PATH_MAX, orig_name, local_tm);
++          if (strftime(filename, PATH_MAX, orig_name, local_tm) =3D=3D 0)=
 {
++            error("%s: strftime", __func__);
++          }
+         } else {
+           strncpy(filename, orig_name, PATH_MAX);
+         }
+diff --git a/util-print.c b/util-print.c
+index 8b20649..fea6b19 100644
+--- a/util-print.c
++++ b/util-print.c
+@@ -230,7 +230,8 @@ ts_date_hmsfrac_print(netdissect_options *ndo, long se=
c, long usec,
+ {
+       time_t Time =3D sec;
+       struct tm *tm;
+-      char timestr[32];
++      char timebuf[32];
++      const char *timestr;
+
+       if ((unsigned)sec & 0x80000000) {
+               ND_PRINT("[Error converting time]");
+@@ -242,14 +243,14 @@ ts_date_hmsfrac_print(netdissect_options *ndo, long =
sec, long usec,
+       else
+               tm =3D gmtime(&Time);
+
+-      if (!tm) {
+-              ND_PRINT("[Error converting time]");
+-              return;
++
++      if (date_flag =3D=3D WITH_DATE) {
++              timestr =3D nd_format_time(timebuf, sizeof(timebuf),
++                  "%Y-%m-%d %H:%M:%S", tm);
++      } else {
++              timestr =3D nd_format_time(timebuf, sizeof(timebuf),
++                  "%H:%M:%S", tm);
+       }
+-      if (date_flag =3D=3D WITH_DATE)
+-              strftime(timestr, sizeof(timestr), "%Y-%m-%d %H:%M:%S", tm)=
;
+-      else
+-              strftime(timestr, sizeof(timestr), "%H:%M:%S", tm);
+       ND_PRINT("%s", timestr);
+
+       ts_frac_print(ndo, usec);
+@@ -404,6 +405,25 @@ signed_relts_print(netdissect_options *ndo,
+       }
+       unsigned_relts_print(ndo, secs);
+ }
++/*
++ * Format a struct tm with strftime().
++ * If the pointer to the struct tm is null, that means that the
++ * routine to convert a time_t to a struct tm failed; the localtime()
++ * and gmtime() in the Microsoft Visual Studio C library will fail,
++ * returning null, if the value is before the UNIX Epoch.
++ */
++const char *
++nd_format_time(char *buf, size_t bufsize, const char *format,
++         const struct tm *timeptr)
++{
++      if (timeptr !=3D NULL) {
++              if (strftime(buf, bufsize, format, timeptr) !=3D 0)
++                      return (buf);
++              else
++                      return ("[nd_format_time() buffer is too small]");
++      } else
++              return ("[localtime() or gmtime() couldn't convert the date=
 and time]");
++}
+
+ /* Print the truncated string */
+ void nd_print_trunc(netdissect_options *ndo)
+--
+2.40.0
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb b/me=
ta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
index 03f1b76f9..dfb408dcd 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
@@ -24,6 +24,7 @@ SRC_URI =3D " \
     http://www.tcpdump.org/release/${BP}.tar.gz \
     file://add-ptest.patch \
     file://run-ptest \
+    file://CVE-2023-1801.patch \
 "

 SRC_URI[sha256sum] =3D "ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528a169315e49=
9c6861952e73b3"
--
2.40.0


--_000_BY1PR11MB8005CB9F40F82DE806AF3844E534ABY1PR11MB8005namp_
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
Hi&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Please ignore it .</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Meenali</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Meenali Gupta via lists.openembedded.org
 &lt;meenali.gupta=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Friday, July 14, 2023 4:57 PM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> [oe][meta-networking[mickledore][PATCH 1/1] fix: CVE-2023-1=
801</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Meenali Gupta &lt;mgupta1@blr-linux-engg1.wr=
s.com&gt;<br>
<br>
The SMB protocol decoder in tcpdump version 4.99.3 can perform<br>
an out-of-bounds write when decoding a crafted network packet<br>
<br>
Signed-off-by: Meenali Gupta &lt;mgupta1@blr-linux-engg1.wrs.com&gt;<br>
---<br>
&nbsp;.../tcpdump/tcpdump/CVE-2023-1801.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 342 ++++++++++++++++++<br>
&nbsp;.../recipes-support/tcpdump/tcpdump_4.99.3.bb |&nbsp;&nbsp; 1 +<br>
&nbsp;2 files changed, 343 insertions(+)<br>
&nbsp;create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/CV=
E-2023-1801.patch<br>
<br>
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2023-1801.=
patch b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2023-1801.patch=
<br>
new file mode 100644<br>
index 000000000..03a1c0aa4<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2023-1801.patch<b=
r>
@@ -0,0 +1,342 @@<br>
+From 13336c4054015bef84d93bf51b50b15df6e265bf Mon Sep 17 00:00:00 2001<br>
+From: Guy Harris &lt;gharris@sonic.net&gt;<br>
+Date: Mon, 30 Jan 2023 23:03:16 -0800<br>
+Subject: [PATCH] tcpdump: Have a common routine for converting dates and t=
imes<br>
+ to strings.<br>
+<br>
+Have a routine that takes a buffer, a strftime format, and a struct tm *<b=
r>
+as arguments, and:<br>
+<br>
+* checks whether the struct tm * is null and, if so, returns a string<br>
+indicating that the date and time couldn't be converted;<br>
+<br>
+* otherwise, passes it to strftime(), along with the buffer and the<br>
+format argument and, if strftime() returns 0, meaning the string didn't<br=
>
+fit into the buffer and thus that the buffer's contents are undefined,<br>
+returns a string indicating that the date and time didn't fit into the<br>
+buffer;<br>
+<br>
+* otherwise, returns a pointer to the buffer.<br>
+<br>
+Call that routine instead of directly calling strftime() in printers;<br>
+that prevents printing a buffer with undefined data if the buffer isn't<br=
>
+big enough for the string.<br>
+<br>
+Also, when generating file names using an strftime format, check the<br>
+return value of strftime() to make sure the buffer didn't overflow.<br>
+<br>
+Upstream-Status: Backport[<a href=3D"https://github.com/the-tcpdump-group/=
tcpdump/commit/03c037bbd75588beba3ee09f26d17783d21e30bc">https://github.com=
/the-tcpdump-group/tcpdump/commit/03c037bbd75588beba3ee09f26d17783d21e30bc<=
/a>]<br>
+CVE: CVE-2023-1801<br>
+<br>
+Signed-off-by: Meenali Gupta &lt;mgupta1@blr-linux-engg1.wrs.com&gt;<br>
+---<br>
+ netdissect.h&nbsp;&nbsp; |&nbsp; 3 +++<br>
+ ntp.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 21 ++++++--=
-------------<br>
+ print-ahcp.c&nbsp;&nbsp; | 12 ++++--------<br>
+ print-arista.c | 13 ++++---------<br>
+ print-rx.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 ++++----<br>
+ print-zep.c&nbsp;&nbsp;&nbsp; |&nbsp; 7 +++----<br>
+ smbutil.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 16 +++++-----------<br>
+ tcpdump.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 22 ++++++++++++++++++++--<br>
+ util-print.c&nbsp;&nbsp; | 36 ++++++++++++++++++++++++++++--------<br>
+ 9 files changed, 77 insertions(+), 61 deletions(-)<br>
+<br>
+diff --git a/netdissect.h b/netdissect.h<br>
+index 5c16be6..b1074ef 100644<br>
+--- a/netdissect.h<br>
++++ b/netdissect.h<br>
+@@ -423,6 +423,9 @@ extern void ts_print(netdissect_options *, const struc=
t timeval *);<br>
+ extern void signed_relts_print(netdissect_options *, int32_t);<br>
+ extern void unsigned_relts_print(netdissect_options *, uint32_t);<br>
+<br>
++extern const char *nd_format_time(char *buf, size_t bufsize,<br>
++&nbsp;&nbsp;&nbsp; const char *format, const struct tm *timeptr);<br>
++<br>
+ extern void fn_print_char(netdissect_options *, u_char);<br>
+ extern void fn_print_str(netdissect_options *, const u_char *);<br>
+ extern u_int nd_printztn(netdissect_options *, const u_char *, u_int, con=
st u_char *);<br>
+diff --git a/ntp.c b/ntp.c<br>
+index 4d17932..0a79f81 100644<br>
+--- a/ntp.c<br>
++++ b/ntp.c<br>
+@@ -55,8 +55,8 @@ p_ntp_time(netdissect_options *ndo,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (i) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int64_t secon=
ds_64bit =3D (int64_t)i - JAN_1970;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; time_t second=
s;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct tm *tm;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char time_buf=
[128];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *time_s=
tring;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seconds =3D (=
time_t)seconds_64bit;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (seconds !=
=3D seconds_64bit) {<br>
+@@ -64,22 +64,13 @@ p_ntp_time(netdissect_options *ndo,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * It doesn't fit into a time_t, so we can't hand it<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * to gmtime.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ND_PRINT(&quot; (unrepresentable)&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; time_string =3D &quot;[Time is too large to fit into a time_t]&quot;;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; tm =3D gmtime(&amp;seconds);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (tm =3D=3D NULL) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * gmtime() can't handle it.<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (Yes, that might happen with some ver=
sion of<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Microsoft's C library.)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ND_PRINT(&quot; (unrepresentable)&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; } else {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* use ISO 8601 (RFC3339) format */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strftime(time_buf, sizeof (time_buf), &quot;%=
Y-%m-%dT%H:%M:%SZ&quot;, tm);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ND_PRINT(&quot; (%s)&quot;, time_buf);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* use ISO 8601 (RFC3339) format */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; time_string =3D nd_format_time(time_buf, sizeof (time_buf),<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &quot;%Y-%m-%dT%H:%M:%SZ&quot;, gmtime(&amp;seconds));<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ND_PRINT(&quot; (%=
s)&quot;, time_string);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ #endif<br>
+ }<br>
+diff --git a/print-ahcp.c b/print-ahcp.c<br>
+index 9859f76..d57edda 100644<br>
+--- a/print-ahcp.c<br>
++++ b/print-ahcp.c<br>
+@@ -102,18 +102,14 @@ ahcp_time_print(netdissect_options *ndo,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; const u_char *cp, uint8_t len)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; time_t t;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct tm *tm;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buf[BUFSIZE];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buf[sizeof(&quot;-yyyyyyyyyy-mm-dd hh=
:mm:ss UTC&quot;)];<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (len !=3D 4)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto invalid;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t =3D GET_BE_U_4(cp);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (NULL =3D=3D (tm =3D gmtime(&amp;t)))<b=
r>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ND_PRINT(&quot;: gmtime() error&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (0 =3D=3D strftime(buf, sizeof(buf=
), &quot;%Y-%m-%d %H:%M:%S&quot;, tm))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ND_PRINT(&quot;: strftime() error&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ND_PRINT(&quot;: %s UTC&quot;, buf);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ND_PRINT(&quot;: %s&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nd_format_time(buf=
, sizeof(buf), &quot;%Y-%m-%d %H:%M:%S UTC&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gmtime=
(&amp;t)));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
+<br>
+ invalid:<br>
+diff --git a/print-arista.c b/print-arista.c<br>
+index 039a1ff..079ad68 100644<br>
+--- a/print-arista.c<br>
++++ b/print-arista.c<br>
+@@ -10,7 +10,6 @@<br>
+<br>
+ #include &quot;netdissect.h&quot;<br>
+ #include &quot;extract.h&quot;<br>
+-#include &quot;addrtoname.h&quot;<br>
+<br>
+ /*<br>
+<br>
+@@ -93,17 +92,13 @@ arista_print_date_hms_time(netdissect_options *ndo, ui=
nt32_t seconds,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; uint32_t nanoseconds)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; time_t ts;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct tm *tm;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buf[BUFSIZE];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buf[sizeof(&quot;-yyyyyyyyyy-mm-dd hh=
:mm:ss&quot;)];<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ts =3D seconds + (nanoseconds / 10000=
00000);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nanoseconds %=3D 1000000000;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (NULL =3D=3D (tm =3D gmtime(&amp;ts)))<=
br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ND_PRINT(&quot;gmtime() error&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (0 =3D=3D strftime(buf, sizeof(buf=
), &quot;%Y-%m-%d %H:%M:%S&quot;, tm))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ND_PRINT(&quot;strftime() error&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ND_PRINT(&quot;%s.%09u&quot;, buf, nanoseconds);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ND_PRINT(&quot;%s.%09u&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nd_format_time(buf=
, sizeof(buf), &quot;%Y-%m-%d %H:%M:%S&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
gmtime(&amp;ts)), nanoseconds);<br>
+ }<br>
+<br>
+ int<br>
+diff --git a/print-rx.c b/print-rx.c<br>
+index 3f7589e..dbef71c 100644<br>
+--- a/print-rx.c<br>
++++ b/print-rx.c<br>
+@@ -794,12 +794,12 @@ rx_cache_find(netdissect_options *ndo, const struct =
rx_header *rxh,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ND_PRINT(&quot; =
%&quot; PRIu64, _i); \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+<br>
+-#define DATEOUT() { time_t _t; struct tm *tm; char str[256]; \<br>
++#define DATEOUT() { time_t _t; char str[256]; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _t =3D (time_t) =
GET_BE_S_4(bp); \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bp +=3D sizeof(i=
nt32_t); \<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tm =3D localtime(&amp=
;_t); \<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strftime(str, 256, &q=
uot;%Y/%m/%d %H:%M:%S&quot;, tm); \<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ND_PRINT(&quot; %s&qu=
ot;, str); \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ND_PRINT(&quot; %s&qu=
ot;, \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; nd_format_time(str, sizeof(str), \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &quot;%Y/%m/%d %H:%M:%S&quot;, localtime(&amp;_t))); \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+<br>
+ #define STOREATTROUT() { uint32_t mask, _i; \<br>
+diff --git a/print-zep.c b/print-zep.c<br>
+index fd74368..642b240 100644<br>
+--- a/print-zep.c<br>
++++ b/print-zep.c<br>
+@@ -83,12 +83,11 @@ static void zep_print_ts(netdissect_options *ndo, cons=
t u_char *p)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (i) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; time_t seconds =3D i - JAN_1970;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; struct tm *tm;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; char time_buf[128];<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; tm =3D localtime(&amp;seconds);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; strftime(time_buf, sizeof (time_buf), &quot;%Y/%m/%d %H:%M:%S&quot;, =
tm);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ND_PRINT(&quot; (%s)&quot;, time_buf);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ND_PRINT(&quot; (%s)&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nd_format_time(time_buf, sizeof (time_buf), &=
quot;%Y/%m/%d %H:%M:%S&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; localtime(&amp;seconds)));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ #endif<br>
+ }<br>
+diff --git a/smbutil.c b/smbutil.c<br>
+index 7f609f7..f33a323 100644<br>
+--- a/smbutil.c<br>
++++ b/smbutil.c<br>
+@@ -768,9 +768,8 @@ smb_fdata1(netdissect_options *ndo,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 'T':<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; time_t t;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct tm *lt;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *t=
string;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buffer[sizeof=
(&quot;Www Mmm dd hh:mm:ss yyyy\n&quot;)];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buffer[sizeof=
(&quot;Www Mmm dd hh:mm:ss yyyyy&quot;)];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t x;<b=
r>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (atoi(=
fmt + 1)) {<br>
+@@ -800,16 +799,11 @@ smb_fdata1(netdissect_options *ndo,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (t !=3D 0)=
 {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; lt =3D localtime(&amp;t);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (lt !=3D NULL) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strftime(buffer, sizeof(buffer), &quot;%a %b =
%e %T %Y%n&quot;, lt);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tstring =3D buffer;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tstring =3D &quot;(Can't convert time)\n&quot=
;;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tstring =3D nd_format_time(buffer, sizeof(buf=
fer), &quot;%a %b %e %T %Y&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; localtime(&amp;t));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; tstring =3D &quot;NULL\n&quot;;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ND_PRINT(&quot;%s&=
quot;, tstring);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; tstring =3D &quot;NULL&quot;;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ND_PRINT(&quot;%s\=
n&quot;, tstring);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fmt++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (ND_ASC=
II_ISDIGIT(*fmt))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fmt++;<br>
+diff --git a/tcpdump.c b/tcpdump.c<br>
+index 78d0871..b0f75b9 100644<br>
+--- a/tcpdump.c<br>
++++ b/tcpdump.c<br>
+@@ -843,6 +843,8 @@ MakeFilename(char *buffer, char *orig_name, int cnt, i=
nt max_chars)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *filename =3D malloc=
(PATH_MAX + 1);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (filename =3D=3D NULL)=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e=
rror(&quot;%s: malloc&quot;, __func__);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strlen(orig_name) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error(=
&quot;an empty string is not a valid file name&quot;);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Process with strftime =
if Gflag is set. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (Gflag !=3D 0) {<br>
+@@ -854,9 +856,25 @@ MakeFilename(char *buffer, char *orig_name, int cnt, =
int max_chars)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* There's no=
 good way to detect an error in strftime since a return<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * value of 0=
 isn't necessarily failure.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp; * va=
lue of 0 isn't necessarily failure; if orig_name is an empty<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * string, th=
e formatted string will be empty.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * However, t=
he C90 standard says that, if there *is* a<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * buffer ove=
rflow, the content of the buffer is undefined,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * so we must=
 check for a buffer overflow.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * So we chec=
k above for an empty orig_name, and only call<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * strftime()=
 if it's non-empty, in which case the return<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * value will=
 only be 0 if the formatted date doesn't fit<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * in the buf=
fer.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (We check =
above because, even if we don't use -G, we<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * want a bet=
ter error message than &quot;tcpdump: : No such<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * file or di=
rectory&quot; for this case.)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strftime(filename,=
 PATH_MAX, orig_name, local_tm);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strftime(filen=
ame, PATH_MAX, orig_name, local_tm) =3D=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error(=
&quot;%s: strftime&quot;, __func__);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strncpy(filen=
ame, orig_name, PATH_MAX);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+diff --git a/util-print.c b/util-print.c<br>
+index 8b20649..fea6b19 100644<br>
+--- a/util-print.c<br>
++++ b/util-print.c<br>
+@@ -230,7 +230,8 @@ ts_date_hmsfrac_print(netdissect_options *ndo, long se=
c, long usec,<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; time_t Time =3D sec;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct tm *tm;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char timestr[32];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char timebuf[32];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *timestr;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((unsigned)sec &amp; 0x80000000) {=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ND_PRINT(&quot;[Error converting time]&quot;);<br>
+@@ -242,14 +243,14 @@ ts_date_hmsfrac_print(netdissect_options *ndo, long =
sec, long usec,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; tm =3D gmtime(&amp;Time);<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!tm) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ND_PRINT(&quot;[Error converting time]&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (date_flag =3D=3D WITH_DATE) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; timestr =3D nd_format_time(timebuf, sizeof(timebuf),<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%Y-%m-%d %H:%M:%S&quot;, tm);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; timestr =3D nd_format_time(timebuf, sizeof(timebuf),<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%H:%M:%S&quot;, tm);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (date_flag =3D=3D WITH_DATE)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; strftime(timestr, sizeof(timestr), &quot;%Y-%m-%d %H:%M:%S&quot;, tm)=
;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; strftime(timestr, sizeof(timestr), &quot;%H:%M:%S&quot;, tm);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ND_PRINT(&quot;%s&quot;, timestr);<br=
>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ts_frac_print(ndo, usec);<br>
+@@ -404,6 +405,25 @@ signed_relts_print(netdissect_options *ndo,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned_relts_print(ndo, secs);<br>
+ }<br>
++/*<br>
++ * Format a struct tm with strftime().<br>
++ * If the pointer to the struct tm is null, that means that the<br>
++ * routine to convert a time_t to a struct tm failed; the localtime()<br>
++ * and gmtime() in the Microsoft Visual Studio C library will fail,<br>
++ * returning null, if the value is before the UNIX Epoch.<br>
++ */<br>
++const char *<br>
++nd_format_time(char *buf, size_t bufsize, const char *format,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct tm *timeptr=
)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (timeptr !=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (strftime(buf, bufsize, format, timeptr) !=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (buf);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (&quot;[nd_for=
mat_time() buffer is too small]&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return (&quot;[localtime() or gmtime() couldn't convert the date and =
time]&quot;);<br>
++}<br>
+<br>
+ /* Print the truncated string */<br>
+ void nd_print_trunc(netdissect_options *ndo)<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb b/me=
ta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb<br>
index 03f1b76f9..dfb408dcd 100644<br>
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb<br>
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb<br>
@@ -24,6 +24,7 @@ SRC_URI =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"http://www.tcpdump.org/release/${BP}.ta=
r.gz">http://www.tcpdump.org/release/${BP}.tar.gz</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://add-ptest.patch">file://add-ptes=
t.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://run-ptest">file://run-ptest</a> =
\<br>
+&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2023-1801.patch">file://CVE-2023-=
1801.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528=
a169315e499c6861952e73b3&quot;<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BY1PR11MB8005CB9F40F82DE806AF3844E534ABY1PR11MB8005namp_--

