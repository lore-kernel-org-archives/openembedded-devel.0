Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.87])
 by mx.groups.io with SMTP id smtpd.web09.4849.1619148660467366565
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 20:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lN6XXLJk;
 spf=pass (domain: windriver.com, ip: 40.107.220.87, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fv1yEA6sWsM+4Jm6cyMdAFb2w7ak7qCsbEmJVcL+TJVPZnvDQVMyr0ykfuqW3seBKpiveh/BI+QGTnJ0e2v4WBm/ioTncWNWNP3uJ2kgnSSljQ8uMjINpW8IU3VLcMEtWppeHPWtm+04zskfd2NbAE0aQnplwl4xEbo5VM678ckxpcXD8RIhKqef9S5Udsf2lnTK6JbQH/MHm3QiKoJYcZTlQoFSs5hekgKJ32kWBve+gei5WK2iQDY12GRK9JCuHwsT8VQSJ0tfFOX8MR0NR8yt0IzgkifTS5t7NkGul/J+7DHl3CVVYSU/Sjt8kIRk1OlbU/F+u9YcXcng9f4Oiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IyL1a8gQtdwlp4m+HgbFXxHKkPbvwfVnTcMibYgYfI=;
 b=MmgnDGbaepWE2DPOfU1ACO6NfN89P0q8L4NbiZ2MCFhb6W3HQv/0OT1kg7eKfFr4hEeRoJsBnAdM66ZEmGktfJR3O2C7NqxQumoXBsoZ4EWUOdzE5qGXbjAC6Z6PzYv9H74w230nSHEXthwcZza/fvtW3NqEI8bUINDXzK1O+X5SjOr4oAV5ANG9/oIEcvf5AQy+efW3wyplRGGawgXf8t4FCW5BVx+cwZvXArmuSjNGx6qAeeY9FIowZ6VWOXzLc5XoraHqkWSnIIDxS4aam0oRv4TiHx3qXCejfOhuj8mKCk4VlNJAx8Ui0L+zLln6f3+BVhVjziu+LFFOTJRLmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IyL1a8gQtdwlp4m+HgbFXxHKkPbvwfVnTcMibYgYfI=;
 b=lN6XXLJkVw1lc3mW0LC08BxRNi47EIpK9FWZyvOztIs+G3vaafY0nTouHocYYbdYlM36Nu6Ew5B1rE67gTkRDYo39ndz6SIbtt93LRHBTv26QvSf1d+CzWlxJ+QBLYwN8iuOd8dwmWNSqrAcIl9RI+jD3cu4vvYDeyUaclw3srQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Fri, 23 Apr
 2021 03:30:59 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 03:30:59 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gvfs: rdepend on gsettings-desktop-schemas
Date: Fri, 23 Apr 2021 11:30:49 +0800
Message-ID: <20210423033049.172369-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR13CA0148.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::33) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by SJ0PR13CA0148.namprd13.prod.outlook.com (2603:10b6:a03:2c6::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.16 via Frontend Transport; Fri, 23 Apr 2021 03:30:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54c3e00f-22b3-4a8f-1390-08d90608366a
X-MS-TrafficTypeDiagnostic: CO1PR11MB4804:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4804D6B946AEEE721FBA863CF9459@CO1PR11MB4804.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ABayaZeYieVP6DHO1BhvGyXdgOdP2UvqMlhRCYB3awpJPRgJlxkr+OMnyM2tm/Xsr7UA5yD58ikXrovYzu6jnR0XREy+WVtIamtVW3ZqRUN6EAWOvd4razn7xEuzsn2L02PaqqC4MxlFeioVWsx+HAwEQE+oiMVMoCmJmx/g/FOg/m1G/knY1NWuLMOQn8aF0EBIHoZLjWNBNmoTlEDCfp1KhToul7KPR0oXUbdysTa+4VZBuZCRE27R15WFK69Kk7AlMQ1WHbhq+ouRIl+Fz5/hHlKBF6kwnmOiKQ3/WHalcIRKVF0A95PpGgqBAWOK22o8isNVUpRGRq1spwwE4a1dGNt/LCA5xRLe35zkvLnGIqE9+B6Z66kDYlE6AHMrueqII4hRF9MNbNUh0zBYTgmmCxcfgNX5tL6t5iVc7G4LiDcQK+TMix8xsUUKJG7/DPOgG0aRDee+Ur4A0Q8o7U/fq09rxuwfPemEDoiPcfm5egKoM/OE0G1kBhcTWsbvoVoaMxIuhl3qKX4J6bOhvmxna+GiNhiBp30NSEf3FqX7ROyncNq4cVDSXkk4VFKo9aJLl004Qir66Wwu7jAhh30JdY9JJPMM8ydpuSY9QSyRr7A/E0x5gR3/dkIIz+VKwYnOj+VePRswdSWvljbopz0iSh1knJCIeVR6CszAM0kWzZAq5OeJPBYqqYF7E4rIIWFB5TsQ5CQwoTPWrhJYWlWe15Pg2YU8JW4v/pZsaSg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39850400004)(366004)(86362001)(1076003)(6506007)(66946007)(38350700002)(66476007)(5660300002)(36756003)(26005)(956004)(316002)(16526019)(186003)(8936002)(2616005)(52116002)(2906002)(8676002)(66556008)(6916009)(38100700002)(6666004)(83380400001)(478600001)(6486002)(44832011)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?gQ+BAcbLl+d9SoouZ9JkquaDGD1APuBTReRQ3aJoO3zWuUmlp92BE+ZP2gGR?=
 =?us-ascii?Q?38VwVdGbOKqXcKT51zTrrqx4V/FtL1KAWOIU5KrhPnu9MulNwxyRRIIobSdy?=
 =?us-ascii?Q?vcknMGp/zdXz9R/Q5sxzwYalInAtX73T7WDetzvIRBiC9UoUGodR8F3WArde?=
 =?us-ascii?Q?xldLIJRwDKeZoeLwc4R9IxOSM32L85fEKw7snM9C9Sj9tSAV5CduGiRaFJNV?=
 =?us-ascii?Q?K49Cvi//HGBTvL/oHpfya8+UCcTUlv60GwDoFUVR0Sq3S/wNNJNhmJreLyrK?=
 =?us-ascii?Q?6XR1Oa9XpinPMdNISpI9QlVFq1DG9PxPrVjcizg8efufuqQyApcaN0vAvmCk?=
 =?us-ascii?Q?uQkei9p14t7ooikRdUH0LU94kThPBJEdYFyF/oifn/eldrtwnEHfzi3VxTkh?=
 =?us-ascii?Q?bxuoNLlH8QhBn14mcWaTwRc36wP25tyM91sOoPYoZr+upSimvq1ZU/vSkHzs?=
 =?us-ascii?Q?nIE2df/yc2Z0UomKgBeBUaTYTisu6MpLgzsYOs7TQd57leHPnCXzAbOEpgLB?=
 =?us-ascii?Q?PocjrKE+M940AszHTDcXkkf7oCi+kcW4EiX+UuxsQqgXkaZrxOcK1qOXTLDG?=
 =?us-ascii?Q?nngH0lXZscw99xr1pkADslnhSm5Hos598uKbXmXDmXlO/ZpMpUa5gekSaFOP?=
 =?us-ascii?Q?ohksvlpeZJkjUc5f3DlEjiWX6zhT6/DyrjgyHyI17xo77vMR9xzc5KxZEedj?=
 =?us-ascii?Q?kxL/eI4tniJVKxhDXiUYmqQ5JR5v+3NRqOLiaiETf4UK3t7n1i9gKEXWUiCs?=
 =?us-ascii?Q?tJeFSp5etVON5RQIcYdGJ1KTeRZIZOQiMR6y41+xDL0pjpy0d+sivIc9YmPJ?=
 =?us-ascii?Q?oPWFBZabKaAyzRCViKBQInhGzoKVArBk20FLteZwK4XsHJaPEQ2W5Rs+v6B+?=
 =?us-ascii?Q?xT/8ziOYVj/NKawwxDZ0WPxkPTyO0QvdfhMdngjfK62DyTkx1vysg3V91Tr0?=
 =?us-ascii?Q?Pr8Nnt2q+tPhdOFFVVND8J7FEH26bMlCX2t4fEorgtTNVFaQ0T5GHevP/B99?=
 =?us-ascii?Q?R59iyNF29gJ6i27NNUeYvpEHMzIo2ZQM14JLd3uCxcESoJr44hYoTm+l75KI?=
 =?us-ascii?Q?zNqhd2xqBweAG1d9wfGkBkMfpgI/EAOCLY4+rn2efF36p+cBfLUI7RVEiFnJ?=
 =?us-ascii?Q?R/CeTF1RSgx2vBSBF4m9cvloA249uwTb/q2d/5AQGsJkxzYeJH0+ABHiOLSk?=
 =?us-ascii?Q?wp1zHqYSu8KlxfB7kLxS++RX4YQbt8/qCFPuwFVAye2/aCuGlwNjRVQHlGcG?=
 =?us-ascii?Q?81tMMUr21GweL2hbUkWgeMLKTzvZqHZxga45TvZTaC+poZ4U+BPuwKZ6r92W?=
 =?us-ascii?Q?UAN8/tmtGfuDd4JQUYR+tt6m?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c3e00f-22b3-4a8f-1390-08d90608366a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 03:30:59.4909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Y4RGZzR0cGKKx+dZOyhYuyXT0fLHN/9m9eLXXmJpcHsWz89tqrfUdOVkYm1R+XflxtNKMsvnqpTo7Gb0QlmIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The gvfs-udisks2-volume-monitor requires gsettings-desktop-schemas.

