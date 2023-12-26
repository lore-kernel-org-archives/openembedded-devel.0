Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA5CC46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 09:47:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.78494.1703584021315012223
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Dec 2023 01:47:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PnxDUCdG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07249f857e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BQ9b1Wv002359
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 01:47:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-type:mime-version; s=
	PPS06212021; bh=LN0o7CkrhmyvJIv4Hnf770R2jQeT9qH9H9tbTg3M2Vw=; b=
	PnxDUCdGp2oIEBk1DpBTmCEqDv4x/mfIGFpqmgINt8KkXro+eTDk8w578laGx69B
	dHwGKRgHXFz4L5WncOnIRYffo6nbo1xhOqlr3+Mb8tVRp+BtvLiONCeSPwaxcex5
	EHhAw0Ml6Z1zoCn/Y0QwyeT+C/yhP+z82U9fQJ5LYzc0ySWMLuK/mkD5WpNVICBQ
	FmAin6uLkb46bb8/vG1EqrKLPizhHrlxtmETH/dvj52QZE0nHSL0iQqSzR2Fh9mr
	7QCW1x+m/tuD4YsVyo9gh8So+EJLlxBg7zuNstsfMlMZ6L4bBHn/Tf40pqPrFdiH
	I6LBWWZ5ORQDEL4RhH3JoA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5yxm1wsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 01:47:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZT7ai54oSyxu5JUg015pc22VijzM1cA3j3L47y1berQRPNoqO3YjsluFVsg/eUPR55081ZqBYcPy1cwppzFvNa2HHhK8oBlM/xGgZwuEQCosPz7TG/mqbF292MplJ664m4LGJfqiU8lYU2e0OXV5qEbxfTDr2Gyea1STrAQpKwGjIrK1H41GyiUQZ1WO1h+y1pic1hY+rfeEoG/tsbTb0a2iNiGwx/Y3BGwGJ9HfMi7yk+o62d1KTcZG9uDxligI8xwxd/h6O+akcxKAjE5NawdObPeaqbHVKLaYlfTyln573oF/7/mpEZf6et22ufKACXGJupdjtJAUVJ+XFLdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LN0o7CkrhmyvJIv4Hnf770R2jQeT9qH9H9tbTg3M2Vw=;
 b=LnHexPPMSXq4ZG/lK7Qa8jO91VDtccgf4u8uwBtdH+afwbcc8ceLldkYXpEleU3PKvPfmti3CHloqjVKT/niXeCR5a/zsYitlR8sqlyOboaWFQwLrarZ39p2VdxR5rjSqdwO/GgGvYLRHORV/h8eHmcOM3zh8VSFbbSGx0QUb0tpVRcRFbNM7pbPmD/holERJGiqx/j1YySWAr3YgLVYbga4jUyTDmxMIJNDWIgQhblPx3DLgLNDOGZD4MtekNWUEUiosm2WvCtUnRV5Oa8vrIAFUEc45FRbuojPyo72ZIhE9dJG8CIz0rf7NxsOrTEhJdxi3pBw8RA3lXLCcQUxlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by PH7PR11MB5982.namprd11.prod.outlook.com (2603:10b6:510:1e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Tue, 26 Dec
 2023 09:46:56 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::d836:9049:e781:2391]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::d836:9049:e781:2391%5]) with mapi id 15.20.7113.027; Tue, 26 Dec 2023
 09:46:56 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][kirkstone][PATCH 2/2] samba: fix CVE-2023-42669
Thread-Topic: [oe][meta-networking][kirkstone][PATCH 2/2] samba: fix
 CVE-2023-42669
Thread-Index: AQHaN94FAFstaS9YV0OLRavlKSde3A==
Date: Tue, 26 Dec 2023 09:46:55 +0000
Message-ID: 
 <MW4PR11MB5822488F48F470CEB3737C7C8498A@MW4PR11MB5822.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|PH7PR11MB5982:EE_
