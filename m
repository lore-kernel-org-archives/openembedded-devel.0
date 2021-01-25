Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.56])
 by mx.groups.io with SMTP id smtpd.web08.37022.1611584716485916698
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:25:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kYF682FI;
 spf=pass (domain: windriver.com, ip: 40.107.243.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAGrJhVRRDaXdpWRRfaq1OnGIgZ41pOpofYiKj73twHRJa6IV4d6PtjP29Pnkr20ZLG84T8B1+Pw54WPjBGNvoCWqNNL13LxajVyX1i7y3j5U65fuE9idYQko5UE5qgd7AYep+ntGpjeNWPv2w9La6zYFY4AdEnF8V2iEFbvdsZQTUnSmj51746z21cAHdz0sE5GiHFrCX2L0UtlXSJRV8aVGwdWhisZKr5F75YPKQQFbpuI4dNRWHhhq0ogepIWAETOg9auTrUoFNHrAjV/ad8wHRboe5ObR6TBOf33PpBg/iRXlG8Lb77JvGTezUTdPlaZb+d0s99zPRXWcJnX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtHaH1dvSY7XoXP9hgXcemMow88+6+j9MJkclPBGUN8=;
 b=ICkCL3UXOrz7nRV+C1FLpqJz3+FXGn4cmY+01bohV0vn3nCqNwoOaGfn5WviogvPNA4HEBDfKIIvXMqtaLMRtpmmlUEJAi2gyZDsEN4VytRcRTLsUQh+5dsGUt64IUbZlTx3Rfageg9SbvnX4xku6eBesj5Pi5vI4w0/xhPUsSfRQ1hfrprAqOX1ry9i/WvU8YdgfkVyGcngLSUjYFzGyp5NpAGtqMOWzt1yj6VePHHY2a5uUrOUQHzi5NH+j918LzUBhPWv6vgI5libBrClm1w9qN3lJp7k/eoxtpBlZT/LCbnt4BnHCYYarGn+sdJ+KrgZN56RmVo4I1a2ditdxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtHaH1dvSY7XoXP9hgXcemMow88+6+j9MJkclPBGUN8=;
 b=kYF682FIK6mnfry4WVi5DH103M6fUEqV4B/IMPuM7IjPHKslJSC78f7jHZjpgn72OywK1AkGru53aHbTNFXw/qGyNf9FF9QUAmmnh3rJUwytG+0gOQvZVBCH2i6mkBWsrDct59OnPf/PWiOKwK26sIvLZOJfFyoTQp2vzppd06U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3838.namprd11.prod.outlook.com (2603:10b6:208:f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Mon, 25 Jan
 2021 14:25:13 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 14:25:13 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
CC: ticotimo@gmail.com,
	raj.khem@gmail.com
Subject: [meta-python][PATCH 1/2] packagegroup-meta-python: sort package names, add notes
Date: Mon, 25 Jan 2021 09:24:59 -0500
Message-ID: <20210125142500.936815-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: SJ0PR05CA0109.namprd05.prod.outlook.com
 (2603:10b6:a03:334::24) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by SJ0PR05CA0109.namprd05.prod.outlook.com (2603:10b6:a03:334::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.7 via Frontend Transport; Mon, 25 Jan 2021 14:25:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cec3b7a-7ca3-4a10-736a-08d8c13d0770
X-MS-TrafficTypeDiagnostic: MN2PR11MB3838:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB38380E8C52CEB9C6E4C9D0FD9FBD9@MN2PR11MB3838.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jvZ4/ZqHC0uCH4595spSO0to9vGcntqm3h7HmdVEOFvM0grq+4ZSM5kNWu0JQXgJXVRocBwBgg3IgZghoQTdFrk9iDskpfdXcdU4RptPM20aOPfeqbNQPuWNS/Da6D98IykZn8dAHOdCdP88ZLZnkkII6t89PJo+m1ubZEgh20V0rsXGeaaERHR7fI45shrXCO9uvE3O8+9OfbltDEmcEuR4DI48QKiyqfRu9IcHvope56QWf2VOgWNbT4GZqZsvPGnCX1/zrN9cPbRnD1e3iRC1fpmCVAzbYJ4vQC84/113oUYWWXumLXjQfRe1aFm5FtTQqhSKH5xx34Lf8VHP4RU7TWIQXMYo25o7D+Pfq3XyRYhVm2GQS50QPI/oC0xrGChqcntoQ1+pQd8zCSXGZ0gVIyS/YVzjh2NjMjeLnbIdFxpQGaeWMhCGL/wKtm6k5Vh7K8bYiIOqOu6mUcBSul3uklML8i6QUCl0NAk7LYMUz8zebD4/6nJTFjBzmofqTTqQ7pLP1xhr0xYQsFA/tA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39850400004)(2906002)(66946007)(6666004)(66556008)(66476007)(6916009)(6486002)(478600001)(86362001)(5660300002)(83380400001)(30864003)(8676002)(4326008)(316002)(1076003)(52116002)(6512007)(26005)(44832011)(186003)(6506007)(16526019)(956004)(2616005)(36756003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?b1CcLYW048JgnK2OGLgHETE1lsBhKOXsnLnDeQgn/NKaFL2swz/eHvGKhsfl?=
 =?us-ascii?Q?yTAZSOc2bJGqOrovLtYd/XibMkcKW7zC2mv20TXheQ6+tHIBJz/9GTa5XfY5?=
 =?us-ascii?Q?z5sZiuaDop6LkafzGCL/wbgCNpcF6LSHhq9U8ANZ8F5RpvlY39ULftmAjFdZ?=
 =?us-ascii?Q?HbXoX/5mP8xAYWnTPUvHVmyHbMGS3W/AFmmAieSDE07dMZhJXa0cqgJI83cr?=
 =?us-ascii?Q?MC4kxWM+mLI8YUYeTJHJ/PBJcQynuFPUuPSfLEfzkQ8NsmHi0RQTyN1R6/YQ?=
 =?us-ascii?Q?Hqag7k8jGy+odPEMjfLDaI6tW/M7Rzs8044ZcEG/amDRSCxKQhM20PIbWIFs?=
 =?us-ascii?Q?LECXlrFO+y1bOqltAux+VL8+nVzMVW1mtjzoPy4GVgqjEsUbREBtKiS/lWE5?=
 =?us-ascii?Q?rlthGeM9CdASo77slrW0Kta9B1AEqZDrVHs99dXlqGkwBLqY5dvpf2rrgkG1?=
 =?us-ascii?Q?/MZq9hmWwK1nlrR6CXGdytp4HbPYSpcDlvHF/j1lH7dEWParAwRMYdJ0QQsq?=
 =?us-ascii?Q?wIKxNo2uhnxLmgR03stFuvdo2rvhHcdlsjYkBO/L2MnvW1vHcArprp0Zj7OH?=
 =?us-ascii?Q?Cbu/ac+Dq5mmIOk8K7wzhEW8Y6Nf5zvTjy/rNWDdVhqUWKqBQg/eML/ESbuU?=
 =?us-ascii?Q?JhSWuqMfbSMH1bIae+gwJ0AHqAz6Z1GPLb4C1H5cKHM41lTUF9vqDWvIoZll?=
 =?us-ascii?Q?ZG+WPMIkc+TSa6c6k4yaF3+NiKuMQhTu65DxKBXZr65d0YtxaV9fKAVsjatn?=
 =?us-ascii?Q?ngI7sN9kanpuPXCzwsLdWW+jARo6JSVEZXK1y+CjSmwZxEysVO+REdoaMQd6?=
 =?us-ascii?Q?D5vTVcdewOI6eAkmW2eQ8MZS0ruL90nlHnmz16ub7MT11VgvCV6S9wQCVYtL?=
 =?us-ascii?Q?R2r2K3L5PgsFB1ljDx2JZCQPV4bN46SXHpJvZ1Y2nMgpxT1M8F4CAEU/bvsK?=
 =?us-ascii?Q?QQlfwJh2sqI+7eXy6Lqv4yCYHTwfZGUVc1qj//CXuysdagHPctFToqIHl/fD?=
 =?us-ascii?Q?eWAk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cec3b7a-7ca3-4a10-736a-08d8c13d0770
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 14:25:13.8239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilfBWH4wh0glDZtpCSvID3XHT+veqBrwM1OuLWioS1Q+nPpnhihqbOQosYUleg+wki5AO+JNKg8cUlEWNs70rCmhdV1vbN7jT7hNF73gfrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3838
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The packagegroup-meta-python file's package lists were unsorted, so
they were reorded to make it easier to manually inspect. Additionally,
the packagegroup-meta-python3-extended and -connectivity packagegroups
did not appear to have any use except to be added to the main group,
so they were removed and their recipe lists combined into the main
packagegroup-meta-python3. Finally, a note about enabling Fortran
support in the compiler was added to the file, since python3-cvxopt
relies on it in order to build.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../packagegroups/packagegroup-meta-python.bb | 624 +++++++++---------
 1 file changed, 308 insertions(+), 316 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pytho=
n.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 5f81fd35b..bbc9a80b3 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -7,442 +7,434 @@ PACKAGES =3D ' \
     packagegroup-meta-python3 \
 '
=20
+# Note that python3-cvxopt requires Fortran support. To enable this,
+# add the following to your local.conf:
+# FORTRAN_forcevariable =3D ",fortran"
 RDEPENDS_packagegroup-meta-python3 =3D "\
-    packagegroup-meta-python3-extended \
-    packagegroup-meta-python3-connectivity \
-"
-
-RDEPENDS_packagegroup-meta-python3 =3D "\
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-systemd", =
"", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "python3-blivetgui", ""=
, d)} \
+    gyp \
     pamela \
     pyrtm \
-    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-systemd", =
"", d)} \
-    python3-bcrypt \
-    python3-flask-mail \
-    python3-editor \
-    python3-flask-pymongo \
-    python3-cffi \
-    python3-pillow \
-    python3-markupsafe \
-    python3-flask-nav \
-    python3-asciitree \
-    python3-flask-sqlalchemy \
-    python3-gevent \
+    python3-absl \
     python3-aenum \
