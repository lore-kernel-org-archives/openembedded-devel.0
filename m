Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E00C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 06:36:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.67002.1718951759937086644
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jun 2024 23:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6902708f5d=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L3Ugpc016581
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 23:35:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yvrmr0j8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 23:35:59 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 23:35:57 -0700
From: mgupta1 <meenali.gupta@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-openembedded][kirkstone][PATCH 1/1] openvpn: fix multiple CVEs
Date: Fri, 21 Jun 2024 06:35:37 +0000
Message-ID: <20240621063537.3887271-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: WLkciO8bj6PUbjEBoMk8J0uiL_IdesGL
X-Proofpoint-ORIG-GUID: WLkciO8bj6PUbjEBoMk8J0uiL_IdesGL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_01,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1011 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406210047
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45L3Ugpc016581
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 06:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110986

From: Meenali Gupta <meenali.gupta@windriver.com>

CVE-2024-24974:
Previously, the VPN tool=E2=80=99s Windows implementation allowed remote =
access to
its service pipe, posing a security risk. Using compromised credentials, =
a
threat actor could communicate with OpenVPN to orchestrate attacks.

CVE-2024-27903:
OpenVPN has mitigated the risk by restricting plugin load. Plugins can
now only be loaded from the software=E2=80=99s install directory, the Win=
dows
system directory, and the plugin_dir directory under the software=E2=80=99=
s installation.

CVE-2024-27459:
This vulnerability affects the interactive service component, potentially=
 leading
to local privilege escalation when triggered by an oversized message.To m=
itigate
this risk, the VPN solution now terminates connections upon detecting exc=
essively
large messages, preventing stack overflow exploits.

References:
https://openvpn.net/security-advisory/ovpnx-vulnerability-cve-2024-27903-=
cve-2024-27459-cve-2024-24974/
https://socradar.io/openvpn-fixed-multiple-vulnerabilities-on-windows/
https://community.openvpn.net/openvpn/wiki/CVE-2024-27903
https://community.openvpn.net/openvpn/wiki/CVE-2024-27459
https://community.openvpn.net/openvpn/wiki/CVE-2024-24974

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 .../openvpn/openvpn/CVE-2024-24974.patch      |  49 ++++++++
 .../openvpn/openvpn/CVE-2024-27459.patch      |  99 +++++++++++++++
 .../openvpn/openvpn/CVE-2024-27903.patch      | 119 ++++++++++++++++++
 .../recipes-support/openvpn/openvpn_2.5.6.bb  |   6 +-
 4 files changed, 272 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2=
024-24974.patch
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2=
024-27459.patch
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2=
024-27903.patch

diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-249=
74.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-24974=
.patch
new file mode 100644
index 0000000000..b42b3040ef
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-24974.patc=
h
@@ -0,0 +1,49 @@
+From 2c1de0f0803360c0a6408f754066bd3a6fb28237 Mon Sep 17 00:00:00 2001
+From: Lev Stipakov <lstipakov@gmail.com>
+Date: Tue, 19 Mar 2024 17:16:07 +0200
+Subject: [PATCH] interactive.c: disable remote access to the service pip=
e
+
+Remote access to the service pipe is not needed and might
+be a potential attack vector.
+
+For example, if an attacker manages to get credentials for
+a user which is the member of "OpenVPN Administrators" group
+on a victim machine, an attacker might be able to communicate
+with the privileged interactive service on a victim machine
+and start openvpn processes remotely.
+
+CVE: 2024-24974
+
+Microsoft case number: 85925
+
+Reported-by: Vladimir Tokarev <vtokarev@microsoft.com>
+Change-Id: I8739c5f127e9ca0683fcdbd099dba9896ae46277
+Signed-off-by: Lev Stipakov <lev@openvpn.net>
+Acked-by: Heiko Hund <heiko@openvpn.net>
+Message-Id: <20240319151723.936-2-lev@openvpn.net>
+URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/ms=
g28419.html
+Signed-off-by: Gert Doering <gert@greenie.muc.de>
+
+CVE:CVE-2024-24974
+Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/2c1=
de0f0803360c0a6408f754066bd3a6fb28237]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ src/openvpnserv/interactive.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/openvpnserv/interactive.c b/src/openvpnserv/interactive=
.c
+index 3b120ae..5e3ff12 100644
+--- a/src/openvpnserv/interactive.c
++++ b/src/openvpnserv/interactive.c
+@@ -1994,7 +1994,7 @@ CreateClientPipeInstance(VOID)
+
+     openvpn_sntprintf(pipe_name, _countof(pipe_name), TEXT("\\\\.\\pipe=
\\" PACKAGE "%s\\service"), service_instance);
+     pipe =3D CreateNamedPipe(pipe_name, flags,
+-                           PIPE_TYPE_MESSAGE | PIPE_READMODE_MESSAGE,
++                           PIPE_TYPE_MESSAGE | PIPE_READMODE_MESSAGE | =
PIPE_REJECT_REMOTE_CLIENTS,
+                            PIPE_UNLIMITED_INSTANCES, 1024, 1024, 0, NUL=
L);
+     if (pipe =3D=3D INVALID_HANDLE_VALUE)
+     {
+--
+2.40.0
diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-274=
59.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27459=
.patch
new file mode 100644
index 0000000000..d04eeb571d
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27459.patc=
h
@@ -0,0 +1,99 @@
+From 989b22cb6e007fd1addcfaf7d12f4fec9fbc9639 Mon Sep 17 00:00:00 2001
+From: Lev Stipakov <lstipakov@gmail.com>
+Date: Tue, 19 Mar 2024 17:27:11 +0200
+Subject: [PATCH] interactive.c: Fix potential stack overflow issue
+When reading message from the pipe, we first peek the pipe to get the si=
ze
+of the message waiting to be read and then read the message. A compromis=
ed
+OpenVPN process could send an excessively large message, which would res=
ult
+in a stack-allocated message buffer overflow.
+
+To address this, we terminate the misbehaving process if the peeked mess=
age
+size exceeds the maximum allowable size.
+
+CVE: 2024-27459
+Microsoft case number: 85932
+
+Reported-by: Vladimir Tokarev <vtokarev@microsoft.com>
+Change-Id: Ib5743cba0741ea11f9ee62c4978b2c6789b81ada
+Signed-off-by: Lev Stipakov <lev@openvpn.net>
+Acked-by: Heiko Hund <heiko@openvpn.net>
+Message-Id: <20240319152803.1801-2-lev@openvpn.net>
+URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/ms=
g28420.html
+Signed-off-by: Gert Doering <gert@greenie.muc.de>
+
+CVE:CVE-2024-27459
+Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/989=
b22cb6e007fd1addcfaf7d12f4fec9fbc9639]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ src/openvpnserv/interactive.c | 34 +++++++++++++++++++++-------------
+ 1 file changed, 21 insertions(+), 13 deletions(-)
+
+diff --git a/src/openvpnserv/interactive.c b/src/openvpnserv/interactive=
.c
+index 5e3ff12..f613b99 100644
+--- a/src/openvpnserv/interactive.c
++++ b/src/openvpnserv/interactive.c
+@@ -111,6 +111,18 @@ typedef struct {
+     HANDLE device;
+ } ring_buffer_handles_t;
+
++typedef union {
++    message_header_t header;
++    address_message_t address;
++    route_message_t route;
++    flush_neighbors_message_t flush_neighbors;
++    block_dns_message_t block_dns;
++    dns_cfg_message_t dns;
++    enable_dhcp_message_t dhcp;
++    register_ring_buffers_message_t rrb;
++    set_mtu_message_t mtu;
++    wins_cfg_message_t wins;
++} pipe_message_t;
+
+ static DWORD
+ AddListItem(list_item_t **pfirst, LPVOID data)
+@@ -1444,18 +1456,7 @@ static VOID
+ HandleMessage(HANDLE pipe, HANDLE ovpn_proc, ring_buffer_handles_t *rin=
g_buffer_handles,
+               DWORD bytes, DWORD count, LPHANDLE events, undo_lists_t *=
lists)
+ {
+-    DWORD read;
+-    union {
+-        message_header_t header;
+-        address_message_t address;
+-        route_message_t route;
+-        flush_neighbors_message_t flush_neighbors;
+-        block_dns_message_t block_dns;
+-        dns_cfg_message_t dns;
+-        enable_dhcp_message_t dhcp;
+-        register_ring_buffers_message_t rrb;
+-        set_mtu_message_t mtu;
+-    } msg;
++    pipe_message_t msg;
+     ack_message_t ack =3D {
+         .header =3D {
+             .type =3D msg_acknowledgement,
+@@ -1465,7 +1466,7 @@ HandleMessage(HANDLE pipe, HANDLE ovpn_proc, ring_=
buffer_handles_t *ring_buffer_
+         .error_number =3D ERROR_MESSAGE_DATA
+     };
+
+-    read =3D ReadPipeAsync(pipe, &msg, bytes, count, events);
++    DWORD read =3D ReadPipeAsync(pipe, &msg, bytes, count, events);
+     if (read !=3D bytes || read < sizeof(msg.header) || read !=3D msg.h=
eader.size)
+     {
+         goto out;
+@@ -1884,6 +1885,13 @@ RunOpenvpn(LPVOID p)
+             break;
+         }
+
++	 if (bytes > sizeof(pipe_message_t))
++        {
++            /* process at the other side of the pipe is misbehaving, sh=
ut it down */
++            MsgToEventLog(MSG_FLAGS_ERROR, TEXT("OpenVPN process sent t=
oo large payload length to the pipe (%lu bytes), it will be terminated"),=
 bytes);
++            break;
++        }
++
+         HandleMessage(ovpn_pipe, proc_info.hProcess, &ring_buffer_handl=
es, bytes, 1, &exit_event, &undo_lists);
+     }
+
+--
+2.40.0
diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-279=
03.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27903=
.patch
new file mode 100644
index 0000000000..d0726ab35c
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27903.patc=
h
@@ -0,0 +1,119 @@
+From aaea545d8a940f761898d736b68bcb067d503b1d Mon Sep 17 00:00:00 2001
+From: Lev Stipakov <lstipakov@gmail.com>
+Date: Tue, 19 Mar 2024 15:53:45 +0200
+Subject: [PATCH] win32: Enforce loading of plugins from a trusted direct=
ory
+
+Currently, there's a risk associated with allowing plugins to be loaded =
from
+any location. This update ensures plugins are only loaded from a trusted
+directory, which is either:
+
+    - HKLM\SOFTWARE\OpenVPN\plugin_dir (or if the key is missing,
+    then HKLM\SOFTWARE\OpenVPN, which is installation directory)
+
+    - System directory
+
+Loading from UNC paths is disallowed.
+
+Note: This change affects only Windows environments.
+
+CVE: 2024-27903
+
+Change-Id: I154a4aaad9242c9253a64312a14c5fd2ea95f40d
+Reported-by: Vladimir Tokarev <vtokarev@microsoft.com>
+Signed-off-by: Lev Stipakov <lev@openvpn.net>
+Acked-by: Selva Nair <selva.nair@gmail.com>
+Message-Id: <20240319135355.1279-2-lev@openvpn.net>
+URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/ms=
g28416.html
+Signed-off-by: Gert Doering <gert@greenie.muc.de>
+
+CVE:CVE-2024-27903
+Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/aae=
a545d8a940f761898d736b68bcb067d503b1d]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ src/openvpn/plugin.c | 18 +++++++++++++++---
+ src/openvpn/win32.c  | 21 +++++++++------------
+ 2 files changed, 24 insertions(+), 15 deletions(-)
+
+diff --git a/src/openvpn/plugin.c b/src/openvpn/plugin.c
+index ed5d7c0..f7315f4 100644
+--- a/src/openvpn/plugin.c
++++ b/src/openvpn/plugin.c
+@@ -279,11 +279,23 @@ plugin_init_item(struct plugin *p, const struct pl=
ugin_option *o)
+
+ #else  /* ifndef _WIN32 */
+
+-    rel =3D !platform_absolute_pathname(p->so_pathname);
+-    p->module =3D LoadLibraryW(wide_string(p->so_pathname, &gc));
++    WCHAR *wpath =3D wide_string(p->so_pathname, &gc);
++    WCHAR normalized_plugin_path[MAX_PATH] =3D {0};
++    /* Normalize the plugin path, converting any relative paths to abso=
lute paths. */
++    if (!GetFullPathNameW(wpath, MAX_PATH, normalized_plugin_path, NULL=
))
++    {
++        msg(M_ERR, "PLUGIN_INIT: could not load plugin DLL: %ls. Failed=
 to normalize plugin path.", wpath);
++    }
++
++    if (!plugin_in_trusted_dir(normalized_plugin_path))
++    {
++        msg(M_FATAL, "PLUGIN_INIT: could not load plugin DLL: %ls. The =
DLL is not in a trusted directory.", normalized_plugin_path);
++    }
++
++    p->module =3D LoadLibraryW(normalized_plugin_path);
+     if (!p->module)
+     {
+-        msg(M_ERR, "PLUGIN_INIT: could not load plugin DLL: %s", p->so_=
pathname);
++        msg(M_ERR, "PLUGIN_INIT: could not load plugin DLL: %ls", norma=
lized_plugin_path);
+     }
+
+ #define PLUGIN_SYM(var, name, flags) dll_resolve_symbol(p->module, (voi=
d *)&p->var, name, p->so_pathname, flags)
+diff --git a/src/openvpn/win32.c b/src/openvpn/win32.c
+index e91e742..1e61ffa 100644
+--- a/src/openvpn/win32.c
++++ b/src/openvpn/win32.c
+@@ -1532,27 +1532,24 @@ openvpn_swprintf(wchar_t *const str, const size_=
t size, const wchar_t *const for
+     return (len >=3D 0 && len < size);
+ }
+
+-static BOOL
+-get_install_path(WCHAR *path, DWORD size)
++bool
++get_openvpn_reg_value(const WCHAR *key, WCHAR *value, DWORD size)
+ {
+     WCHAR reg_path[256];
+-    HKEY key;
+-    BOOL res =3D FALSE;
++    HKEY hkey;
+     openvpn_swprintf(reg_path, _countof(reg_path), L"SOFTWARE\\" PACKAG=
E_NAME);
+
+-    LONG status =3D RegOpenKeyExW(HKEY_LOCAL_MACHINE, reg_path, 0, KEY_=
READ, &key);
++    LONG status =3D RegOpenKeyExW(HKEY_LOCAL_MACHINE, reg_path, 0, KEY_=
READ, &hkey);
+     if (status !=3D ERROR_SUCCESS)
+     {
+-        return res;
++        return false;
+     }
+
+-    /* The default value of REG_KEY is the install path */
+-    status =3D RegGetValueW(key, NULL, NULL, RRF_RT_REG_SZ, NULL, (LPBY=
TE)path, &size);
+-    res =3D status =3D=3D ERROR_SUCCESS;
++    status =3D RegGetValueW(hkey, NULL, key, RRF_RT_REG_SZ, NULL, (LPBY=
TE)value, &size);
+
+-    RegCloseKey(key);
++    RegCloseKey(hkey);
+
+-    return res;
++    return status =3D=3D ERROR_SUCCESS;
+ }
+
+ static void
+@@ -1561,7 +1558,7 @@ set_openssl_env_vars()
+     const WCHAR *ssl_fallback_dir =3D L"C:\\Windows\\System32";
+
+     WCHAR install_path[MAX_PATH] =3D { 0 };
+-    if (!get_install_path(install_path, _countof(install_path)))
++    if (!get_openvpn_reg_value(NULL, install_path, _countof(install_pat=
h)))
+     {
+         /* if we cannot find installation path from the registry,
+          * use Windows directory as a fallback
+--
+2.40.0
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb b/m=
eta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
index 828cd5033e..b5ee31078b 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
@@ -10,7 +10,11 @@ inherit autotools systemd update-rc.d
 SRC_URI =3D "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz=
 \
            file://openvpn \
            file://openvpn@.service \
-           file://openvpn-volatile.conf"
+           file://openvpn-volatile.conf \
+           file://CVE-2024-24974.patch \
+           file://CVE-2024-27459.patch \
+           file://CVE-2024-27903.patch \
+           "
=20
 UPSTREAM_CHECK_URI =3D "https://openvpn.net/community-downloads"
=20
--=20
2.40.0


