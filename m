Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1160BCDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 08:54:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.50184.1697792088496018940
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Oct 2023 01:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c2MsYX2L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86572e0271=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39K7OWwT023520
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 01:54:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=ngdDxkdjzaLq3AUG5j
	4+EKv5oDrqlnqFHz2zvZicTv0=; b=c2MsYX2Lmub7Z0gQLZRNi/edTWyJxu5/Q/
	tnN2PMfzTz/XceSIxGb34JS/Zq5Y3I5BV5jEy0m3sxlKjqfTNZJiLsORlvHE+guP
	RhGHNnccZ77kt0shOETYi8DZ5xPLKse8GLyzTcnYLlHLb/63Wce1bfeq7QWElQTE
	PqyTEQATPXDt2OQqWrFTGyy8mXyJY1x0e0gmbeNpg0AzBEwOQo8u066mpXPD+98t
	jYV/DvYFuTu474w8CFu+yYbZFiSl+znFlteTNTR8MadKsboYkYaWzbM7Fs7+SCMN
	1fiqi4XO4oC1XrHoiwdSPo8tygC5RKoAWjuDKL6qgPuCAohi1lBw==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tueut8b8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 01:54:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1pi6cJnD6WlGEJ2MpP8v5tqg51IhnzUBDFHnoExez5mjmP30Uwhf2lL/zzn28wH1rfl+5cVwoYJ6kSQgqFX9lCOUu9yylF+5/wHg5xpt9zaTYdFqV8+Zf8jJmjLHzZHyzC5e+5pJ+Tvg2v0DYExCLfv1sieQJXUL8NF3u6/wkLuqVjOhtjIshaVom4ssWsDZz9zDk9xshfnV/7aWdZqscsLXm7zbLBc9lRoSLhrL1917+9c2tz5Kd0XEJbQQP3vGtRBSmPxlmXZl8DSdNYUKOyfHfv1lisH/DYF37i2rzPj0otvsUm4ZdLiykhGkCFMaI6Snzapsunh/9mq+f0dLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngdDxkdjzaLq3AUG5j4+EKv5oDrqlnqFHz2zvZicTv0=;
 b=CW201O+4iu7TosTy0dDPZcIYHPvf1XaOjjdwmLX5MGFXG45sV0L+BarRkKxLOWZSUIXSwHWHrh1+zBW8HGgMaKLwJnuXA6iampNB3iwk56jiPB58Qcpiv1LjKyBQYLrftlghSRwg1J8CjSe/avjMftqIz690m167NEGwQgmGKALwAPN6+ibdA7sRqfxoNII+bzOMUQiXqgMkT1xfPsz3kCZP5be7zPrmuqW3RyRVOBYJQFIwsVpZvY+RlOSO1wwlKrZXgvmtWMWx2wN2BazmhNDu/rfCgqIx526kr9J288SPGWJ1R2DBgY4IVl5s3y/81ljlK7DO/xA+1GPRLWLMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by BY1PR11MB8029.namprd11.prod.outlook.com (2603:10b6:a03:526::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 08:54:41 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::226:904a:7463:daba]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::226:904a:7463:daba%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 08:54:41 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix
 CVE-2023-34968
Thread-Topic: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix
 CVE-2023-34968
Thread-Index: AQHZ9e972U2aPCRyuEiIJQTAPjjjJLBSejWI
Date: Fri, 20 Oct 2023 08:54:41 +0000
Message-ID: 
 <MW4PR11MB58229D3C80116C6E9A538A2A84DBA@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <178A967EADBA7D9A.9230@lists.openembedded.org>
