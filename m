Return-Path: <RahulJanani.Pandi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A668FC4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 07:11:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11365.1714029112585736514
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Apr 2024 00:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RjuYtu0v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4845fc3397=rahuljanani.pandi@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P6jPEs025173
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 00:11:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=6Xtf8
	8FcQXb3xWu3148RhWLYxQ3vPOaAW1dK2rnwLnk=; b=RjuYtu0v8bF8ZO5gg+lzy
	0zM0OJiflOAvinOrEWWAlM9SrddcRKJhhWRjqAYdA981XuppWx6y+wk5Y2pvJrxH
	/LzFPBIs1hULMT4NJ1zKpvhcuqeEdmvsCAcksDQFqV0JV/Vn8sEW7dpqRFiQKFbE
	clTqRZPENWOux2GoPR+Y9f3uCPLGlZkYO2gg0Dpqd/zOcs41dQfowp1nWi2NDea9
	RrTMY8gqMnybzQcazKL7kpxD6SJPKyxNz/i6tT6cH1Uz2MMqE5xrB1CxtwIvdvZH
	KsA638dxF90hfb4owPms+tC3PdgypMUUncMaktWW7B7c28ZmR5w/ktzAcY4k8+73
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xmd7gmsk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 00:11:51 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Thu, 25 Apr 2024 00:11:50 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Thu, 25 Apr 2024 00:11:49 -0700
From: Rahul Janani Pandi <RahulJanani.Pandi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Rahul Janani Pandi <RahulJanani.Pandi@windriver.com>
Subject: [oe][meta-python][kirkstone][PATCH 1/1] python3-aiohttp: Fix CVE-2024-23334
Date: Thu, 25 Apr 2024 07:10:52 +0000
Message-ID: <20240425071052.123585-1-RahulJanani.Pandi@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ER8bIsyfKNlKmyivBvm5-Ts_5sCbsQGC
X-Proofpoint-GUID: ER8bIsyfKNlKmyivBvm5-Ts_5sCbsQGC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_06,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404250049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 07:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110147

aiohttp is an asynchronous HTTP client/server framework
for asyncio and Python.When using aiohttp as a web server
and configuring static routes, it is necessary to specify
the root path for static files. Additionally, the option
'follow_symlinks' can be used to determine whether to
follow symbolic links outside the static root directory.
When 'follow_symlinks' is set to True, there is no
validation to check if reading a file is within the root
directory. This can lead to directory traversal
vulnerabilities, resulting in unauthorized access to
arbitrary files on the system, even when symlinks are not
present. Disabling follow_symlinks and using a reverse proxy
are encouraged mitigations. Version 3.9.2 fixes this issue.

References:
https://security-tracker.debian.org/tracker/CVE-2024-23334
https://github.com/aio-libs/aiohttp/releases/tag/v3.9.2

Signed-off-by: Rahul Janani Pandi <RahulJanani.Pandi@windriver.com>
---
 .../python3-aiohttp/CVE-2024-23334.patch      | 222 ++++++++++++++++++
 .../python/python3-aiohttp_3.8.6.bb           |   3 +
 2 files changed, 225 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-23334.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-23334.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-23334.patch
