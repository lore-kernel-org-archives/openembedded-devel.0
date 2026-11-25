Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36257.1795584234598110102
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:23:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WQXs+A1v;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=20500; q=dns/txt;
  s=iport01; t=1795584234; x=1796793834;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vpjznsB4CPJ5qPc7z/l/aVlENtN+KfefP4mk/FLJmh4=;
  b=WQXs+A1v6tNu99DsJ+oz/1fqZPGniJrLrU4I9rgmdtT+qNAE76vi2UWI
   d9smqC0xYFFdYOCOTUIa0km6hbstJeBZstRWV/Bx/DYgzdC0eF8vksHwt
   lO+SlJjoJz2nzQtfGKIZzWjG48jx2W23pZVP3lgU+cGofHAjm0xFJNbVN
   hPdq764Xt/aX8WcbjiScwHNcbd4denAevl5+Ol0NmU8vp1ubm+MqMmZUh
   U9Dkg6ac2YBaxrrAJ4YF/SxUz6Buz2TnPtdpVMuQjqfVRdlBwvtcN0+eJ
   u99KiGyMIdcDONCpeIacQoIK0F4RIGDWCrHp2Ukw0GQbulQ1OPw0nZF6e
   A==;
X-CSE-ConnectionGUID: QZ44vJR/SzattoF9y4EVLA==
X-CSE-MsgGUID: wd0E2pDmTAObbGhl1bH+yQ==
X-IPAS-Result: =?us-ascii?q?A0BVAAAGbgZr/85K/pBaHQEBAQEJARIBBQUBgX0HAQsBA?=
 =?us-ascii?q?YJVdWFCSQOUJ4IhA4ETkD2MWRSBag8BAQEPRA0EAQGFBQKOIgImNQgOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGFQczDUkBiUgBhX8BAgEDJ?=
 =?us-ascii?q?yICAT0cAwECLysdAQUIGYMCAYJ0AgERugGBeTOBAYMpAYFU2zMBCxQBgTgBh?=
 =?us-ascii?q?UGIJV0YAUSEOicbG4FygRWCdHaBBYFcAoE3D4ZgBIIigQyBVB5khTiGWQKBS?=
 =?us-ascii?q?YhSSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBHoESgQNdg?=
 =?us-ascii?q?SsoXiGBCIF1AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VD?=
 =?us-ascii?q?GcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBDCcdHhkOAikGFiELNBgNSBEsNxUZB?=
 =?us-ascii?q?D5uB5QTgm4tMQwPLxMBKwQFDjYBAQclFgcIOg8UER4HBxAtkmwIkjahEQoog?=
 =?us-ascii?q?3mMJJU6GjOEBIFXpRcLmH2CWYheglOHXY4MCyY3hGqBagE5gVlwFTuCZwlKG?=
 =?us-ascii?q?Q9XiH+EY4NrhWTIVSIjNQIJAy8BAQcCBw4DC4FoiSGGXyyBUgEB?=
IronPort-Data: A9a23:okFHxK7HCdGjRx6JM++mPgxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 jYcWGrTaf2KZ2P9etF/btvjpx5U7JXSn9Y1TgdvrSthZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eBL9EpvhVOyZ15
 /UENDcjPwHfqtyS6efuIgVsrpxLwMjDNY4F/3UlxjbDALN+HNbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaO0Mn1lQ/UPrSmM+hnWH2aThRsnqepLE85C7YywkZPL3FboCEIozVFZQ9ckCwu
 W6e0j7hLhQmHfuVwxWF9iumpqzepHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPBWy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:1qwa6K3DDn+kF5OwbKBCswqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3A13ER52q49dEpzp1YbJSjeejmUfkXLiHD7k2XGF2?=
 =?us-ascii?q?xFXpuZuyEFXKu3Ioxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AEQv8ow2tXobWMZyW0NoEvZWzXDUj/Kj2JRoVvZA?=
 =?us-ascii?q?6ku6OPwNwP26XrHeme9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="62908789"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:23:50 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id 40844180008D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:23:50 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id E9FF1CC2EF1; Tue, 24 Nov 2026 21:23:48 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][wrynose][PATCH 2/2] python3-scapy: fix CVE-2025-71463
