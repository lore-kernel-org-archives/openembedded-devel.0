Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B991CC3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 03:17:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7325.1721272657742083712
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jul 2024 20:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=79293fe182=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I2UcTu032131
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 03:17:37 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40erhj034r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 03:17:36 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 20:17:35 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 20:17:34 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][meta-python][PATCH] python3-h5py: fix compile error with gcc 14
Date: Thu, 18 Jul 2024 11:17:33 +0800
Message-ID: <20240718031733.2868099-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: TzNpIXqD9E4Sy9roNerEVP_wldzKc7Yh
X-Proofpoint-GUID: TzNpIXqD9E4Sy9roNerEVP_wldzKc7Yh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_19,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1011
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407180020
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46I2UcTu032131
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 03:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111389

From: Changqing Li <changqing.li@windriver.com>

Backport two patches to fix following compile error:

h5py/h5l.c: In function =E2=80=98__pyx_pf_4h5py_3h5l_9LinkProxy_12get_val=
=E2=80=99:
h5py/h5l.c:8152:107: error: passing argument 4 of =E2=80=98__pyx_f_4h5py_=
4defs_H5Lunpack_elink_val=E2=80=99 from incompatible pointer type [-Winco=
mpatible-pointer-types]
 8152 |       __pyx_t_2 =3D __pyx_f_4h5py_4defs_H5Lunpack_elink_val(__pyx=
_v_buf, __pyx_v_buf_size, (&__pyx_v_wtf), (&__pyx_v_ext_file_name), (&__p=
yx_v_ext_obj_name)); if (unlikely(__pyx_t_2 =3D=3D ((herr_t)((herr_t)-1L)=
))) __PYX_ERR(1, 187, __pyx_L5_error)
      |                                                                  =
                                        ~^~~~~~~~~~~~~~~~~~~~~~~
      |                                                                  =
                                         |
      |

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...001-Use-libc.stdint-instead-of-numpy.patch | 27 +++++++++++++++++++
 ...ast-arguments-to-H5Lunpack_elink_val.patch | 27 +++++++++++++++++++
 .../python/python3-h5py_3.10.0.bb             |  5 +++-
 3 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001=
-Use-libc.stdint-instead-of-numpy.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0002=
-Properly-cast-arguments-to-H5Lunpack_elink_val.patch

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-Use-li=
bc.stdint-instead-of-numpy.patch b/meta-python/recipes-devtools/python/py=
thon3-h5py/0001-Use-libc.stdint-instead-of-numpy.patch
new file mode 100644
index 000000000..3c55fa697
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-Use-libc.stdi=
nt-instead-of-numpy.patch
@@ -0,0 +1,27 @@
+From 434e1bf4ab9fa53ec1293cde86f4dbec6784e50f Mon Sep 17 00:00:00 2001
+From: Orion Poplawski <orion@nwra.com>
+Date: Thu, 22 Feb 2024 08:41:17 -0700
+Subject: [PATCH 1/2] Use libc.stdint instead of numpy
+
+Upstream-Status: Backport [https://github.com/h5py/h5py/pull/2382/commit=
s/387a22b8c1513800c0401f496b4ed512c1639798]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ h5py/api_types_ext.pxd                   | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/h5py/api_types_ext.pxd b/h5py/api_types_ext.pxd
+index 91acb128..55a239f5 100644
+--- a/h5py/api_types_ext.pxd
++++ b/h5py/api_types_ext.pxd
+@@ -20,7 +20,7 @@ from libc.string cimport strlen, strchr, strcpy, strnc=
py, strcmp,\
+ ctypedef long size_t
+ from libc.time cimport time_t
+=20
+-from numpy cimport int8_t, uint8_t, int16_t, uint16_t, int32_t, uint32_=
t, int64_t, uint64_t
++from libc.stdint cimport int8_t, uint8_t, int16_t, uint16_t, int32_t, u=
int32_t, int64_t, uint64_t
+=20
+ IF UNAME_SYSNAME !=3D "Windows":
+     cdef extern from "unistd.h":
+--=20
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-h5py/0002-Proper=
ly-cast-arguments-to-H5Lunpack_elink_val.patch b/meta-python/recipes-devt=
ools/python/python3-h5py/0002-Properly-cast-arguments-to-H5Lunpack_elink_=
val.patch
new file mode 100644
index 000000000..0f77f745a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0002-Properly-cast=
-arguments-to-H5Lunpack_elink_val.patch
@@ -0,0 +1,27 @@
+From 9ed4f80fd482e135119086fb2015ca97dce306ae Mon Sep 17 00:00:00 2001
+From: Orion Poplawski <orion@nwra.com>
+Date: Thu, 15 Feb 2024 20:47:50 -0700
+Subject: [PATCH 2/2] Properly cast arguments to H5Lunpack_elink_val
+
+Upstream-Status: Backport [https://github.com/h5py/h5py/pull/2380/commit=
s/704e13ac83b42898514610c4df9f32f367e767e4]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ h5py/h5l.pyx         | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/h5py/h5l.pyx b/h5py/h5l.pyx
+index 60b252fa..af725bdb 100644
+--- a/h5py/h5l.pyx
++++ b/h5py/h5l.pyx
+@@ -184,7 +184,7 @@ cdef class LinkProxy:
+             if info.type =3D=3D H5L_TYPE_SOFT:
+                 py_retval =3D buf
+             else:
+-                H5Lunpack_elink_val(buf, buf_size, &wtf, &ext_file_name=
, &ext_obj_name)
++                H5Lunpack_elink_val(buf, buf_size, &wtf, <const char **=
>&ext_file_name, <const char **>&ext_obj_name)
+                 py_retval =3D (bytes(ext_file_name), bytes(ext_obj_name=
))
+         finally:
+             efree(buf)
+--=20
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb b=
/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
index 8a9158525..d557a8188 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
@@ -7,7 +7,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D113251d71fb03=
84712c719b567261c5c"
 SRC_URI[sha256sum] =3D "d93adc48ceeb33347eb24a634fb787efc7ae4644e6ea4ba7=
33d099605045c049"
=20
 SRC_URI +=3D "file://0001-setup_build.py-avoid-absolute-path.patch \
-            file://0001-Fix-Cython-3-compatibility.patch"
+            file://0001-Fix-Cython-3-compatibility.patch \
+            file://0001-Use-libc.stdint-instead-of-numpy.patch \
+            file://0002-Properly-cast-arguments-to-H5Lunpack_elink_val.p=
atch \
+"
=20
 inherit pkgconfig pypi setuptools3
=20
--=20
2.25.1