new file mode 100644
index 000000000..29909529a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-23334.patch
@@ -0,0 +1,222 @@
+From 1c335944d6a8b1298baf179b7c0b3069f10c514b
+From: Sam Bull <git@sambull.org>
+Date:   Sun Jan 28 18:13:06 2024 +0000
+Subject: [PATCH] python3-aiohttp: Validate static paths (#8079)
+
+Co-authored-by: J. Nick Koston <nick@koston.org>
+
+CVE: CVE-2024-23334
+
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/1c335944d6a8b1298baf179b7c0b3069f10c514b]
+
+Signed-off-by: Rahul Janani Pandi <RahulJanani.Pandi@windriver.com>
+---
+ CHANGES/8079.bugfix.rst         |  1 +
+ aiohttp/web_urldispatcher.py    | 18 +++++--
+ docs/web_advanced.rst           | 16 ++++--
+ docs/web_reference.rst          | 12 +++--
+ tests/test_web_urldispatcher.py | 91 +++++++++++++++++++++++++++++++++
+ 5 files changed, 128 insertions(+), 10 deletions(-)
+ create mode 100644 CHANGES/8079.bugfix.rst
+
+diff --git a/CHANGES/8079.bugfix.rst b/CHANGES/8079.bugfix.rst
+new file mode 100644
+index 0000000..57bc8bf
+--- /dev/null
++++ b/CHANGES/8079.bugfix.rst
+@@ -0,0 +1 @@
++Improved validation of paths for static resources -- by :user:`bdraco`.
+diff --git a/aiohttp/web_urldispatcher.py b/aiohttp/web_urldispatcher.py
+index 5942e35..e8a8023 100644
+--- a/aiohttp/web_urldispatcher.py
++++ b/aiohttp/web_urldispatcher.py
+@@ -593,9 +593,14 @@ class StaticResource(PrefixResource):
+             url = url / filename
+
+         if append_version:
++            unresolved_path = self._directory.joinpath(filename)
+             try:
+-                filepath = self._directory.joinpath(filename).resolve()
+-                if not self._follow_symlinks:
++                if self._follow_symlinks:
++                    normalized_path = Path(os.path.normpath(unresolved_path))
++                    normalized_path.relative_to(self._directory)
++                    filepath = normalized_path.resolve()
++                else:
++                    filepath = unresolved_path.resolve()
+                     filepath.relative_to(self._directory)
+             except (ValueError, FileNotFoundError):
+                 # ValueError for case when path point to symlink
+@@ -660,8 +665,13 @@ class StaticResource(PrefixResource):
+                 # /static/\\machine_name\c$ or /static/D:\path
+                 # where the static dir is totally different
+                 raise HTTPForbidden()
+-            filepath = self._directory.joinpath(filename).resolve()
+-            if not self._follow_symlinks:
++            unresolved_path = self._directory.joinpath(filename)
++            if self._follow_symlinks:
++                normalized_path = Path(os.path.normpath(unresolved_path))
++                normalized_path.relative_to(self._directory)
++                filepath = normalized_path.resolve()
++            else:
++                filepath = unresolved_path.resolve()
+                 filepath.relative_to(self._directory)
+         except (ValueError, FileNotFoundError) as error:
+             # relatively safe
+diff --git a/docs/web_advanced.rst b/docs/web_advanced.rst
+index 3a98b78..5129397 100644
+--- a/docs/web_advanced.rst
++++ b/docs/web_advanced.rst
+@@ -136,12 +136,22 @@ instead could be enabled with ``show_index`` parameter set to ``True``::
+
+    web.static('/prefix', path_to_static_folder, show_index=True)
+
+-When a symlink from the static directory is accessed, the server responses to
+-client with ``HTTP/404 Not Found`` by default. To allow the server to follow
+-symlinks, parameter ``follow_symlinks`` should be set to ``True``::
++When a symlink that leads outside the static directory is accessed, the server
++responds to the client with ``HTTP/404 Not Found`` by default. To allow the server to
++follow symlinks that lead outside the static root, the parameter ``follow_symlinks``
++should be set to ``True``::
+
+    web.static('/prefix', path_to_static_folder, follow_symlinks=True)
+
++.. caution::
++
++   Enabling ``follow_symlinks`` can be a security risk, and may lead to
++   a directory transversal attack. You do NOT need this option to follow symlinks
++   which point to somewhere else within the static directory, this option is only
++   used to break out of the security sandbox. Enabling this option is highly
++   discouraged, and only expected to be used for edge cases in a local
++   development setting where remote users do not have access to the server.
++
+ When you want to enable cache busting,
+ parameter ``append_version`` can be set to ``True``
+
+diff --git a/docs/web_reference.rst b/docs/web_reference.rst
+index a156f47..b100676 100644
+--- a/docs/web_reference.rst
++++ b/docs/web_reference.rst
+@@ -1836,9 +1836,15 @@ Router is any object that implements :class:`~aiohttp.abc.AbstractRouter` interf
+                               by default it's not allowed and HTTP/403 will
+                               be returned on directory access.
+
+-      :param bool follow_symlinks: flag for allowing to follow symlinks from
+-                              a directory, by default it's not allowed and
+-                              HTTP/404 will be returned on access.
++      :param bool follow_symlinks: flag for allowing to follow symlinks that lead
++                              outside the static root directory, by default it's not allowed and
++                              HTTP/404 will be returned on access.  Enabling ``follow_symlinks``
++                              can be a security risk, and may lead to a directory transversal attack.
++                              You do NOT need this option to follow symlinks which point to somewhere
++                              else within the static directory, this option is only used to break out
++                              of the security sandbox. Enabling this option is highly discouraged,
++                              and only expected to be used for edge cases in a local development
++                              setting where remote users do not have access to the server.
+
+       :param bool append_version: flag for adding file version (hash)
+                               to the url query string, this value will
+diff --git a/tests/test_web_urldispatcher.py b/tests/test_web_urldispatcher.py
+index f24f451..f40f6a5 100644
+--- a/tests/test_web_urldispatcher.py
++++ b/tests/test_web_urldispatcher.py
+@@ -123,6 +123,97 @@ async def test_follow_symlink(tmp_dir_path, aiohttp_client) -> None:
+     assert (await r.text()) == data
+
+
++async def test_follow_symlink_directory_traversal(
++    tmp_path: pathlib.Path, aiohttp_client: AiohttpClient
++) -> None:
++    # Tests that follow_symlinks does not allow directory transversal
++    data = "private"
++
++    private_file = tmp_path / "private_file"
++    private_file.write_text(data)
++
++    safe_path = tmp_path / "safe_dir"
++    safe_path.mkdir()
++
++    app = web.Application()
++
++    # Register global static route:
++    app.router.add_static("/", str(safe_path), follow_symlinks=True)
++    client = await aiohttp_client(app)
++
++    await client.start_server()
++    # We need to use a raw socket to test this, as the client will normalize
++    # the path before sending it to the server.
++    reader, writer = await asyncio.open_connection(client.host, client.port)
++    writer.write(b"GET /../private_file HTTP/1.1\r\n\r\n")
++    response = await reader.readuntil(b"\r\n\r\n")
++    assert b"404 Not Found" in response
++    writer.close()
++    await writer.wait_closed()
++    await client.close()
++
++
++async def test_follow_symlink_directory_traversal_after_normalization(
++    tmp_path: pathlib.Path, aiohttp_client: AiohttpClient
++) -> None:
++    # Tests that follow_symlinks does not allow directory transversal
++    # after normalization
++    #
++    # Directory structure
++    # |-- secret_dir
++    # |   |-- private_file (should never be accessible)
++    # |   |-- symlink_target_dir
++    # |       |-- symlink_target_file (should be accessible via the my_symlink symlink)
++    # |       |-- sandbox_dir
++    # |           |-- my_symlink -> symlink_target_dir
++    #
++    secret_path = tmp_path / "secret_dir"
++    secret_path.mkdir()
++
++    # This file is below the symlink target and should not be reachable
++    private_file = secret_path / "private_file"
++    private_file.write_text("private")
++
++    symlink_target_path = secret_path / "symlink_target_dir"
++    symlink_target_path.mkdir()
++
++    sandbox_path = symlink_target_path / "sandbox_dir"
++    sandbox_path.mkdir()
++
++    # This file should be reachable via the symlink
++    symlink_target_file = symlink_target_path / "symlink_target_file"
++    symlink_target_file.write_text("readable")
++
++    my_symlink_path = sandbox_path / "my_symlink"
++    pathlib.Path(str(my_symlink_path)).symlink_to(str(symlink_target_path), True)
++
++    app = web.Application()
++
++    # Register global static route:
++    app.router.add_static("/", str(sandbox_path), follow_symlinks=True)
++    client = await aiohttp_client(app)
++
++    await client.start_server()
++    # We need to use a raw socket to test this, as the client will normalize
++    # the path before sending it to the server.
++    reader, writer = await asyncio.open_connection(client.host, client.port)
++    writer.write(b"GET /my_symlink/../private_file HTTP/1.1\r\n\r\n")
++    response = await reader.readuntil(b"\r\n\r\n")
++    assert b"404 Not Found" in response
++    writer.close()
++    await writer.wait_closed()
++
++    reader, writer = await asyncio.open_connection(client.host, client.port)
++    writer.write(b"GET /my_symlink/symlink_target_file HTTP/1.1\r\n\r\n")
++    response = await reader.readuntil(b"\r\n\r\n")
++    assert b"200 OK" in response
++    response = await reader.readuntil(b"readable")
++    assert response == b"readable"
++    writer.close()
++    await writer.wait_closed()
++    await client.close()
++
++
+ @pytest.mark.parametrize(
+     "dir_name,filename,data",
+     [
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
index f8ca9a473..c805e17d8 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
@@ -4,6 +4,9 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
+SRC_URI += "file://CVE-2024-23334.patch \
+           "
+
 SRC_URI[sha256sum] = "b0cf2a4501bff9330a8a5248b4ce951851e415bdcce9dc158e76cfd55e15085c"
 
 PYPI_PACKAGE = "aiohttp"
-- 
2.40.0