Date: Tue, 24 Nov 2026 21:23:45 -0800
Message-Id: <20261125052345.3120371-2-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125052345.3120371-1-asparmar@cisco.com>
References: <20261125052345.3120371-1-asparmar@cisco.com>
MIME-Version: 1.0
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132986
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream backport for CVE-2025-71463 to the
current version. The upstream fix merge or commit is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commit links are recorded in the embedded patch headers when
the fix expands to multiple commits.

This patch also removes stale session persistence examples and obsolete
man-page limitations. The introduction cleanup is taken from [3].

[1] https://github.com/secdev/scapy/commit/13621d1145b3435e9d03caf20997107a=
84435c0b
[2] https://github.com/secdev/scapy/security/advisories/GHSA-cq46-m9x9-j8w2
[3] https://github.com/secdev/scapy/commit/5376fcc86aaba7c516fb4aa19576b03b=
387d217a

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../python/python3-scapy/CVE-2025-71463.patch | 468 ++++++++++++++++++
 .../python/python3-scapy_2.6.1.bb             |   1 +
 2 files changed, 469 insertions(+)
 create mode 100644 meta-networking/recipes-devtools/python/python3-scapy/C=
VE-2025-71463.patch

diff --git a/meta-networking/recipes-devtools/python/python3-scapy/CVE-2025=
-71463.patch b/meta-networking/recipes-devtools/python/python3-scapy/CVE-20=
25-71463.patch
new file mode 100644
index 0000000..e1277c9
--- /dev/null
+++ b/meta-networking/recipes-devtools/python/python3-scapy/CVE-2025-71463.=
patch
@@ -0,0 +1,468 @@
+From 8df000ba71082f90902ef8f971b0ca1f881edf17 Mon Sep 17 00:00:00 2001
+From: Guillaume Valadon <guillaume.valadon@gitguardian.com>
+Date: Wed, 1 Oct 2025 21:58:56 +0200
+Subject: [PATCH] Sessions removed
+
+CVE: CVE-2025-71463
+Upstream-Status: Backport [https://github.com/secdev/scapy/commit/13621d11=
45b3435e9d03caf20997107a84435c0b]
+
+Backport Changes:
+- The removed temporary-file test uses the current version's
+  AppVeyor-specific Windows path assertion instead of the newer upstream
+  assertion.
+- Include only the introduction documentation cleanup from upstream
+  https://github.com/secdev/scapy/commit/5376fcc86aaba7c516fb4aa19576b03b3=
87d217a
+  to remove obsolete session save/reload examples. Its unrelated autorun
+  and session bookkeeping changes are omitted.
+- Remove the obsolete session-saving limitation from doc/scapy.1 because
+  session persistence is removed by this fix.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ doc/scapy.1                |  12 +--
+ doc/scapy/introduction.rst |  14 +---
+ doc/scapy/usage.rst        |  18 ----
+ scapy/main.py              | 166 ++-----------------------------------
+ test/regression.uts        |  67 +--------------
+ 5 files changed, 11 insertions(+), 266 deletions(-)
+
+diff --git a/doc/scapy.1 b/doc/scapy.1
+index 395871a8..1e8d6d4f 100644
+--- a/doc/scapy.1
++++ b/doc/scapy.1
+@@ -17,10 +17,7 @@ arping, tcpdump, tshark, p0f, ...
+ .PP
+ \fBScapy\fP uses the Python interpreter as a command board. That means th=
at=20
+ you can use directly Python language (assign variables, use loops,=20
+-define functions, etc.) If you give a file a parameter when you run=20
+-\fBScapy\fP, your session (variables, functions, instances, ...) will be =
saved=20
+-when you leave the interpreter and restored the next time you launch
+-\fBScapy\fP.=20
++define functions, etc.)
+ .PP
+ The idea is simple. Those kinds of tools do two things : sending packets=
=20
+ and receiving answers. That's what \fBScapy\fP does : you define a set of=
=20
+@@ -48,9 +45,6 @@ header-less mode, also reduces verbosity.
+ \fB\-d\fR
+ increase log verbosity. Can be used many times.
+ .TP
+-\fB\-s\fR FILE
+-use FILE to save/load session values (variables, functions, instances, ..=
.)=20
+-.TP
+ \fB\-p\fR PRESTART_FILE=20
+ use PRESTART_FILE instead of $HOME/.config/scapy/prestart.py as pre-start=
up file
+ .TP
+@@ -194,10 +188,6 @@ Does not give the right source IP for routes that use=
 interface aliases.