In-Reply-To: <178A967EADBA7D9A.9230@lists.openembedded.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|BY1PR11MB8029:EE_
x-ms-office365-filtering-correlation-id: 32dc0b4d-25c7-439c-9202-08dbd14a330a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kXy6NtGczMOoRFaKnFRYagVMlCnKkgHHxWuEiRQ8zbYIDfB3apj0XKwFkI+NrdsD0p2E6aYMF+FPQPEHxTFOXiQ+PeLZhmO861853qitNTug/hY2w5/CkjwDJw3+KmQBIEISib8C+GX8ABY7LBdGBG2c7x+/38afY/xocqRxH++w971K2i0JREa8t1uvkmZ/vPFgqfsReRFOdyYoZ9beKaEDJ2ZlQOxW0coPIkCZs54PS8GKu38lxuPiHUXChtYtIPmis1PglCkXWs6J7hIOVzxTA6XP/On9LFTS9rl+jp7FZ0x8QoMJ6WTTMu+0SBa9HbcrZNzNA3dGeOS8cUudTnFnZ4/6/tYu6w4SFmxSv8wfU8l2AjVkd42YhKa+SFO7Yg4XdvYnoRiSjbZtqPME7kgviRWyawxCqMlrqJHmK9RE+V3N3+pCNk6Y2dbqkYK6ftAxXgtkJeXSf3yTMt0DtC9DjtD9w10bgJ2qhg8ptcr5f/Uw2ZvnXoxuR0XAq5NzXWOvorDlN6bn+XX0gSr31bbg5+Y+Ra6XqbaB7ji5FxtezSLyIO3oRmudoW/cxSFjbj8l+Qrs6DR7QAZ5uBreenPcF99rHRKwcNSAe4zCHdPDgsg6VsBBwoTmzWRLiGL/Ti/8KcdU9aKWAtGjpeXHlTy3vXwsUXP2lcysSrgc/CU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(396003)(346002)(366004)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(19627405001)(33656002)(55016003)(38070700009)(91956017)(316002)(66556008)(66946007)(64756008)(66446008)(66476007)(166002)(86362001)(38100700002)(76116006)(122000001)(110136005)(83380400001)(71200400001)(9686003)(7696005)(6506007)(8936002)(30864003)(2906002)(478600001)(41300700001)(8676002)(966005)(5660300002)(52536014)(579004)(559001)(134885004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?MVtVQ82ItmHXqDmQSH8wPJAQfpq+sasDlZDMJorocDzzUb+33k7Zmmno?=
 =?Windows-1252?Q?bt+FfQFeICYK3sdt9Zkz0K3P9d1Oob7gyS6KtVX6zRj5RpW0FeA+PB9d?=
 =?Windows-1252?Q?T+UuQkvD57CcPoRapWFl2Y37ak0s60/8uf8ZZ9soU3G93DlT2/fqVVSF?=
 =?Windows-1252?Q?CF947flWunZnzsOdWKeH+dX5LsfMUER8eTZqAGkTt99F8e4a4pIzb+ug?=
 =?Windows-1252?Q?8qHCqy1t1tHvn2POmRsBlmplsTdYF99/MdyaXouTnIpGWdUlooVo+YZA?=
 =?Windows-1252?Q?NXanPw8etCNpYI6kQceL8FySrRZFRk0y7q6FLFDXOwxPLURC9xcb1BE0?=
 =?Windows-1252?Q?TgUYnWU+3tidCMXmojq0sgUKdtLrzgJgpDD3WyDDwq+tc/Ok6XD6UciH?=
 =?Windows-1252?Q?EkKPUVzV7iwRGMQNPLYme3nuY6/n8LiBWLrlTlU1gRyidwjZrqD7isAC?=
 =?Windows-1252?Q?ABxmJp/c6ue4h7xnIBukUlvKMtvX8rYGs+I//B/XvAPX9y19QoQi1aua?=
 =?Windows-1252?Q?MUY8DF4ANZgcr8H0IaLzGMITvE8c2IlA+0LrZK/eF3Src9EL8w3w/uQx?=
 =?Windows-1252?Q?Gw4Wf4DD9dp7roljWyo0deWpG4pzKawbylsVRqLA6m2otfOqJv8jS4S0?=
 =?Windows-1252?Q?xEBYos2i2rXjaEEbXMU9yeNS95hiFGJU6Plngts0TkEnoEWgPo7yOpT6?=
 =?Windows-1252?Q?Nh4bUzlHTuGCtJixdHQ63q2M6BFU/UGZB8552uHHV5QzYUrptZnSOff2?=
 =?Windows-1252?Q?oR/Lgf04HAkwRVto2U5lLGBsxzjFZNynRzEsVbzozwGLl3teDm61s7is?=
 =?Windows-1252?Q?7NnFZ1D9u0EL9aZdG+wKY8s4JLQ5RiV1wQDHOFUriZb7Z2gz5ffUCKvm?=
 =?Windows-1252?Q?VsHBgCpdTwZd0IgqmuaRqzKAGwJdJD2BgkADDwXt8LJhjRTw+quNndKx?=
 =?Windows-1252?Q?D8gq5B+tVUEvawOg2uWtUB3+Mw5dvUBLaZ8MG+U+smfNLKqWdfIoW/E1?=
 =?Windows-1252?Q?jLD8vjq28hB+YIHV7fEH6J2tKUivEOmiYMKcYcbYsEJsGzFC7doi0BAC?=
 =?Windows-1252?Q?VECoHUqW4aDIPCZS5+MnnjpcWFw9tHfX5QPrn/ZTsVnWhpWGOvc669wl?=
 =?Windows-1252?Q?MPk70XHmpq/EhZFZuiQ8Xb5TPytZaMVuqlVQwVVjn/qjCUSYnFUtpmzN?=
 =?Windows-1252?Q?YhtluVC/c7mWra/HXUjV/FWCCE/iev/hTzbkcu/HQgFS1GvsA9HNo7x3?=
 =?Windows-1252?Q?gAViapw7pgNvshgaIdqLtlz54fH1mQ35tcy0HoZOVEaiAK8sqfI7Ae4N?=
 =?Windows-1252?Q?Iy+J/lQstO+Tt86rJthDBw+TwGSxinMkclNtoEwnobzvt/NXkEwQyxuL?=
 =?Windows-1252?Q?PnbEu45DJdoOejVcEieDV/HPicvo5zaN3V0/lu77HjSlK7fTFVjg0sS8?=
 =?Windows-1252?Q?A9YTD8nOy9M5X7FGs5dcUmfTLoeJfYyjgPhkdR4P8UfSfNaR3IVZmhYi?=
 =?Windows-1252?Q?TP94Vu2IeIpNpUV3cooEk5U5fv1MDiZUYE7niut3DCLThT2LC5kn+rJF?=
 =?Windows-1252?Q?U2QPVdNszkZ5AlQh7GVGygwZSRyN8lczuuPAkrawZgcT5OOV4ysmqohX?=
 =?Windows-1252?Q?8UsmA17ayIV8esJbHG2IsxZ971NFuw4F9oiV5xwQ7OjQgAU1szriJTf5?=
 =?Windows-1252?Q?SyU1BKiJRuac7boM8jmONSO5oZy+1cdzVXHCQves/qMWB7It56KKSQM1?=
 =?Windows-1252?Q?xV/DjR7U1SYN2dtyqxaUfdhESUtDhqSgamcmA4Xgn2Gii00/YnY5OZwj?=
 =?Windows-1252?Q?Zk2djg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB58229D3C80116C6E9A538A2A84DBAMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32dc0b4d-25c7-439c-9202-08dbd14a330a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 08:54:41.6899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dkci+te4yz7Ow+lbaM543qnjdNARygbofAMMkbwsbOTFEum5BwBrLnHcd4BCzGFD7YxU1mzlPFMoJewsVoPmZYr/v9q1qSh2XUkGgwc5oAO1s5TWe2S455KJGzeiPVbW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8029
X-Proofpoint-GUID: UVmGJt93ZPuRo9Sybne2ZnoF0cTJjvTg
X-Proofpoint-ORIG-GUID: UVmGJt93ZPuRo9Sybne2ZnoF0cTJjvTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_07,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310170000 definitions=main-2310200073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 08:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105619

--_000_MW4PR11MB58229D3C80116C6E9A538A2A84DBAMW4PR11MB5822namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Reminder!

-Archana
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Polampalli, Archana via lists.openembedded.or=
g <archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: 03 October 2023 17:17
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix CVE-2023-34=
968

A path disclosure vulnerability was found in Samba. As part of the Spotligh=
t protocol,
Samba discloses the server-side absolute path of shares, files, and directo=
ries in the
results for search queries. This flaw allows a malicious client or an attac=
ker with a
targeted RPC request to view the information that is part of the disclosed =
path.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2023-34968_0001.patch     | 104 ++++
 .../samba/samba/CVE-2023-34968_0002.patch     |  39 ++
 .../samba/samba/CVE-2023-34968_0003.patch     |  65 +++
 .../samba/samba/CVE-2023-34968_0004.patch     |  85 +++
 .../samba/samba/CVE-2023-34968_0005.patch     |  83 +++
 .../samba/samba/CVE-2023-34968_0006.patch     |  57 +++
 .../samba/samba/CVE-2023-34968_0007.patch     |  49 ++
 .../samba/samba/CVE-2023-34968_0008.patch     |  62 +++
 .../samba/samba/CVE-2023-34968_0009.patch     | 465 +++++++++++++++++
 .../samba/samba/CVE-2023-34968_0010.patch     | 484 ++++++++++++++++++
 .../samba/samba/CVE-2023-34968_0011.patch     | 295 +++++++++++
 .../samba/samba_4.14.14.bb                    |  11 +
 12 files changed, 1799 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
23-34968_0001.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
23-34968_0002.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
23-34968_0003.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
23-34968_0004.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
23-34968_0005.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
23-34968_0006.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
23-34968_0007.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
23-34968_0008.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
23-34968_0009.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
23-34968_0010.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
23-34968_0011.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0001.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0001.patch
new file mode 100644
index 000000000..ad8e3e4ce
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0001.=
patch
@@ -0,0 +1,104 @@
+From 98b2a013bc723cd660978d5a1db40b987816f90e Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Tue, 6 Jun 2023 15:17:26 +0200
+Subject: [PATCH] CVE-2023-34968: mdssvc: cache and reuse stat info in stru=
ct
+ sl_inode_path_map
+
+Prepare for the "path" being a fake path and not the real server-side
+path where we won't be able to vfs_stat_fsp() this fake path. Luckily we a=
lready
+got stat info for the object in mds_add_result() so we can just pass stat =
info
+from there.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/98b2=
a013bc723cd660978d5a1db40b987816f90e]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpc_server/mdssvc/mdssvc.c | 32 +++++++-----------------------
+ source3/rpc_server/mdssvc/mdssvc.h |  1 +
+ 2 files changed, 8 insertions(+), 25 deletions(-)
+
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mdssv=
c/mdssvc.c
+index 26a3ec7..a6cc653 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.c
++++ b/source3/rpc_server/mdssvc/mdssvc.c
+@@ -446,7 +446,10 @@ static int ino_path_map_destr_cb(struct sl_inode_path=
_map *entry)
+  * entries by calling talloc_free() on the query slq handles.
+  **/
+
+-static bool inode_map_add(struct sl_query *slq, uint64_t ino, const char =
*path)
++static bool inode_map_add(struct sl_query *slq,
++                        uint64_t ino,
++                        const char *path,
++                        struct stat_ex *st)
+ {
+       NTSTATUS status;
+       struct sl_inode_path_map *entry;
+@@ -493,6 +496,7 @@ static bool inode_map_add(struct sl_query *slq, uint64=
_t ino, const char *path)
+
+       entry->ino =3D ino;
+       entry->mds_ctx =3D slq->mds_ctx;
++      entry->st =3D *st;
+       entry->path =3D talloc_strdup(entry, path);
+       if (entry->path =3D=3D NULL) {
+               DEBUG(1, ("talloc failed\n"));
+@@ -629,7 +633,7 @@ bool mds_add_result(struct sl_query *slq, const char *=
path)
+               return false;
+       }
+
+-      ok =3D inode_map_add(slq, ino64, path);
++      ok =3D inode_map_add(slq, ino64, path, &sb);
+       if (!ok) {
+               DEBUG(1, ("inode_map_add error\n"));
+               slq->state =3D SLQ_STATE_ERROR;
+@@ -1350,29 +1354,7 @@ static bool slrpc_fetch_attributes(struct mds_ctx *=
mds_ctx,
+               elem =3D talloc_get_type_abort(p, struct sl_inode_path_map)=
;
+               path =3D elem->path;
+
+-              status =3D synthetic_pathref(talloc_tos(),
+-                                         mds_ctx->conn->cwd_fsp,
+-                                         path,
+-                                         NULL,
+-                                         NULL,
+-                                         0,
+-                                         0,
+-                                         &smb_fname);
+-              if (!NT_STATUS_IS_OK(status)) {
+-                      /* This is not an error, the user may lack permissi=
ons */
+-                      DBG_DEBUG("synthetic_pathref [%s]: %s\n",
+-                                smb_fname_str_dbg(smb_fname),
+-                                nt_errstr(status));
+-                      return true;
+-              }
+-
+-              result =3D SMB_VFS_FSTAT(smb_fname->fsp, &smb_fname->st);
+-              if (result !=3D 0) {
+-                      TALLOC_FREE(smb_fname);
+-                      return true;
+-              }
+-
+-              sp =3D &smb_fname->st;
++              sp =3D &elem->st;
+       }
+
+       ok =3D add_filemeta(mds_ctx, reqinfo, fm_array, path, sp);
+diff --git a/source3/rpc_server/mdssvc/mdssvc.h b/source3/rpc_server/mdssv=
c/mdssvc.h
+index 3924827..a097991 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.h
++++ b/source3/rpc_server/mdssvc/mdssvc.h
+@@ -105,6 +105,7 @@ struct sl_inode_path_map {
+       struct mds_ctx    *mds_ctx;
+       uint64_t           ino;
+       char              *path;
++      struct stat_ex     st;
+ };
+
+ /* Per process state */
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0002.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0002.patch
new file mode 100644
index 000000000..21b98c4d7
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0002.=
patch
@@ -0,0 +1,39 @@
+From 47a0c1681dd1e7ec407679793966ec8bdc08a24e Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Sat, 17 Jun 2023 13:39:55 +0200
+Subject: [PATCH] CVE-2023-34968: mdssvc: add missing "kMDSStoreMetaScopes"
+ dict key in slrpc_fetch_properties()
+
+We were adding the value, but not the key.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/47a0=
c1681dd1e7ec407679793966ec8bdc08a24e]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpc_server/mdssvc/mdssvc.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mdssv=
c/mdssvc.c
+index a6d09a43b9c..9c23ef95753 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.c
++++ b/source3/rpc_server/mdssvc/mdssvc.c
+@@ -730,6 +730,10 @@ static bool slrpc_fetch_properties(struct mds_ctx *md=
s_ctx,
+       }
+
+       /* kMDSStoreMetaScopes array */
++      result =3D dalloc_stradd(dict, "kMDSStoreMetaScopes");
++      if (result !=3D 0) {
++              return false;
++      }
+       array =3D dalloc_zero(dict, sl_array_t);
+       if (array =3D=3D NULL) {
+               return NULL;
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0003.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0003.patch
new file mode 100644
index 000000000..42106d82b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0003.=
patch
@@ -0,0 +1,65 @@
+From 56a21b3bc8fb24416ead9061f9305c8122bc7f86 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Mon, 19 Jun 2023 17:14:38 +0200
+Subject: [PATCH] CVE-2023-34968: mdscli: use correct TALLOC memory context
+ when allocating spotlight_blob
+
+d is talloc_free()d at the end of the functions and the buffer was later u=
sed
+after beeing freed in the DCERPC layer when sending the packet.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/56a2=
1b3bc8fb24416ead9061f9305c8122bc7f86]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpc_client/cli_mdssvc_util.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/source3/rpc_client/cli_mdssvc_util.c b/source3/rpc_client/cli=
_mdssvc_util.c
+index fe5092c3790..892a844e71a 100644
+--- a/source3/rpc_client/cli_mdssvc_util.c
++++ b/source3/rpc_client/cli_mdssvc_util.c
+@@ -209,7 +209,7 @@ NTSTATUS mdscli_blob_search(TALLOC_CTX *mem_ctx,
+               return NT_STATUS_NO_MEMORY;
+       }
+
+-      blob->spotlight_blob =3D talloc_array(d,
++      blob->spotlight_blob =3D talloc_array(mem_ctx,
+                                           uint8_t,
+                                           ctx->max_fragment_size);
+       if (blob->spotlight_blob =3D=3D NULL) {
+@@ -293,7 +293,7 @@ NTSTATUS mdscli_blob_get_results(TALLOC_CTX *mem_ctx,
+               return NT_STATUS_NO_MEMORY;
+       }
+
+-      blob->spotlight_blob =3D talloc_array(d,
++      blob->spotlight_blob =3D talloc_array(mem_ctx,
+                                           uint8_t,
+                                           ctx->max_fragment_size);
+       if (blob->spotlight_blob =3D=3D NULL) {
+@@ -426,7 +426,7 @@ NTSTATUS mdscli_blob_get_path(TALLOC_CTX *mem_ctx,
+               return NT_STATUS_NO_MEMORY;
+       }
+
+-      blob->spotlight_blob =3D talloc_array(d,
++      blob->spotlight_blob =3D talloc_array(mem_ctx,
+                                           uint8_t,
+                                           ctx->max_fragment_size);
+       if (blob->spotlight_blob =3D=3D NULL) {
+@@ -510,7 +510,7 @@ NTSTATUS mdscli_blob_close_search(TALLOC_CTX *mem_ctx,
+               return NT_STATUS_NO_MEMORY;
+       }
+
+-      blob->spotlight_blob =3D talloc_array(d,
++      blob->spotlight_blob =3D talloc_array(mem_ctx,
+                                           uint8_t,
+                                           ctx->max_fragment_size);
+       if (blob->spotlight_blob =3D=3D NULL) {
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0004.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0004.patch
new file mode 100644
index 000000000..785908b52
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0004.=
patch
@@ -0,0 +1,85 @@
+From 0ae6084d1a9c4eb12e9f1ab1902e00f96bcbea55 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Mon, 19 Jun 2023 18:28:41 +0200
+Subject: [PATCH] CVE-2023-34968: mdscli: remove response blob allocation
+
+This is handled by the NDR code transparently.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+---
+ source3/rpc_client/cli_mdssvc.c | 36 ---------------------------------
+ 1 file changed, 36 deletions(-)
+
+diff --git a/source3/rpc_client/cli_mdssvc.c b/source3/rpc_client/cli_mdss=
vc.c
+index 046d37135cb..474d7c0b150 100644
+--- a/source3/rpc_client/cli_mdssvc.c
++++ b/source3/rpc_client/cli_mdssvc.c
+@@ -276,15 +276,6 @@ struct tevent_req *mdscli_search_send(TALLOC_CTX *mem=
_ctx,
+               return tevent_req_post(req, ev);
+       }
+
+-      state->response_blob.spotlight_blob =3D talloc_array(
+-              state,
+-              uint8_t,
+-              mdscli_ctx->max_fragment_size);
+-      if (tevent_req_nomem(state->response_blob.spotlight_blob, req)) {
+-              return tevent_req_post(req, ev);
+-      }
+-      state->response_blob.size =3D mdscli_ctx->max_fragment_size;
+-
+       subreq =3D dcerpc_mdssvc_cmd_send(state,
+                                       ev,
+                                       mdscli_ctx->bh,
+@@ -457,15 +448,6 @@ struct tevent_req *mdscli_get_results_send(
+               return tevent_req_post(req, ev);
+       }
+
+-      state->response_blob.spotlight_blob =3D talloc_array(
+-              state,
+-              uint8_t,
+-              mdscli_ctx->max_fragment_size);
+-      if (tevent_req_nomem(state->response_blob.spotlight_blob, req)) {
+-              return tevent_req_post(req, ev);
+-      }
+-      state->response_blob.size =3D mdscli_ctx->max_fragment_size;
+-
+       subreq =3D dcerpc_mdssvc_cmd_send(state,
+                                       ev,
+                                       mdscli_ctx->bh,
+@@ -681,15 +663,6 @@ struct tevent_req *mdscli_get_path_send(TALLOC_CTX *m=
em_ctx,
+               return tevent_req_post(req, ev);
+       }
+
+-      state->response_blob.spotlight_blob =3D talloc_array(
+-              state,
+-              uint8_t,
+-              mdscli_ctx->max_fragment_size);
+-      if (tevent_req_nomem(state->response_blob.spotlight_blob, req)) {
+-              return tevent_req_post(req, ev);
+-      }
+-      state->response_blob.size =3D mdscli_ctx->max_fragment_size;
+-
+       subreq =3D dcerpc_mdssvc_cmd_send(state,
+                                       ev,
+                                       mdscli_ctx->bh,
+@@ -852,15 +825,6 @@ struct tevent_req *mdscli_close_search_send(TALLOC_CT=
X *mem_ctx,
+               return tevent_req_post(req, ev);
+       }
+
+-      state->response_blob.spotlight_blob =3D talloc_array(
+-              state,
+-              uint8_t,
+-              mdscli_ctx->max_fragment_size);
+-      if (tevent_req_nomem(state->response_blob.spotlight_blob, req)) {
+-              return tevent_req_post(req, ev);
+-      }
+-      state->response_blob.size =3D mdscli_ctx->max_fragment_size;
+-
+       subreq =3D dcerpc_mdssvc_cmd_send(state,
+                                       ev,
+                                       mdscli_ctx->bh,
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0005.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0005.patch
new file mode 100644
index 000000000..308b441e9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0005.=
patch
@@ -0,0 +1,83 @@
+From 353a9ccea6ff93ea2cd604dcc2b0372f056f819d Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Tue, 20 Jun 2023 11:28:47 +0200
+Subject: [PATCH] CVE-2023-34968: smbtorture: remove response blob allocati=
on
+ in mdssvc.c
+
+This is alreay done by NDR for us.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/353a=
9ccea6ff93ea2cd604dcc2b0372f056f819d]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+
+---
+ source4/torture/rpc/mdssvc.c | 26 --------------------------
+ 1 file changed, 26 deletions(-)
+
+diff --git a/source4/torture/rpc/mdssvc.c b/source4/torture/rpc/mdssvc.c
+index 3689692f7de..a16bd5b47e3 100644
+--- a/source4/torture/rpc/mdssvc.c
++++ b/source4/torture/rpc/mdssvc.c
+@@ -536,13 +536,6 @@ static bool test_mdssvc_invalid_ph_cmd(struct torture=
_context *tctx,
+       request_blob.length =3D 0;
+       request_blob.size =3D 0;
+
+-      response_blob.spotlight_blob =3D talloc_array(state,
+-                                                  uint8_t,
+-                                                  0);
+-      torture_assert_not_null_goto(tctx, response_blob.spotlight_blob,
+-                                   ok, done, "dalloc_zero failed\n");
+-      response_blob.size =3D 0;
+-
+       status =3D  dcerpc_mdssvc_cmd(b,
+                                   state,
+                                   &ph,
+@@ -632,13 +625,6 @@ static bool test_mdssvc_sl_unpack_loop(struct torture=
_context *tctx,
+       request_blob.size =3D sizeof(test_sl_unpack_loop_buf);
+       request_blob.length =3D sizeof(test_sl_unpack_loop_buf);
+
+-      response_blob.spotlight_blob =3D talloc_array(state,
+-                                                  uint8_t,
+-                                                  0);
+-      torture_assert_not_null_goto(tctx, response_blob.spotlight_blob,
+-                                   ok, done, "dalloc_zero failed\n");
+-      response_blob.size =3D 0;
+-
+       status =3D dcerpc_mdssvc_cmd(b,
+                                  state,
+                                  &state->ph,
+@@ -764,11 +750,6 @@ static bool test_sl_dict_type_safety(struct torture_c=
ontext *tctx,
+       torture_assert_goto(tctx, request_blob.length > 0,
+                           ok, done, "sl_pack failed\n");
+
+-      response_blob.spotlight_blob =3D talloc_array(state, uint8_t, 0);
+-      torture_assert_not_null_goto(tctx, response_blob.spotlight_blob,
+-                                   ok, done, "dalloc_zero failed\n");
+-      response_blob.size =3D 0;
+-
+       status =3D dcerpc_mdssvc_cmd(b,
+                                  state,
+                                  &state->ph,
+@@ -926,13 +907,6 @@ static bool test_mdssvc_fetch_attr_unknown_cnid(struc=
t torture_context *tctx,
+                                    ret, done, "dalloc_zero failed\n");
+       request_blob.size =3D max_fragment_size;
+
+-      response_blob.spotlight_blob =3D talloc_array(state,
+-                                                  uint8_t,
+-                                                  max_fragment_size);
+-      torture_assert_not_null_goto(tctx, response_blob.spotlight_blob,
+-                                   ret, done, "dalloc_zero failed\n");
+-      response_blob.size =3D max_fragment_size;
+-
+       len =3D sl_pack(d, (char *)request_blob.spotlight_blob, request_blo=
b.size);
+       torture_assert_goto(tctx, len !=3D -1, ret, done, "sl_pack failed\n=
");
+
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0006.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0006.patch
new file mode 100644
index 000000000..34526a8c8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0006.=
patch
@@ -0,0 +1,57 @@
+From 449f1280b718c6da3b8e309fe124be4e9bfd8184 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Tue, 20 Jun 2023 11:35:41 +0200
+Subject: [PATCH] CVE-2023-34968: rpcclient: remove response blob allocatio=
n
+
+This is alreay done by NDR for us.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/449f=
1280b718c6da3b8e309fe124be4e9bfd8184]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpcclient/cmd_spotlight.c | 16 ----------------
+ 1 file changed, 16 deletions(-)
+
+diff --git a/source3/rpcclient/cmd_spotlight.c b/source3/rpcclient/cmd_spo=
tlight.c
+index 24db9893df6..64fe321089c 100644
+--- a/source3/rpcclient/cmd_spotlight.c
++++ b/source3/rpcclient/cmd_spotlight.c
+@@ -144,13 +144,6 @@ static NTSTATUS cmd_mdssvc_fetch_properties(
+       }
+       request_blob.size =3D max_fragment_size;
+
+-      response_blob.spotlight_blob =3D talloc_array(mem_ctx, uint8_t, max=
_fragment_size);
+-      if (response_blob.spotlight_blob =3D=3D NULL) {
+-              status =3D NT_STATUS_INTERNAL_ERROR;
+-              goto done;
+-      }
+-      response_blob.size =3D max_fragment_size;
+-
+       len =3D sl_pack(d, (char *)request_blob.spotlight_blob, request_blo=
b.size);
+       if (len =3D=3D -1) {
+               status =3D NT_STATUS_INTERNAL_ERROR;
+@@ -368,15 +361,6 @@ static NTSTATUS cmd_mdssvc_fetch_attributes(
+       }
+       request_blob.size =3D max_fragment_size;
+
+-      response_blob.spotlight_blob =3D talloc_array(mem_ctx,
+-                                                  uint8_t,
+-                                                  max_fragment_size);
+-      if (response_blob.spotlight_blob =3D=3D NULL) {
+-              status =3D NT_STATUS_INTERNAL_ERROR;
+-              goto done;
+-      }
+-      response_blob.size =3D max_fragment_size;
+-
+       len =3D sl_pack(d, (char *)request_blob.spotlight_blob, request_blo=
b.size);
+       if (len =3D=3D -1) {
+               status =3D NT_STATUS_INTERNAL_ERROR;
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0007.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0007.patch
new file mode 100644
index 000000000..679e174c0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0007.=
patch
@@ -0,0 +1,49 @@
+From cc593a6ac531f02f2fe70fd4f7dfe649a02f9206 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Tue, 20 Jun 2023 11:42:10 +0200
+Subject: [PATCH] CVE-2023-34968: mdssvc: remove response blob allocation
+
+This is alreay done by NDR for us.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/cc59=
3a6ac531f02f2fe70fd4f7dfe649a02f9206]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpc_server/mdssvc/srv_mdssvc_nt.c | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c b/source3/rpc_serve=
r/mdssvc/srv_mdssvc_nt.c
+index b8eed8b..714e6c1 100644
+--- a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c
++++ b/source3/rpc_server/mdssvc/srv_mdssvc_nt.c
+@@ -209,7 +209,6 @@ void _mdssvc_unknown1(struct pipes_struct *p, struct m=
dssvc_unknown1 *r)
+ void _mdssvc_cmd(struct pipes_struct *p, struct mdssvc_cmd *r)
+ {
+       bool ok;
+-      char *rbuf;
+       struct mds_ctx *mds_ctx;
+       NTSTATUS status;
+
+@@ -266,13 +265,6 @@ void _mdssvc_cmd(struct pipes_struct *p, struct mdssv=
c_cmd *r)
+               return;
+       }
+
+-      rbuf =3D talloc_zero_array(p->mem_ctx, char, r->in.max_fragment_siz=
e1);
+-      if (rbuf =3D=3D NULL) {
+-              p->fault_state =3D DCERPC_FAULT_CANT_PERFORM;
+-              return;
+-      }
+-      r->out.response_blob->spotlight_blob =3D (uint8_t *)rbuf;
+-      r->out.response_blob->size =3D r->in.max_fragment_size1;
+
+       /* We currently don't use fragmentation at the mdssvc RPC layer */
+       *r->out.fragment =3D 0;
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0008.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0008.patch
new file mode 100644
index 000000000..e65379fe8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0008.=
patch
@@ -0,0 +1,62 @@
+From 397919e82b493206ae9b60bb9c539d52c3207729 Mon Sep 17 00:00:00 2001
+From: Archana Polampalli <archana.polampalli@windriver.com>
+Date: Fri, 29 Sep 2023 08:59:31 +0000
+Subject: [PATCH] CVE-2023-34968: mdssvc: switch to doing an early return
+
+Just reduce indentation of the code handling the success case. No change i=
n
+behaviour.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/3979=
19e82b493206ae9b60bb9c539d52c3207729]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpc_server/mdssvc/mdssvc.c | 26 ++++++++++++++------------
+ 1 file changed, 14 insertions(+), 12 deletions(-)
+
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mdssv=
c/mdssvc.c
+index a6cc653..0e6a916 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.c
++++ b/source3/rpc_server/mdssvc/mdssvc.c
+@@ -1798,19 +1798,21 @@ bool mds_dispatch(struct mds_ctx *mds_ctx,
+       }
+
+       ok =3D slcmd->function(mds_ctx, query, reply);
+-      if (ok) {
+-              DBG_DEBUG("%s", dalloc_dump(reply, 0));
+-
+-              len =3D sl_pack(reply,
+-                            (char *)response_blob->spotlight_blob,
+-                            response_blob->size);
+-              if (len =3D=3D -1) {
+-                      DBG_ERR("error packing Spotlight RPC reply\n");
+-                      ok =3D false;
+-                      goto cleanup;
+-              }
+-              response_blob->length =3D len;
++        if (!ok) {
++              goto cleanup;
++      }
++
++      DBG_DEBUG("%s", dalloc_dump(reply, 0));
++
++      len =3D sl_pack(reply,
++                    (char *)response_blob->spotlight_blob,
++                    response_blob->size);
++      if (len =3D=3D -1) {
++              DBG_ERR("error packing Spotlight RPC reply\n");
++              ok =3D false;
++              goto cleanup;
+       }
++      response_blob->length =3D len;
+
+ cleanup:
+       talloc_free(query);
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0009.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0009.patch
new file mode 100644
index 000000000..e21f2ba4b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0009.=
patch
@@ -0,0 +1,465 @@
+From cb8313e7bee75454ce29d2b2f657927259298f52 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Mon, 19 Jun 2023 18:16:57 +0200
+Subject: [PATCH] CVE-2023-34968: mdssvc: introduce an allocating wrapper t=
o
+ sl_pack()
+
+sl_pack_alloc() does the buffer allocation that previously all callers of
+sl_pack() did themselves.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/cb83=
13e7bee75454ce29d2b2f657927259298f52]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpc_client/cli_mdssvc_util.c      | 80 +++++------------------
+ source3/rpc_server/mdssvc/marshalling.c   | 35 ++++++++--
+ source3/rpc_server/mdssvc/marshalling.h   |  9 ++-
+ source3/rpc_server/mdssvc/mdssvc.c        | 18 ++---
+ source3/rpc_server/mdssvc/mdssvc.h        |  5 +-
+ source3/rpc_server/mdssvc/srv_mdssvc_nt.c |  5 +-
+ source3/rpcclient/cmd_spotlight.c         | 32 ++-------
+ source4/torture/rpc/mdssvc.c              | 24 ++-----
+ 8 files changed, 80 insertions(+), 128 deletions(-)
+
+diff --git a/source3/rpc_client/cli_mdssvc_util.c b/source3/rpc_client/cli=
_mdssvc_util.c
+index 892a844..a39202d 100644
+--- a/source3/rpc_client/cli_mdssvc_util.c
++++ b/source3/rpc_client/cli_mdssvc_util.c
+@@ -42,7 +42,7 @@ NTSTATUS mdscli_blob_search(TALLOC_CTX *mem_ctx,
+       sl_array_t *scope_array =3D NULL;
+       double dval;
+       uint64_t uint64val;
+-      ssize_t len;
++      NTSTATUS status;
+       int ret;
+
+       d =3D dalloc_new(mem_ctx);
+@@ -209,23 +209,11 @@ NTSTATUS mdscli_blob_search(TALLOC_CTX *mem_ctx,
+               return NT_STATUS_NO_MEMORY;
+       }
+
+-      blob->spotlight_blob =3D talloc_array(mem_ctx,
+-                                          uint8_t,
+-                                          ctx->max_fragment_size);
+-      if (blob->spotlight_blob =3D=3D NULL) {
+-              TALLOC_FREE(d);
+-              return NT_STATUS_NO_MEMORY;
+-      }
+-      blob->size =3D ctx->max_fragment_size;
+-
+-      len =3D sl_pack(d, (char *)blob->spotlight_blob, blob->size);
++      status =3D sl_pack_alloc(mem_ctx, d, blob, ctx->max_fragment_size);
+       TALLOC_FREE(d);
+-      if (len =3D=3D -1) {
+-              return NT_STATUS_NO_MEMORY;
++      if (!NT_STATUS_IS_OK(status)) {
++              return status;
+       }
+-
+-      blob->length =3D len;
+-      blob->size =3D len;
+       return NT_STATUS_OK;
+ }
+
+@@ -238,7 +226,7 @@ NTSTATUS mdscli_blob_get_results(TALLOC_CTX *mem_ctx,
+       uint64_t *uint64p =3D NULL;
+       sl_array_t *array =3D NULL;
+       sl_array_t *cmd_array =3D NULL;
+-      ssize_t len;
++      NTSTATUS status;
+       int ret;
+
+       d =3D dalloc_new(mem_ctx);
+@@ -293,23 +281,11 @@ NTSTATUS mdscli_blob_get_results(TALLOC_CTX *mem_ctx=
,
+               return NT_STATUS_NO_MEMORY;
+       }
+
+-      blob->spotlight_blob =3D talloc_array(mem_ctx,
+-                                          uint8_t,
+-                                          ctx->max_fragment_size);
+-      if (blob->spotlight_blob =3D=3D NULL) {
+-              TALLOC_FREE(d);
+-              return NT_STATUS_NO_MEMORY;
+-      }
+-      blob->size =3D ctx->max_fragment_size;
+-
+-      len =3D sl_pack(d, (char *)blob->spotlight_blob, blob->size);
++      status =3D sl_pack_alloc(mem_ctx, d, blob, ctx->max_fragment_size);
+       TALLOC_FREE(d);
+-      if (len =3D=3D -1) {
+-              return NT_STATUS_NO_MEMORY;
++      if (!NT_STATUS_IS_OK(status)) {
++              return status;
+       }
+-
+-      blob->length =3D len;
+-      blob->size =3D len;
+       return NT_STATUS_OK;
+ }
+
+@@ -325,7 +301,7 @@ NTSTATUS mdscli_blob_get_path(TALLOC_CTX *mem_ctx,
+       sl_array_t *cmd_array =3D NULL;
+       sl_array_t *attr_array =3D NULL;
+       sl_cnids_t *cnids =3D NULL;
+-      ssize_t len;
++      NTSTATUS status;
+       int ret;
+
+       d =3D dalloc_new(mem_ctx);
+@@ -426,23 +402,11 @@ NTSTATUS mdscli_blob_get_path(TALLOC_CTX *mem_ctx,
+               return NT_STATUS_NO_MEMORY;
+       }
+
+-      blob->spotlight_blob =3D talloc_array(mem_ctx,
+-                                          uint8_t,
+-                                          ctx->max_fragment_size);
+-      if (blob->spotlight_blob =3D=3D NULL) {
+-              TALLOC_FREE(d);
+-              return NT_STATUS_NO_MEMORY;
+-      }
+-      blob->size =3D ctx->max_fragment_size;
+-
+-      len =3D sl_pack(d, (char *)blob->spotlight_blob, blob->size);
++      status =3D sl_pack_alloc(mem_ctx, d, blob, ctx->max_fragment_size);
+       TALLOC_FREE(d);
+-      if (len =3D=3D -1) {
+-              return NT_STATUS_NO_MEMORY;
++      if (!NT_STATUS_IS_OK(status)) {
++              return status;
+       }
+-
+-      blob->length =3D len;
+-      blob->size =3D len;
+       return NT_STATUS_OK;
+ }
+
+@@ -455,7 +419,7 @@ NTSTATUS mdscli_blob_close_search(TALLOC_CTX *mem_ctx,
+       uint64_t *uint64p =3D NULL;
+       sl_array_t *array =3D NULL;
+       sl_array_t *cmd_array =3D NULL;
+-      ssize_t len;
++      NTSTATUS status;
+       int ret;
+
+       d =3D dalloc_new(mem_ctx);
+@@ -510,22 +474,10 @@ NTSTATUS mdscli_blob_close_search(TALLOC_CTX *mem_ct=
x,
+               return NT_STATUS_NO_MEMORY;
+       }
+
+-      blob->spotlight_blob =3D talloc_array(mem_ctx,
+-                                          uint8_t,
+-                                          ctx->max_fragment_size);
+-      if (blob->spotlight_blob =3D=3D NULL) {
+-              TALLOC_FREE(d);
+-              return NT_STATUS_NO_MEMORY;
+-      }
+-      blob->size =3D ctx->max_fragment_size;
+-
+-      len =3D sl_pack(d, (char *)blob->spotlight_blob, blob->size);
++      status =3D sl_pack_alloc(mem_ctx, d, blob, ctx->max_fragment_size);
+       TALLOC_FREE(d);
+-      if (len =3D=3D -1) {
+-              return NT_STATUS_NO_MEMORY;
++      if (!NT_STATUS_IS_OK(status)) {
++              return status;
+       }
+-
+-      blob->length =3D len;
+-      blob->size =3D len;
+       return NT_STATUS_OK;
+ }
+diff --git a/source3/rpc_server/mdssvc/marshalling.c b/source3/rpc_server/=
mdssvc/marshalling.c
+index 441d411..34bfda5 100644
+--- a/source3/rpc_server/mdssvc/marshalling.c
++++ b/source3/rpc_server/mdssvc/marshalling.c
+@@ -78,6 +78,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query, const c=
har *buf,
+                             ssize_t offset, size_t bufsize,
+                             int count, ssize_t toc_offset,
+                             int encoding);
++static ssize_t sl_pack(DALLOC_CTX *query, char *buf, size_t bufsize);
+
+ /************************************************************************=
******
+  * Wrapper functions for the *VAL macros with bound checking
+@@ -1190,11 +1191,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,
+       return offset;
+ }
+
+-/************************************************************************=
******
+- * Global functions for packing und unpacking
+- ************************************************************************=
******/
+-
+-ssize_t sl_pack(DALLOC_CTX *query, char *buf, size_t bufsize)
++static ssize_t sl_pack(DALLOC_CTX *query, char *buf, size_t bufsize)
+ {
+       ssize_t result;
+       char *toc_buf;
+@@ -1274,6 +1271,34 @@ ssize_t sl_pack(DALLOC_CTX *query, char *buf, size_=
t bufsize)
+       return len;
+ }
+
++/************************************************************************=
******
++ * Global functions for packing und unpacking
++ ************************************************************************=
******/
++
++NTSTATUS sl_pack_alloc(TALLOC_CTX *mem_ctx,
++                     DALLOC_CTX *d,
++                     struct mdssvc_blob *b,
++                     size_t max_fragment_size)
++{
++      ssize_t len;
++
++      b->spotlight_blob =3D talloc_zero_array(mem_ctx,
++                                            uint8_t,
++                                            max_fragment_size);
++      if (b->spotlight_blob =3D=3D NULL) {
++              return NT_STATUS_NO_MEMORY;
++      }
++
++      len =3D sl_pack(d, (char *)b->spotlight_blob, max_fragment_size);
++      if (len =3D=3D -1) {
++              return NT_STATUS_DATA_ERROR;
++      }
++
++      b->length =3D len;
++      b->size =3D len;
++      return NT_STATUS_OK;
++}
++
+ bool sl_unpack(DALLOC_CTX *query, const char *buf, size_t bufsize)
+ {
+       ssize_t result;
+diff --git a/source3/rpc_server/mdssvc/marshalling.h b/source3/rpc_server/=
mdssvc/marshalling.h
+index 086ca74..2cc1b44 100644
+--- a/source3/rpc_server/mdssvc/marshalling.h
++++ b/source3/rpc_server/mdssvc/marshalling.h
+@@ -22,6 +22,9 @@
+ #define _MDSSVC_MARSHALLING_H
+
+ #include "dalloc.h"
++#include "libcli/util/ntstatus.h"
++#include "lib/util/data_blob.h"
++#include "librpc/gen_ndr/mdssvc.h"
+
+ #define MAX_SL_FRAGMENT_SIZE 0xFFFFF
+
+@@ -49,7 +52,11 @@ typedef struct {
+  * Function declarations
+  ************************************************************************=
******/
+
+-extern ssize_t sl_pack(DALLOC_CTX *query, char *buf, size_t bufsize);
++extern NTSTATUS sl_pack_alloc(TALLOC_CTX *mem_ctx,
++                            DALLOC_CTX *d,
++                            struct mdssvc_blob *b,
++                            size_t max_fragment_size);
++
+ extern bool sl_unpack(DALLOC_CTX *query, const char *buf, size_t bufsize)=
;
+
+ #endif
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mdssv=
c/mdssvc.c
+index 0e6a916..19257e8 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.c
++++ b/source3/rpc_server/mdssvc/mdssvc.c
+@@ -1726,11 +1726,11 @@ error:
+  **/
+ bool mds_dispatch(struct mds_ctx *mds_ctx,
+                 struct mdssvc_blob *request_blob,
+-                struct mdssvc_blob *response_blob)
++                struct mdssvc_blob *response_blob,
++                size_t max_fragment_size)
+ {
+       bool ok;
+       int ret;
+-      ssize_t len;
+       DALLOC_CTX *query =3D NULL;
+       DALLOC_CTX *reply =3D NULL;
+       char *rpccmd;
+@@ -1738,6 +1738,7 @@ bool mds_dispatch(struct mds_ctx *mds_ctx,
+       const struct smb_filename conn_basedir =3D {
+               .base_name =3D mds_ctx->conn->connectpath,
+       };
++      NTSTATUS status;
+
+       if (CHECK_DEBUGLVL(10)) {
+               const struct sl_query *slq;
+@@ -1804,15 +1805,14 @@ bool mds_dispatch(struct mds_ctx *mds_ctx,
+
+       DBG_DEBUG("%s", dalloc_dump(reply, 0));
+
+-      len =3D sl_pack(reply,
+-                    (char *)response_blob->spotlight_blob,
+-                    response_blob->size);
+-      if (len =3D=3D -1) {
+-              DBG_ERR("error packing Spotlight RPC reply\n");
+-              ok =3D false;
++      status =3D sl_pack_alloc(response_blob,
++                             reply,
++                             response_blob,
++                             max_fragment_size);
++      if (!NT_STATUS_IS_OK(status)) {
++              DBG_ERR("sl_pack_alloc() failed\n");
+               goto cleanup;
+       }
+-      response_blob->length =3D len;
+
+ cleanup:
+       talloc_free(query);
+diff --git a/source3/rpc_server/mdssvc/mdssvc.h b/source3/rpc_server/mdssv=
c/mdssvc.h
+index a097991..b3bd8b9 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.h
++++ b/source3/rpc_server/mdssvc/mdssvc.h
+@@ -157,9 +157,10 @@ struct mds_ctx *mds_init_ctx(TALLOC_CTX *mem_ctx,
+                            int snum,
+                            const char *sharename,
+                            const char *path);
+-extern bool mds_dispatch(struct mds_ctx *query_ctx,
++extern bool mds_dispatch(struct mds_ctx *mds_ctx,
+                        struct mdssvc_blob *request_blob,
+-                       struct mdssvc_blob *response_blob);
++                       struct mdssvc_blob *response_blob,
++                       size_t max_fragment_size);
+ bool mds_add_result(struct sl_query *slq, const char *path);
+
+ #endif /* _MDSSVC_H */
+diff --git a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c b/source3/rpc_serve=
r/mdssvc/srv_mdssvc_nt.c
+index 714e6c1..59e2a97 100644
+--- a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c
++++ b/source3/rpc_server/mdssvc/srv_mdssvc_nt.c
+@@ -269,7 +269,10 @@ void _mdssvc_cmd(struct pipes_struct *p, struct mdssv=
c_cmd *r)
+       /* We currently don't use fragmentation at the mdssvc RPC layer */
+       *r->out.fragment =3D 0;
+
+-      ok =3D mds_dispatch(mds_ctx, &r->in.request_blob, r->out.response_b=
lob);
++      ok =3D mds_dispatch(mds_ctx,
++                        &r->in.request_blob,
++                        r->out.response_blob,
++                        r->in.max_fragment_size1);
+       if (ok) {
+               *r->out.unkn9 =3D 0;
+       } else {
+diff --git a/source3/rpcclient/cmd_spotlight.c b/source3/rpcclient/cmd_spo=
tlight.c
+index 64fe321..ba3f61f 100644
+--- a/source3/rpcclient/cmd_spotlight.c
++++ b/source3/rpcclient/cmd_spotlight.c
+@@ -43,7 +43,6 @@ static NTSTATUS cmd_mdssvc_fetch_properties(
+       uint32_t unkn3;      /* server always returns 0 ? */
+       struct mdssvc_blob request_blob;
+       struct mdssvc_blob response_blob;
+-      ssize_t len;
+       uint32_t max_fragment_size =3D 64 * 1024;
+       DALLOC_CTX *d, *mds_reply;
+       uint64_t *uint64var;
+@@ -137,20 +136,10 @@ static NTSTATUS cmd_mdssvc_fetch_properties(
+               goto done;
+       }
+
+-      request_blob.spotlight_blob =3D talloc_array(mem_ctx, uint8_t, max_=
fragment_size);
+-      if (request_blob.spotlight_blob =3D=3D NULL) {
+-              status =3D NT_STATUS_INTERNAL_ERROR;
+-              goto done;
+-      }
+-      request_blob.size =3D max_fragment_size;
+-
+-      len =3D sl_pack(d, (char *)request_blob.spotlight_blob, request_blo=
b.size);
+-      if (len =3D=3D -1) {
+-              status =3D NT_STATUS_INTERNAL_ERROR;
++      status =3D sl_pack_alloc(mem_ctx, d, &request_blob, max_fragment_si=
ze);
++      if (!NT_STATUS_IS_OK(status)) {
+               goto done;
+       }
+-      request_blob.length =3D len;
+-      request_blob.size =3D len;
+
+       status =3D  dcerpc_mdssvc_cmd(b, mem_ctx,
+                                   &share_handle,
+@@ -204,7 +193,6 @@ static NTSTATUS cmd_mdssvc_fetch_attributes(
+       uint32_t unkn3;      /* server always returns 0 ? */
+       struct mdssvc_blob request_blob;
+       struct mdssvc_blob response_blob;
+-      ssize_t len;
+       uint32_t max_fragment_size =3D 64 * 1024;
+       DALLOC_CTX *d, *mds_reply;
+       uint64_t *uint64var;
+@@ -352,22 +340,10 @@ static NTSTATUS cmd_mdssvc_fetch_attributes(
+               goto done;
+       }
+
+-      request_blob.spotlight_blob =3D talloc_array(mem_ctx,
+-                                                 uint8_t,
+-                                                 max_fragment_size);
+-      if (request_blob.spotlight_blob =3D=3D NULL) {
+-              status =3D NT_STATUS_INTERNAL_ERROR;
+-              goto done;
+-      }
+-      request_blob.size =3D max_fragment_size;
+-
+-      len =3D sl_pack(d, (char *)request_blob.spotlight_blob, request_blo=
b.size);
+-      if (len =3D=3D -1) {
+-              status =3D NT_STATUS_INTERNAL_ERROR;
++      status =3D sl_pack_alloc(mem_ctx, d, &request_blob, max_fragment_si=
ze);
++      if (!NT_STATUS_IS_OK(status)) {
+               goto done;
+       }
+-      request_blob.length =3D len;
+-      request_blob.size =3D len;
+
+       status =3D dcerpc_mdssvc_cmd(b, mem_ctx,
+                                  &share_handle,
+diff --git a/source4/torture/rpc/mdssvc.c b/source4/torture/rpc/mdssvc.c
+index e99c82c..1305456 100644
+--- a/source4/torture/rpc/mdssvc.c
++++ b/source4/torture/rpc/mdssvc.c
+@@ -745,11 +745,9 @@ static bool test_sl_dict_type_safety(struct torture_c=
ontext *tctx,
+                                    ok, done, "dalloc_new failed\n");
+       request_blob.size =3D 64 * 1024;
+
+-      request_blob.length =3D sl_pack(d,
+-                                    (char *)request_blob.spotlight_blob,
+-                                    request_blob.size);
+-      torture_assert_goto(tctx, request_blob.length > 0,
+-                          ok, done, "sl_pack failed\n");
++      status =3D sl_pack_alloc(tctx, d, &request_blob, 64 * 1024);
++      torture_assert_ntstatus_ok_goto(tctx, status, ok, done,
++                                      "sl_pack_alloc() failed\n");
+
+       status =3D dcerpc_mdssvc_cmd(b,
+                                  state,
+@@ -836,7 +834,6 @@ static bool test_mdssvc_fetch_attr_unknown_cnid(struct=
 torture_context *tctx,
+       const char *path_type =3D NULL;
+       uint64_t ino64;
+       NTSTATUS status;
+-      ssize_t len;
+       int ret;
+       bool ok =3D true;
+
+@@ -901,19 +898,10 @@ static bool test_mdssvc_fetch_attr_unknown_cnid(stru=
ct torture_context *tctx,
+       ret =3D dalloc_add(array, cnids, sl_cnids_t);
+       torture_assert_goto(tctx, ret =3D=3D 0, ret, done, "dalloc_add fail=
ed\n");
+
+-      request_blob.spotlight_blob =3D talloc_array(state,
+-                                                 uint8_t,
+-                                                 max_fragment_size);
+-      torture_assert_not_null_goto(tctx, request_blob.spotlight_blob,
+-                                   ret, done, "dalloc_zero failed\n");
+-      request_blob.size =3D max_fragment_size;
+-
+-      len =3D sl_pack(d, (char *)request_blob.spotlight_blob, request_blo=
b.size);
+-      torture_assert_goto(tctx, len !=3D -1, ret, done, "sl_pack failed\n=
");
+-
+-      request_blob.length =3D len;
+-      request_blob.size =3D len;
+
++      status =3D sl_pack_alloc(tctx, d, &request_blob, max_fragment_size)=
;
++      torture_assert_ntstatus_ok_goto(tctx, status, ok, done,
++                                      "sl_pack_alloc() failed\n");
+       status =3D  dcerpc_mdssvc_cmd(b,
+                                   state,
+                                   &state->ph,
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0010.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0010.patch
new file mode 100644
index 000000000..57668f5ee
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0010.=
patch
@@ -0,0 +1,484 @@
+From a5c570e262911874e43e82de601d809aa5b1b729 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Sat, 17 Jun 2023 13:53:27 +0200
+Subject: [PATCH] CVE-2023-34968: mdscli: return share relative paths The n=
ext
+ commit will change the Samba Spotlight server to return absolute paths th=
at
+ start with the sharename as "/SHARENAME/..." followed by the share path
+ relative appended.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+So given a share
+
+  [spotlight]
+    path =3D /foo/bar
+    spotlight =3D yes
+
+and a file inside this share with a full path of
+
+  /foo/bar/dir/file
+
+previously a search that matched this file would returns the absolute
+server-side pato of the file, ie
+
+  /foo/bar/dir/file
+
+This will be change to
+
+  /spotlight/dir/file
+
+As currently the mdscli library and hence the mdsearch tool print out thes=
e
+paths returned from the server, we have to change the output to accomodate=
 these
+fake paths. The only way to do this sensibly is by makeing the paths relat=
ive to
+the containing share, so just
+
+  dir/file
+
+in the example above.
+
+The client learns about the share root path prefix =96 real server-side of=
 fake in
+the future =96 in an initial handshake in the "share_path" out argument of=
 the
+mdssvc_open() RPC call, so the client can use this path to convert the abs=
olute
+path to relative.
+
+There is however an additional twist: the macOS Spotlight server prefixes =
this
+absolute path with another prefix, typically "/System/Volumes/Data", so in=
 the
+example above the full path for the same search would be
+
+  /System/Volumes/Data/foo/bar/dir/file
+
+So macOS does return the full server-side path too, just prefixed with an
+additional path. This path prefixed can be queried by the client in the
+mdssvc_cmd() RPC call with an Spotlight command of "fetchPropertiesForCont=
ext:"
+and the path is returned in a dictionary with key "kMDSStorePathScopes". S=
amba
+just returns "/" for this.
+
+Currently the mdscli library doesn't issue this Spotlight RPC
+request (fetchPropertiesForContext), so this is added in this commit. In t=
he
+end, all search result paths are stripped of the combined prefix
+
+  kMDSStorePathScopes + share_path (from mdssvc_open).
+
+eg
+
+  kMDSStorePathScopes =3D /System/Volumes/Data
+  share_path =3D /foo/bar
+  search result =3D /System/Volumes/Data/foo/bar/dir/file
+  relative path returned by mdscli =3D dir/file
+
+Makes sense? :)
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/a5c5=
70e262911874e43e82de601d809aa5b1b729]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ python/samba/tests/dcerpc/mdssvc.py     |  26 ++--
+ source3/rpc_client/cli_mdssvc.c         | 155 +++++++++++++++++++++++-
+ source3/rpc_client/cli_mdssvc_private.h |   4 +
+ source3/rpc_client/cli_mdssvc_util.c    |  68 +++++++++++
+ source3/rpc_client/cli_mdssvc_util.h    |   4 +
+ 5 files changed, 243 insertions(+), 14 deletions(-)
+
+diff --git a/python/samba/tests/dcerpc/mdssvc.py b/python/samba/tests/dcer=
pc/mdssvc.py
+index b0df509..5002e5d 100644
+--- a/python/samba/tests/dcerpc/mdssvc.py
++++ b/python/samba/tests/dcerpc/mdssvc.py
+@@ -84,10 +84,11 @@ class MdssvcTests(RpcInterfaceTestCase):
+         self.t =3D threading.Thread(target=3DMdssvcTests.http_server, arg=
s=3D(self,))
+         self.t.setDaemon(True)
+         self.t.start()
++        self.sharepath =3D os.environ["LOCAL_PATH"]
+         time.sleep(1)
+
+         conn =3D mdscli.conn(self.pipe, 'spotlight', '/foo')
+-        self.sharepath =3D conn.sharepath()
++        self.fakepath =3D conn.sharepath()
+         conn.disconnect(self.pipe)
+
+         for file in testfiles:
+@@ -105,12 +106,11 @@ class MdssvcTests(RpcInterfaceTestCase):
+         self.server.serve_forever()
+
+     def run_test(self, query, expect, json_in, json_out):
+-        expect =3D [s.replace("%BASEPATH%", self.sharepath) for s in expe=
ct]
+         self.server.json_in =3D json_in.replace("%BASEPATH%", self.sharep=
ath)
+         self.server.json_out =3D json_out.replace("%BASEPATH%", self.shar=
epath)
+
+         self.conn =3D mdscli.conn(self.pipe, 'spotlight', '/foo')
+-        search =3D self.conn.search(self.pipe, query, self.sharepath)
++        search =3D self.conn.search(self.pipe, query, self.fakepath)
+
+         # Give it some time, the get_results() below returns immediately
+         # what's available, so if we ask to soon, we might get back no re=
sults
+@@ -141,7 +141,7 @@ class MdssvcTests(RpcInterfaceTestCase):
+             ]
+           }
+         }'''
+-        exp_results =3D ["%BASEPATH%/foo", "%BASEPATH%/bar"]
++        exp_results =3D ["foo", "bar"]
+         self.run_test('*=3D=3D"samba*"', exp_results, exp_json_query, fak=
e_json_response)
+
+     def test_mdscli_search_escapes(self):
+@@ -181,14 +181,14 @@ class MdssvcTests(RpcInterfaceTestCase):
+           }
+         }'''
+         exp_results =3D [
+-            r"%BASEPATH%/x+x",
+-            r"%BASEPATH%/x*x",
+-            r"%BASEPATH%/x=3Dx",
+-            r"%BASEPATH%/x'x",
+-            r"%BASEPATH%/x?x",
+-            r"%BASEPATH%/x x",
+-            r"%BASEPATH%/x(x",
+-            "%BASEPATH%/x\"x",
+-            r"%BASEPATH%/x\x",
++            r"x+x",
++            r"x*x",
++            r"x=3Dx",
++            r"x'x",
++            r"x?x",
++            r"x x",
++            r"x(x",
++            "x\"x",
++            r"x\x",
+         ]
+         self.run_test(sl_query, exp_results, exp_json_query, fake_json_re=
sponse)
+diff --git a/source3/rpc_client/cli_mdssvc.c b/source3/rpc_client/cli_mdss=
vc.c
+index 07c19b5..a047b91 100644
+--- a/source3/rpc_client/cli_mdssvc.c
++++ b/source3/rpc_client/cli_mdssvc.c
+@@ -43,10 +43,12 @@ char *mdscli_get_basepath(TALLOC_CTX *mem_ctx,
+ struct mdscli_connect_state {
+       struct tevent_context *ev;
+       struct mdscli_ctx *mdscli_ctx;
++      struct mdssvc_blob response_blob;
+ };
+
+ static void mdscli_connect_open_done(struct tevent_req *subreq);
+ static void mdscli_connect_unknown1_done(struct tevent_req *subreq);
++static void mdscli_connect_fetch_props_done(struct tevent_req *subreq);
+
+ struct tevent_req *mdscli_connect_send(TALLOC_CTX *mem_ctx,
+                                      struct tevent_context *ev,
+@@ -111,6 +113,7 @@ static void mdscli_connect_open_done(struct tevent_req=
 *subreq)
+       struct mdscli_connect_state *state =3D tevent_req_data(
+               req, struct mdscli_connect_state);
+       struct mdscli_ctx *mdscli_ctx =3D state->mdscli_ctx;
++      size_t share_path_len;
+       NTSTATUS status;
+
+       status =3D dcerpc_mdssvc_open_recv(subreq, state);
+@@ -120,6 +123,18 @@ static void mdscli_connect_open_done(struct tevent_re=
q *subreq)
+               return;
+       }
+
++      share_path_len =3D strlen(mdscli_ctx->mdscmd_open.share_path);
++      if (share_path_len < 1 || share_path_len > UINT16_MAX) {
++              tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);
++              return;
++      }
++      mdscli_ctx->mdscmd_open.share_path_len =3D share_path_len;
++
++      if (mdscli_ctx->mdscmd_open.share_path[share_path_len-1] =3D=3D '/'=
) {
++              mdscli_ctx->mdscmd_open.share_path[share_path_len-1] =3D '\=
0';
++              mdscli_ctx->mdscmd_open.share_path_len--;
++      }
++
+       subreq =3D dcerpc_mdssvc_unknown1_send(
+                       state,
+                       state->ev,
+@@ -146,6 +161,8 @@ static void mdscli_connect_unknown1_done(struct tevent=
_req *subreq)
+               subreq, struct tevent_req);
+       struct mdscli_connect_state *state =3D tevent_req_data(
+               req, struct mdscli_connect_state);
++      struct mdscli_ctx *mdscli_ctx =3D state->mdscli_ctx;
++      struct mdssvc_blob request_blob;
+       NTSTATUS status;
+
+       status =3D dcerpc_mdssvc_unknown1_recv(subreq, state);
+@@ -153,6 +170,108 @@ static void mdscli_connect_unknown1_done(struct teve=
nt_req *subreq)
+       if (tevent_req_nterror(req, status)) {
+               return;
+       }
++      status =3D mdscli_blob_fetch_props(state,
++                                       state->mdscli_ctx,
++                                       &request_blob);
++      if (tevent_req_nterror(req, status)) {
++              return;
++      }
++
++      subreq =3D dcerpc_mdssvc_cmd_send(state,
++                                      state->ev,
++                                      mdscli_ctx->bh,
++                                      &mdscli_ctx->ph,
++                                      0,
++                                      mdscli_ctx->dev,
++                                      mdscli_ctx->mdscmd_open.unkn2,
++                                      0,
++                                      mdscli_ctx->flags,
++                                      request_blob,
++                                      0,
++                                      mdscli_ctx->max_fragment_size,
++                                      1,
++                                      mdscli_ctx->max_fragment_size,
++                                      0,
++                                      0,
++                                      &mdscli_ctx->mdscmd_cmd.fragment,
++                                      &state->response_blob,
++                                      &mdscli_ctx->mdscmd_cmd.unkn9);
++      if (tevent_req_nomem(subreq, req)) {
++              return;
++      }
++      tevent_req_set_callback(subreq, mdscli_connect_fetch_props_done, re=
q);
++      mdscli_ctx->async_pending++;
++      return;
++}
++
++static void mdscli_connect_fetch_props_done(struct tevent_req *subreq)
++{
++      struct tevent_req *req =3D tevent_req_callback_data(
++              subreq, struct tevent_req);
++      struct mdscli_connect_state *state =3D tevent_req_data(
++              req, struct mdscli_connect_state);
++      struct mdscli_ctx *mdscli_ctx =3D state->mdscli_ctx;
++      DALLOC_CTX *d =3D NULL;
++      sl_array_t *path_scope_array =3D NULL;
++      char *path_scope =3D NULL;
++      NTSTATUS status;
++      bool ok;
++
++      status =3D dcerpc_mdssvc_cmd_recv(subreq, state);
++      TALLOC_FREE(subreq);
++      state->mdscli_ctx->async_pending--;
++      if (tevent_req_nterror(req, status)) {
++              return;
++      }
++
++      d =3D dalloc_new(state);
++      if (tevent_req_nomem(d, req)) {
++              return;
++      }
++
++      ok =3D sl_unpack(d,
++                     (char *)state->response_blob.spotlight_blob,
++                     state->response_blob.length);
++      if (!ok) {
++              tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);
++              return;
++      }
++
++      path_scope_array =3D dalloc_value_for_key(d,
++                                              "DALLOC_CTX", 0,
++                                              "kMDSStorePathScopes",
++                                              "sl_array_t");
++      if (path_scope_array =3D=3D NULL) {
++              DBG_ERR("Missing kMDSStorePathScopes\n");
++              tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);
++              return;
++      }
++
++      path_scope =3D dalloc_get(path_scope_array, "char *", 0);
++      if (path_scope =3D=3D NULL) {
++              DBG_ERR("Missing path in kMDSStorePathScopes\n");
++              tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);
++              return;
++      }
++
++      mdscli_ctx->path_scope_len =3D strlen(path_scope);
++      if (mdscli_ctx->path_scope_len < 1 ||
++          mdscli_ctx->path_scope_len > UINT16_MAX)
++      {
++              DBG_ERR("Bad path_scope: %s\n", path_scope);
++              tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);
++              return;
++      }
++      mdscli_ctx->path_scope =3D talloc_strdup(mdscli_ctx, path_scope);
++      if (tevent_req_nomem(mdscli_ctx->path_scope, req)) {
++              return;
++      }
++
++      if (mdscli_ctx->path_scope[mdscli_ctx->path_scope_len-1] =3D=3D '/'=
) {
++              mdscli_ctx->path_scope[mdscli_ctx->path_scope_len-1] =3D '\=
0';
++              mdscli_ctx->path_scope_len--;
++      }
++
+
+       tevent_req_done(req);
+ }
+@@ -697,7 +816,10 @@ static void mdscli_get_path_done(struct tevent_req *s=
ubreq)
+       struct mdscli_get_path_state *state =3D tevent_req_data(
+               req, struct mdscli_get_path_state);
+       DALLOC_CTX *d =3D NULL;
++      size_t pathlen;
++      size_t prefixlen;
+       char *path =3D NULL;
++      const char *p =3D NULL;
+       NTSTATUS status;
+       bool ok;
+
+@@ -732,7 +854,38 @@ static void mdscli_get_path_done(struct tevent_req *s=
ubreq)
+               tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);
+               return;
+       }
+-      state->path =3D talloc_move(state, &path);
++
++      /* Path is prefixed by /PATHSCOPE/SHARENAME/, strip it */
++      pathlen =3D strlen(path);
++
++      /*
++       * path_scope_len and share_path_len are already checked to be smal=
ler
++       * then UINT16_MAX so this can't overflow
++       */
++      prefixlen =3D state->mdscli_ctx->path_scope_len
++              + state->mdscli_ctx->mdscmd_open.share_path_len;
++
++      if (pathlen < prefixlen) {
++              DBG_DEBUG("Bad path: %s\n", path);
++              tevent_req_nterror(req, NT_STATUS_INVALID_PARAMETER);
++              return;
++      }
++
++      p =3D path + prefixlen;
++      while (*p =3D=3D '/') {
++              p++;
++      }
++      if (*p =3D=3D '\0') {
++              DBG_DEBUG("Bad path: %s\n", path);
++              tevent_req_nterror(req, NT_STATUS_INVALID_PARAMETER);
++              return;
++      }
++
++      state->path =3D talloc_strdup(state, p);
++      if (state->path =3D=3D NULL) {
++              tevent_req_nterror(req, NT_STATUS_NO_MEMORY);
++              return;
++      }
+       DBG_DEBUG("path: %s\n", state->path);
+
+       tevent_req_done(req);
+diff --git a/source3/rpc_client/cli_mdssvc_private.h b/source3/rpc_client/=
cli_mdssvc_private.h
+index 031af85..b10aca0 100644
+--- a/source3/rpc_client/cli_mdssvc_private.h
++++ b/source3/rpc_client/cli_mdssvc_private.h
+@@ -42,6 +42,7 @@ struct mdscli_ctx {
+       /* cmd specific or unknown fields */
+       struct {
+               char share_path[1025];
++              size_t share_path_len;
+               uint32_t unkn2;
+               uint32_t unkn3;
+       } mdscmd_open;
+@@ -56,6 +57,9 @@ struct mdscli_ctx {
+       struct {
+               uint32_t status;
+       } mdscmd_close;
++
++      char *path_scope;
++      size_t path_scope_len;
+ };
+
+ struct mdscli_search_ctx {
+diff --git a/source3/rpc_client/cli_mdssvc_util.c b/source3/rpc_client/cli=
_mdssvc_util.c
+index a39202d..1eaaca7 100644
+--- a/source3/rpc_client/cli_mdssvc_util.c
++++ b/source3/rpc_client/cli_mdssvc_util.c
+@@ -28,6 +28,74 @@
+ #include "rpc_server/mdssvc/dalloc.h"
+ #include "rpc_server/mdssvc/marshalling.h"
+
++NTSTATUS mdscli_blob_fetch_props(TALLOC_CTX *mem_ctx,
++                               struct mdscli_ctx *ctx,
++                               struct mdssvc_blob *blob)
++{
++      DALLOC_CTX *d =3D NULL;
++      uint64_t *uint64p =3D NULL;
++      sl_array_t *array =3D NULL;
++      sl_array_t *cmd_array =3D NULL;
++      NTSTATUS status;
++      int ret;
++
++      d =3D dalloc_new(mem_ctx);
++      if (d =3D=3D NULL) {
++              return NT_STATUS_NO_MEMORY;
++      }
++
++      array =3D dalloc_zero(d, sl_array_t);
++      if (array =3D=3D NULL) {
++              TALLOC_FREE(d);
++              return NT_STATUS_NO_MEMORY;
++      }
++
++      ret =3D dalloc_add(d, array, sl_array_t);
++      if (ret !=3D 0) {
++              TALLOC_FREE(d);
++              return NT_STATUS_NO_MEMORY;
++      }
++
++      cmd_array =3D dalloc_zero(d, sl_array_t);
++      if (cmd_array =3D=3D NULL) {
++              TALLOC_FREE(d);
++              return NT_STATUS_NO_MEMORY;
++      }
++
++      ret =3D dalloc_add(array, cmd_array, sl_array_t);
++      if (ret !=3D 0) {
++              TALLOC_FREE(d);
++              return NT_STATUS_NO_MEMORY;
++      }
++
++      ret =3D dalloc_stradd(cmd_array, "fetchPropertiesForContext:");
++      if (ret !=3D 0) {
++              TALLOC_FREE(d);
++              return NT_STATUS_NO_MEMORY;
++      }
++
++      uint64p =3D talloc_zero_array(cmd_array, uint64_t, 2);
++      if (uint64p =3D=3D NULL) {
++              TALLOC_FREE(d);
++              return NT_STATUS_NO_MEMORY;
++      }
++
++      talloc_set_name(uint64p, "uint64_t *");
++
++      ret =3D dalloc_add(cmd_array, uint64p, uint64_t *);
++      if (ret !=3D 0) {
++              TALLOC_FREE(d);
++              return NT_STATUS_NO_MEMORY;
++      }
++
++      status =3D sl_pack_alloc(mem_ctx, d, blob, ctx->max_fragment_size);
++      TALLOC_FREE(d);
++      if (!NT_STATUS_IS_OK(status)) {
++              return status;
++      }
++      return NT_STATUS_OK;
++}
++
+ NTSTATUS mdscli_blob_search(TALLOC_CTX *mem_ctx,
+                           struct mdscli_search_ctx *search,
+                           struct mdssvc_blob *blob)
+diff --git a/source3/rpc_client/cli_mdssvc_util.h b/source3/rpc_client/cli=
_mdssvc_util.h
+index 7a98c85..3f32475 100644
+--- a/source3/rpc_client/cli_mdssvc_util.h
++++ b/source3/rpc_client/cli_mdssvc_util.h
+@@ -21,6 +21,10 @@
+ #ifndef _MDSCLI_UTIL_H_
+ #define _MDSCLI_UTIL_H_
+
++NTSTATUS mdscli_blob_fetch_props(TALLOC_CTX *mem_ctx,
++                               struct mdscli_ctx *ctx,
++                               struct mdssvc_blob *blob);
++
+ NTSTATUS mdscli_blob_search(TALLOC_CTX *mem_ctx,
+                           struct mdscli_search_ctx *search,
+                           struct mdssvc_blob *blob);
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0011.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0011.patch
new file mode 100644
index 000000000..d2bef187f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0011.=
patch
@@ -0,0 +1,295 @@
+From 091b0265fe42878d676def5d4f5b4f8f3977b0e2 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Mon, 5 Jun 2023 18:02:20 +0200
+Subject: [PATCH] CVE-2023-34968: mdssvc: return a fake share path Instead =
of
+ returning the real server-side absolute path of shares and search results=
,
+ return a fake absolute path replacing the path of the share with the shar=
e
+ name, iow for a share "test" with a server-side path of "/foo/bar", we
+ previously returned
+
+  /foo/bar and
+  /foo/bar/search/result
+
+and now return
+
+  /test and
+  /test/search/result
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15388
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+Reviewed-by: Stefan Metzmacher <metze@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/091b=
0265fe42878d676def5d4f5b4f8f3977b0e2]
+
+CVE: CVE-2023-34968
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/lib/util_path.c                   | 52 ++++++++++++++++++++
+ source3/lib/util_path.h                   |  5 ++
+ source3/rpc_server/mdssvc/mdssvc.c        | 60 +++++++++++++++++++++--
+ source3/rpc_server/mdssvc/mdssvc.h        |  1 +
+ source3/rpc_server/mdssvc/srv_mdssvc_nt.c | 17 +++++--
+ 6 files changed, 128 insertions(+), 7 deletions(-)
+ mode change 100755 =3D> 100644 source3/libads/ldap.c
+
+diff --git a/source3/lib/util_path.c b/source3/lib/util_path.c
+index c34b734..5b5a51c 100644
+--- a/source3/lib/util_path.c
++++ b/source3/lib/util_path.c
+@@ -21,8 +21,10 @@
+  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+  */
+
++#include "includes.h"
+ #include "replace.h"
+ #include <talloc.h>
++#include "lib/util/debug.h"
+ #include "lib/util/samba_util.h"
+ #include "lib/util_path.h"
+
+@@ -210,3 +212,53 @@ char *canonicalize_absolute_path(TALLOC_CTX *ctx, con=
st char *pathname_in)
+       *p++ =3D '\0';
+       return pathname;
+ }
++
++/*
++ * Take two absolute paths, figure out if "subdir" is a proper
++ * subdirectory of "parent". Return the component relative to the
++ * "parent" without the potential "/". Take care of "parent"
++ * possibly ending in "/".
++ */
++bool subdir_of(const char *parent,
++             size_t parent_len,
++             const char *subdir,
++             const char **_relative)
++{
++      const char *relative =3D NULL;
++      bool matched;
++
++      SMB_ASSERT(parent[0] =3D=3D '/');
++      SMB_ASSERT(subdir[0] =3D=3D '/');
++
++      if (parent_len =3D=3D 1) {
++              /*
++               * Everything is below "/"
++               */
++              *_relative =3D subdir+1;
++              return true;
++      }
++
++      if (parent[parent_len-1] =3D=3D '/') {
++              parent_len -=3D 1;
++      }
++
++      matched =3D (strncmp(subdir, parent, parent_len) =3D=3D 0);
++      if (!matched) {
++              return false;
++      }
++
++      relative =3D &subdir[parent_len];
++
++      if (relative[0] =3D=3D '\0') {
++              *_relative =3D relative; /* nothing left */
++              return true;
++      }
++
++      if (relative[0] =3D=3D '/') {
++              /* End of parent must match a '/' in subdir. */
++              *_relative =3D relative+1;
++              return true;
++      }
++
++      return false;
++}
+diff --git a/source3/lib/util_path.h b/source3/lib/util_path.h
+index 3e7d04d..6d2155a 100644
+--- a/source3/lib/util_path.h
++++ b/source3/lib/util_path.h
+@@ -31,5 +31,10 @@ char *lock_path(TALLOC_CTX *mem_ctx, const char *name);
+ char *state_path(TALLOC_CTX *mem_ctx, const char *name);
+ char *cache_path(TALLOC_CTX *mem_ctx, const char *name);
+ char *canonicalize_absolute_path(TALLOC_CTX *ctx, const char *abs_path);
++bool subdir_of(const char *parent,
++               size_t parent_len,
++               const char *subdir,
++               const char **_relative);
++
+
+ #endif
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mdssv=
c/mdssvc.c
+index 19257e8..d442d8d 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.c
++++ b/source3/rpc_server/mdssvc/mdssvc.c
+@@ -520,11 +520,14 @@ static bool inode_map_add(struct sl_query *slq,
+ bool mds_add_result(struct sl_query *slq, const char *path)
+ {
+       struct smb_filename *smb_fname =3D NULL;
++      char *fake_path =3D NULL;
++      const char *relative =3D NULL;
+       struct stat_ex sb;
+       uint32_t attr;
+       uint64_t ino64;
+       int result;
+       NTSTATUS status;
++      bool sub;
+       bool ok;
+
+       /*
+@@ -610,6 +613,17 @@ bool mds_add_result(struct sl_query *slq, const char =
*path)
+               }
+       }
+
++      sub =3D subdir_of(slq->mds_ctx->spath,
++                      slq->mds_ctx->spath_len,
++                      path,
++                      &relative);
++      if (!sub) {
++              DBG_ERR("[%s] is not inside [%s]\n",
++                      path, slq->mds_ctx->spath);
++              slq->state =3D SLQ_STATE_ERROR;
++              return false;
++      }
++
+       /*
+        * Add inode number and filemeta to result set, this is what
+        * we return as part of the result set of a query
+@@ -622,18 +636,30 @@ bool mds_add_result(struct sl_query *slq, const char=
 *path)
+               slq->state =3D SLQ_STATE_ERROR;
+               return false;
+       }
++
++      fake_path =3D talloc_asprintf(slq,
++                                  "/%s/%s",
++                                  slq->mds_ctx->sharename,
++                                  relative);
++      if (fake_path =3D=3D NULL) {
++              slq->state =3D SLQ_STATE_ERROR;
++              return false;
++      }
++
+       ok =3D add_filemeta(slq->mds_ctx,
+                         slq->reqinfo,
+                         slq->query_results->fm_array,
+-                        path,
++                        fake_path,
+                         &sb);
+       if (!ok) {
+               DBG_ERR("add_filemeta error\n");
++              TALLOC_FREE(fake_path);
+               slq->state =3D SLQ_STATE_ERROR;
+               return false;
+       }
+
+-      ok =3D inode_map_add(slq, ino64, path, &sb);
++      ok =3D inode_map_add(slq, ino64, fake_path, &sb);
++      TALLOC_FREE(fake_path);
+       if (!ok) {
+               DEBUG(1, ("inode_map_add error\n"));
+               slq->state =3D SLQ_STATE_ERROR;
+@@ -840,6 +866,32 @@ static void slq_close_timer(struct tevent_context *ev=
,
+       }
+ }
+
++/**
++ * Translate a fake scope from the client like /sharename/dir
++ * to the real server-side path, replacing the "/sharename" part
++ * with the absolute server-side path of the share.
++ **/
++static bool mdssvc_real_scope(struct sl_query *slq, const char *fake_scop=
e)
++{
++      size_t sname_len =3D strlen(slq->mds_ctx->sharename);
++      size_t fake_scope_len =3D strlen(fake_scope);
++
++      if (fake_scope_len < sname_len + 1) {
++              DBG_ERR("Short scope [%s] for share [%s]\n",
++                      fake_scope, slq->mds_ctx->sharename);
++              return false;
++      }
++
++      slq->path_scope =3D talloc_asprintf(slq,
++                                        "%s%s",
++                                        slq->mds_ctx->spath,
++                                        fake_scope + sname_len + 1);
++      if (slq->path_scope =3D=3D NULL) {
++              return false;
++      }
++      return true;
++}
++
+ /**
+  * Begin a search query
+  **/
+@@ -946,8 +998,8 @@ static bool slrpc_open_query(struct mds_ctx *mds_ctx,
+               goto error;
+       }
+
+-      slq->path_scope =3D talloc_strdup(slq, scope);
+-      if (slq->path_scope =3D=3D NULL) {
++      ok =3D mdssvc_real_scope(slq, scope);
++      if (!ok) {
+               goto error;
+       }
+
+diff --git a/source3/rpc_server/mdssvc/mdssvc.h b/source3/rpc_server/mdssv=
c/mdssvc.h
+index b3bd8b9..8434812 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.h
++++ b/source3/rpc_server/mdssvc/mdssvc.h
+@@ -127,6 +127,7 @@ struct mds_ctx {
+       int snum;
+       const char *sharename;
+       const char *spath;
++      size_t spath_len;
+       struct connection_struct *conn;
+       struct sl_query *query_list;     /* list of active queries */
+       struct db_context *ino_path_map; /* dbwrap rbt for storing inode->p=
ath mappings */
+diff --git a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c b/source3/rpc_serve=
r/mdssvc/srv_mdssvc_nt.c
+index 59e2a97..b20bd2a 100644
+--- a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c
++++ b/source3/rpc_server/mdssvc/srv_mdssvc_nt.c
+@@ -121,6 +121,7 @@ void _mdssvc_open(struct pipes_struct *p, struct mdssv=
c_open *r)
+               loadparm_s3_global_substitution();
+       int snum;
+       char *outpath =3D discard_const_p(char, r->out.share_path);
++      char *fake_path =3D NULL;
+       char *path;
+       NTSTATUS status;
+
+@@ -144,21 +145,31 @@ void _mdssvc_open(struct pipes_struct *p, struct mds=
svc_open *r)
+               return;
+       }
+
++      fake_path =3D talloc_asprintf(p->mem_ctx, "/%s", r->in.share_name);
++      if (fake_path =3D=3D NULL) {
++              DBG_ERR("Couldn't create fake share path for %s\n",
++                      r->in.share_name);
++              talloc_free(path);
++              p->fault_state =3D DCERPC_FAULT_CANT_PERFORM;
++              return;
++      }
++
+       status =3D create_mdssvc_policy_handle(p->mem_ctx, p,
+                                            snum,
+                                            r->in.share_name,
+                                            path,
+                                            r->out.handle);
+       if (!NT_STATUS_IS_OK(status)) {
+-              DBG_ERR("Couldn't create policy handle for %s\n",
++              DBG_ERR("Couldn't create path for %s\n",
+                       r->in.share_name);
+               talloc_free(path);
++              talloc_free(fake_path);
+               p->fault_state =3D DCERPC_FAULT_CANT_PERFORM;
+               return;
+       }
+
+-      strlcpy(outpath, path, 1024);
+-      talloc_free(path);
++      strlcpy(outpath, fake_path, 1024);
++      talloc_free(fake_path);
+       return;
+ }
+
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index 73e8a82e8..aa27592cb 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -38,6 +38,17 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2022-2127.patch \
            file://CVE-2023-34967_0001.patch \
            file://CVE-2023-34967_0002.patch \
+           file://CVE-2023-34968_0001.patch \
+           file://CVE-2023-34968_0002.patch \
+           file://CVE-2023-34968_0003.patch \
+           file://CVE-2023-34968_0004.patch \
+           file://CVE-2023-34968_0005.patch \
+           file://CVE-2023-34968_0006.patch \
+           file://CVE-2023-34968_0007.patch \
+           file://CVE-2023-34968_0008.patch \
+           file://CVE-2023-34968_0009.patch \
+           file://CVE-2023-34968_0010.patch \
+           file://CVE-2023-34968_0011.patch \
            "

 SRC_URI:append:libc-musl =3D " \
--
2.40.0


--_000_MW4PR11MB58229D3C80116C6E9A538A2A84DBAMW4PR11MB5822namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Reminder!</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
-Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> 03 October 2023 17:17<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix CVE-=
2023-34968</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">A path disclosure vulnerability was found in Samba=
. As part of the Spotlight protocol,<br>
Samba discloses the server-side absolute path of shares, files, and directo=
ries in the<br>
results for search queries. This flaw allows a malicious client or an attac=
ker with a<br>
targeted RPC request to view the information that is part of the disclosed =
path.<br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../samba/samba/CVE-2023-34968_0001.patch&nbsp;&nbsp;&nbsp;&nbsp; | 1=
04 ++++<br>
&nbsp;.../samba/samba/CVE-2023-34968_0002.patch&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 39 ++<br>
&nbsp;.../samba/samba/CVE-2023-34968_0003.patch&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 65 +++<br>
&nbsp;.../samba/samba/CVE-2023-34968_0004.patch&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 85 +++<br>
&nbsp;.../samba/samba/CVE-2023-34968_0005.patch&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 83 +++<br>
&nbsp;.../samba/samba/CVE-2023-34968_0006.patch&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 57 +++<br>
&nbsp;.../samba/samba/CVE-2023-34968_0007.patch&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 49 ++<br>
&nbsp;.../samba/samba/CVE-2023-34968_0008.patch&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 62 +++<br>
&nbsp;.../samba/samba/CVE-2023-34968_0009.patch&nbsp;&nbsp;&nbsp;&nbsp; | 4=
65 +++++++++++++++++<br>
&nbsp;.../samba/samba/CVE-2023-34968_0010.patch&nbsp;&nbsp;&nbsp;&nbsp; | 4=
84 ++++++++++++++++++<br>
&nbsp;.../samba/samba/CVE-2023-34968_0011.patch&nbsp;&nbsp;&nbsp;&nbsp; | 2=
95 +++++++++++<br>
&nbsp;.../samba/samba_4.14.14.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 11 +<br>
&nbsp;12 files changed, 1799 insertions(+)<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2023-34968_0001.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2023-34968_0002.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2023-34968_0003.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2023-34968_0004.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2023-34968_0005.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2023-34968_0006.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2023-34968_0007.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2023-34968_0008.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2023-34968_0009.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2023-34968_0010.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2023-34968_0011.patch<br>
<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0001.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0001.patch<br>
new file mode 100644<br>
index 000000000..ad8e3e4ce<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0001.=
patch<br>
@@ -0,0 +1,104 @@<br>
+From 98b2a013bc723cd660978d5a1db40b987816f90e Mon Sep 17 00:00:00 2001<br>
+From: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Date: Tue, 6 Jun 2023 15:17:26 +0200<br>
+Subject: [PATCH] CVE-2023-34968: mdssvc: cache and reuse stat info in stru=
ct<br>
+ sl_inode_path_map<br>
+<br>
+Prepare for the &quot;path&quot; being a fake path and not the real server=
-side<br>
+path where we won't be able to vfs_stat_fsp() this fake path. Luckily we a=
lready<br>
+got stat info for the object in mds_add_result() so we can just pass stat =
info<br>
+from there.<br>
+<br>
+BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15388">https:=
//bugzilla.samba.org/show_bug.cgi?id=3D15388</a><br>
+<br>
+Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Reviewed-by: Stefan Metzmacher &lt;metze@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/samba-team/samba/=
commit/98b2a013bc723cd660978d5a1db40b987816f90e">https://github.com/samba-t=
eam/samba/commit/98b2a013bc723cd660978d5a1db40b987816f90e</a>]<br>
+<br>
+CVE: CVE-2023-34968<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ source3/rpc_server/mdssvc/mdssvc.c | 32 +++++++-----------------------<br=
>
+ source3/rpc_server/mdssvc/mdssvc.h |&nbsp; 1 +<br>
+ 2 files changed, 8 insertions(+), 25 deletions(-)<br>
+<br>
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mdssv=
c/mdssvc.c<br>
+index 26a3ec7..a6cc653 100644<br>
+--- a/source3/rpc_server/mdssvc/mdssvc.c<br>
++++ b/source3/rpc_server/mdssvc/mdssvc.c<br>
+@@ -446,7 +446,10 @@ static int ino_path_map_destr_cb(struct sl_inode_path=
_map *entry)<br>
+&nbsp; * entries by calling talloc_free() on the query slq handles.<br>
+&nbsp; **/<br>
+<br>
+-static bool inode_map_add(struct sl_query *slq, uint64_t ino, const char =
*path)<br>
++static bool inode_map_add(struct sl_query *slq,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t =
ino,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const cha=
r *path,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct st=
at_ex *st)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct sl_inode_path_map *entry;<br>
+@@ -493,6 +496,7 @@ static bool inode_map_add(struct sl_query *slq, uint64=
_t ino, const char *path)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entry-&gt;ino =3D ino;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entry-&gt;mds_ctx =3D slq-&gt;mds_ctx=
;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entry-&gt;st =3D *st;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entry-&gt;path =3D talloc_strdup(entr=
y, path);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (entry-&gt;path =3D=3D NULL) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DEBUG(1, (&quot;talloc failed\n&quot;));<br>
+@@ -629,7 +633,7 @@ bool mds_add_result(struct sl_query *slq, const char *=
path)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok =3D inode_map_add(slq, ino64, path);<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok =3D inode_map_add(slq, ino64, path, &am=
p;sb);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ok) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DEBUG(1, (&quot;inode_map_add error\n&quot;));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; slq-&gt;state =3D SLQ_STATE_ERROR;<br>
+@@ -1350,29 +1354,7 @@ static bool slrpc_fetch_attributes(struct mds_ctx *=
mds_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; elem =3D talloc_get_type_abort(p, struct sl_inode_path_map);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; path =3D elem-&gt;path;<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; status =3D synthetic_pathref(talloc_tos(),<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; mds_ctx-&gt;conn-&gt;cwd_fsp,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; path,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; NULL,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; NULL,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 0,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 0,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &amp;smb_fname);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (!NT_STATUS_IS_OK(status)) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* This is not an err=
or, the user may lack permissions */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DBG_DEBUG(&quot;synth=
etic_pathref [%s]: %s\n&quot;,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smb_fname_str_dbg(smb_fname),<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nt_errstr(status));<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; result =3D SMB_VFS_FSTAT(smb_fname-&gt;fsp, &amp;smb_fname-&gt;st);<b=
r>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (result !=3D 0) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TALLOC_FREE(smb_fname=
);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; sp =3D &amp;smb_fname-&gt;st;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; sp =3D &amp;elem-&gt;st;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok =3D add_filemeta(mds_ctx, reqinfo,=
 fm_array, path, sp);<br>
+diff --git a/source3/rpc_server/mdssvc/mdssvc.h b/source3/rpc_server/mdssv=
c/mdssvc.h<br>
+index 3924827..a097991 100644<br>
+--- a/source3/rpc_server/mdssvc/mdssvc.h<br>
++++ b/source3/rpc_server/mdssvc/mdssvc.h<br>
+@@ -105,6 +105,7 @@ struct sl_inode_path_map {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mds_ctx&nbsp;&nbsp;&nbsp; *mds=
_ctx;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ino;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *path;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct stat_ex&nbsp;&nbsp;&nbsp;&nbsp; st;=
<br>
+ };<br>
+<br>
+ /* Per process state */<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0002.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0002.patch<br>
new file mode 100644<br>
index 000000000..21b98c4d7<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0002.=
patch<br>
@@ -0,0 +1,39 @@<br>
+From 47a0c1681dd1e7ec407679793966ec8bdc08a24e Mon Sep 17 00:00:00 2001<br>
+From: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Date: Sat, 17 Jun 2023 13:39:55 +0200<br>
+Subject: [PATCH] CVE-2023-34968: mdssvc: add missing &quot;kMDSStoreMetaSc=
opes&quot;<br>
+ dict key in slrpc_fetch_properties()<br>
+<br>
+We were adding the value, but not the key.<br>
+<br>
+BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15388">https:=
//bugzilla.samba.org/show_bug.cgi?id=3D15388</a><br>
+<br>
+Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Reviewed-by: Stefan Metzmacher &lt;metze@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/samba-team/samba/=
commit/47a0c1681dd1e7ec407679793966ec8bdc08a24e">https://github.com/samba-t=
eam/samba/commit/47a0c1681dd1e7ec407679793966ec8bdc08a24e</a>]<br>
+<br>
+CVE: CVE-2023-34968<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ source3/rpc_server/mdssvc/mdssvc.c | 4 ++++<br>
+ 1 file changed, 4 insertions(+)<br>
+<br>
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mdssv=
c/mdssvc.c<br>
+index a6d09a43b9c..9c23ef95753 100644<br>
+--- a/source3/rpc_server/mdssvc/mdssvc.c<br>
++++ b/source3/rpc_server/mdssvc/mdssvc.c<br>
+@@ -730,6 +730,10 @@ static bool slrpc_fetch_properties(struct mds_ctx *md=
s_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* kMDSStoreMetaScopes array */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D dalloc_stradd(dict, &quot;kMDSS=
toreMetaScopes&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (result !=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return false;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; array =3D dalloc_zero(dict, sl_array_=
t);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (array =3D=3D NULL) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return NULL;<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0003.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0003.patch<br>
new file mode 100644<br>
index 000000000..42106d82b<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0003.=
patch<br>
@@ -0,0 +1,65 @@<br>
+From 56a21b3bc8fb24416ead9061f9305c8122bc7f86 Mon Sep 17 00:00:00 2001<br>
+From: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Date: Mon, 19 Jun 2023 17:14:38 +0200<br>
+Subject: [PATCH] CVE-2023-34968: mdscli: use correct TALLOC memory context=
<br>
+ when allocating spotlight_blob<br>
+<br>
+d is talloc_free()d at the end of the functions and the buffer was later u=
sed<br>
+after beeing freed in the DCERPC layer when sending the packet.<br>
+<br>
+BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15388">https:=
//bugzilla.samba.org/show_bug.cgi?id=3D15388</a><br>
+<br>
+Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Reviewed-by: Stefan Metzmacher &lt;metze@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/samba-team/samba/=
commit/56a21b3bc8fb24416ead9061f9305c8122bc7f86">https://github.com/samba-t=
eam/samba/commit/56a21b3bc8fb24416ead9061f9305c8122bc7f86</a>]<br>
+<br>
+CVE: CVE-2023-34968<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ source3/rpc_client/cli_mdssvc_util.c | 8 ++++----<br>
+ 1 file changed, 4 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/source3/rpc_client/cli_mdssvc_util.c b/source3/rpc_client/cli=
_mdssvc_util.c<br>
+index fe5092c3790..892a844e71a 100644<br>
+--- a/source3/rpc_client/cli_mdssvc_util.c<br>
++++ b/source3/rpc_client/cli_mdssvc_util.c<br>
+@@ -209,7 +209,7 @@ NTSTATUS mdscli_blob_search(TALLOC_CTX *mem_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return NT_STATUS_NO_MEMORY;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;spotlight_blob =3D talloc_array(d=
,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;spotlight_blob =3D talloc_array(m=
em_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;max_fragment_size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (blob-&gt;spotlight_blob =3D=3D NU=
LL) {<br>
+@@ -293,7 +293,7 @@ NTSTATUS mdscli_blob_get_results(TALLOC_CTX *mem_ctx,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return NT_STATUS_NO_MEMORY;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;spotlight_blob =3D talloc_array(d=
,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;spotlight_blob =3D talloc_array(m=
em_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;max_fragment_size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (blob-&gt;spotlight_blob =3D=3D NU=
LL) {<br>
+@@ -426,7 +426,7 @@ NTSTATUS mdscli_blob_get_path(TALLOC_CTX *mem_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return NT_STATUS_NO_MEMORY;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;spotlight_blob =3D talloc_array(d=
,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;spotlight_blob =3D talloc_array(m=
em_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;max_fragment_size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (blob-&gt;spotlight_blob =3D=3D NU=
LL) {<br>
+@@ -510,7 +510,7 @@ NTSTATUS mdscli_blob_close_search(TALLOC_CTX *mem_ctx,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return NT_STATUS_NO_MEMORY;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;spotlight_blob =3D talloc_array(d=
,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;spotlight_blob =3D talloc_array(m=
em_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;max_fragment_size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (blob-&gt;spotlight_blob =3D=3D NU=
LL) {<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0004.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0004.patch<br>
new file mode 100644<br>
index 000000000..785908b52<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0004.=
patch<br>
@@ -0,0 +1,85 @@<br>
+From 0ae6084d1a9c4eb12e9f1ab1902e00f96bcbea55 Mon Sep 17 00:00:00 2001<br>
+From: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Date: Mon, 19 Jun 2023 18:28:41 +0200<br>
+Subject: [PATCH] CVE-2023-34968: mdscli: remove response blob allocation<b=
r>
+<br>
+This is handled by the NDR code transparently.<br>
+<br>
+BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15388">https:=
//bugzilla.samba.org/show_bug.cgi?id=3D15388</a><br>
+<br>
+Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Reviewed-by: Stefan Metzmacher &lt;metze@samba.org&gt;<br>
+---<br>
+ source3/rpc_client/cli_mdssvc.c | 36 ---------------------------------<br=
>
+ 1 file changed, 36 deletions(-)<br>
+<br>
+diff --git a/source3/rpc_client/cli_mdssvc.c b/source3/rpc_client/cli_mdss=
vc.c<br>
+index 046d37135cb..474d7c0b150 100644<br>
+--- a/source3/rpc_client/cli_mdssvc.c<br>
++++ b/source3/rpc_client/cli_mdssvc.c<br>
+@@ -276,15 +276,6 @@ struct tevent_req *mdscli_search_send(TALLOC_CTX *mem=
_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return tevent_req_post(req, ev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;response_blob.spotlight_blob =3D=
 talloc_array(<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; state,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; uint8_t,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; mdscli_ctx-&gt;max_fragment_size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tevent_req_nomem(state-&gt;response_bl=
ob.spotlight_blob, req)) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return tevent_req_post(req, ev);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;response_blob.size =3D mdscli_ct=
x-&gt;max_fragment_size;<br>
+-<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subreq =3D dcerpc_mdssvc_cmd_send(sta=
te,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; ev,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; mdscli_ctx-&gt;bh,<br>
+@@ -457,15 +448,6 @@ struct tevent_req *mdscli_get_results_send(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return tevent_req_post(req, ev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;response_blob.spotlight_blob =3D=
 talloc_array(<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; state,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; uint8_t,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; mdscli_ctx-&gt;max_fragment_size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tevent_req_nomem(state-&gt;response_bl=
ob.spotlight_blob, req)) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return tevent_req_post(req, ev);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;response_blob.size =3D mdscli_ct=
x-&gt;max_fragment_size;<br>
+-<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subreq =3D dcerpc_mdssvc_cmd_send(sta=
te,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; ev,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; mdscli_ctx-&gt;bh,<br>
+@@ -681,15 +663,6 @@ struct tevent_req *mdscli_get_path_send(TALLOC_CTX *m=
em_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return tevent_req_post(req, ev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;response_blob.spotlight_blob =3D=
 talloc_array(<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; state,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; uint8_t,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; mdscli_ctx-&gt;max_fragment_size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tevent_req_nomem(state-&gt;response_bl=
ob.spotlight_blob, req)) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return tevent_req_post(req, ev);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;response_blob.size =3D mdscli_ct=
x-&gt;max_fragment_size;<br>
+-<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subreq =3D dcerpc_mdssvc_cmd_send(sta=
te,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; ev,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; mdscli_ctx-&gt;bh,<br>
+@@ -852,15 +825,6 @@ struct tevent_req *mdscli_close_search_send(TALLOC_CT=
X *mem_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return tevent_req_post(req, ev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;response_blob.spotlight_blob =3D=
 talloc_array(<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; state,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; uint8_t,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; mdscli_ctx-&gt;max_fragment_size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tevent_req_nomem(state-&gt;response_bl=
ob.spotlight_blob, req)) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return tevent_req_post(req, ev);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;response_blob.size =3D mdscli_ct=
x-&gt;max_fragment_size;<br>
+-<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subreq =3D dcerpc_mdssvc_cmd_send(sta=
te,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; ev,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; mdscli_ctx-&gt;bh,<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0005.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0005.patch<br>
new file mode 100644<br>
index 000000000..308b441e9<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0005.=
patch<br>
@@ -0,0 +1,83 @@<br>
+From 353a9ccea6ff93ea2cd604dcc2b0372f056f819d Mon Sep 17 00:00:00 2001<br>
+From: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Date: Tue, 20 Jun 2023 11:28:47 +0200<br>
+Subject: [PATCH] CVE-2023-34968: smbtorture: remove response blob allocati=
on<br>
+ in mdssvc.c<br>
+<br>
+This is alreay done by NDR for us.<br>
+<br>
+BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15388">https:=
//bugzilla.samba.org/show_bug.cgi?id=3D15388</a><br>
+<br>
+Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Reviewed-by: Stefan Metzmacher &lt;metze@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/samba-team/samba/=
commit/353a9ccea6ff93ea2cd604dcc2b0372f056f819d">https://github.com/samba-t=
eam/samba/commit/353a9ccea6ff93ea2cd604dcc2b0372f056f819d</a>]<br>
+<br>
+CVE: CVE-2023-34968<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+<br>
+---<br>
+ source4/torture/rpc/mdssvc.c | 26 --------------------------<br>
+ 1 file changed, 26 deletions(-)<br>
+<br>
+diff --git a/source4/torture/rpc/mdssvc.c b/source4/torture/rpc/mdssvc.c<b=
r>
+index 3689692f7de..a16bd5b47e3 100644<br>
+--- a/source4/torture/rpc/mdssvc.c<br>
++++ b/source4/torture/rpc/mdssvc.c<br>
+@@ -536,13 +536,6 @@ static bool test_mdssvc_invalid_ph_cmd(struct torture=
_context *tctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.length =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.size =3D 0;<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob.spotlight_blob =3D talloc_ar=
ray(state,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uin=
t8_t,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0);=
<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_not_null_goto(tctx, respons=
e_blob.spotlight_blob,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok, done, &quot;da=
lloc_zero failed\n&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob.size =3D 0;<br>
+-<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D&nbsp; dcerpc_mdssvc_cmd(b,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;ph,<br>
+@@ -632,13 +625,6 @@ static bool test_mdssvc_sl_unpack_loop(struct torture=
_context *tctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.size =3D sizeof(test_sl_=
unpack_loop_buf);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.length =3D sizeof(test_s=
l_unpack_loop_buf);<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob.spotlight_blob =3D talloc_ar=
ray(state,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uin=
t8_t,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0);=
<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_not_null_goto(tctx, respons=
e_blob.spotlight_blob,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok, done, &quot;da=
lloc_zero failed\n&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob.size =3D 0;<br>
+-<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D dcerpc_mdssvc_cmd(b,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;state-&gt;ph,<br>
+@@ -764,11 +750,6 @@ static bool test_sl_dict_type_safety(struct torture_c=
ontext *tctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, request_blo=
b.length &gt; 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ok, done, &quot;sl_pack failed\n&quot;);<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob.spotlight_blob =3D talloc_ar=
ray(state, uint8_t, 0);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_not_null_goto(tctx, respons=
e_blob.spotlight_blob,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok, done, &quot;da=
lloc_zero failed\n&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob.size =3D 0;<br>
+-<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D dcerpc_mdssvc_cmd(b,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;state-&gt;ph,<br>
+@@ -926,13 +907,6 @@ static bool test_mdssvc_fetch_attr_unknown_cnid(struc=
t torture_context *tctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret, done, &q=
uot;dalloc_zero failed\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.size =3D max_fragment_si=
ze;<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob.spotlight_blob =3D talloc_ar=
ray(state,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uin=
t8_t,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max=
_fragment_size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_not_null_goto(tctx, respons=
e_blob.spotlight_blob,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret, done, &quot;d=
alloc_zero failed\n&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob.size =3D max_fragment_size;<=
br>
+-<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D sl_pack(d, (char *)request_bl=
ob.spotlight_blob, request_blob.size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, len !=3D -1=
, ret, done, &quot;sl_pack failed\n&quot;);<br>
+<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0006.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0006.patch<br>
new file mode 100644<br>
index 000000000..34526a8c8<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0006.=
patch<br>
@@ -0,0 +1,57 @@<br>
+From 449f1280b718c6da3b8e309fe124be4e9bfd8184 Mon Sep 17 00:00:00 2001<br>
+From: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Date: Tue, 20 Jun 2023 11:35:41 +0200<br>
+Subject: [PATCH] CVE-2023-34968: rpcclient: remove response blob allocatio=
n<br>
+<br>
+This is alreay done by NDR for us.<br>
+<br>
+BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15388">https:=
//bugzilla.samba.org/show_bug.cgi?id=3D15388</a><br>
+<br>
+Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Reviewed-by: Stefan Metzmacher &lt;metze@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/samba-team/samba/=
commit/449f1280b718c6da3b8e309fe124be4e9bfd8184">https://github.com/samba-t=
eam/samba/commit/449f1280b718c6da3b8e309fe124be4e9bfd8184</a>]<br>
+<br>
+CVE: CVE-2023-34968<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ source3/rpcclient/cmd_spotlight.c | 16 ----------------<br>
+ 1 file changed, 16 deletions(-)<br>
+<br>
+diff --git a/source3/rpcclient/cmd_spotlight.c b/source3/rpcclient/cmd_spo=
tlight.c<br>
+index 24db9893df6..64fe321089c 100644<br>
+--- a/source3/rpcclient/cmd_spotlight.c<br>
++++ b/source3/rpcclient/cmd_spotlight.c<br>
+@@ -144,13 +144,6 @@ static NTSTATUS cmd_mdssvc_fetch_properties(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.size =3D max_fragment_si=
ze;<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob.spotlight_blob =3D talloc_ar=
ray(mem_ctx, uint8_t, max_fragment_size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (response_blob.spotlight_blob =3D=3D NU=
LL) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; status =3D NT_STATUS_INTERNAL_ERROR;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; goto done;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob.size =3D max_fragment_size;<=
br>
+-<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D sl_pack(d, (char *)request_bl=
ob.spotlight_blob, request_blob.size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (len =3D=3D -1) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; status =3D NT_STATUS_INTERNAL_ERROR;<br>
+@@ -368,15 +361,6 @@ static NTSTATUS cmd_mdssvc_fetch_attributes(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.size =3D max_fragment_si=
ze;<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob.spotlight_blob =3D talloc_ar=
ray(mem_ctx,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uin=
t8_t,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max=
_fragment_size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (response_blob.spotlight_blob =3D=3D NU=
LL) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; status =3D NT_STATUS_INTERNAL_ERROR;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; goto done;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob.size =3D max_fragment_size;<=
br>
+-<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D sl_pack(d, (char *)request_bl=
ob.spotlight_blob, request_blob.size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (len =3D=3D -1) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; status =3D NT_STATUS_INTERNAL_ERROR;<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0007.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0007.patch<br>
new file mode 100644<br>
index 000000000..679e174c0<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0007.=
patch<br>
@@ -0,0 +1,49 @@<br>
+From cc593a6ac531f02f2fe70fd4f7dfe649a02f9206 Mon Sep 17 00:00:00 2001<br>
+From: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Date: Tue, 20 Jun 2023 11:42:10 +0200<br>
+Subject: [PATCH] CVE-2023-34968: mdssvc: remove response blob allocation<b=
r>
+<br>
+This is alreay done by NDR for us.<br>
+<br>
+BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15388">https:=
//bugzilla.samba.org/show_bug.cgi?id=3D15388</a><br>
+<br>
+Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Reviewed-by: Stefan Metzmacher &lt;metze@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/samba-team/samba/=
commit/cc593a6ac531f02f2fe70fd4f7dfe649a02f9206">https://github.com/samba-t=
eam/samba/commit/cc593a6ac531f02f2fe70fd4f7dfe649a02f9206</a>]<br>
+<br>
+CVE: CVE-2023-34968<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ source3/rpc_server/mdssvc/srv_mdssvc_nt.c | 8 --------<br>
+ 1 file changed, 8 deletions(-)<br>
+<br>
+diff --git a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c b/source3/rpc_serve=
r/mdssvc/srv_mdssvc_nt.c<br>
+index b8eed8b..714e6c1 100644<br>
+--- a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c<br>
++++ b/source3/rpc_server/mdssvc/srv_mdssvc_nt.c<br>
+@@ -209,7 +209,6 @@ void _mdssvc_unknown1(struct pipes_struct *p, struct m=
dssvc_unknown1 *r)<br>
+ void _mdssvc_cmd(struct pipes_struct *p, struct mdssvc_cmd *r)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ok;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *rbuf;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mds_ctx *mds_ctx;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
+<br>
+@@ -266,13 +265,6 @@ void _mdssvc_cmd(struct pipes_struct *p, struct mdssv=
c_cmd *r)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rbuf =3D talloc_zero_array(p-&gt;mem_ctx, =
char, r-&gt;in.max_fragment_size1);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rbuf =3D=3D NULL) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; p-&gt;fault_state =3D DCERPC_FAULT_CANT_PERFORM;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r-&gt;out.response_blob-&gt;spotlight_blob=
 =3D (uint8_t *)rbuf;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r-&gt;out.response_blob-&gt;size =3D r-&gt=
;in.max_fragment_size1;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* We currently don't use fragmentati=
on at the mdssvc RPC layer */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *r-&gt;out.fragment =3D 0;<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0008.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0008.patch<br>
new file mode 100644<br>
index 000000000..e65379fe8<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0008.=
patch<br>
@@ -0,0 +1,62 @@<br>
+From 397919e82b493206ae9b60bb9c539d52c3207729 Mon Sep 17 00:00:00 2001<br>
+From: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<br>
+Date: Fri, 29 Sep 2023 08:59:31 +0000<br>
+Subject: [PATCH] CVE-2023-34968: mdssvc: switch to doing an early return<b=
r>
+<br>
+Just reduce indentation of the code handling the success case. No change i=
n<br>
+behaviour.<br>
+<br>
+BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15388">https:=
//bugzilla.samba.org/show_bug.cgi?id=3D15388</a><br>
+<br>
+Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Reviewed-by: Stefan Metzmacher &lt;metze@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/samba-team/samba/=
commit/397919e82b493206ae9b60bb9c539d52c3207729">https://github.com/samba-t=
eam/samba/commit/397919e82b493206ae9b60bb9c539d52c3207729</a>]<br>
+<br>
+CVE: CVE-2023-34968<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ source3/rpc_server/mdssvc/mdssvc.c | 26 ++++++++++++++------------<br>
+ 1 file changed, 14 insertions(+), 12 deletions(-)<br>
+<br>
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mdssv=
c/mdssvc.c<br>
+index a6cc653..0e6a916 100644<br>
+--- a/source3/rpc_server/mdssvc/mdssvc.c<br>
++++ b/source3/rpc_server/mdssvc/mdssvc.c<br>
+@@ -1798,19 +1798,21 @@ bool mds_dispatch(struct mds_ctx *mds_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok =3D slcmd-&gt;function(mds_ctx, qu=
ery, reply);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ok) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DBG_DEBUG(&quot;%s&quot;, dalloc_dump(reply, 0));<br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; len =3D sl_pack(reply,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; (char *)response_blob-&gt;spotlight_blob,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; response_blob-&gt;size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (len =3D=3D -1) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DBG_ERR(&quot;error p=
acking Spotlight RPC reply\n&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok =3D false;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto cleanup;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; response_blob-&gt;length =3D len;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ok) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; goto cleanup;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DBG_DEBUG(&quot;%s&quot;, dalloc_dump(repl=
y, 0));<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D sl_pack(reply,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (char *)response_blob-&gt;spotlig=
ht_blob,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob-&gt;size);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (len =3D=3D -1) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DBG_ERR(&quot;error packing Spotlight RPC reply\n&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ok =3D false;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; goto cleanup;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob-&gt;length =3D len;<br>
+<br>
+ cleanup:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; talloc_free(query);<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0009.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0009.patch<br>
new file mode 100644<br>
index 000000000..e21f2ba4b<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0009.=
patch<br>
@@ -0,0 +1,465 @@<br>
+From cb8313e7bee75454ce29d2b2f657927259298f52 Mon Sep 17 00:00:00 2001<br>
+From: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Date: Mon, 19 Jun 2023 18:16:57 +0200<br>
+Subject: [PATCH] CVE-2023-34968: mdssvc: introduce an allocating wrapper t=
o<br>
+ sl_pack()<br>
+<br>
+sl_pack_alloc() does the buffer allocation that previously all callers of<=
br>
+sl_pack() did themselves.<br>
+<br>
+BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15388">https:=
//bugzilla.samba.org/show_bug.cgi?id=3D15388</a><br>
+<br>
+Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Reviewed-by: Stefan Metzmacher &lt;metze@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/samba-team/samba/=
commit/cb8313e7bee75454ce29d2b2f657927259298f52">https://github.com/samba-t=
eam/samba/commit/cb8313e7bee75454ce29d2b2f657927259298f52</a>]<br>
+<br>
+CVE: CVE-2023-34968<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ source3/rpc_client/cli_mdssvc_util.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 80 +=
++++------------------<br>
+ source3/rpc_server/mdssvc/marshalling.c&nbsp;&nbsp; | 35 ++++++++--<br>
+ source3/rpc_server/mdssvc/marshalling.h&nbsp;&nbsp; |&nbsp; 9 ++-<br>
+ source3/rpc_server/mdssvc/mdssvc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | 18 ++---<br>
+ source3/rpc_server/mdssvc/mdssvc.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; |&nbsp; 5 +-<br>
+ source3/rpc_server/mdssvc/srv_mdssvc_nt.c |&nbsp; 5 +-<br>
+ source3/rpcclient/cmd_spotlight.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; | 32 ++-------<br>
+ source4/torture/rpc/mdssvc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 24 ++-----<br>
+ 8 files changed, 80 insertions(+), 128 deletions(-)<br>
+<br>
+diff --git a/source3/rpc_client/cli_mdssvc_util.c b/source3/rpc_client/cli=
_mdssvc_util.c<br>
+index 892a844..a39202d 100644<br>
+--- a/source3/rpc_client/cli_mdssvc_util.c<br>
++++ b/source3/rpc_client/cli_mdssvc_util.c<br>
+@@ -42,7 +42,7 @@ NTSTATUS mdscli_blob_search(TALLOC_CTX *mem_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sl_array_t *scope_array =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; double dval;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t uint64val;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssize_t len;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d =3D dalloc_new(mem_ctx);<br>
+@@ -209,23 +209,11 @@ NTSTATUS mdscli_blob_search(TALLOC_CTX *mem_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return NT_STATUS_NO_MEMORY;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;spotlight_blob =3D talloc_array(m=
em_ctx,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; uint8_t,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;max_fragment_size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (blob-&gt;spotlight_blob =3D=3D NULL) {=
<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TALLOC_FREE(d);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;size =3D ctx-&gt;max_fragment_siz=
e;<br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D sl_pack(d, (char *)blob-&gt;spotli=
ght_blob, blob-&gt;size);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D sl_pack_alloc(mem_ctx, d, blob,=
 ctx-&gt;max_fragment_size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TALLOC_FREE(d);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (len =3D=3D -1) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!NT_STATUS_IS_OK(status)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return status;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;length =3D len;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;size =3D len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NT_STATUS_OK;<br>
+ }<br>
+<br>
+@@ -238,7 +226,7 @@ NTSTATUS mdscli_blob_get_results(TALLOC_CTX *mem_ctx,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *uint64p =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sl_array_t *array =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sl_array_t *cmd_array =3D NULL;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssize_t len;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d =3D dalloc_new(mem_ctx);<br>
+@@ -293,23 +281,11 @@ NTSTATUS mdscli_blob_get_results(TALLOC_CTX *mem_ctx=
,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return NT_STATUS_NO_MEMORY;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;spotlight_blob =3D talloc_array(m=
em_ctx,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; uint8_t,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;max_fragment_size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (blob-&gt;spotlight_blob =3D=3D NULL) {=
<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TALLOC_FREE(d);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;size =3D ctx-&gt;max_fragment_siz=
e;<br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D sl_pack(d, (char *)blob-&gt;spotli=
ght_blob, blob-&gt;size);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D sl_pack_alloc(mem_ctx, d, blob,=
 ctx-&gt;max_fragment_size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TALLOC_FREE(d);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (len =3D=3D -1) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!NT_STATUS_IS_OK(status)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return status;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;length =3D len;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;size =3D len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NT_STATUS_OK;<br>
+ }<br>
+<br>
+@@ -325,7 +301,7 @@ NTSTATUS mdscli_blob_get_path(TALLOC_CTX *mem_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sl_array_t *cmd_array =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sl_array_t *attr_array =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sl_cnids_t *cnids =3D NULL;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssize_t len;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d =3D dalloc_new(mem_ctx);<br>
+@@ -426,23 +402,11 @@ NTSTATUS mdscli_blob_get_path(TALLOC_CTX *mem_ctx,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return NT_STATUS_NO_MEMORY;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;spotlight_blob =3D talloc_array(m=
em_ctx,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; uint8_t,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;max_fragment_size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (blob-&gt;spotlight_blob =3D=3D NULL) {=
<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TALLOC_FREE(d);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;size =3D ctx-&gt;max_fragment_siz=
e;<br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D sl_pack(d, (char *)blob-&gt;spotli=
ght_blob, blob-&gt;size);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D sl_pack_alloc(mem_ctx, d, blob,=
 ctx-&gt;max_fragment_size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TALLOC_FREE(d);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (len =3D=3D -1) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!NT_STATUS_IS_OK(status)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return status;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;length =3D len;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;size =3D len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NT_STATUS_OK;<br>
+ }<br>
+<br>
+@@ -455,7 +419,7 @@ NTSTATUS mdscli_blob_close_search(TALLOC_CTX *mem_ctx,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *uint64p =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sl_array_t *array =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sl_array_t *cmd_array =3D NULL;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssize_t len;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d =3D dalloc_new(mem_ctx);<br>
+@@ -510,22 +474,10 @@ NTSTATUS mdscli_blob_close_search(TALLOC_CTX *mem_ct=
x,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return NT_STATUS_NO_MEMORY;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;spotlight_blob =3D talloc_array(m=
em_ctx,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; uint8_t,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;max_fragment_size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (blob-&gt;spotlight_blob =3D=3D NULL) {=
<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TALLOC_FREE(d);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;size =3D ctx-&gt;max_fragment_siz=
e;<br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D sl_pack(d, (char *)blob-&gt;spotli=
ght_blob, blob-&gt;size);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D sl_pack_alloc(mem_ctx, d, blob,=
 ctx-&gt;max_fragment_size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TALLOC_FREE(d);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (len =3D=3D -1) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!NT_STATUS_IS_OK(status)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return status;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;length =3D len;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; blob-&gt;size =3D len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NT_STATUS_OK;<br>
+ }<br>
+diff --git a/source3/rpc_server/mdssvc/marshalling.c b/source3/rpc_server/=
mdssvc/marshalling.c<br>
+index 441d411..34bfda5 100644<br>
+--- a/source3/rpc_server/mdssvc/marshalling.c<br>
++++ b/source3/rpc_server/mdssvc/marshalling.c<br>
+@@ -78,6 +78,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query, const c=
har *buf,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ssize_t offset, size_t bufsize,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; int count, ssize_t toc_offset,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; int encoding);<br>
++static ssize_t sl_pack(DALLOC_CTX *query, char *buf, size_t bufsize);<br>
+<br>
+ /************************************************************************=
******<br>
+&nbsp; * Wrapper functions for the *VAL macros with bound checking<br>
+@@ -1190,11 +1191,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return offset;<br>
+ }<br>
+<br>
+-/************************************************************************=
******<br>
+- * Global functions for packing und unpacking<br>
+- ************************************************************************=
******/<br>
+-<br>
+-ssize_t sl_pack(DALLOC_CTX *query, char *buf, size_t bufsize)<br>
++static ssize_t sl_pack(DALLOC_CTX *query, char *buf, size_t bufsize)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssize_t result;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *toc_buf;<br>
+@@ -1274,6 +1271,34 @@ ssize_t sl_pack(DALLOC_CTX *query, char *buf, size_=
t bufsize)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return len;<br>
+ }<br>
+<br>
++/************************************************************************=
******<br>
++ * Global functions for packing und unpacking<br>
++ ************************************************************************=
******/<br>
++<br>
++NTSTATUS sl_pack_alloc(TALLOC_CTX *mem_ctx,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DALLOC_CTX *d,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdssvc_blob *b,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t max_fragment_size)<b=
r>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssize_t len;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b-&gt;spotlight_blob =3D talloc_zero_array=
(mem_ctx,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_fragment_size);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (b-&gt;spotlight_blob =3D=3D NULL) {<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D sl_pack(d, (char *)b-&gt;spotlight=
_blob, max_fragment_size);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (len =3D=3D -1) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_DATA_ERROR;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b-&gt;length =3D len;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b-&gt;size =3D len;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NT_STATUS_OK;<br>
++}<br>
++<br>
+ bool sl_unpack(DALLOC_CTX *query, const char *buf, size_t bufsize)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssize_t result;<br>
+diff --git a/source3/rpc_server/mdssvc/marshalling.h b/source3/rpc_server/=
mdssvc/marshalling.h<br>
+index 086ca74..2cc1b44 100644<br>
+--- a/source3/rpc_server/mdssvc/marshalling.h<br>
++++ b/source3/rpc_server/mdssvc/marshalling.h<br>
+@@ -22,6 +22,9 @@<br>
+ #define _MDSSVC_MARSHALLING_H<br>
+<br>
+ #include &quot;dalloc.h&quot;<br>
++#include &quot;libcli/util/ntstatus.h&quot;<br>
++#include &quot;lib/util/data_blob.h&quot;<br>
++#include &quot;librpc/gen_ndr/mdssvc.h&quot;<br>
+<br>
+ #define MAX_SL_FRAGMENT_SIZE 0xFFFFF<br>
+<br>
+@@ -49,7 +52,11 @@ typedef struct {<br>
+&nbsp; * Function declarations<br>
+&nbsp; *******************************************************************=
***********/<br>
+<br>
+-extern ssize_t sl_pack(DALLOC_CTX *query, char *buf, size_t bufsize);<br>
++extern NTSTATUS sl_pack_alloc(TALLOC_CTX *mem_ctx,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; DALLOC_CTX *d,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; struct mdssvc_blob *b,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; size_t max_fragment_size);<br>
++<br>
+ extern bool sl_unpack(DALLOC_CTX *query, const char *buf, size_t bufsize)=
;<br>
+<br>
+ #endif<br>
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mdssv=
c/mdssvc.c<br>
+index 0e6a916..19257e8 100644<br>
+--- a/source3/rpc_server/mdssvc/mdssvc.c<br>
++++ b/source3/rpc_server/mdssvc/mdssvc.c<br>
+@@ -1726,11 +1726,11 @@ error:<br>
+&nbsp; **/<br>
+ bool mds_dispatch(struct mds_ctx *mds_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; struct mdssvc_blob *request_blob,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; struct mdssvc_blob *response_blob)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; struct mdssvc_blob *response_blob,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; size_t max_fragment_size)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ok;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssize_t len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DALLOC_CTX *query =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DALLOC_CTX *reply =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *rpccmd;<br>
+@@ -1738,6 +1738,7 @@ bool mds_dispatch(struct mds_ctx *mds_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct smb_filename conn_basedi=
r =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .base_name =3D mds_ctx-&gt;conn-&gt;connectpath,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (CHECK_DEBUGLVL(10)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; const struct sl_query *slq;<br>
+@@ -1804,15 +1805,14 @@ bool mds_dispatch(struct mds_ctx *mds_ctx,<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DBG_DEBUG(&quot;%s&quot;, dalloc_dump=
(reply, 0));<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D sl_pack(reply,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (char *)response_blob-&gt;spotlig=
ht_blob,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob-&gt;size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (len =3D=3D -1) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DBG_ERR(&quot;error packing Spotlight RPC reply\n&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ok =3D false;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D sl_pack_alloc(response_blob,<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; reply,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; response_blob,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; max_fragment_size);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!NT_STATUS_IS_OK(status)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DBG_ERR(&quot;sl_pack_alloc() failed\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto cleanup;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob-&gt;length =3D len;<br>
+<br>
+ cleanup:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; talloc_free(query);<br>
+diff --git a/source3/rpc_server/mdssvc/mdssvc.h b/source3/rpc_server/mdssv=
c/mdssvc.h<br>
+index a097991..b3bd8b9 100644<br>
+--- a/source3/rpc_server/mdssvc/mdssvc.h<br>
++++ b/source3/rpc_server/mdssvc/mdssvc.h<br>
+@@ -157,9 +157,10 @@ struct mds_ctx *mds_init_ctx(TALLOC_CTX *mem_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; int snum,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; const char *sharename,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; const char *path);<br>
+-extern bool mds_dispatch(struct mds_ctx *query_ctx,<br>
++extern bool mds_dispatch(struct mds_ctx *mds_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mds=
svc_blob *request_blob,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdssvc_b=
lob *response_blob);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdssvc_b=
lob *response_blob,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t max_frag=
ment_size);<br>
+ bool mds_add_result(struct sl_query *slq, const char *path);<br>
+<br>
+ #endif /* _MDSSVC_H */<br>
+diff --git a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c b/source3/rpc_serve=
r/mdssvc/srv_mdssvc_nt.c<br>
+index 714e6c1..59e2a97 100644<br>
+--- a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c<br>
++++ b/source3/rpc_server/mdssvc/srv_mdssvc_nt.c<br>
+@@ -269,7 +269,10 @@ void _mdssvc_cmd(struct pipes_struct *p, struct mdssv=
c_cmd *r)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* We currently don't use fragmentati=
on at the mdssvc RPC layer */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *r-&gt;out.fragment =3D 0;<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok =3D mds_dispatch(mds_ctx, &amp;r-&gt;in=
.request_blob, r-&gt;out.response_blob);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok =3D mds_dispatch(mds_ctx,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;r-&g=
t;in.request_blob,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r-&gt;out=
.response_blob,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r-&gt;in.=
max_fragment_size1);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ok) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *r-&gt;out.unkn9 =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
+diff --git a/source3/rpcclient/cmd_spotlight.c b/source3/rpcclient/cmd_spo=
tlight.c<br>
+index 64fe321..ba3f61f 100644<br>
+--- a/source3/rpcclient/cmd_spotlight.c<br>
++++ b/source3/rpcclient/cmd_spotlight.c<br>
+@@ -43,7 +43,6 @@ static NTSTATUS cmd_mdssvc_fetch_properties(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t unkn3;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; /* server always returns 0 ? */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdssvc_blob request_blob;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdssvc_blob response_blob;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssize_t len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t max_fragment_size =3D 64 * 1=
024;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DALLOC_CTX *d, *mds_reply;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *uint64var;<br>
+@@ -137,20 +136,10 @@ static NTSTATUS cmd_mdssvc_fetch_properties(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto done;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.spotlight_blob =3D talloc_arr=
ay(mem_ctx, uint8_t, max_fragment_size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (request_blob.spotlight_blob =3D=3D NUL=
L) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; status =3D NT_STATUS_INTERNAL_ERROR;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; goto done;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.size =3D max_fragment_size;<b=
r>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D sl_pack(d, (char *)request_blob.sp=
otlight_blob, request_blob.size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (len =3D=3D -1) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; status =3D NT_STATUS_INTERNAL_ERROR;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D sl_pack_alloc(mem_ctx, d, &amp;=
request_blob, max_fragment_size);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!NT_STATUS_IS_OK(status)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto done;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.length =3D len;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.size =3D len;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D&nbsp; dcerpc_mdssvc_cmd(b,=
 mem_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;share_handle,<=
br>
+@@ -204,7 +193,6 @@ static NTSTATUS cmd_mdssvc_fetch_attributes(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t unkn3;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; /* server always returns 0 ? */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdssvc_blob request_blob;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdssvc_blob response_blob;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssize_t len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t max_fragment_size =3D 64 * 1=
024;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DALLOC_CTX *d, *mds_reply;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *uint64var;<br>
+@@ -352,22 +340,10 @@ static NTSTATUS cmd_mdssvc_fetch_attributes(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto done;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.spotlight_blob =3D talloc_arr=
ay(mem_ctx,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t,<=
br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_fragm=
ent_size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (request_blob.spotlight_blob =3D=3D NUL=
L) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; status =3D NT_STATUS_INTERNAL_ERROR;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; goto done;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.size =3D max_fragment_size;<b=
r>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D sl_pack(d, (char *)request_blob.sp=
otlight_blob, request_blob.size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (len =3D=3D -1) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; status =3D NT_STATUS_INTERNAL_ERROR;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D sl_pack_alloc(mem_ctx, d, &amp;=
request_blob, max_fragment_size);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!NT_STATUS_IS_OK(status)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto done;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.length =3D len;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.size =3D len;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D dcerpc_mdssvc_cmd(b, mem_c=
tx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;share_handle,<br>
+diff --git a/source4/torture/rpc/mdssvc.c b/source4/torture/rpc/mdssvc.c<b=
r>
+index e99c82c..1305456 100644<br>
+--- a/source4/torture/rpc/mdssvc.c<br>
++++ b/source4/torture/rpc/mdssvc.c<br>
+@@ -745,11 +745,9 @@ static bool test_sl_dict_type_safety(struct torture_c=
ontext *tctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok, done, &qu=
ot;dalloc_new failed\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.size =3D 64 * 1024;<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.length =3D sl_pack(d,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (char *)requ=
est_blob.spotlight_blob,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob=
.size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, request_blob.len=
gth &gt; 0,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ok, done, &quot;sl_pack failed\n&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D sl_pack_alloc(tctx, d, &amp;req=
uest_blob, 64 * 1024);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_ntstatus_ok_goto(tctx, stat=
us, ok, done,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&quot;sl_pack_alloc() failed\n&quot;);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D dcerpc_mdssvc_cmd(b,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state,<br>
+@@ -836,7 +834,6 @@ static bool test_mdssvc_fetch_attr_unknown_cnid(struct=
 torture_context *tctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *path_type =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t ino64;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssize_t len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ok =3D true;<br>
+<br>
+@@ -901,19 +898,10 @@ static bool test_mdssvc_fetch_attr_unknown_cnid(stru=
ct torture_context *tctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D dalloc_add(array, cnids, sl_c=
nids_t);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, ret =3D=3D =
0, ret, done, &quot;dalloc_add failed\n&quot;);<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.spotlight_blob =3D talloc_arr=
ay(state,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t,<=
br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_fragm=
ent_size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_not_null_goto(tctx, request=
_blob.spotlight_blob,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret, done, &quot;d=
alloc_zero failed\n&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.size =3D max_fragment_size;<b=
r>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D sl_pack(d, (char *)request_blob.sp=
otlight_blob, request_blob.size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, len !=3D -1, ret=
, done, &quot;sl_pack failed\n&quot;);<br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.length =3D len;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.size =3D len;<br>
+<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D sl_pack_alloc(tctx, d, &amp;req=
uest_blob, max_fragment_size);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_ntstatus_ok_goto(tctx, stat=
us, ok, done,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&quot;sl_pack_alloc() failed\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D&nbsp; dcerpc_mdssvc_cmd(b,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;state-&gt;ph,<=
br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0010.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0010.patch<br>
new file mode 100644<br>
index 000000000..57668f5ee<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0010.=
patch<br>
@@ -0,0 +1,484 @@<br>
+From a5c570e262911874e43e82de601d809aa5b1b729 Mon Sep 17 00:00:00 2001<br>
+From: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Date: Sat, 17 Jun 2023 13:53:27 +0200<br>
+Subject: [PATCH] CVE-2023-34968: mdscli: return share relative paths The n=
ext<br>
+ commit will change the Samba Spotlight server to return absolute paths th=
at<br>
+ start with the sharename as &quot;/SHARENAME/...&quot; followed by the sh=
are path<br>
+ relative appended.<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+So given a share<br>
+<br>
+&nbsp; [spotlight]<br>
+&nbsp;&nbsp;&nbsp; path =3D /foo/bar<br>
+&nbsp;&nbsp;&nbsp; spotlight =3D yes<br>
+<br>
+and a file inside this share with a full path of<br>
+<br>
+&nbsp; /foo/bar/dir/file<br>
+<br>
+previously a search that matched this file would returns the absolute<br>
+server-side pato of the file, ie<br>
+<br>
+&nbsp; /foo/bar/dir/file<br>
+<br>
+This will be change to<br>
+<br>
+&nbsp; /spotlight/dir/file<br>
+<br>
+As currently the mdscli library and hence the mdsearch tool print out thes=
e<br>
+paths returned from the server, we have to change the output to accomodate=
 these<br>
+fake paths. The only way to do this sensibly is by makeing the paths relat=
ive to<br>
+the containing share, so just<br>
+<br>
+&nbsp; dir/file<br>
+<br>
+in the example above.<br>
+<br>
+The client learns about the share root path prefix =96 real server-side of=
 fake in<br>
+the future =96 in an initial handshake in the &quot;share_path&quot; out a=
rgument of the<br>
+mdssvc_open() RPC call, so the client can use this path to convert the abs=
olute<br>
+path to relative.<br>
+<br>
+There is however an additional twist: the macOS Spotlight server prefixes =
this<br>
+absolute path with another prefix, typically &quot;/System/Volumes/Data&qu=
ot;, so in the<br>
+example above the full path for the same search would be<br>
+<br>
+&nbsp; /System/Volumes/Data/foo/bar/dir/file<br>
+<br>
+So macOS does return the full server-side path too, just prefixed with an<=
br>
+additional path. This path prefixed can be queried by the client in the<br=
>
+mdssvc_cmd() RPC call with an Spotlight command of &quot;fetchPropertiesFo=
rContext:&quot;<br>
+and the path is returned in a dictionary with key &quot;kMDSStorePathScope=
s&quot;. Samba<br>
+just returns &quot;/&quot; for this.<br>
+<br>
+Currently the mdscli library doesn't issue this Spotlight RPC<br>
+request (fetchPropertiesForContext), so this is added in this commit. In t=
he<br>
+end, all search result paths are stripped of the combined prefix<br>
+<br>
+&nbsp; kMDSStorePathScopes + share_path (from mdssvc_open).<br>
+<br>
+eg<br>
+<br>
+&nbsp; kMDSStorePathScopes =3D /System/Volumes/Data<br>
+&nbsp; share_path =3D /foo/bar<br>
+&nbsp; search result =3D /System/Volumes/Data/foo/bar/dir/file<br>
+&nbsp; relative path returned by mdscli =3D dir/file<br>
+<br>
+Makes sense? :)<br>
+<br>
+BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15388">https:=
//bugzilla.samba.org/show_bug.cgi?id=3D15388</a><br>
+<br>
+Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Reviewed-by: Stefan Metzmacher &lt;metze@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/samba-team/samba/=
commit/a5c570e262911874e43e82de601d809aa5b1b729">https://github.com/samba-t=
eam/samba/commit/a5c570e262911874e43e82de601d809aa5b1b729</a>]<br>
+<br>
+CVE: CVE-2023-34968<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ python/samba/tests/dcerpc/mdssvc.py&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 26 ++=
--<br>
+ source3/rpc_client/cli_mdssvc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 155 +++++++++++++++++++++++-<br>
+ source3/rpc_client/cli_mdssvc_private.h |&nbsp;&nbsp; 4 +<br>
+ source3/rpc_client/cli_mdssvc_util.c&nbsp;&nbsp;&nbsp; |&nbsp; 68 +++++++=
++++<br>
+ source3/rpc_client/cli_mdssvc_util.h&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +<=
br>
+ 5 files changed, 243 insertions(+), 14 deletions(-)<br>
+<br>
+diff --git a/python/samba/tests/dcerpc/mdssvc.py b/python/samba/tests/dcer=
pc/mdssvc.py<br>
+index b0df509..5002e5d 100644<br>
+--- a/python/samba/tests/dcerpc/mdssvc.py<br>
++++ b/python/samba/tests/dcerpc/mdssvc.py<br>
+@@ -84,10 +84,11 @@ class MdssvcTests(RpcInterfaceTestCase):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.t =3D threading.Thre=
ad(target=3DMdssvcTests.http_server, args=3D(self,))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.t.setDaemon(True)<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.t.start()<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.sharepath =3D os.environ[=
&quot;LOCAL_PATH&quot;]<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; time.sleep(1)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conn =3D mdscli.conn(self=
.pipe, 'spotlight', '/foo')<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.sharepath =3D conn.sharep=
ath()<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.fakepath =3D conn.sharepa=
th()<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conn.disconnect(self.pipe=
)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for file in testfiles:<br=
>
+@@ -105,12 +106,11 @@ class MdssvcTests(RpcInterfaceTestCase):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.server.serve_forever=
()<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; def run_test(self, query, expect, json_in, json_o=
ut):<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; expect =3D [s.replace(&quot;%B=
ASEPATH%&quot;, self.sharepath) for s in expect]<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.server.json_in =3D j=
son_in.replace(&quot;%BASEPATH%&quot;, self.sharepath)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.server.json_out =3D =
json_out.replace(&quot;%BASEPATH%&quot;, self.sharepath)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.conn =3D mdscli.conn=
(self.pipe, 'spotlight', '/foo')<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; search =3D self.conn.search(se=
lf.pipe, query, self.sharepath)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; search =3D self.conn.search(se=
lf.pipe, query, self.fakepath)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Give it some time, the =
get_results() below returns immediately<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # what's available, so if=
 we ask to soon, we might get back no results<br>
+@@ -141,7 +141,7 @@ class MdssvcTests(RpcInterfaceTestCase):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }'''<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exp_results =3D [&quot;%BASEPA=
TH%/foo&quot;, &quot;%BASEPATH%/bar&quot;]<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exp_results =3D [&quot;foo&quo=
t;, &quot;bar&quot;]<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.run_test('*=3D=3D&qu=
ot;samba*&quot;', exp_results, exp_json_query, fake_json_response)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; def test_mdscli_search_escapes(self):<br>
+@@ -181,14 +181,14 @@ class MdssvcTests(RpcInterfaceTestCase):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }'''<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exp_results =3D [<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r&quot=
;%BASEPATH%/x+x&quot;,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r&quot=
;%BASEPATH%/x*x&quot;,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r&quot=
;%BASEPATH%/x=3Dx&quot;,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r&quot=
;%BASEPATH%/x'x&quot;,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r&quot=
;%BASEPATH%/x?x&quot;,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r&quot=
;%BASEPATH%/x x&quot;,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r&quot=
;%BASEPATH%/x(x&quot;,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
%BASEPATH%/x\&quot;x&quot;,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r&quot=
;%BASEPATH%/x\x&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r&quot=
;x+x&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r&quot=
;x*x&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r&quot=
;x=3Dx&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r&quot=
;x'x&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r&quot=
;x?x&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r&quot=
;x x&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r&quot=
;x(x&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
x\&quot;x&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r&quot=
;x\x&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.run_test(sl_query, e=
xp_results, exp_json_query, fake_json_response)<br>
+diff --git a/source3/rpc_client/cli_mdssvc.c b/source3/rpc_client/cli_mdss=
vc.c<br>
+index 07c19b5..a047b91 100644<br>
+--- a/source3/rpc_client/cli_mdssvc.c<br>
++++ b/source3/rpc_client/cli_mdssvc.c<br>
+@@ -43,10 +43,12 @@ char *mdscli_get_basepath(TALLOC_CTX *mem_ctx,<br>
+ struct mdscli_connect_state {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct tevent_context *ev;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdscli_ctx *mdscli_ctx;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdssvc_blob response_blob;<br>
+ };<br>
+<br>
+ static void mdscli_connect_open_done(struct tevent_req *subreq);<br>
+ static void mdscli_connect_unknown1_done(struct tevent_req *subreq);<br>
++static void mdscli_connect_fetch_props_done(struct tevent_req *subreq);<b=
r>
+<br>
+ struct tevent_req *mdscli_connect_send(TALLOC_CTX *mem_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
truct tevent_context *ev,<br>
+@@ -111,6 +113,7 @@ static void mdscli_connect_open_done(struct tevent_req=
 *subreq)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdscli_connect_state *state =
=3D tevent_req_data(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; req, struct mdscli_connect_state);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdscli_ctx *mdscli_ctx =3D sta=
te-&gt;mdscli_ctx;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t share_path_len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D dcerpc_mdssvc_open_recv(su=
breq, state);<br>
+@@ -120,6 +123,18 @@ static void mdscli_connect_open_done(struct tevent_re=
q *subreq)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; share_path_len =3D strlen(mdscli_ctx-&gt;m=
dscmd_open.share_path);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (share_path_len &lt; 1 || share_path_le=
n &gt; UINT16_MAX) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mdscli_ctx-&gt;mdscmd_open.share_path_len =
=3D share_path_len;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (mdscli_ctx-&gt;mdscmd_open.share_path[=
share_path_len-1] =3D=3D '/') {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; mdscli_ctx-&gt;mdscmd_open.share_path[share_path_len-1] =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; mdscli_ctx-&gt;mdscmd_open.share_path_len--;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subreq =3D dcerpc_mdssvc_unknown1_sen=
d(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;ev,<br=
>
+@@ -146,6 +161,8 @@ static void mdscli_connect_unknown1_done(struct tevent=
_req *subreq)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; subreq, struct tevent_req);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdscli_connect_state *state =
=3D tevent_req_data(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; req, struct mdscli_connect_state);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdscli_ctx *mdscli_ctx =3D state-&g=
t;mdscli_ctx;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdssvc_blob request_blob;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D dcerpc_mdssvc_unknown1_rec=
v(subreq, state);<br>
+@@ -153,6 +170,108 @@ static void mdscli_connect_unknown1_done(struct teve=
nt_req *subreq)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tevent_req_nterror(req, status)) =
{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D mdscli_blob_fetch_props(state,<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; state-&gt;mdscli_ctx,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &amp;request_blob);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tevent_req_nterror(req, status)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subreq =3D dcerpc_mdssvc_cmd_send(state,<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
state-&gt;ev,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
mdscli_ctx-&gt;bh,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&amp;mdscli_ctx-&gt;ph,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
mdscli_ctx-&gt;dev,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
mdscli_ctx-&gt;mdscmd_open.unkn2,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
mdscli_ctx-&gt;flags,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
request_blob,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
mdscli_ctx-&gt;max_fragment_size,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
1,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
mdscli_ctx-&gt;max_fragment_size,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&amp;mdscli_ctx-&gt;mdscmd_cmd.fragment,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&amp;state-&gt;response_blob,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&amp;mdscli_ctx-&gt;mdscmd_cmd.unkn9);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tevent_req_nomem(subreq, req)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tevent_req_set_callback(subreq, mdscli_con=
nect_fetch_props_done, req);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mdscli_ctx-&gt;async_pending++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
++}<br>
++<br>
++static void mdscli_connect_fetch_props_done(struct tevent_req *subreq)<br=
>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct tevent_req *req =3D tevent_req_call=
back_data(<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; subreq, struct tevent_req);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdscli_connect_state *state =3D tev=
ent_req_data(<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; req, struct mdscli_connect_state);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdscli_ctx *mdscli_ctx =3D state-&g=
t;mdscli_ctx;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DALLOC_CTX *d =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sl_array_t *path_scope_array =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *path_scope =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ok;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D dcerpc_mdssvc_cmd_recv(subreq, =
state);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TALLOC_FREE(subreq);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;mdscli_ctx-&gt;async_pending--;<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tevent_req_nterror(req, status)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d =3D dalloc_new(state);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tevent_req_nomem(d, req)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok =3D sl_unpack(d,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (char *)state-&gt;response_=
blob.spotlight_blob,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;response_blob.len=
gth);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ok) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; path_scope_array =3D dalloc_value_for_key(=
d,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DALLOC_CTX&quot;, 0,<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;kMDSStorePathScopes&q=
uot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;sl_array_t&quot;);<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (path_scope_array =3D=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DBG_ERR(&quot;Missing kMDSStorePathScopes\n&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; path_scope =3D dalloc_get(path_scope_array=
, &quot;char *&quot;, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (path_scope =3D=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DBG_ERR(&quot;Missing path in kMDSStorePathScopes\n&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mdscli_ctx-&gt;path_scope_len =3D strlen(p=
ath_scope);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (mdscli_ctx-&gt;path_scope_len &lt; 1 |=
|<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mdscli_ctx-&gt;pat=
h_scope_len &gt; UINT16_MAX)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DBG_ERR(&quot;Bad path_scope: %s\n&quot;, path_scope);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mdscli_ctx-&gt;path_scope =3D talloc_strdu=
p(mdscli_ctx, path_scope);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tevent_req_nomem(mdscli_ctx-&gt;path_s=
cope, req)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (mdscli_ctx-&gt;path_scope[mdscli_ctx-&=
gt;path_scope_len-1] =3D=3D '/') {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; mdscli_ctx-&gt;path_scope[mdscli_ctx-&gt;path_scope_len-1] =3D '\0';<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; mdscli_ctx-&gt;path_scope_len--;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tevent_req_done(req);<br>
+ }<br>
+@@ -697,7 +816,10 @@ static void mdscli_get_path_done(struct tevent_req *s=
ubreq)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdscli_get_path_state *state =
=3D tevent_req_data(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; req, struct mdscli_get_path_state);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DALLOC_CTX *d =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t pathlen;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t prefixlen;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *path =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *p =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ok;<br>
+<br>
+@@ -732,7 +854,38 @@ static void mdscli_get_path_done(struct tevent_req *s=
ubreq)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; tevent_req_nterror(req, NT_STATUS_INTERNAL_ERROR);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;path =3D talloc_move(state, &amp=
;path);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Path is prefixed by /PATHSCOPE/SHARENAM=
E/, strip it */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pathlen =3D strlen(path);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * path_scope_len and share_path_len =
are already checked to be smaller<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * then UINT16_MAX so this can't over=
flow<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prefixlen =3D state-&gt;mdscli_ctx-&gt;pat=
h_scope_len<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; + state-&gt;mdscli_ctx-&gt;mdscmd_open.share_path_len;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pathlen &lt; prefixlen) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DBG_DEBUG(&quot;Bad path: %s\n&quot;, path);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; tevent_req_nterror(req, NT_STATUS_INVALID_PARAMETER);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p =3D path + prefixlen;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (*p =3D=3D '/') {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; p++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*p =3D=3D '\0') {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DBG_DEBUG(&quot;Bad path: %s\n&quot;, path);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; tevent_req_nterror(req, NT_STATUS_INVALID_PARAMETER);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;path =3D talloc_strdup(state, p)=
;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (state-&gt;path =3D=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; tevent_req_nterror(req, NT_STATUS_NO_MEMORY);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DBG_DEBUG(&quot;path: %s\n&quot;, sta=
te-&gt;path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tevent_req_done(req);<br>
+diff --git a/source3/rpc_client/cli_mdssvc_private.h b/source3/rpc_client/=
cli_mdssvc_private.h<br>
+index 031af85..b10aca0 100644<br>
+--- a/source3/rpc_client/cli_mdssvc_private.h<br>
++++ b/source3/rpc_client/cli_mdssvc_private.h<br>
+@@ -42,6 +42,7 @@ struct mdscli_ctx {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* cmd specific or unknown fields */<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; char share_path[1025];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; size_t share_path_len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; uint32_t unkn2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; uint32_t unkn3;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } mdscmd_open;<br>
+@@ -56,6 +57,9 @@ struct mdscli_ctx {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; uint32_t status;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } mdscmd_close;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *path_scope;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t path_scope_len;<br>
+ };<br>
+<br>
+ struct mdscli_search_ctx {<br>
+diff --git a/source3/rpc_client/cli_mdssvc_util.c b/source3/rpc_client/cli=
_mdssvc_util.c<br>
+index a39202d..1eaaca7 100644<br>
+--- a/source3/rpc_client/cli_mdssvc_util.c<br>
++++ b/source3/rpc_client/cli_mdssvc_util.c<br>
+@@ -28,6 +28,74 @@<br>
+ #include &quot;rpc_server/mdssvc/dalloc.h&quot;<br>
+ #include &quot;rpc_server/mdssvc/marshalling.h&quot;<br>
+<br>
++NTSTATUS mdscli_blob_fetch_props(TALLOC_CTX *mem_ctx,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdscli_ctx *ctx,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdssvc_blob *blob)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DALLOC_CTX *d =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *uint64p =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sl_array_t *array =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sl_array_t *cmd_array =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d =3D dalloc_new(mem_ctx);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (d =3D=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; array =3D dalloc_zero(d, sl_array_t);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (array =3D=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TALLOC_FREE(d);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D dalloc_add(d, array, sl_array_t);<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret !=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TALLOC_FREE(d);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_array =3D dalloc_zero(d, sl_array_t);<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (cmd_array =3D=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TALLOC_FREE(d);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D dalloc_add(array, cmd_array, sl_ar=
ray_t);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret !=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TALLOC_FREE(d);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D dalloc_stradd(cmd_array, &quot;fet=
chPropertiesForContext:&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret !=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TALLOC_FREE(d);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64p =3D talloc_zero_array(cmd_array, u=
int64_t, 2);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (uint64p =3D=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TALLOC_FREE(d);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; talloc_set_name(uint64p, &quot;uint64_t *&=
quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D dalloc_add(cmd_array, uint64p, uin=
t64_t *);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret !=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TALLOC_FREE(d);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return NT_STATUS_NO_MEMORY;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D sl_pack_alloc(mem_ctx, d, blob,=
 ctx-&gt;max_fragment_size);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TALLOC_FREE(d);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!NT_STATUS_IS_OK(status)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return status;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NT_STATUS_OK;<br>
++}<br>
++<br>
+ NTSTATUS mdscli_blob_search(TALLOC_CTX *mem_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; struct mdscli_search_ctx *search,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; struct mdssvc_blob *blob)<br>
+diff --git a/source3/rpc_client/cli_mdssvc_util.h b/source3/rpc_client/cli=
_mdssvc_util.h<br>
+index 7a98c85..3f32475 100644<br>
+--- a/source3/rpc_client/cli_mdssvc_util.h<br>
++++ b/source3/rpc_client/cli_mdssvc_util.h<br>
+@@ -21,6 +21,10 @@<br>
+ #ifndef _MDSCLI_UTIL_H_<br>
+ #define _MDSCLI_UTIL_H_<br>
+<br>
++NTSTATUS mdscli_blob_fetch_props(TALLOC_CTX *mem_ctx,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdscli_ctx *ctx,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdssvc_blob *blob);<br>
++<br>
+ NTSTATUS mdscli_blob_search(TALLOC_CTX *mem_ctx,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; struct mdscli_search_ctx *search,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; struct mdssvc_blob *blob);<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
8_0011.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
968_0011.patch<br>
new file mode 100644<br>
index 000000000..d2bef187f<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0011.=
patch<br>
@@ -0,0 +1,295 @@<br>
+From 091b0265fe42878d676def5d4f5b4f8f3977b0e2 Mon Sep 17 00:00:00 2001<br>
+From: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Date: Mon, 5 Jun 2023 18:02:20 +0200<br>
+Subject: [PATCH] CVE-2023-34968: mdssvc: return a fake share path Instead =
of<br>
+ returning the real server-side absolute path of shares and search results=
,<br>
+ return a fake absolute path replacing the path of the share with the shar=
e<br>
+ name, iow for a share &quot;test&quot; with a server-side path of &quot;/=
foo/bar&quot;, we<br>
+ previously returned<br>
+<br>
+&nbsp; /foo/bar and<br>
+&nbsp; /foo/bar/search/result<br>
+<br>
+and now return<br>
+<br>
+&nbsp; /test and<br>
+&nbsp; /test/search/result<br>
+<br>
+BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15388">https:=
//bugzilla.samba.org/show_bug.cgi?id=3D15388</a><br>
+<br>
+Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Reviewed-by: Stefan Metzmacher &lt;metze@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/samba-team/samba/=
commit/091b0265fe42878d676def5d4f5b4f8f3977b0e2">https://github.com/samba-t=
eam/samba/commit/091b0265fe42878d676def5d4f5b4f8f3977b0e2</a>]<br>
+<br>
+CVE: CVE-2023-34968<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ source3/lib/util_path.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 52 +++++++++++=
+++++++++<br>
+ source3/lib/util_path.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 5 ++<br>
+ source3/rpc_server/mdssvc/mdssvc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | 60 +++++++++++++++++++++--<br>
+ source3/rpc_server/mdssvc/mdssvc.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; |&nbsp; 1 +<br>
+ source3/rpc_server/mdssvc/srv_mdssvc_nt.c | 17 +++++--<br>
+ 6 files changed, 128 insertions(+), 7 deletions(-)<br>
+ mode change 100755 =3D&gt; 100644 source3/libads/ldap.c<br>
+<br>
+diff --git a/source3/lib/util_path.c b/source3/lib/util_path.c<br>
+index c34b734..5b5a51c 100644<br>
+--- a/source3/lib/util_path.c<br>
++++ b/source3/lib/util_path.c<br>
+@@ -21,8 +21,10 @@<br>
+&nbsp; * along with this program.&nbsp; If not, see &lt;<a href=3D"http://=
www.gnu.org/licenses/">http://www.gnu.org/licenses/</a>&gt;.<br>
+&nbsp; */<br>
+<br>
++#include &quot;includes.h&quot;<br>
+ #include &quot;replace.h&quot;<br>
+ #include &lt;talloc.h&gt;<br>
++#include &quot;lib/util/debug.h&quot;<br>
+ #include &quot;lib/util/samba_util.h&quot;<br>
+ #include &quot;lib/util_path.h&quot;<br>
+<br>
+@@ -210,3 +212,53 @@ char *canonicalize_absolute_path(TALLOC_CTX *ctx, con=
st char *pathname_in)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *p++ =3D '\0';<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return pathname;<br>
+ }<br>
++<br>
++/*<br>
++ * Take two absolute paths, figure out if &quot;subdir&quot; is a proper<=
br>
++ * subdirectory of &quot;parent&quot;. Return the component relative to t=
he<br>
++ * &quot;parent&quot; without the potential &quot;/&quot;. Take care of &=
quot;parent&quot;<br>
++ * possibly ending in &quot;/&quot;.<br>
++ */<br>
++bool subdir_of(const char *parent,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
size_t parent_len,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
const char *subdir,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
const char **_relative)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *relative =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool matched;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMB_ASSERT(parent[0] =3D=3D '/');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMB_ASSERT(subdir[0] =3D=3D '/');<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (parent_len =3D=3D 1) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * Everything is below &quot;/&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; *_relative =3D subdir+1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return true;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (parent[parent_len-1] =3D=3D '/') {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; parent_len -=3D 1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; matched =3D (strncmp(subdir, parent, paren=
t_len) =3D=3D 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!matched) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return false;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; relative =3D &amp;subdir[parent_len];<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (relative[0] =3D=3D '\0') {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; *_relative =3D relative; /* nothing left */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return true;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (relative[0] =3D=3D '/') {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* End of parent must match a '/' in subdir. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; *_relative =3D relative+1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return true;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
++}<br>
+diff --git a/source3/lib/util_path.h b/source3/lib/util_path.h<br>
+index 3e7d04d..6d2155a 100644<br>
+--- a/source3/lib/util_path.h<br>
++++ b/source3/lib/util_path.h<br>
+@@ -31,5 +31,10 @@ char *lock_path(TALLOC_CTX *mem_ctx, const char *name);=
<br>
+ char *state_path(TALLOC_CTX *mem_ctx, const char *name);<br>
+ char *cache_path(TALLOC_CTX *mem_ctx, const char *name);<br>
+ char *canonicalize_absolute_path(TALLOC_CTX *ctx, const char *abs_path);<=
br>
++bool subdir_of(const char *parent,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; size_t parent_len,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; const char *subdir,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; const char **_relative);<br>
++<br>
+<br>
+ #endif<br>
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mdssv=
c/mdssvc.c<br>
+index 19257e8..d442d8d 100644<br>
+--- a/source3/rpc_server/mdssvc/mdssvc.c<br>
++++ b/source3/rpc_server/mdssvc/mdssvc.c<br>
+@@ -520,11 +520,14 @@ static bool inode_map_add(struct sl_query *slq,<br>
+ bool mds_add_result(struct sl_query *slq, const char *path)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smb_filename *smb_fname =3D NU=
LL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *fake_path =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *relative =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct stat_ex sb;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t attr;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t ino64;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int result;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool sub;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ok;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+@@ -610,6 +613,17 @@ bool mds_add_result(struct sl_query *slq, const char =
*path)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sub =3D subdir_of(slq-&gt;mds_ctx-&gt;spat=
h,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slq-&gt;mds_ctx-&gt;s=
path_len,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; path,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;relative);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!sub) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DBG_ERR(&quot;[%s] is not inside [%s]\n&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; path, slq-&gt;mds_ctx=
-&gt;spath);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; slq-&gt;state =3D SLQ_STATE_ERROR;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return false;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Add inode number and filemeta=
 to result set, this is what<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * we return as part of the resu=
lt set of a query<br>
+@@ -622,18 +636,30 @@ bool mds_add_result(struct sl_query *slq, const char=
 *path)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; slq-&gt;state =3D SLQ_STATE_ERROR;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fake_path =3D talloc_asprintf(slq,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/%s/%s&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slq-&gt;mds_ctx-&gt;shar=
ename,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; relative);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fake_path =3D=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; slq-&gt;state =3D SLQ_STATE_ERROR;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return false;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok =3D add_filemeta(slq-&gt;mds_ctx,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slq-=
&gt;reqinfo,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slq-=
&gt;query_results-&gt;fm_array,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; path,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fake_path=
,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp=
;sb);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ok) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DBG_ERR(&quot;add_filemeta error\n&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TALLOC_FREE(fake_path);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; slq-&gt;state =3D SLQ_STATE_ERROR;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok =3D inode_map_add(slq, ino64, path, &am=
p;sb);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok =3D inode_map_add(slq, ino64, fake_path=
, &amp;sb);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TALLOC_FREE(fake_path);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ok) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DEBUG(1, (&quot;inode_map_add error\n&quot;));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; slq-&gt;state =3D SLQ_STATE_ERROR;<br>
+@@ -840,6 +866,32 @@ static void slq_close_timer(struct tevent_context *ev=
,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ }<br>
+<br>
++/**<br>
++ * Translate a fake scope from the client like /sharename/dir<br>
++ * to the real server-side path, replacing the &quot;/sharename&quot; par=
t<br>
++ * with the absolute server-side path of the share.<br>
++ **/<br>
++static bool mdssvc_real_scope(struct sl_query *slq, const char *fake_scop=
e)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t sname_len =3D strlen(slq-&gt;mds_ct=
x-&gt;sharename);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t fake_scope_len =3D strlen(fake_scop=
e);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fake_scope_len &lt; sname_len + 1) {<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DBG_ERR(&quot;Short scope [%s] for share [%s]\n&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fake_scope, slq-&gt;m=
ds_ctx-&gt;sharename);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return false;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slq-&gt;path_scope =3D talloc_asprintf(slq=
,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;%s%s&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; slq-&gt;mds_ctx-&gt;spath,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; fake_scope + sname_len + 1);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (slq-&gt;path_scope =3D=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return false;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
++}<br>
++<br>
+ /**<br>
+&nbsp; * Begin a search query<br>
+&nbsp; **/<br>
+@@ -946,8 +998,8 @@ static bool slrpc_open_query(struct mds_ctx *mds_ctx,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto error;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slq-&gt;path_scope =3D talloc_strdup(slq, =
scope);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (slq-&gt;path_scope =3D=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok =3D mdssvc_real_scope(slq, scope);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ok) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto error;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+diff --git a/source3/rpc_server/mdssvc/mdssvc.h b/source3/rpc_server/mdssv=
c/mdssvc.h<br>
+index b3bd8b9..8434812 100644<br>
+--- a/source3/rpc_server/mdssvc/mdssvc.h<br>
++++ b/source3/rpc_server/mdssvc/mdssvc.h<br>
+@@ -127,6 +127,7 @@ struct mds_ctx {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int snum;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *sharename;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *spath;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t spath_len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct connection_struct *conn;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct sl_query *query_list;&nbsp;&nb=
sp;&nbsp;&nbsp; /* list of active queries */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct db_context *ino_path_map; /* d=
bwrap rbt for storing inode-&gt;path mappings */<br>
+diff --git a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c b/source3/rpc_serve=
r/mdssvc/srv_mdssvc_nt.c<br>
+index 59e2a97..b20bd2a 100644<br>
+--- a/source3/rpc_server/mdssvc/srv_mdssvc_nt.c<br>
++++ b/source3/rpc_server/mdssvc/srv_mdssvc_nt.c<br>
+@@ -121,6 +121,7 @@ void _mdssvc_open(struct pipes_struct *p, struct mdssv=
c_open *r)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; loadparm_s3_global_substitution();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int snum;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *outpath =3D discard_const_p(cha=
r, r-&gt;out.share_path);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *fake_path =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *path;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
+<br>
+@@ -144,21 +145,31 @@ void _mdssvc_open(struct pipes_struct *p, struct mds=
svc_open *r)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fake_path =3D talloc_asprintf(p-&gt;mem_ct=
x, &quot;/%s&quot;, r-&gt;in.share_name);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fake_path =3D=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DBG_ERR(&quot;Couldn't create fake share path for %s\n&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r-&gt;in.share_name);=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; talloc_free(path);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; p-&gt;fault_state =3D DCERPC_FAULT_CANT_PERFORM;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D create_mdssvc_policy_handl=
e(p-&gt;mem_ctx, p,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snum,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r-&gt;in.share_name,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; path,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r-&gt;out.handle);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!NT_STATUS_IS_OK(status)) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DBG_ERR(&quot;Couldn't create policy handle for %s\n&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DBG_ERR(&quot;Couldn't create path for %s\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r-&gt;in.share_n=
ame);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; talloc_free(path);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; talloc_free(fake_path);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; p-&gt;fault_state =3D DCERPC_FAULT_CANT_PERFORM;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strlcpy(outpath, path, 1024);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; talloc_free(path);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strlcpy(outpath, fake_path, 1024);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; talloc_free(fake_path);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
+ }<br>
+<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
index 73e8a82e8..aa27592cb 100644<br>
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
@@ -38,6 +38,17 @@ SRC_URI =3D &quot;${SAMBA_MIRROR}/stable/samba-${PV}.tar=
.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-2127.patch">file://CVE-2022-2127.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-34967_0001.patch">file://CVE-2023-34967_0001.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-34967_0002.patch">file://CVE-2023-34967_0002.patch</a> =
\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-34968_0001.patch">file://CVE-2023-34968_0001.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-34968_0002.patch">file://CVE-2023-34968_0002.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-34968_0003.patch">file://CVE-2023-34968_0003.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-34968_0004.patch">file://CVE-2023-34968_0004.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-34968_0005.patch">file://CVE-2023-34968_0005.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-34968_0006.patch">file://CVE-2023-34968_0006.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-34968_0007.patch">file://CVE-2023-34968_0007.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-34968_0008.patch">file://CVE-2023-34968_0008.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-34968_0009.patch">file://CVE-2023-34968_0009.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-34968_0010.patch">file://CVE-2023-34968_0010.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-34968_0011.patch">file://CVE-2023-34968_0011.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;SRC_URI:append:libc-musl =3D &quot; \<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB58229D3C80116C6E9A538A2A84DBAMW4PR11MB5822namp_--