x-ms-office365-filtering-correlation-id: d1eff985-8f2b-4ef8-7fe5-08dc05f798aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /Mn66KX1bVhnLG/X45sOo4R8cjM7lKXzt3OyCZ08lQyvx4kQeApGlhEyEbT8+RB1Gog+WAyrIki9cfOUPrPbjguYNP8oYA0/gF1p2g7vA+ww0vkeI89IJr8N0YOH6jb+BuJkEtYSARfKNi0ceESwRv3C652kLRj5D8+fDsj/I150sM877Y5iKEuhnggP6hnqDYNi+qTpyKC8C03pitHej09EoSvWMhOFGpTD1XAvqDrshTC56uwsfeR2WexrPjmdKjjybzXN3Cy11+hp6b87Znl5L4h+1Tjq2nOLiIPXl14YryUJUJNHbfvS/iXWcZ6EXo30PXHhPKL9VIfeGog1NhpccOpWXX08EzjkQ0GH0ON+LxeV2AUlTbB8u79bDcUt92QRdAAOUurGPuD7fF0aPe0DiLxuE/0cuYOrs4FCW3/pQqOhe0h0laUYxQ/pghoBxnvro2PbgKMZngTGTHSZBsXNSG1eVeKAsp3cMH9mPEwoC8j6WibgQcBmSLeSGv95VzxVzITPuxYf2Z3+EDM+HnaG0IVvc2cVEFlfTwGRiHU8ZWbQHfcvUrL0w+4W7cwvRdoxRJo0pmwzLBVh2kboEf4XMd+mba3sbFXq1VjJcEU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(39850400004)(366004)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(33656002)(6916009)(91956017)(76116006)(66946007)(66476007)(64756008)(66446008)(66556008)(7696005)(6506007)(9686003)(55236004)(966005)(478600001)(38070700009)(71200400001)(66574015)(83380400001)(26005)(122000001)(86362001)(55016003)(38100700002)(19627405001)(2906002)(5660300002)(41300700001)(8936002)(8676002)(316002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?4bPE7o/napNHPsmcAgpBmJPCF+nrYz/02qw5z9TQSrIZmdHyzSM85jnIts?=
 =?iso-8859-1?Q?LjCVNU5PVW0c3fhHoyn2AQhyEo1FiRFhKrDVs6FBqIYwjEx2lIKezBDP9Z?=
 =?iso-8859-1?Q?BOL9WERW7ksAppGdu3E7r5+JfNTxGUJmSoiarsnc+k7J5G8yAT92oKno4U?=
 =?iso-8859-1?Q?Te8lnvU+icmr3rtplfHQOOu8FOfjyqDsbz/5uJ/l8DCaeNB9eFFQBkItpq?=
 =?iso-8859-1?Q?/+ux1VVHeIm2EFY+HFuWRsCFs6nFZarPnQNCg53c2HTM8KpcRSQKPPGlzB?=
 =?iso-8859-1?Q?4g0yCWc0LycDRYUxSZ2spqGszYthabi+n/Zz2tfH7PjzlhA6iMBXgozvXK?=
 =?iso-8859-1?Q?DOHskkyQjoPDJBR/GDTvZENiqsraFOH9kFIjuMvNlD7xARK+35K7BHUy2K?=
 =?iso-8859-1?Q?1C6Qjw5EqwabLQxvvPoaxqYlHI38ZOiJin1wTvupVNH9aqbscrP7DdIn/8?=
 =?iso-8859-1?Q?vhTWQkpDlNzBDUCm1Uk7tQe/EtBqrCWHdgd4+ZJMb2nolMBOcz0Vv3wtCZ?=
 =?iso-8859-1?Q?MekiGzeNF78QnBn165mB8btN4MLkFI/HDbHOFinRvQn3UzBISw86vtZ12s?=
 =?iso-8859-1?Q?QSTxdMA/1Xm/4BXaJsyrHEQyG/VW7h4aJYS0eRB8OFK6oAdwRep8vQJ6VF?=
 =?iso-8859-1?Q?8jc2ij4zM7xrXIYS4HJq3a71HP19wbMZZbN3r++OCIqtaQKeuYRwaF75zD?=
 =?iso-8859-1?Q?i5TVmRX/cBxY0fW1HYxdriyWViFOyLPQ3rvmEydF8DrcFSgFmOSNbWpH9w?=
 =?iso-8859-1?Q?dZe1L1gUNm8NTSuwJbZPEDLpu/PpwUDipuSI22f2yBJNvaBtU14xr/M/1r?=
 =?iso-8859-1?Q?gKdSLzB/Qnf+29Jmn8EVx9LquwdQCRF4mRbFwFg2DgFwDR/J8bJ+FiAi2D?=
 =?iso-8859-1?Q?UZUE94nTRGKmbisWDv1VCXk07oZ8naKh/eaKDRvtgnj9SPiffCbwoi25zK?=
 =?iso-8859-1?Q?dq3XviQ89Ivcb7HvAQO416MhtrW6YniiEkyoMkdOojq5W7gaSPw3sZcJjZ?=
 =?iso-8859-1?Q?Lf0niE/d8SdwPzGJz1KIWAbQ10O3Hw+uWJNRsnRB7LYS2urDY06MVLioRq?=
 =?iso-8859-1?Q?M3xTzm5rlcBFCzrEtvD7ZMQCrO67g5DM52uzq1R5pPtxP+cf71VKGWVOik?=
 =?iso-8859-1?Q?wF4ai5Sv0NY28ZJFD0qZFx4ARZbicRl2He4iifL7p7kOILhIyGkrksEsD2?=
 =?iso-8859-1?Q?XlS0EnIHxqA9KbdbLkUZQ0KKWN43FgMXuoFBwrxTu+A9AvZPKXRuM+dGZt?=
 =?iso-8859-1?Q?9T71GYGr8cXOw3LAYxKu2NU9NdNeQPooWG+GjsxpG7KoXhnKAdlv6fzqwv?=
 =?iso-8859-1?Q?SFow8wrIa/0bZ4zcBOiC+iZ78avlRess+5yp4wpSSVW/ZHSXRbRjtOQMJJ?=
 =?iso-8859-1?Q?qPcvbVAsIpLeb9+IqIAUroXS0a5QWlUV1yZAVODgj59Pjv1KhJHMNPTvh5?=
 =?iso-8859-1?Q?aiTH6t8A03fIvrIRerCQ8Ryf5VSvYi5U+5sT+HUp5FgJ2ANMooMMIUkFM2?=
 =?iso-8859-1?Q?oGGN85VnyH9/kf7yTKiRR/qOTpgRCfjLlL3FLICCnaS0AQrYI9yWUgWyqx?=
 =?iso-8859-1?Q?k+YKUnTIE+6DLms64fnqYy8KvNYdOXiEJ8iFqidiryXp0aKDXMWAaXRI0c?=
 =?iso-8859-1?Q?VzkytU2aTVhu/W266us5H9mIoNtGusorbCN8FtdCTiAI+Owd2lUEiOsw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB5822488F48F470CEB3737C7C8498AMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1eff985-8f2b-4ef8-7fe5-08dc05f798aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2023 09:46:55.5890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nORvXnM2PEwZSnaPSkEJFDG4IpDMmr08U+ARIHmRqqOGudVtWBQcAl0XAhQPNpgxEc3qFVZGGXchXj85mbxSCrKrvEZTgzI7gUyOPiqO8fAPIMe1x8Q7ouc7G+LXXqq3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5982
X-Proofpoint-GUID: yrv5AP5eoj4DtoQxhHvcPsIJUy7udP_t
X-Proofpoint-ORIG-GUID: yrv5AP5eoj4DtoQxhHvcPsIJUy7udP_t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312260072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 09:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107809

--_000_MW4PR11MB5822488F48F470CEB3737C7C8498AMW4PR11MB5822namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reminder!

Kindly merge this Patch.

Regards,
Archana

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability was found in Samba's "rpcecho" development server, a non-Wi=
ndows
RPC server used to test Samba's DCE/RPC stack elements. This vulnerability =
stems
from an RPC function that can be blocked indefinitely. The issue arises bec=
ause
the "rpcecho" service operates with only one worker in the main RPC task, a=
llowing
calls to the "rpcecho" server to be blocked for a specified time, causing s=
ervice
disruptions. This disruption is triggered by a "sleep()" call in the "dcesr=
v_echo_TestSleep()"
function under specific conditions. Authenticated users or attackers can ex=
ploit this
vulnerability to make calls to the "rpcecho" server, requesting it to block=
 for a
specified duration, effectively disrupting most services and leading to a c=
omplete
denial of service on the AD DC. The DoS affects all other services as "rpce=
cho" runs
in the main RPC task.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-42669

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2023-42669.patch          | 94 +++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
23-42669.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-4266=
9.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-42669.p=
atch
new file mode 100644
index 000000000..dfa6aeb02
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-42669.patch
@@ -0,0 +1,94 @@
+From 9989568b20c8f804140c22f51548d766a18ed887 Mon Sep 17 00:00:00 2001
+From: Andrew Bartlett <abartlet@samba.org>
+Date: Tue, 12 Sep 2023 18:59:44 +1200
+Subject: [PATCH] CVE-2023-42669 s4-rpc_server: Disable rpcecho server by
+ default
+
+The rpcecho server is useful in development and testing, but should never
+have been allowed into production, as it includes the facility to
+do a blocking sleep() in the single-threaded rpc worker.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15474
+
+Signed-off-by: Andrew Bartlett <abartlet@samba.org>
+
+CVE: CVE-2023-42669
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/9989=
568b20c8f804140c22f51548d766a18ed887]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ docs-xml/smbdotconf/protocol/dcerpcendpointservers.xml | 2 +-
+ lib/param/loadparm.c                                   | 2 +-
+ selftest/target/Samba4.pm                              | 2 +-
+ source3/param/loadparm.c                               | 2 +-
+ source4/rpc_server/wscript_build                       | 3 ++-
+ 5 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/docs-xml/smbdotconf/protocol/dcerpcendpointservers.xml b/docs=
-xml/smbdotconf/protocol/dcerpcendpointservers.xml
+index 8a217cc..c6642b7 100644
+--- a/docs-xml/smbdotconf/protocol/dcerpcendpointservers.xml
++++ b/docs-xml/smbdotconf/protocol/dcerpcendpointservers.xml
+@@ -6,6 +6,6 @@
+       <para>Specifies which DCE/RPC endpoint servers should be run.</para=
>
+ </description>
+
+-<value type=3D"default">epmapper, wkssvc, rpcecho, samr, netlogon, lsarpc=
, drsuapi, dssetup, unixinfo, browser, eventlog6, backupkey, dnsserver</val=
ue>
++<value type=3D"default">epmapper, wkssvc, samr, netlogon, lsarpc, drsuapi=
, dssetup, unixinfo, browser, eventlog6, backupkey, dnsserver</value>
+ <value type=3D"example">rpcecho</value>
+ </samba:parameter>
+diff --git a/lib/param/loadparm.c b/lib/param/loadparm.c
+index eedfa00..75687f5 100644
+--- a/lib/param/loadparm.c
++++ b/lib/param/loadparm.c
+@@ -2717,7 +2717,7 @@ struct loadparm_context *loadparm_init(TALLOC_CTX *m=
em_ctx)
+       lpcfg_do_global_parameter(lp_ctx, "ntvfs handler", "unixuid default=
");
+       lpcfg_do_global_parameter(lp_ctx, "max connections", "0");
+
+-      lpcfg_do_global_parameter(lp_ctx, "dcerpc endpoint servers", "epmap=
per wkssvc rpcecho samr netlogon lsarpc drsuapi dssetup unixinfo browser ev=
entlog6 backupkey dnsserver");
++      lpcfg_do_global_parameter(lp_ctx, "dcerpc endpoint servers", "epmap=
per wkssvc  samr netlogon lsarpc drsuapi dssetup unixinfo browser eventlog6=
 backupkey dnsserver");
+       lpcfg_do_global_parameter(lp_ctx, "server services", "s3fs rpc nbt =
wrepl ldap cldap kdc drepl winbindd ntp_signd kcc dnsupdate dns");
+       lpcfg_do_global_parameter(lp_ctx, "kccsrv:samba_kcc", "true");
+       /* the winbind method for domain controllers is for both RODC
+diff --git a/selftest/target/Samba4.pm b/selftest/target/Samba4.pm
+index 651faa7..c7b33d2 100755
+--- a/selftest/target/Samba4.pm
++++ b/selftest/target/Samba4.pm
+@@ -773,7 +773,7 @@ sub provision_raw_step1($$)
+       wins support =3D yes
+       server role =3D $ctx->{server_role}
+       server services =3D +echo $services
+-        dcerpc endpoint servers =3D +winreg +srvsvc
++        dcerpc endpoint servers =3D +winreg +srvsvc +rpcecho
+       notify:inotify =3D false
+       ldb:nosync =3D true
+       ldap server require strong auth =3D yes
+diff --git a/source3/param/loadparm.c b/source3/param/loadparm.c
+index 8bcd35f..a99ab35 100644
+--- a/source3/param/loadparm.c
++++ b/source3/param/loadparm.c
+@@ -879,7 +879,7 @@ static void init_globals(struct loadparm_context *lp_c=
tx, bool reinit_globals)
+
+       Globals.server_services =3D str_list_make_v3_const(NULL, "s3fs rpc =
nbt wrepl ldap cldap kdc drepl winbindd ntp_signd kcc dnsupdate dns", NULL)=
;
+
+-      Globals.dcerpc_endpoint_servers =3D str_list_make_v3_const(NULL, "e=
pmapper wkssvc rpcecho samr netlogon lsarpc drsuapi dssetup unixinfo browse=
r eventlog6 backupkey dnsserver", NULL);
++      Globals.dcerpc_endpoint_servers =3D str_list_make_v3_const(NULL, "e=
pmapper wkssvc  samr netlogon lsarpc drsuapi dssetup unixinfo browser event=
log6 backupkey dnsserver", NULL);
+
+       Globals.tls_enabled =3D true;
+       Globals.tls_verify_peer =3D TLS_VERIFY_PEER_AS_STRICT_AS_POSSIBLE;
+diff --git a/source4/rpc_server/wscript_build b/source4/rpc_server/wscript=
_build
+index 8c75672..a2520da 100644
+--- a/source4/rpc_server/wscript_build
++++ b/source4/rpc_server/wscript_build
+@@ -29,7 +29,8 @@ bld.SAMBA_MODULE('dcerpc_rpcecho',
+       source=3D'echo/rpc_echo.c',
+       subsystem=3D'dcerpc_server',
+       init_function=3D'dcerpc_server_rpcecho_init',
+-      deps=3D'ndr-standard events'
++    deps=3D'ndr-standard events',
++    enabled=3Dbld.CONFIG_GET('ENABLE_SELFTEST')
+       )
+
+
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index dcb4d8137..17d12e439 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -51,6 +51,7 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2023-34968_0011.patch \
            file://CVE-2023-4091-0001.patch \
            file://CVE-2023-4091-0002.patch \
+           file://CVE-2023-42669.patch \
            "

 SRC_URI:append:libc-musl =3D " \
--
2.40.0






--_000_MW4PR11MB5822488F48F470CEB3737C7C8498AMW4PR11MB5822namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<pre><div style=3D"text-align: left;" class=3D"elementToProof">Reminder!</d=
iv><div style=3D"text-align: left;" class=3D"elementToProof"><br></div><div=
 style=3D"text-align: left;" class=3D"elementToProof">Kindly merge this Pat=
ch.</div><div style=3D"text-align: left;" class=3D"elementToProof"><br></di=
v><div style=3D"text-align: left;" class=3D"elementToProof">Regards,<div>Ar=
chana</div></div><div style=3D"text-align: left;" class=3D"elementToProof">=
<br></div><div style=3D"text-align: left;" class=3D"elementToProof"><span s=
tyle=3D"letter-spacing: normal; font-size: 12pt; font-weight: 400; color: r=
gb(0, 0, 0);" class=3D"elementToProof">From: Archana Polampalli &lt;archana=
.polampalli@windriver.com&gt;=0A=
=0A=
A vulnerability was found in Samba's &quot;rpcecho&quot; development server=
, a non-Windows=0A=
RPC server used to test Samba's DCE/RPC stack elements. This vulnerability =
stems=0A=
from an RPC function that can be blocked indefinitely. The issue arises bec=
ause=0A=
the &quot;rpcecho&quot; service operates with only one worker in the main R=
PC task, allowing=0A=
calls to the &quot;rpcecho&quot; server to be blocked for a specified time,=
 causing service=0A=
disruptions. This disruption is triggered by a &quot;sleep()&quot; call in =
the &quot;dcesrv_echo_TestSleep()&quot;=0A=
function under specific conditions. Authenticated users or attackers can ex=
ploit this=0A=
vulnerability to make calls to the &quot;rpcecho&quot; server, requesting i=
t to block for a=0A=
specified duration, effectively disrupting most services and leading to a c=
omplete=0A=
denial of service on the AD DC. The DoS affects all other services as &quot=
;rpcecho&quot; runs=0A=
in the main RPC task.=0A=
=0A=
References:=0A=
https://nvd.nist.gov/vuln/detail/CVE-2023-42669=0A=
=0A=
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
=0A=
---=0A=
&nbsp;.../samba/samba/CVE-2023-42669.patch &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| 94 +++++++++++++++++++=0A=
&nbsp;.../samba/samba_4.14.14.bb &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;1 +=0A=
&nbsp;2 files changed, 95 insertions(+)=0A=
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2023-42669.patch=0A=
=0A=
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-4266=
9.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-42669.p=
atch=0A=
new file mode 100644=0A=
index 000000000..dfa6aeb02=0A=
--- /dev/null=0A=
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-42669.patch=
=0A=
@@ -0,0 +1,94 @@=0A=
+From 9989568b20c8f804140c22f51548d766a18ed887 Mon Sep 17 00:00:00 2001=0A=
+From: Andrew Bartlett &lt;abartlet@samba.org&gt;=0A=
+Date: Tue, 12 Sep 2023 18:59:44 +1200=0A=
+Subject: [PATCH] CVE-2023-42669 s4-rpc_server: Disable rpcecho server by=
=0A=
+ default=0A=
+=0A=
+The rpcecho server is useful in development and testing, but should never=
=0A=
+have been allowed into production, as it includes the facility to=0A=
+do a blocking sleep() in the single-threaded rpc worker.=0A=
+=0A=
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15474=0A=
+=0A=
+Signed-off-by: Andrew Bartlett &lt;abartlet@samba.org&gt;=0A=
+=0A=
+CVE: CVE-2023-42669=0A=
+=0A=
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/9989=
568b20c8f804140c22f51548d766a18ed887]=0A=
+=0A=
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
=0A=
+---=0A=
+ docs-xml/smbdotconf/protocol/dcerpcendpointservers.xml | 2 +-=0A=
+ lib/param/loadparm.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 2 +-=
=0A=
+ selftest/target/Samba4.pm &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 2 +-=0A=
+ source3/param/loadparm.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 2 +-=0A=
+ source4/rpc_server/wscript_build &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 3 ++-=0A=
+ 5 files changed, 6 insertions(+), 5 deletions(-)=0A=
+=0A=
+diff --git a/docs-xml/smbdotconf/protocol/dcerpcendpointservers.xml b/docs=
-xml/smbdotconf/protocol/dcerpcendpointservers.xml=0A=
+index 8a217cc..c6642b7 100644=0A=
+--- a/docs-xml/smbdotconf/protocol/dcerpcendpointservers.xml=0A=
++++ b/docs-xml/smbdotconf/protocol/dcerpcendpointservers.xml=0A=
+@@ -6,6 +6,6 @@=0A=
+	&lt;para&gt;Specifies which DCE/RPC endpoint servers should be run.&lt;/p=
ara&gt;=0A=
+ &lt;/description&gt;=0A=
+=0A=
+-&lt;value type=3D&quot;default&quot;&gt;epmapper, wkssvc, rpcecho, samr, =
netlogon, lsarpc, drsuapi, dssetup, unixinfo, browser, eventlog6, backupkey=
, dnsserver&lt;/value&gt;=0A=
++&lt;value type=3D&quot;default&quot;&gt;epmapper, wkssvc, samr, netlogon,=
 lsarpc, drsuapi, dssetup, unixinfo, browser, eventlog6, backupkey, dnsserv=
er&lt;/value&gt;=0A=
+ &lt;value type=3D&quot;example&quot;&gt;rpcecho&lt;/value&gt;=0A=
+ &lt;/samba:parameter&gt;=0A=
+diff --git a/lib/param/loadparm.c b/lib/param/loadparm.c=0A=
+index eedfa00..75687f5 100644=0A=
+--- a/lib/param/loadparm.c=0A=
++++ b/lib/param/loadparm.c=0A=
+@@ -2717,7 +2717,7 @@ struct loadparm_context *loadparm_init(TALLOC_CTX *m=
em_ctx)=0A=
+	lpcfg_do_global_parameter(lp_ctx, &quot;ntvfs handler&quot;, &quot;unixui=
d default&quot;);=0A=
+	lpcfg_do_global_parameter(lp_ctx, &quot;max connections&quot;, &quot;0&qu=
ot;);=0A=
+=0A=
+-	lpcfg_do_global_parameter(lp_ctx, &quot;dcerpc endpoint servers&quot;, &=
quot;epmapper wkssvc rpcecho samr netlogon lsarpc drsuapi dssetup unixinfo =
browser eventlog6 backupkey dnsserver&quot;);=0A=
++	lpcfg_do_global_parameter(lp_ctx, &quot;dcerpc endpoint servers&quot;, &=
quot;epmapper wkssvc &nbsp;samr netlogon lsarpc drsuapi dssetup unixinfo br=
owser eventlog6 backupkey dnsserver&quot;);=0A=
+	lpcfg_do_global_parameter(lp_ctx, &quot;server services&quot;, &quot;s3fs=
 rpc nbt wrepl ldap cldap kdc drepl winbindd ntp_signd kcc dnsupdate dns&qu=
ot;);=0A=
+	lpcfg_do_global_parameter(lp_ctx, &quot;kccsrv:samba_kcc&quot;, &quot;tru=
e&quot;);=0A=
+	/* the winbind method for domain controllers is for both RODC=0A=
+diff --git a/selftest/target/Samba4.pm b/selftest/target/Samba4.pm=0A=
+index 651faa7..c7b33d2 100755=0A=
+--- a/selftest/target/Samba4.pm=0A=
++++ b/selftest/target/Samba4.pm=0A=
+@@ -773,7 +773,7 @@ sub provision_raw_step1($$)=0A=
+	wins support =3D yes=0A=
+	server role =3D $ctx-&gt;{server_role}=0A=
+	server services =3D +echo $services=0A=
+- &nbsp; &nbsp; &nbsp; &nbsp;dcerpc endpoint servers =3D +winreg +srvsvc=
=0A=
++ &nbsp; &nbsp; &nbsp; &nbsp;dcerpc endpoint servers =3D +winreg +srvsvc +=
rpcecho=0A=
+	notify:inotify =3D false=0A=
+	ldb:nosync =3D true=0A=
+	ldap server require strong auth =3D yes=0A=
+diff --git a/source3/param/loadparm.c b/source3/param/loadparm.c=0A=
+index 8bcd35f..a99ab35 100644=0A=
+--- a/source3/param/loadparm.c=0A=
++++ b/source3/param/loadparm.c=0A=
+@@ -879,7 +879,7 @@ static void init_globals(struct loadparm_context *lp_c=
tx, bool reinit_globals)=0A=
+=0A=
+	Globals.server_services =3D str_list_make_v3_const(NULL, &quot;s3fs rpc n=
bt wrepl ldap cldap kdc drepl winbindd ntp_signd kcc dnsupdate dns&quot;, N=
ULL);=0A=
+=0A=
+-	Globals.dcerpc_endpoint_servers =3D str_list_make_v3_const(NULL, &quot;e=
pmapper wkssvc rpcecho samr netlogon lsarpc drsuapi dssetup unixinfo browse=
r eventlog6 backupkey dnsserver&quot;, NULL);=0A=
++	Globals.dcerpc_endpoint_servers =3D str_list_make_v3_const(NULL, &quot;e=
pmapper wkssvc &nbsp;samr netlogon lsarpc drsuapi dssetup unixinfo browser =
eventlog6 backupkey dnsserver&quot;, NULL);=0A=
+=0A=
+	Globals.tls_enabled =3D true;=0A=
+	Globals.tls_verify_peer =3D TLS_VERIFY_PEER_AS_STRICT_AS_POSSIBLE;=0A=
+diff --git a/source4/rpc_server/wscript_build b/source4/rpc_server/wscript=
_build=0A=
+index 8c75672..a2520da 100644=0A=
+--- a/source4/rpc_server/wscript_build=0A=
++++ b/source4/rpc_server/wscript_build=0A=
+@@ -29,7 +29,8 @@ bld.SAMBA_MODULE('dcerpc_rpcecho',=0A=
+	source=3D'echo/rpc_echo.c',=0A=
+	subsystem=3D'dcerpc_server',=0A=
+	init_function=3D'dcerpc_server_rpcecho_init',=0A=
+-	deps=3D'ndr-standard events'=0A=
++ &nbsp; &nbsp;deps=3D'ndr-standard events',=0A=
++ &nbsp; &nbsp;enabled=3Dbld.CONFIG_GET('ENABLE_SELFTEST')=0A=
+	)=0A=
+=0A=
+=0A=
+--=0A=
+2.40.0=0A=
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.14.14.bb=0A=
index dcb4d8137..17d12e439 100644=0A=
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb=0A=
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb=0A=
@@ -51,6 +51,7 @@ SRC_URI =3D &quot;${SAMBA_MIRROR}/stable/samba-${PV}.tar.=
gz \=0A=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://CVE-2023-34968_0011.patch =
\=0A=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://CVE-2023-4091-0001.patch \=
=0A=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://CVE-2023-4091-0002.patch \=
=0A=
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://CVE-2023-42669.patch \=0A=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;=0A=
&nbsp;=0A=
&nbsp;SRC_URI:append:libc-musl =3D &quot; \=0A=
-- =0A=
2.40.0=0A=
=0A=
=0A=
</span></div></pre>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
<br>
</div>
</body>
</html>

--_000_MW4PR11MB5822488F48F470CEB3737C7C8498AMW4PR11MB5822namp_--