Fixes:
gvfs-udisks2-vo[1780]: Settings schema 'org.gnome.desktop.lockdown' is not =
installed
kernel: show_signal: 26 callbacks suppressed
kernel: traps: gvfs-udisks2-vo[1780] trap int3 ip:7f856be349c7 sp:7ffe34561=
e60 error:0 in libglib-2.0.so.0.6600.7[7f856bdf8000+88000]
systemd[1637]: gvfs-udisks2-volume-monitor.service: Main process exited, co=
de=3Dkilled, status=3D5/TRAP
systemd[1637]: gvfs-udisks2-volume-monitor.service: Failed with result 'sig=
nal'.
systemd[1637]: Failed to start Virtual filesystem service - disk device mon=
itor.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb b/meta-gnome/reci=
pes-gnome/gvfs/gvfs_1.44.1.bb
index ad5dab5ec..c8c16a3c5 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb
@@ -8,6 +8,8 @@ inherit gnomebase gsettings bash-completion gettext upstrea=
m-version-is-even fea
 DEPENDS +=3D "libsecret glib-2.0 glib-2.0-native libgudev shadow-native \
             gsettings-desktop-schemas dbus"
=20
+RDEPENDS_${PN} +=3D "gsettings-desktop-schemas"
+
 SRC_URI =3D "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${=
PV}")}/${BPN}-${PV}.tar.xz;name=3Darchive"
 SRC_URI[archive.md5sum] =3D "72383474f52d05c21ef2be96d0b91974"
 SRC_URI[archive.sha256sum] =3D "50ef3245d1b03666a40455109169a2a1bd51419fd2=
d51f9fa6cfd4f89f04fb46"
--=20
2.25.1

