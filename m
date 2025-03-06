Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2222C282EC
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 10:20:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9610.1741256450398945458
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Mar 2025 02:20:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51601af165=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5265TwCK005736
	for <openembedded-devel@lists.openembedded.org>; Thu, 6 Mar 2025 10:20:49 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456ct89vjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 10:20:49 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 6 Mar 2025 02:20:48 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 6 Mar 2025 02:20:47 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 1/2] python3-requests-ftp: remove use of module cgi
Date: Thu, 6 Mar 2025 18:20:34 +0800
Message-ID: <20250306102035.1552646-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: GAEYIFiPnbEQNL5dzKrcVX031aDgYLFy
X-Proofpoint-ORIG-GUID: GAEYIFiPnbEQNL5dzKrcVX031aDgYLFy
X-Authority-Analysis: v=2.4 cv=D4W9KuRj c=1 sm=1 tr=0 ts=67c97701 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=8AHkEIZyAAAA:8 a=vTr9H3xdAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=tTq_80_9wGIsfMoWbhIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Xj4ZUx8FdtsA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_04,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 impostorscore=0 spamscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503060077
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5265TwCK005736
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 10:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115766

From: Kai Kang <kai.kang@windriver.com>

python 3.13 removed some modules such as cgi which is required by python3=
-requests-ftp:

    https://docs.python.org/3/whatsnew/3.13.html

    Important removals:

    PEP 594: The remaining 19 =E2=80=9Cdead batteries=E2=80=9D (legacy st=
dlib modules) have
    been removed from the standard library: aifc, audioop, cgi, cgitb,
    chunk, crypt, imghdr, mailcap, msilib, nis, nntplib, ossaudiodev, pip=
es,
    sndhdr, spwd, sunau, telnetlib, uu and xdrlib.

Backport and rebase a patch from Fedora to remove use of module cgi.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-Remove-use-of-the-cgi-module.patch   | 115 ++++++++++++++++++
 .../python/python3-requests-ftp_0.3.1.bb      |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-=
ftp/0001-Remove-use-of-the-cgi-module.patch

diff --git a/meta-python/recipes-devtools/python/python3-requests-ftp/000=
1-Remove-use-of-the-cgi-module.patch b/meta-python/recipes-devtools/pytho=
n/python3-requests-ftp/0001-Remove-use-of-the-cgi-module.patch
new file mode 100644
index 0000000000..2d32bf0a17
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests-ftp/0001-Remov=
e-use-of-the-cgi-module.patch
@@ -0,0 +1,115 @@
+python 3.13 removed some modules such as cgi which is required by python=
3-requests-ftp:
+
+    https://docs.python.org/3/whatsnew/3.13.html
+
+    Important removals:
+
+    PEP 594: The remaining 19 =E2=80=9Cdead batteries=E2=80=9D (legacy s=
tdlib modules) have
+    been removed from the standard library: aifc, audioop, cgi, cgitb,
+    chunk, crypt, imghdr, mailcap, msilib, nis, nntplib, ossaudiodev, pi=
pes,
+    sndhdr, spwd, sunau, telnetlib, uu and xdrlib.
+
+Backport and rebase a patch from Fedora to remove use of module cgi.
+
+Upstream-Status: Backport [https://dl.fedoraproject.org/pub/fedora/linux=
/development/rawhide/Server/source/tree/Packages/p/python-requests-ftp-0.=
3.1-36.fc42.src.rpm]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ requests_ftp/ftp.py | 56 ---------------------------------------------
+ 1 file changed, 56 deletions(-)
+
+diff --git a/requests_ftp/ftp.py b/requests_ftp/ftp.py
+index 9711905..85dac47 100644
+--- a/requests_ftp/ftp.py
++++ b/requests_ftp/ftp.py
+@@ -6,7 +6,6 @@ from requests.compat import urlparse
+ from requests.hooks import dispatch_hook
+ from requests import Response, codes
+ from io import BytesIO
+-import cgi
+ import os
+ import socket
+=20
+@@ -29,12 +28,6 @@ class FTPSession(requests.Session):
+         content field contains the binary data.'''
+         return self.request('RETR', url, **kwargs)
+=20
+-    def stor(self, url, files=3DNone, **kwargs):
+-        '''Sends an FTP STOR to a given URL. Returns a Response object.=
 Expects
