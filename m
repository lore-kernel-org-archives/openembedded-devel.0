Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.55])
 by mx.groups.io with SMTP id smtpd.web09.9267.1613488606925620432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 07:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=k1Pm75uv;
 spf=pass (domain: windriver.com, ip: 40.107.76.55, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCHp6olJZQU+QeJPodgvVtBGz+phcPGGnfFiarwlNijiFH7EGUory6/tpCRoaT4QGPPKlZYttAOfpMrUGwPO4Kwb4SvHkEzSLnig57Czp9m0E8butk4XYzzANNmJt8wEtMWuRlJtLDd3x9JOCVjG/DIvqIAM47yrTRKNaaKe/G0EWm+quZRuZwIBQopWL/jJVadKbWFL6hvbUFugrtO8bDDjl//lAprSWIIIRV0OJh3nVSOMM4TXQI6eUSkj6fQ6Dcd6m3hQTlMhI/MDlPSXlHJgYE/Qmdyps5ThsEZTndYSJBl6vx/h1JXX8hjVHUauZ6rsy6uw+ZyCy6KjwtVs+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhAbX3CAX2UtyNIYyvaNhH2LC90f+XTR6z+ZEGdnliw=;
 b=hT/bVU7FCGVzmvCLoLjQW8hFPX4fh723Lsh+5RpChtBk7c09A768+DA8cA6Jw7hTUhpHJ9Mpr2LzRG+IeNTylK69jal4x7Rlh3hMcq77Nihv2qZVd/FzLQ2S6v4k0PgbLg03pTa5bu/icCoxjZcNUuoHlxlLgnfEIn0HfVeXeBSI0LHUpI20C7Oe96djJxNfwWoc5rMRcHcjw91pabdrrExQSJI4kkxesQYpri2jOnReNwsmpJO5Qm61ptEt+Vm9oTQK8648+9dnJ9Hx9dEGjZNjCqS9+x7th/+3URgCOFx6/tfut4C+ZmpCPqxRVlE3PCDnvSWNIYQHBzNi0gaIZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhAbX3CAX2UtyNIYyvaNhH2LC90f+XTR6z+ZEGdnliw=;
 b=k1Pm75uvpljy8lUlgp0DYMvMyN13V3uukDwxxGyplFJ/m8k6L2tE/C7NIIQAN1xXN12J1AvhITFbgGNoF1irjvN3n2t+dgk5I/k+xM5rXugYH3YXhsiHplew6qKm9f0RWxMP8S+xkrWoRlLuWrf7HdpI6h8K6hszQoNvy0ZAMAQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB3358.namprd11.prod.outlook.com (2603:10b6:805:c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 16 Feb
 2021 15:16:45 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%8]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 15:16:45 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] rsyslog: upgrade 8.2006.0->8.2012.0
