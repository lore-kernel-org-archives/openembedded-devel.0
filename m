Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web09.9112.1621347298103130362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 07:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WyhQVRVh;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGqYS47+Tl9LpPan7MCL0PsuT5LFtZBARMWe8sXVdLPQGgAUEVKWYhkQJ+hB07tdvEJ3oSmLAurIxnewcWB9FXbzb+nwRvK+xWXhsprphDyYuSH7yZgir8+VZfVDyltWIzkI7/AQjEoGnj9NZ6zYLaNiRkD564AYiIr6y3A80WAsPVy3U8E0uiNidukrCc9MA5S22HqALmoCtyrIuwsuClAkqFLDr4FzfzHjo7E9n9Jxap+l92Pc5wBumk+lMtH6XfURllX9IOSOECDgzQShGy1d+2mUQ8MmsItgm7SmRMnLDn/rt0M1NcNpLgwyru6NMbNGf4qZn8TkuDnU2V+vgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhltVrQZ7TD9fkFtAT8Lmu1Iu2hMAQX4vXgUoAarAp8=;
 b=Xifl5+sigd8lY3/E09qyKu+an7DIeS5Pq70oPpbVPq8KlAWvrEZFDuh+zR6cdlJDTW/hEejVcxKBNGl66Lj7VBiHzFJ1+RHnaOCXqYXQF/D+qBIrSAAUTOwA31v24SuWdUoFA3sFSf9CngT8uOwJcF2k0POcyz98rQE3dwjEg+j4mcRz6WAt2+RkGaZSt6dpRJMPM4umh4pe9K1Zqy7ZmBqSCaAXa1hCU+bqoAUvS09A5blczw6ieL3Py0Sv7XRHjpw6ib79OGdPY5+Ona5rjiUcnY8FVhe71pt46H3m/RvP6KvjT4p1Xh9ZsCMapwwiRfBGWWLCFirvgvLtxToOxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhltVrQZ7TD9fkFtAT8Lmu1Iu2hMAQX4vXgUoAarAp8=;
 b=WyhQVRVhGn/d6lk/0tOZRTVnhq7/4HWlF4CdJCponbYez1gWsQn3DAUX/yaKpdpDI6vVrTFzYSZNsOvxZQE3vCe5vwcIGT0zO5VLITYMlZLN0YNvcQOaajTbSo6DqzgH252izKgYThmnwYKr6CrRGAW8zzqXiot+MCwMo14W0Eg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3894.namprd11.prod.outlook.com (2603:10b6:a03:18c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 14:14:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 14:14:57 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-django: upgrade 3.2.2 -> 3.2.3
Date: Tue, 18 May 2021 10:14:49 -0400
Message-ID: <20210518141449.913331-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518141449.913331-1-trevor.gamblin@windriver.com>
References: <20210518141449.913331-1-trevor.gamblin@windriver.com>
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by BY5PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:1e0::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 14:14:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e17e956e-6643-4d3e-f2c3-08d91a0750a0
X-MS-TrafficTypeDiagnostic: BY5PR11MB3894:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB389452AF8FB253048EA8EED79F2C9@BY5PR11MB3894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hUl/OuORaTpYijbx28v9OJDakPCFMDdJQ76ZY4rSB83SDMImE3xpvi2yZ5LbU0Nw0tQlE/IyEEp8IhsMBdshZHo+UYrrveuO8XNH67m0DA+91NuOBqdjty0QlzBImOR8vFx9ZMwzkdP7AKpO+++axYd31mqqwl28ZRSAMzeNEjz6Rxl1qkrJKd0A+tXbF+TzlYGyLFIrompnAnXFRqKyLoJOydeEaOA7q5MmmMLZvLqfIVoEdnS/E0Dmr3UV9ECmO+OQGMp281jSH+y18etp2Bl6jpQfkB6ji/hYrS8Uxn9QC52yxI1kpodkX9C0Y/uvHZVfjvavkdVb6PTgRb4QP4gEZ+meQ33di6p3e0VwPfNhViyklrjXlznmCZpjFjbfp172lJGUsxFfzUnwUOMerPG4N2YCFnf2Vt0+OsVxBgeLsxj1rm787Ya1iaIUB6tnJEGFuuhO0B3PgnblFnpXA7xYxWabLr7svFb/XEZg5PvvWyjELg/tZzVV/WtaPUwdcfXmSxLJFQUkFOUu3qdjh4qsIZlgdV8pc1931f2WN9OyTmdIg3BTGPm9pJ2zvjqjg0gVwXPh46/3u2n1+MwfVtc0UF2bef4GbaduUXMps21X/qxL6TsonVpNaMX4vnzgAxLtcRKTuPBGmuqjg0Tv9w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(366004)(396003)(136003)(376002)(346002)(83380400001)(5660300002)(38100700002)(16526019)(38350700002)(6916009)(86362001)(26005)(36756003)(2906002)(2616005)(6506007)(8936002)(8676002)(66946007)(66476007)(66556008)(6486002)(52116002)(1076003)(186003)(6512007)(478600001)(316002)(6666004)(956004)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Rih2FTAq3VKgHHQl/WRn1awLpVZ7RHGuiYfpJZm7Sv//ciBqh13wEw5jgJzI?=
 =?us-ascii?Q?8ukNpUUyi83zGZSnQf036cE3bn1llUsjOm8nWeofI4nbRBEQG4WcDiKqBa7v?=
 =?us-ascii?Q?nBvbYYrJXPWxvXP53Kyl6o2hqUDAvh/JPwfzhGbPB25VBK+VYmeswUl9IMJI?=
 =?us-ascii?Q?Wp34JLza0iqqq/k+9kDvnYFNlfS46ToHgikIXqFBZCb94PgVJgDe/y5zEHbP?=
 =?us-ascii?Q?FNnpu5URLykb410yidr1zduUjft05r7uHs5QLwUPgfGT27EFGLHdVz8UijWM?=
 =?us-ascii?Q?oiq4lGZNsySQpjfFQnyiZBXzD8oyCnLI9rP6AJX6F2QlNEjiK+xmWyiJcsk8?=
 =?us-ascii?Q?57XjHLhbR0EgfCkHVMaYGlDEsLacqNDkJm74EvyQml4hNgWZaccKO4n6azJd?=
 =?us-ascii?Q?0Nf9uPGAYu0KNS5A9gOS8WWLOZuQuOvoQPgZR7RXvJcEfLzow9/cNUBuNH0x?=
 =?us-ascii?Q?cxO+VOOorZot9o6pheFSEi+OwbsmIuZBXle2zQK0k7QTN5MHYuF8G5TG+DcR?=
 =?us-ascii?Q?djZ9X/UH53qZRkYeBcL6sAfp//O308nXvdIT2rIFXVyusZKD0Tokibs+U/xR?=
 =?us-ascii?Q?UDR/2+LS9ws5a2gbRvW8TNyXgUahPdWOrZqxcFeRufCosrqhb7SHYzjCk/7a?=
 =?us-ascii?Q?wypYqImwT7N1HnjlnS9dnFvKH2y1CTHURvMo1XCsjSGGjzVMspx0N/HH5GD5?=
 =?us-ascii?Q?ugWmNuKXPypBP8fqvgjtS8klu7cgrRgj7I6rKeuDe63zOmAKITC7pi4aJmCD?=
 =?us-ascii?Q?CKjVVtfLVaNoAYQEwTd2PIUy8hLVG0C0yqkML5HngkybYq/qK0ze59+4kpTF?=
 =?us-ascii?Q?n48uNrG0WP082tJC1+EgxiYbaqKx1V7TMAWRF/ZPsDz725WMGsK1tLq9qkSX?=
 =?us-ascii?Q?XYdW2gIlrvDSxoaDviEsCNZchag+lCtT27deyxsvJclppryga2XLIILzdmqy?=
 =?us-ascii?Q?QEfvVo7D32a4cn94YY17RdrFC6XPiAaPo30NrlN5MUQG0UeM+NU72n1s7i9x?=
 =?us-ascii?Q?noAeoR4bO6POdtz2E8QQg/6A41/90HdvdoL24zk7o8WhBBNokxDMLY3Ty9FS?=
 =?us-ascii?Q?R0GMQHrvAUv9ZbroxhZEY37JlqQYKwVC/NU7VCGvITsZ7ami7Ch1BWcqzdZM?=
 =?us-ascii?Q?eHVyVU52RQ2pdj//hJU6CzB5TbdzDXGfVjogdG+UKSegW8Jah2dHU/pcxso8?=
 =?us-ascii?Q?AERK3P/5QMEXwwdI3BcvhRbzUrUUcCZFjI40NgX3Yy7jjjjnEMtcDJgn7K7+?=
 =?us-ascii?Q?PAAZaoubn/WBeEqqCCkxliQOaauT/AIjJsl60r3lxWFych6r9Z54v9FQUceC?=
 =?us-ascii?Q?1wR+wEXFutTsoN5E2YxUZZfX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e17e956e-6643-4d3e-f2c3-08d91a0750a0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 14:14:57.6819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fphplM4MZPmUwULwvB8UUXx2mOKWNqS8X2W0BgknOHKylKkS1BXYswLj4E8u/Mzafwdyq+vBm3E9yCMNHw1kSYJu8syiOqZ1vR4ce7/cj6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3894
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

3.2.3 is a bugfix release:

- Prepared for mysqlclient > 2.0.3 support (#32732).
- Fixed a regression in Django 3.2 that caused the incorrect
  filtering of querysets combined with the | operator (#32717).
- Fixed a regression in Django 3.2.1 where saving FileField
  would raise a SuspiciousFileOperation even when a custom
  upload_to returns a valid file path (#32718).

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/{python3-django_3.2.2.bb =3D> python3-django_3.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.2.bb =3D> p=
ython3-django_3.2.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.2.bb b/=
meta-python/recipes-devtools/python/python3-django_3.2.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.3.bb
index 7deac2ca9..7a9611ca1 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.3.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
=20
-SRC_URI[sha256sum] =3D "0a1d195ad65c52bf275b8277b3d49680bd1137a5f55039a806=
f25f6b9752ce3d"
+SRC_URI[sha256sum] =3D "13ac78dbfd189532cad8f383a27e58e18b3d33f80009ceb476=
d7fcbfc5dcebd8"
=20
 RDEPENDS_${PN} +=3D "\
     ${PYTHON_PN}-sqlparse \
--=20
2.31.1