+=20
+ May miss packets under heavy load. This is a restriction from python itse=
lf
+=20
+-Session saving is limited by Python ability to marshal objects. As a=20
+-consequence, lambda functions and generators can't be saved, which seriou=
sly
+-reduce the usefulness of this feature.=20
+-
+ BPF filters don't work on Point-to-point interfaces.
+=20
+=20
+diff --git a/doc/scapy/introduction.rst b/doc/scapy/introduction.rst
+index ab8b97cf..b308755c 100644
+--- a/doc/scapy/introduction.rst
++++ b/doc/scapy/introduction.rst
+@@ -62,10 +62,9 @@ Interpreting results can help users that don't know wha=
t a port scan is, but it
+ Quick demo
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=20
+-First, we play a bit and create four IP packets at once. Let's see how it=
 works. We first instantiate the IP class. Then, we instantiate it again an=
d we provide a destination that is worth four IP addresses (/30 gives the n=
etmask). Using a Python idiom, we develop this implicit packet in a set of =
explicit packets. Then, we quit the interpreter. As we provided a session f=
ile, the variables we were working on are saved, then reloaded::
++First, we play a bit and create four IP packets at once. Let's see how it=
 works. We first instantiate the IP class. Then, we instantiate it again an=
d we provide a destination that is worth four IP addresses (/30 gives the n=
etmask). Using a Python idiom, we develop this implicit packet in a set of =
explicit packets::
+=20
+-    # ./run_scapy -s mysession
+-    New session [mysession]
++    # ./run_scapy
+     Welcome to Scapy (2.4.0)
+     >>> IP()
+     <IP |>
+@@ -76,15 +75,6 @@ First, we play a bit and create four IP packets at once=
. Let's see how it works.
+     >>> [p for p in ip]
+     [<IP dst=3D207.171.175.28 |>, <IP dst=3D207.171.175.29 |>,
+      <IP dst=3D207.171.175.30 |>, <IP dst=3D207.171.175.31 |>]
+-    >>> ^D
+-
+-::
+-
+-    # ./run_scapy -s mysession
+-    Using session [mysession]
+-    Welcome to Scapy (2.4.0)
+-    >>> ip
+-    <IP dst=3D<Net www.target.com/30> |>
+=20
+ Now, let's manipulate some packets::
+=20
+diff --git a/doc/scapy/usage.rst b/doc/scapy/usage.rst
+index a32792db..990aa5f4 100644
+--- a/doc/scapy/usage.rst
++++ b/doc/scapy/usage.rst
+@@ -1019,24 +1019,6 @@ The output above can be reimported back into Scapy =
using ``import_object()``::
+     \x0b\x0c\r\x0e\x0f\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1a\x1b\x1=
c\x1d\x1e\x1f=20
+     !"#$%&\'()*+,-./01234567' |>>>>
+=20
+-Sessions
+-^^^^^^^^
+-
+-At last Scapy is capable of saving all session variables using the ``save=
_session()`` function:
+-
+->>> dir()
+-['__builtins__', 'conf', 'new_pkt', 'pkt', 'pkt_export', 'pkt_hex', 'pkt_=
raw', 'pkts']
+->>> save_session("session.scapy")
+-
+-Next time you start Scapy you can load the previous saved session using t=
he ``load_session()`` command::
+-
+-    >>> dir()
+-    ['__builtins__', 'conf']
+-    >>> load_session("session.scapy")
+-    >>> dir()
+-    ['__builtins__', 'conf', 'new_pkt', 'pkt', 'pkt_export', 'pkt_hex', '=
pkt_raw', 'pkts']
+-
+-
+ Making tables
+ -------------
+=20
+diff --git a/scapy/main.py b/scapy/main.py
+index c5ad0c74..c7ef726b 100644
+--- a/scapy/main.py
++++ b/scapy/main.py
+@@ -14,14 +14,11 @@ import sys
+ import os
+ import getopt
+ import code
+-import gzip
+ import glob
+ import importlib
+ import io
+ from itertools import zip_longest
+ import logging
+-import pickle
+-import types
+ import warnings
+ from random import choice
+=20
+@@ -230,7 +227,7 @@ conf.color_theme =3D DefaultTheme()
+ def _usage():
+     # type: () -> None
+     print(
+-        "Usage: scapy.py [-s sessionfile] [-c new_startup_file] "
++        "Usage: scapy.py [-c new_startup_file] "
+         "[-p new_prestart_file] [-C] [-P] [-H]\n"
+         "Args:\n"
+         "\t-H: header-less start\n"
+@@ -439,116 +436,8 @@ def _scapy_exts():
+     return res
+=20
+=20
+-def save_session(fname=3D"", session=3DNone, pickleProto=3D-1):
+-    # type: (str, Optional[Dict[str, Any]], int) -> None
+-    """Save current Scapy session to the file specified in the fname arg.
+-
+-    params:
+-     - fname: file to save the scapy session in
+-     - session: scapy session to use. If None, the console one will be us=
ed
+-     - pickleProto: pickle proto version (default: -1 =3D latest)"""
+-    from scapy import utils
+-    from scapy.config import conf, ConfClass
+-    if not fname:
+-        fname =3D conf.session
+-        if not fname:
+-            conf.session =3D fname =3D utils.get_temp_file(keep=3DTrue)
+-    log_interactive.info("Saving session into [%s]", fname)
+-
+-    if not session:
+-        if conf.interactive_shell in ["ipython", "ptipython"]:
+-            from IPython import get_ipython
+-            session =3D get_ipython().user_ns
+-        else:
+-            session =3D builtins.__dict__["scapy_session"]
+-
+-    if not session:
+-        log_interactive.error("No session found ?!")
+-        return
+-
+-    ignore =3D session.get("_scpybuiltins", [])
+-    hard_ignore =3D ["scapy_session", "In", "Out", "open"]
+-    to_be_saved =3D session.copy()
+-
+-    for k in list(to_be_saved):
+-        i =3D to_be_saved[k]
+-        if k[0] =3D=3D "_":
+-            del to_be_saved[k]
+-        elif hasattr(i, "__module__") and i.__module__.startswith("IPytho=
n"):
+-            del to_be_saved[k]
+-        elif isinstance(i, ConfClass):
+-            del to_be_saved[k]
+-        elif k in ignore or k in hard_ignore:
+-            del to_be_saved[k]
+-        elif isinstance(i, (type, types.ModuleType, types.FunctionType)):
+-            if k[0] !=3D "_":
+-                log_interactive.warning("[%s] (%s) can't be saved.", k, t=
ype(i))
+-            del to_be_saved[k]
+-        else:
+-            try:
+-                pickle.dumps(i)
+-            except Exception:
+-                log_interactive.warning("[%s] (%s) can't be saved.", k, t=
ype(i))
+-
+-    try:
+-        os.rename(fname, fname + ".bak")
+-    except OSError:
+-        pass
+-
+-    f =3D gzip.open(fname, "wb")
+-    pickle.dump(to_be_saved, f, pickleProto)
+-    f.close()
+-
+-
+-def load_session(fname=3DNone):
+-    # type: (Optional[Union[str, None]]) -> None
+-    """Load current Scapy session from the file specified in the fname ar=
g.
+-    This will erase any existing session.
+-
+-    params:
+-     - fname: file to load the scapy session from"""
+-    from scapy.config import conf
+-    if fname is None:
+-        fname =3D conf.session
+-    try:
+-        s =3D pickle.load(gzip.open(fname, "rb"))
+-    except IOError:
+-        try:
+-            s =3D pickle.load(open(fname, "rb"))
+-        except IOError:
+-            # Raise "No such file exception"
+-            raise
+-
+-    scapy_session =3D builtins.__dict__["scapy_session"]
+-    s.update({k: scapy_session[k] for k in scapy_session["_scpybuiltins"]=
})
+-    scapy_session.clear()
+-    scapy_session.update(s)
+-    update_ipython_session(scapy_session)
+-
+-    log_loading.info("Loaded session [%s]", fname)
+-
+-
+-def update_session(fname=3DNone):
+-    # type: (Optional[Union[str, None]]) -> None
+-    """Update current Scapy session from the file specified in the fname =
arg.
+-
+-    params:
+-     - fname: file to load the scapy session from"""
+-    from scapy.config import conf
+-    if fname is None:
+-        fname =3D conf.session
+-    try:
+-        s =3D pickle.load(gzip.open(fname, "rb"))
+-    except IOError:
+-        s =3D pickle.load(open(fname, "rb"))
+-    scapy_session =3D builtins.__dict__["scapy_session"]
+-    scapy_session.update(s)
+-    update_ipython_session(scapy_session)
+-
+-
+ @overload
+-def init_session(session_name,  # type: Optional[Union[str, None]]
+-                 mydict,  # type: Optional[Union[Dict[str, Any], None]]
++def init_session(mydict,  # type: Optional[Union[Dict[str, Any], None]]
+                  ret,  # type: Literal[True]
+                  ):
+     # type: (...) -> Dict[str, Any]
+@@ -556,21 +445,18 @@ def init_session(session_name,  # type: Optional[Uni=
on[str, None]]
+=20
+=20
+ @overload
+-def init_session(session_name,  # type: Optional[Union[str, None]]
+-                 mydict=3DNone,  # type: Optional[Union[Dict[str, Any], N=
one]]
++def init_session(mydict=3DNone,  # type: Optional[Union[Dict[str, Any], N=
one]]
+                  ret=3DFalse,  # type: Literal[False]
+                  ):
+     # type: (...) -> None
+     pass
+=20
+=20
+-def init_session(session_name,  # type: Optional[Union[str, None]]
+-                 mydict=3DNone,  # type: Optional[Union[Dict[str, Any], N=
one]]
++def init_session(mydict=3DNone,  # type: Optional[Union[Dict[str, Any], N=
one]]
+                  ret=3DFalse,  # type: bool
+                  ):
+     # type: (...) -> Union[Dict[str, Any], None]
+     from scapy.config import conf
+-    SESSION =3D {}  # type: Optional[Dict[str, Any]]
+=20
+     # Load Scapy
+     scapy_builtins =3D _scapy_builtins()
+@@ -578,39 +464,7 @@ def init_session(session_name,  # type: Optional[Unio=
n[str, None]]
+     # Load exts
+     scapy_builtins.update(_scapy_exts())
+=20
+-    if session_name:
+-        try:
+-            os.stat(session_name)
+-        except OSError:
+-            log_loading.info("New session [%s]", session_name)
+-        else:
+-            try:
+-                try:
+-                    SESSION =3D pickle.load(gzip.open(session_name, "rb"))
+-                except IOError:
+-                    SESSION =3D pickle.load(open(session_name, "rb"))
+-                log_loading.info("Using existing session [%s]", session_n=
ame)
+-            except ValueError:
+-                msg =3D "Error opening Python3 pickled session on Python2=
 [%s]"