-    python3-gast \
-    python3-blinker \
-    python3-prettytable \
-    python3-cmd2 \
     python3-aiofiles \
-    python3-anyjson \
-    python3-isodate \
-    python3-incremental \
-    python3-aiohttp-jinja2 \
     python3-aiohttp \
+    python3-aiohttp-jinja2 \
     python3-alembic \
     python3-ansi2html \
     python3-ansicolors \
-    python3-argcomplete \
-    python3-argexec \
+    python3-anyjson \
     python3-appdirs \
     python3-apply-defaults \
+    python3-argcomplete \
+    python3-argexec \
     python3-argh \
-    python3-ply \
-    python3-astroid \
-    python3-ndg-httpsclient \
     python3-arpeggio \
-    python3-astor \
-    python3-pika \
+    python3-asciitree \
     python3-asn1crypto \
+    python3-astor \
+    python3-astroid \
     python3-async-timeout \
-    python3-absl \
     python3-attr \
-    python3-flask \
     python3-autobahn \
-    python3-babel \
-    python3-pretend \
     python3-automat \
-    python3-ptyprocess \
     python3-aws-iot-device-sdk-python \
-    python3-bandit \
+    python3-babel \
     python3-backcall \
     python3-backports-functools-lru-cache \
+    python3-bandit \
+    python3-bcrypt \
     python3-beautifulsoup4 \