Date: Tue, 16 Feb 2021 10:16:31 -0500
Message-ID: <20210216151631.26968-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BL1PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::8) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by BL1PR13CA0123.namprd13.prod.outlook.com (2603:10b6:208:2bb::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.11 via Frontend Transport; Tue, 16 Feb 2021 15:16:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb11aaf5-54bb-47da-8045-08d8d28ddf0f
X-MS-TrafficTypeDiagnostic: SN6PR11MB3358:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB335825910121BB539579F13B80879@SN6PR11MB3358.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:140;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ds6MNIu0W4nHxmeHhIVau59kXAkNXuyAxTEhODSoN/+MNF6Olr4i15YsT03tsruEaIKdoaFO302aO47PqEZnbaGfMgBheabnfqN2g3n/fV1XpZCbxiH4z3oEMGGEYy3alEMajGbDhShFeeyRNJn7rNmRqcQL2psDp40kCQ5oNKlMtX38hX3PBPENfi6kgyIbLKM83o4lj9wbr3SDUSuATUNVhsWALaocAnxOKcnM6g++3EVjv3dJ0zfrjMVkO3FoN3BxT0ibZuDX7ytpx9vt89hQB79RnP52JvpHz1r00ruNFVWk2OSwBGkWpDLrIxKrI1A3a8Ebx4tFnAIpSMr2gHi4o1lLvGwA9vIPjK6rRPZPOt3y65hG81AllAAo/uMi0Lq7KV/E+Lhf59cOlvx17uyi0SiD1a4MuGP6/tibLgCvGtIFJrfrSsWH1x4D7acmyeeib9/2O2ygiWqtYpOJOiv/r1XZuH0V8TzapnBwNFiSx7mG34JQQ0eeZU2sCdKschD0SjtHkOXJ0iTqgABID+tYCmDExQkol7lq8QqDVo9CYbF1rTnf1CcOi+9DR0k/73+pmLMBIKjfEQGInsc/WwNgcdL21RLbEBg++jEuo1w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(366004)(396003)(136003)(16526019)(956004)(186003)(86362001)(2616005)(83380400001)(6506007)(5660300002)(36756003)(6512007)(6666004)(26005)(1076003)(478600001)(8936002)(316002)(52116002)(66946007)(66476007)(2906002)(6916009)(6486002)(8676002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?kb/hdKbhGJz/rWtuQN4BjRQ0UpaKdNAfXnDVnnZgLkRMEn/WmHQnDdVsnu0z?=
 =?us-ascii?Q?E/G7EglcEpflyb26ZyzLTSSIfEtWXhQjNrbuPFkxDoNBsc57C860GydmWPsE?=
 =?us-ascii?Q?uMuJvPhzt5GQ5Fw2EvqOvDhUHCf+eCbvMDpjeFEcWVMTPu2ln8600od3js6t?=
 =?us-ascii?Q?//UUUMX/hLdGllx3zEKYhPyg+WgYA3tIaKZRfzGCOn9KHsRTpJwzRDqHXqGV?=
 =?us-ascii?Q?U1iBPIhyVOz2FeBrjgtGzqZg/+nG9LqTz1oswFBmGEm2CpuWH44w6tA4PlI7?=
 =?us-ascii?Q?rHxpJ/yju1ZNxaq6S8oUaERcBmTHlne45idZSz36iSmXBI4bb8WoVgAbX4c5?=
 =?us-ascii?Q?zYQLS0hH8bD+bdOru5CXvC1dvAgVQ/R+ZvlSHjqmqq3B/8dVCKL6oXW+yhNB?=
 =?us-ascii?Q?uN0ltrLfkZmFUUjkQJbP2iTd+qrZf1oIcZ0LnpT/yG9Wj+/GDqu7AcU7YPJB?=
 =?us-ascii?Q?QHYj5k3iKWfB0wscP/1zuJkAnNYog7EVI9mInMvAZd0pKg+kRQOYhlU8udpq?=
 =?us-ascii?Q?68S7Psf9VgtPZ1hG7wXrUIEfhx/BeqIfWJx1fwg21H6l6M4dGYvrW/knPVkA?=
 =?us-ascii?Q?RL2iZ+fvZrOAisBMkf9pbiMqCSBJxAT+VsoaUgCqMLcGgP6CO0oGN+JhnmD2?=
 =?us-ascii?Q?WAayQWxrjwQD7035IQ4nQnmfU/xpqAA6jdM8cguX0hxBXApQ77b2P6HpMT1O?=
 =?us-ascii?Q?Vheio2bp4UWZ2DE/3mhrZW9e5NhzmyEFJppok6RndiR1ovYP/MOM84/vr7X/?=
 =?us-ascii?Q?OlHmwo79kWL6F3Sy8VQN1/aysn21RDqQiGbM0gcXsIE7BVFjEXG7Ps8WtMnG?=
 =?us-ascii?Q?CucmKaaYI6xs52ERjcng/LaHHBM+3h+GAlP6XO2Q35plsqdf6034hbbRY+JB?=
 =?us-ascii?Q?m6ncRdxg0vBm55oVv2jbFE9GK+NdAh6A/nRnqNd4hVDz1MuKBWmGQ+9EYHPE?=
 =?us-ascii?Q?5/yvm8uUaHwiFg+wSoqAZWYbBYsWuFgCm5kiiyvWT6OHD26AjmpkGCaHdGnR?=
 =?us-ascii?Q?ASB+CAT0u+cy8H2eeEwBQccxZXtRekdXC0TXpb37WnA7zYvIb+r497V6VIff?=
 =?us-ascii?Q?bGpVCyQ3jnXtPbUqC874QWp6MfMOsiMS18b3ClQv1undBNIFzt8oS+j6WDTL?=
 =?us-ascii?Q?mku9oCOIfHCr9ObtZ1hn11WbN3eI5FwUoZrFlJ96tqnxOgC4Mktjd2g/PVpd?=
 =?us-ascii?Q?lUih4eZV7LL11JECe5tVKRZobP8ghlCi+ZFqIMX5tsTDAxjaNzu28GFZetNa?=
 =?us-ascii?Q?oALLJzhYKU+YVQpUKznqa9BFtnXtN0urVBcgEv1FTw316V1Ze26q6+OtkYIT?=
 =?us-ascii?Q?Kkw4dwLT3OCk/3Y9cvoD8Yxb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb11aaf5-54bb-47da-8045-08d8d28ddf0f
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 15:16:44.9224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uejE1vsC68IqjrF6BpjrvsPwVW9UR5FpXYVISIXW6CAGajRZO7+qMdP5jGjxSwWfBKP5NEH+rzmrL+hMcUOmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3358
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

new version no longer includes rsyslog.service,
so I copied over the same from 8.2006.
(git version carries it now in ./platform)

referenced rsyslog (upstream) commit id:
cfd07503ba055100a84d75d1a78a5c6cceb9fdab

Ptest Results: (Timeout 800) (qemux86-64)
       2006 2012
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
TOTAL: 411  424
PASS:  361  372
SKIP:  39   41
XFAIL: 0    0
FAIL:  11   11
XPASS: 0    0
ERROR: 0    0

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 .../rsyslog/rsyslog/rsyslog.service           | 21 +++++++++++++++++++
 ...syslog_8.2006.0.bb =3D> rsyslog_8.2012.0.bb} | 10 +++++----
 2 files changed, 27 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.servic=
e
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2006.0.bb =3D> rsyslog_=
8.2012.0.bb} (95%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.service b/met=
a-oe/recipes-extended/rsyslog/rsyslog/rsyslog.service
new file mode 100644
index 000000000..0aacff32d
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.service
@@ -0,0 +1,21 @@
+[Unit]
+Description=3DSystem Logging Service
+Requires=3Dsyslog.socket
+Wants=3Dnetwork.target network-online.target
+After=3Dnetwork.target network-online.target
+Documentation=3Dman:rsyslogd(8)
+Documentation=3Dhttp://www.rsyslog.com/doc/
+
+[Service]
+Type=3Dnotify
+ExecStart=3D@sbindir@/rsyslogd -n -iNONE
+StandardOutput=3Dnull
+Restart=3Don-failure
+
+# Increase the default a bit in order to allow many simultaneous
+# files to be monitored, we might need a lot of fds.
+LimitNOFILE=3D16384
+
+[Install]
+WantedBy=3Dmulti-user.target
+Alias=3Dsyslog.service
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb b/meta-oe=
/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
similarity index 95%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
index b6c2a991f..69fa963d1 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
@@ -21,6 +21,7 @@ SRC_URI =3D "http://www.rsyslog.com/download/files/downlo=
ad/rsyslog/${BPN}-${PV}.t
            file://initscript \
            file://rsyslog.conf \
            file://rsyslog.logrotate \
+           file://rsyslog.service \
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
 "
@@ -29,8 +30,8 @@ SRC_URI_append_libc-musl =3D " \
     file://0001-Include-sys-time-h.patch \
 "
=20
-SRC_URI[md5sum] =3D "33de768941953ceeca9d1a437b47891b"
-SRC_URI[sha256sum] =3D "d9589e64866f2fdc5636af4cae9d60ebf1e3257bb84b81ee95=
3ede6a05878e97"
+SRC_URI[md5sum] =3D "2a64947e3d157c0198609aabd37be42f"
+SRC_URI[sha256sum] =3D "d74cf571e6bcdf8a4c19974afd5e78a05356191390c2f80605=
a9004d1c587a0e"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
@@ -147,8 +148,9 @@ do_install_append() {
         echo '$ModLoad mmjsonparse' >> ${D}${sysconfdir}/rsyslog.d/mmjsonp=
arse.conf
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}=
; then
-        sed -i -e "s#;Requires=3Dsyslog.socket#Requires=3Dsyslog.socket#g"=
 ${D}${systemd_system_unitdir}/rsyslog.service
-        sed -i -e "s#;Alias=3Dsyslog.service#Alias=3Dsyslog.service#g" ${D=
}${systemd_system_unitdir}/rsyslog.service
+        install -d ${D}${systemd_system_unitdir}
+        install -m 644 ${WORKDIR}/rsyslog.service ${D}${systemd_system_uni=
tdir}
+        sed -i -e "s,@sbindir\@,$(sbindir),g" ${D}${systemd_system_unitdir=
}/rsyslog.service
     fi
 }
=20
--=20
2.29.2