+-                log_loading.error(msg, session_name)
+-            except EOFError:
+-                log_loading.error("Error opening session [%s]", session_n=
ame)
+-            except AttributeError:
+-                log_loading.error("Error opening session [%s]. "
+-                                  "Attribute missing", session_name)
+-
+-        if SESSION:
+-            if "conf" in SESSION:
+-                conf.configure(SESSION["conf"])
+-                conf.session =3D session_name
+-                SESSION["conf"] =3D conf
+-            else:
+-                conf.session =3D session_name
+-        else:
+-            conf.session =3D session_name
+-            SESSION =3D {"conf": conf}
+-    else:
+-        SESSION =3D {"conf": conf}
++    SESSION =3D {"conf": conf}  # type: Dict[str, Any]
+=20
+     SESSION.update(scapy_builtins)
+     SESSION["_scpybuiltins"] =3D scapy_builtins.keys()
+@@ -623,6 +477,7 @@ def init_session(session_name,  # type: Optional[Union=
[str, None]]
+         return SESSION
+     return None
+=20
++
+ ################
+ #     Main     #
+ ################
+@@ -751,8 +606,6 @@ def interact(mydict=3DNone, argv=3DNone, mybanner=3DNo=
ne, loglevel=3Dlogging.INFO):
+     STARTUP_FILE =3D DEFAULT_STARTUP_FILE
+     PRESTART_FILE =3D DEFAULT_PRESTART_FILE
+=20
+-    session_name =3D None
+-
+     if argv is None:
+         argv =3D sys.argv
+=20
+@@ -765,8 +618,6 @@ def interact(mydict=3DNone, argv=3DNone, mybanner=3DNo=
ne, loglevel=3Dlogging.INFO):
+                 conf.fancy_banner =3D False
+                 conf.verb =3D 1
+                 conf.logLevel =3D logging.WARNING
+-            elif opt =3D=3D "-s":
+-                session_name =3D param
+             elif opt =3D=3D "-c":
+                 STARTUP_FILE =3D param
+             elif opt =3D=3D "-C":
+@@ -798,7 +649,7 @@ def interact(mydict=3DNone, argv=3DNone, mybanner=3DNo=
ne, loglevel=3Dlogging.INFO):
+             default=3DDEFAULT_PRESTART,
+         )
+=20
+-    SESSION =3D init_session(session_name, mydict=3Dmydict, ret=3DTrue)
++    SESSION =3D init_session(mydict=3Dmydict, ret=3DTrue)
+=20
+     if STARTUP_FILE:
+         _read_config_file(
+@@ -1018,9 +869,6 @@ def interact(mydict=3DNone, argv=3DNone, mybanner=3DN=
one, loglevel=3Dlogging.INFO):
+     else:
+         raise ValueError("Invalid conf.interactive_shell")
+=20
+-    if conf.session:
+-        save_session(conf.session, SESSION)
+-
+=20
+ if __name__ =3D=3D "__main__":
+     interact()
+diff --git a/test/regression.uts b/test/regression.uts
+index 67cd2870..ea01eb2d 100644
+--- a/test/regression.uts
++++ b/test/regression.uts
+@@ -622,72 +622,6 @@ try:
+ except SystemExit:
+     assert True
+=20
+-=3D Session test
+-
+-import builtins
+-
+-# This is automatic when using the console
+-def get_var(var):
+-    return builtins.__dict__["scapy_session"][var]
+-
+-def set_var(var, value):
+-    builtins.__dict__["scapy_session"][var] =3D value
+-
+-def del_var(var):
+-    del builtins.__dict__["scapy_session"][var]
+-
+-init_session(None, {"init_value": 123})
+-set_var("test_value", "8.8.8.8") # test_value =3D "8.8.8.8"
+-save_session()
+-del_var("test_value")
+-load_session()
+-update_session()
+-assert get_var("test_value") =3D=3D "8.8.8.8" #test_value =3D=3D "8.8.8.8"
+-assert get_var("init_value") =3D=3D 123
+-=20
+-=3D Session test with fname
+-
+-session_name =3D tempfile.mktemp()
+-init_session(session_name)
+-set_var("test_value", IP(dst=3D"192.168.0.1")) # test_value =3D IP(dst=3D=
"192.168.0.1")
+-save_session(fname=3D"%s.dat" % session_name)
+-del_var("test_value")
+-
+-set_var("z", True) #z =3D True
+-load_session(fname=3D"%s.dat" % session_name)
+-try:
+-    get_var("z")
+-    assert False
+-except:
+-    pass
+-
+-set_var("z", False) #z =3D False
+-update_session(fname=3D"%s.dat" % session_name)
+-assert get_var("test_value").dst =3D=3D "192.168.0.1" #test_value.dst =3D=
=3D "192.168.0.1"
+-assert not get_var("z")
+-
+-=3D Clear session files
+-
+-os.remove("%s.dat" % session_name)
+-
+-=3D Test temporary file creation
+-~ ci_only
+-
+-scapy_delete_temp_files()
+-
+-tmpfile =3D get_temp_file(autoext=3D".ut")
+-tmpfile
+-if WINDOWS:
+-    assert "scapy" in tmpfile and tmpfile.lower().startswith('c:\\users\\=
appveyor\\appdata\\local\\temp')
+-else:
+-    import platform
+-    BYPASS_TMP =3D platform.python_implementation().lower() =3D=3D "pypy"=
 or DARWIN
+-    assert "scapy" in tmpfile and (BYPASS_TMP =3D=3D True or "/tmp/" in t=
mpfile)
+-
+-assert conf.temp_files[0].endswith(".ut")
+-scapy_delete_temp_files()
+-assert len(conf.temp_files) =3D=3D 0
+-
+ =3D Emulate interact()
+ ~ interact
+=20
+@@ -2186,6 +2120,7 @@ p.show()
+=20
+ =3D Variable creations
+ from io import BytesIO
++import base64
+ pcapfile =3D BytesIO(b'\xd4\xc3\xb2\xa1\x02\x00\x04\x00\x00\x00\x00\x00\x=
00\x00\x00\x00\xff\xff\x00\x00e\x00\x00\x00\xcf\xc5\xacVo*\n\x00(\x00\x00\x=
00(\x00\x00\x00E\x00\x00(\x00\x01\x00\x00@\x06|\xcd\x7f\x00\x00\x01\x7f\x00=
\x00\x01\x00\x14\x00P\x00\x00\x00\x00\x00\x00\x00\x00P\x02 \x00\x91|\x00\x0=
0\xcf\xc5\xacV_-\n\x00\x1c\x00\x00\x00\x1c\x00\x00\x00E\x00\x00\x1c\x00\x01=
\x00\x00@\x11|\xce\x7f\x00\x00\x01\x7f\x00\x00\x01\x005\x005\x00\x08\x01r\x=
cf\xc5\xacV\xf90\n\x00\x1c\x00\x00\x00\x1c\x00\x00\x00E\x00\x00\x1c\x00\x01=
\x00\x00@\x01|\xde\x7f\x00\x00\x01\x7f\x00\x00\x01\x08\x00\xf7\xff\x00\x00\=
x00\x00')
+ pcapngfile =3D BytesIO(b'\n\r\r\n\\\x00\x00\x00M<+\x1a\x01\x00\x00\x00\xf=
f\xff\xff\xff\xff\xff\xff\xff\x01\x00,\x00File created by merging: \nFile1:=
 test.pcap \n\x04\x00\x08\x00mergecap\x00\x00\x00\x00\\\x00\x00\x00\x01\x00=
\x00\x00\\\x00\x00\x00e\x00\x00\x00\xff\xff\x00\x00\x02\x006\x00Unknown/not=
 available in original file format(libpcap)\x00\x00\t\x00\x01\x00\x06\x00\x=
00\x00\x00\x00\x00\x00\\\x00\x00\x00\x06\x00\x00\x00H\x00\x00\x00\x00\x00\x=
00\x00\x8d*\x05\x00/\xfc[\xcd(\x00\x00\x00(\x00\x00\x00E\x00\x00(\x00\x01\x=
00\x00@\x06|\xcd\x7f\x00\x00\x01\x7f\x00\x00\x01\x00\x14\x00P\x00\x00\x00\x=
00\x00\x00\x00\x00P\x02 \x00\x91|\x00\x00H\x00\x00\x00\x06\x00\x00\x00<\x00=
\x00\x00\x00\x00\x00\x00\x8d*\x05\x00\x1f\xff[\xcd\x1c\x00\x00\x00\x1c\x00\=
x00\x00E\x00\x00\x1c\x00\x01\x00\x00@\x11|\xce\x7f\x00\x00\x01\x7f\x00\x00\=
x01\x005\x005\x00\x08\x01r<\x00\x00\x00\x06\x00\x00\x00<\x00\x00\x00\x00\x0=
0\x00\x00\x8d*\x05\x00\xb9\x02\\\xcd\x1c\x00\x00\x00\x1c\x00\x00\x00E\x00\x=
00\x1c\x00\x01\x00\x00@\x01|\xde\x7f\x00\x00\x01\x7f\x00\x00\x01\x08\x00\xf=
7\xff\x00\x00\x00\x00<\x00\x00\x00')
+ pcapnanofile =3D BytesIO(b"M<\xb2\xa1\x02\x00\x04\x00\x00\x00\x00\x00\x00=
\x00\x00\x00\xff\xff\x00\x00e\x00\x00\x00\xcf\xc5\xacV\xc9\xc1\xb5'(\x00\x0=
0\x00(\x00\x00\x00E\x00\x00(\x00\x01\x00\x00@\x06|\xcd\x7f\x00\x00\x01\x7f\=
x00\x00\x01\x00\x14\x00P\x00\x00\x00\x00\x00\x00\x00\x00P\x02 \x00\x91|\x00=
\x00\xcf\xc5\xacV-;\xc1'\x1c\x00\x00\x00\x1c\x00\x00\x00E\x00\x00\x1c\x00\x=
01\x00\x00@\x11|\xce\x7f\x00\x00\x01\x7f\x00\x00\x01\x005\x005\x00\x08\x01r=
\xcf\xc5\xacV\x9aL\xcf'\x1c\x00\x00\x00\x1c\x00\x00\x00E\x00\x00\x1c\x00\x0=
1\x00\x00@\x01|\xde\x7f\x00\x00\x01\x7f\x00\x00\x01\x08\x00\xf7\xff\x00\x00=
\x00\x00")
diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb=
 b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
index 8dcca1f..8cc4002 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
@@ -20,6 +20,7 @@ SRCREV =3D "8e08cbf759de6709a5b4af6bea3655d293129bb4"
 SRC_URI =3D "git://github.com/secdev/scapy.git;branch=3Dmaster;protocol=3D=
https;tag=3Dv${PV} \
            file://0001-python3-scapy-skip-ICMP-regression-tests-in-ptest.p=
atch \
            file://CVE-2026-128237_CVE-2026-128238.patch \
+           file://CVE-2025-71463.patch \
            file://run-ptest"
=20
 UPSTREAM_CHECK_COMMITS =3D "1"
--=20
2.35.6