-    python3-betamax \
     python3-behave \
-    python3-jsonpointer \
+    python3-betamax \
     python3-bitarray \
     python3-bitstring \
     python3-bitstruct \
-    python3-cachecontrol \
+    python3-blinker \
+    python3-blivet \
     python3-booleanpy \
+    python3-cachecontrol \
     python3-cachetools \
     python3-can \
     python3-cantools \
     python3-cassandra-driver \
     python3-cbor2 \
-    python3-chardet \
+    python3-cerberus \
     python3-certifi \
-    python3-isort \
-    python3-colorama \
+    python3-cffi \
+    python3-chardet \
     python3-cheetah \
     python3-click \
-    python3-huey \
+    python3-click-repl \
+    python3-click-spinner \
+    python3-cmd2 \
+    python3-colorama \
     python3-coloredlogs \
     python3-colorlog \
-    python3-wheel \
-    python3-configshell-fb \
-    python3-constantly \
-    python3-contextlib2 \
     python3-configargparse \
-    python3-crcmod \
     python3-configobj \
     python3-configparser \
+    python3-configshell-fb \
+    python3-constantly \
+    python3-contextlib2 \
+    python3-coverage \
     python3-cppy \
-    python3-dbussy \
+    python3-crcmod \
+    python3-croniter \
+    python3-cryptography \
+    python3-cryptography-vectors \
+    python3-cson \
+    python3-custom-inherit \
+    python3-cvxopt \
+    python3-cycler \
+    python3-dateparser \
     python3-dateutil \