+-        to be given one file by the standard Requests method. The remot=
e
+-        filename will be given by the URL provided.'''
+-        return self.request('STOR', url, files=3Dfiles, **kwargs)
+-
+     def nlst(self, url, **kwargs):
+         '''Sends an FTP NLST. Returns a Response object.'''
+         return self.request('NLST', url, **kwargs)
+@@ -52,30 +45,6 @@ def monkeypatch_session():
+     return
+=20
+=20
+-def parse_multipart_files(request):
+-    '''Given a prepared reqest, return a file-like object containing th=
e
+-    original data. This is pretty hacky.'''
+-    # Start by grabbing the pdict.
+-    _, pdict =3D cgi.parse_header(request.headers['Content-Type'])
+-
+-    # Now, wrap the multipart data in a BytesIO buffer. This is annoyin=
g.
+-    buf =3D BytesIO()
+-    buf.write(request.body)
+-    buf.seek(0)
+-
+-    # Parse the data. Simply take the first file.
+-    data =3D cgi.parse_multipart(buf, pdict)
+-    _, filedata =3D data.popitem()
+-    buf.close()
+-
+-    # Get a BytesIO now, and write the file into it.
+-    buf =3D BytesIO()
+-    buf.write(''.join(filedata))
+-    buf.seek(0)
+-
+-    return buf
+-
+-
+ def data_callback_factory(variable):
+     '''Returns a callback suitable for use by the FTP library. This cal=
lback
+     will repeatedly save data into the variable provided to this functi=
on. This
+@@ -135,7 +104,6 @@ class FTPAdapter(requests.adapters.BaseAdapter):
+         # send the specific queries.
+         self.func_table =3D {'LIST': self.list,
+                            'RETR': self.retr,
+-                           'STOR': self.stor,
+                            'NLST': self.nlst,
+                            'SIZE': self.size,
+                            'HEAD': self.head,
+@@ -314,30 +282,6 @@ class FTPAdapter(requests.adapters.BaseAdapter):
+         response.status_code =3D codes.ok
+         return response
+=20
+-    def stor(self, path, request):
+-        '''Executes the FTP STOR command on the given path.'''
+-
+-        # First, get the file handle. We assume (bravely)
+-        # that there is only one file to be sent to a given URL. We als=
o
+-        # assume that the filename is sent as part of the URL, not as p=
art of
+-        # the files argument. Both of these assumptions are rarely corr=
ect,
+-        # but they are easy.
+-        data =3D parse_multipart_files(request)
+-
+-        # Split into the path and the filename.
+-        path, filename =3D os.path.split(path)
+-
+-        # Switch directories and upload the data.
+-        self.conn.cwd(path)
+-        code =3D self.conn.storbinary('STOR ' + filename, data)
+-
+-        # Close the connection and build the response.
+-        self.conn.close()
+-
+-        response =3D build_binary_response(request, BytesIO(), code)
+-
+-        return response
+-
+     def nlst(self, path, request):
+         '''Executes the FTP NLST command on the given path.'''
+         data =3D BytesIO()
diff --git a/meta-python/recipes-devtools/python/python3-requests-ftp_0.3=
.1.bb b/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
index 119c62ea34..7e72391783 100644
--- a/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
@@ -3,6 +3,7 @@ HOMEPAGE =3D "http://github.com/Lukasa/requests-ftp"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6683a23c9968b97709441dc884d46=
df6"
=20
+SRC_URI +=3D "file://0001-Remove-use-of-the-cgi-module.patch"
 SRC_URI[sha256sum] =3D "7504ceb5cba8a5c0135ed738596820a78c5f2be92d79b29f=
96ba99b183d8057a"
=20
 inherit pypi setuptools3
--=20
2.34.1