+    python3-dbus-next \
+    python3-dbussy \
+    python3-decorator \
+    python3-defusedxml \
+    python3-dill \
+    python3-diskcache \
     python3-distro \
-    python3-click-repl \
-    python3-redis \
+    python3-django \
+    python3-django-south \
+    python3-djangorestframework \
+    python3-dnspython \
+    python3-docopt \
     python3-dominate \
+    python3-dt-schema \
+    python3-dynamic-dispatch \
+    python3-ecdsa \
+    python3-editor \
+    python3-engineio \
     python3-et-xmlfile \
+    python3-evdev \
+    python3-fann2 \
+    python3-fasteners \
+    python3-fastnumbers \
     python3-feedformatter \
+    python3-flask \
+    python3-flask-babel \
+    python3-flask-bootstrap \
     python3-flask-jsonpify \
     python3-flask-jwt \
+    python3-flask-login \
+    python3-flask-mail \
     python3-flask-migrate \
-    python3-pyinotify \
+    python3-flask-nav \
+    python3-flask-pymongo \
     python3-flask-restful \
+    python3-flask-script \
+    python3-flask-sijax \
     python3-flask-socketio \
+    python3-flask-sqlalchemy \
+    python3-flask-uploads \
+    python3-flask-user \
+    python3-flask-versioned \
+    python3-flask-wtf \
+    python3-flask-xstatic \
+    python3-future \
+    python3-gast \
+    python3-geojson \
+    python3-gevent \
+    python3-gmpy2 \
     python3-gmqtt \
-    python3-dateparser \
-    python3-defusedxml \
-    python3-rsa \
-    python3-django-south \
-    python3-grpcio \
-    python3-pybind11-json \
+    python3-gnupg \
     python3-google-api-python-client \
+    python3-graphviz \
+    python3-greenlet \
+    python3-greenstalk \
+    python3-grpcio \
+    python3-grpcio-tools \
+    python3-gsocketpool \
+    python3-gunicorn \
+    python3-h2 \
     python3-h5py \
-    python3-dt-schema \
     python3-haversine \
-    python3-fasteners \
-    python3-flask-bootstrap \
-    python3-dbus-next \
-    python3-dnspython \
-    python3-traitlets \
-    python3-pybind11 \
-    python3-flask-script \
-    python3-flask-sijax \
+    python3-hexdump \
+    python3-hpack \
     python3-html2text \
     python3-html5lib \
-    python3-intervals \
-    python3-ipy \
-    python3-ipaddress \
-    python3-iso8601 \
+    python3-httplib2 \
+    python3-huey \
     python3-humanfriendly \
-    python3-lrparsing \
-    python3-itsdangerous \
+    python3-humanize \
+    python3-hyperframe \
     python3-hyperlink \
-    python3-idna-ssl \
-    python3-jdcal \
-    python3-greenstalk \
     python3-icu \
-    python3-jsonschema \
-    python3-keras-applications \
     python3-idna \
-    python3-sympy \
-    python3-langtable \
-    python3-lockfile \
-    python3-nmap \
+    python3-idna \
+    python3-idna-ssl \
+    python3-imageio \
+    python3-incremental \
+    python3-inflection \
+    python3-intervals \
+    python3-ipaddress \
+    python3-ipy \
+    python3-ipython \
+    python3-ipython-genutils \
+    python3-iso3166 \
+    python3-iso8601 \
+    python3-isodate \
+    python3-isort \
+    python3-itsdangerous \
+    python3-javaobj-py3 \
     python3-jdatetime \
-    python3-monotonic \
-    python3-mpmath \
+    python3-jdcal \
     python3-jedi \
+    python3-jsmin \
     python3-jsonpatch \
+    python3-jsonpath-rw \
+    python3-jsonpointer \
+    python3-jsonref \
     python3-jsonrpcserver \
-    python3-libconf \
-    python3-netifaces \
-    python3-msm \
-    python3-nocaselist \
+    python3-jsonschema \
+    python3-jstyleson \
+    python3-kconfiglib \
+    python3-keras-applications \
     python3-keras-preprocessing \
-    python3-flask-babel \
+    python3-kiwisolver \
+    python3-langtable \
+    python3-lazy-object-proxy \
+    python3-libconf \
+    python3-license-expression \
+    python3-lockfile \
     python3-lorem \
-    python3-javaobj-py3 \
-    python3-passlib \
-    python3-pexpect \
+    python3-lrparsing \
+    python3-luma-core \
     python3-luma-oled \
     python3-lxml \
-    python3-precise-runner \
-    python3-padaos \
-    python3-progress \
-    python3-sqlalchemy \
-    python3-sh \
-    python3-petact \
+    python3-lz4 \
+    python3-m2crypto \
+    python3-markdown \
+    python3-markupsafe \
+    python3-matplotlib \
+    python3-mccabe \
+    python3-meh \
+    python3-meld3 \
     python3-mock \
+    python3-monotonic \
+    python3-mpmath \
     python3-msgpack \
-    python3-pyasn1 \
     python3-msk \
-    python3-openpyxl \
-    python3-prctl \
-    python3-pyatspi \
+    python3-msm \
     python3-multidict \
+    python3-natsort \
+    python3-ndg-httpsclient \
     python3-netaddr \
-    python3-parse \
+    python3-netifaces \
+    python3-networkx \
+    python3-nmap \
+    python3-nocasedict \
+    python3-nocaselist \
+    python3-ntplib \
     python3-oauthlib \
-    python3-pyfirmata \
-    python3-pandas \
+    python3-obd \
+    python3-openpyxl \
+    python3-ordered-set \
+    python3-padaos \
     python3-padatious \
-    python3-prompt-toolkit \
-    python3-parse-type \
-    python3-cycler \
-    python3-decorator \
-    python3-django \
-    python3-croniter \
-    python3-flask-user \
-    python3-twitter \
-    python3-evdev \
-    python3-dynamic-dispatch \
-    python3-click-spinner \
-    python3-future \
-    python3-geojson \
-    python3-gunicorn \
-    python3-engineio \
-    python3-gmpy2 \
-    python3-coverage \
-    python3-fastnumbers \
-    python3-fann2 \
-    python3-gnupg \
-    python3-flask-login \
-    python3-pyzmq \
-    python3-cryptography-vectors \
-    python3-flask-uploads \
-    python3-ecdsa \
-    python3-networkx \
-    python3-flask-xstatic \
-    python3-pint \
-    python3-iso3166 \
-    python3-imageio \
-    python3-mccabe \
-    python3-kconfiglib \
-    python3-grpcio-tools \
-    python3-jsmin \
-    python3-greenlet \
-    python3-idna \
-    python3-flask-versioned \
-    python3-httplib2 \
-    python3-ipython-genutils \
-    python3-kiwisolver \
-    python3-lz4 \
-    python3-obd \
-    python3-markdown \
-    python3-m2crypto \
     python3-paho-mqtt \
-    python3-graphviz \
-    python3-pyaudio \
     python3-pako \
-    python3-meld3 \
+    python3-pandas \
     python3-parallax \
-    python3-lazy-object-proxy \
-    python3-license-expression \
-    python3-luma-core \
-    python3-natsort \
-    python3-polyline \
-    python3-ordered-set \
+    python3-paramiko \
+    python3-parse \
+    python3-parse-type \
     python3-parso \
+    python3-passlib \
+    python3-pathtools3 \
+    python3-pep8 \
+    python3-periphery \
+    python3-petact \
+    python3-pexpect \
+    python3-pickleshare \
+    python3-pid \
+    python3-pika \
+    python3-pillow \
+    python3-pint \
+    python3-pkgconfig \
+    python3-ply \
+    python3-pocketsphinx \
+    python3-polyline \
+    python3-prctl \
+    python3-precise-runner \
+    python3-pretend \
+    python3-prettytable \
+    python3-priority \
+    python3-progress \
+    python3-prompt-toolkit \
+    python3-protobuf \
+    python3-psutil \
+    python3-ptyprocess \
+    python3-pulsectl \
+    python3-py-ubjson \
+    python3-pyalsaaudio \
+    python3-pyasn1 \
+    python3-pyasn1-modules \
+    python3-pyatspi \
+    python3-pyaudio \
+    python3-pybind11 \
+    python3-pybind11-json \
+    python3-pybluez \
+    python3-pychromecast \
+    python3-pycodestyle \
+    python3-pyconnman \
     python3-pycparser \
     python3-pycrypto \
+    python3-pycurl \
     python3-pydbus \
-    python3-pathtools3 \
-    python3-periphery \
+    python3-pydicti \
+    python3-pyephem \
+    python3-pyexpect \
+    python3-pyfirmata \
+    python3-pyflakes \
+    python3-pyhamcrest \
     python3-pyiface \
+    python3-pyinotify \
+    python3-pyjks \
     python3-pyjwt \
+    python3-pykickstart \
     python3-pykwalify \
-    python3-docopt \
     python3-pylint \
+    python3-pylyrics \
+    python3-pymisp \
+    python3-pymongo \
+    python3-pymysql \
+    python3-pynacl \
     python3-pynetlinux \
-    python3-pickleshare \
     python3-pyopenssl \
-    python3-protobuf \
-    python3-pyasn1-modules \
+    python3-pyparted \
+    python3-pyperclip \
+    python3-pyperf \
+    python3-pyrad \
+    python3-pyro4 \
+    python3-pyroute2 \
+    python3-pyrsistent \
     python3-pyscaffold \
     python3-pyserial \
     python3-pysocks \
-    python3-pytoml \
+    python3-pystache \
+    python3-pystemd \
+    python3-pytest-asyncio \
     python3-pytest-helpers-namespace \
+    python3-pytest-html \
+    python3-pytest-metadata \
+    python3-pytest-runner \
     python3-pytest-tempdir \
-    python3-pyflakes \
-    python3-pyrad \
+    python3-pytest-timeout \
+    python3-python-vlc \
+    python3-pytoml \
+    python3-pytun \
+    python3-pytz \
+    python3-pyudev \
     python3-pyusb \
-    python3-pyhamcrest \
-    python3-custom-inherit \
-    python3-pymysql \
-    python3-pyperclip \
+    python3-pywbem \
+    python3-pywbemtools \
+    python3-pyyaml \
+    python3-pyzmq \
+    python3-qrcode \
+    python3-raven \
+    python3-rdflib \
+    python3-redis \
+    python3-regex \
+    python3-requests \
+    python3-requests-file \
+    python3-requests-ftp \
+    python3-requests-futures \
+    python3-requests-oauthlib \
+    python3-requests-toolbelt \
     python3-rfc3339-validator \
-    python3-pytz \
+    python3-rfc3986-validator \
+    python3-rfc3987 \
+    python3-robotframework \
+    python3-robotframework-seriallibrary \
+    python3-rsa \
+    python3-ruamel-yaml \
+    python3-scapy \
     python3-scrypt \
-    python3-rdflib \
+    python3-sdnotify \
+    python3-semver \
+    python3-sentry-sdk \
+    python3-serpent \
+    python3-sh \
     python3-sijax \
-    python3-regex \
+    python3-simpleeval \
+    python3-simplejson \
     python3-slip-dbus \
+    python3-smbus \
     python3-smbus2 \
-    python3-pytest-metadata \
-    python3-term \
-    python3-pystache \
-    python3-pep8 \
-    python3-pytest-runner \
-    python3-pybluez \
-    python3-rfc3986-validator \
-    python3-pocketsphinx \
-    python3-sdnotify \
-    python3-pycodestyle \
+    python3-smpplib \
+    python3-snappy \
+    python3-socketio \
+    python3-soupsieve \
     python3-speaklater \
-    python3-wtforms \
     python3-speedtest-cli \
-    python3-pyudev \
-    python3-sqlparse \
-    python3-pyexpect \
-    python3-pytest-html \
-    python3-uritemplate \
-    python3-cryptography \
-    python3-requests \
-    python3-test-generator \
-    python3-whoosh \
-    python3-xstatic-font-awesome \
-    python3-tqdm \
-    python3-vcversioner \
-    python3-semver \
-    python3-serpent \
     python3-spidev \
+    python3-spidev \
+    python3-sqlalchemy \
+    python3-sqlparse \
     python3-sqlsoup \
-    python3-tornado \
-    python3-trafaret \
-    python3-urllib3 \
-    python3-yappi \
-    python3-texttable \
-    python3-humanize \
+    python3-stevedore \
     python3-strict-rfc3339 \
     python3-supervisor \
-    python3-diskcache \
-    python3-requests-futures \
-    python3-matplotlib \
-    python3-sentry-sdk \
-    python3-xlrd \
-    python3-xstatic \
-    python3-tzlocal \
-    python3-ntplib \
-    python3-u-msgpack-python \
-    python3-python-vlc \
-    python3-xlsxwriter \
-    python3-inflection \
+    python3-sympy \
     python3-tabulate \
-    python3-typing-extensions \
-    python3-pystemd \
-    python3-pid \
-    python3-pkgconfig \
-    python3-pylyrics \
-    python3-pyyaml \
-    python3-raven \
-    python3-stevedore \
-    python3-requests-oauthlib \
-    python3-rfc3987 \
-    python3-psutil \
-    python3-robotframework-seriallibrary \
-    python3-pulsectl \
-    python3-py-ubjson \
-    python3-pyalsaaudio \
-    python3-simpleeval \
-    python3-smbus \
-    python3-pychromecast \
-    python3-pyjks \
-    python3-pymongo \
-    python3-spidev \
-    python3-pynacl \
+    python3-term \
     python3-termcolor \
-    python3-pyperf \
-    python3-qrcode \
-    python3-visitor \
-    python3-pyroute2 \
-    python3-webencodings \
-    python3-pyrsistent \
-    python3-werkzeug \
-    python3-pydicti \
-    python3-xmlrunner \
-    python3-smpplib \
-    python3-pymisp \
-    python3-requests-file \
-    python3-requests-toolbelt \
-    python3-ruamel-yaml \
-    python3-socketio \
-    python3-soupsieve \
+    python3-test-generator \
     python3-textparser \
+    python3-texttable \
+    python3-thrift \
     python3-tinyrecord \
+    python3-tornado \
+    python3-tqdm \
+    python3-trafaret \
+    python3-trafaret-config \
+    python3-traitlets \
+    python3-transitions \
     python3-twine \
+    python3-twisted \
+    python3-twitter \
+    python3-twofish \
+    python3-txaio \
+    python3-txws \
+    python3-typeguard \
+    python3-typing-extensions \
+    python3-tzlocal \
+    python3-u-msgpack-python \
+    python3-ujson \
     python3-unidiff \
+    python3-uritemplate \
+    python3-urllib3 \
+    python3-vcversioner \
+    python3-versiontools \
+    python3-visitor \
+    python3-waitress \
     python3-watchdog \
     python3-webcolors \
-    python3-robotframework \
-    python3-xxhash \
-    python3-yarl \
-    python3-zopeinterface \
-    python3-requests-ftp \
-    python3-scapy \
-    python3-paramiko \
-    python3-twofish \
-    python3-simplejson \
-    python3-snappy \
-    python3-versiontools \
-    python3-flask-wtf \
+    python3-webencodings \
+    python3-websocket-client \
     python3-websockets \
     python3-werkzeug \
+    python3-werkzeug \
+    python3-wheel \
+    python3-whoosh \
     python3-wrapt \
+    python3-wtforms \
+    python3-xlrd \
+    python3-xlsxwriter \
+    python3-xmlrunner \
     python3-xmltodict \
-    python3-trafaret-config \
-    python3-twisted \
-    python3-txaio \
-    python3-typeguard \
-    python3-pytest-timeout \
-    python3-ujson \
-    python3-waitress \
-    python3-websocket-client \
     python3-xmodem \
-    python3-djangorestframework \
-    python3-pytest-asyncio \
-    python3-nocasedict \
+    python3-xstatic \
+    python3-xstatic-font-awesome \
+    python3-xxhash \
     python3-yamlloader \
-    python3-ipython \
-    python3-pycurl \
-    gyp \
-    python3-jsonref \
-    python3-transitions \
-    python3-dill \
-    python3-cerberus \
-    python3-cvxopt \
-    python3-jsonpath-rw \
-    python3-hexdump \
-    python3-jstyleson \
-"
-
-RDEPENDS_packagegroup-meta-python3-extended =3D "\
-    python3-blivet \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "python3-blivetgui", ""=
, d)} \
-    python3-cson \
-    python3-meh \
-    python3-pyephem \
-    python3-pykickstart \
-    python3-pyparted \
-    python3-pywbem \
-    python3-pywbemtools \
-"
-
-RDEPENDS_packagegroup-meta-python3-connectivity =3D "\
-    python3-gsocketpool \
-    python3-h2 \
-    python3-hpack \
-    python3-hyperframe \
-    python3-priority \
-    python3-pyconnman \
-    python3-pyro4 \
-    python3-thrift \
-    python3-txws \
-    python3-pytun \
+    python3-yappi \
+    python3-yarl \
+    python3-zopeinterface \
     telepathy-python3 \
 "
=20
--=20
2.29.2

