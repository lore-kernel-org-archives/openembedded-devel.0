Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E25C77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 05:28:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15699.1751520506566519216
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jul 2025 22:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92797910f0=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5634vIaM001428
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Jul 2025 05:28:25 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9d52x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 05:28:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 2 Jul 2025 22:28:26 -0700
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 2 Jul 2025 22:28:25 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [walnascar][meta-python][PATCH] python3-pycares: fix CVE-2025-48945
Date: Thu, 3 Jul 2025 13:28:24 +0800
Message-ID: <20250703052824.3650201-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: YYULOORK_ox-RDowHUGTL-WFDQF9Yht9
X-Proofpoint-GUID: YYULOORK_ox-RDowHUGTL-WFDQF9Yht9
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=686614f9 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Wb1JkmetP80A:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=VlckX9PKAAAA:8 a=1XWaLZrsAAAA:8 a=EG7W4yiQAAAA:8
 a=uPZiAMpXAAAA:8 a=8AHkEIZyAAAA:8 a=IhcZ_VfEAAAA:8 a=t-IPkPogAAAA:8 a=A1X0JdhQAAAA:8 a=3j4BkbkPAAAA:8 a=oGKbnC04lbzwJf1GLzUA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ZmiM9RdZ4sPD_HvZpKn1:22 a=JCRPP3egZMejupIeyygZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA0MSBTYWx0ZWRfXzF5s2aDv4oZ0 7f8chs4llw79bc6n9M5/6Vz3Ng4ujVypgz7Hvv/LLopJgmsKKlnhgPUZJYGJMIbGM7n51KTzgZ9 B/Lt4gqrVDvejr4IxCZ1eaEU8ga30z8d4fqWVjjrH1SmQoPhsxuMSrhvfa64WIiFIZ99SuRmfbX
 pGd14fZG5E8Zj+s/0EGoQGDWWDiF8+kbojEsZW6eT1gq9Onu+e+aFqyq3S9xOZYlKwuv4IDanFL BwRqao1cKyzWtDi7kqGTFq6HEOxOSRrtkJ6YG+2rxqJFcQYJTHEVxG8sywIONNOs1U+UzRtHQH5 WOm9yiCzFkfsOQhcGEg6iIsTCxK5sBI/tgVnWlWiHx4zM48Ih6TZMVFsv9bG9cKo0HgOq3uh9RP
 ReX8zJJEPUVwEUUujciLlIzH/4fUdbYthMaB/ULE1qzzNavQnUut2BjsE9nzdymORVhSEQ8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507030041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 05:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118205

From: Jiaying Song <jiaying.song.cn@windriver.com>

pycares is a Python module which provides an interface to c-ares. c-ares
is a C library that performs DNS requests and name resolutions
asynchronously. Prior to version 4.9.0, pycares is vulnerable to a
use-after-free condition that occurs when a Channel object is garbage
collected while DNS queries are still pending. This results in a fatal
Python error and interpreter crash. The vulnerability has been fixed in
pycares 4.9.0 by implementing a safe channel destruction mechanism.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-48945

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../python3-pycares/CVE-2025-48945.patch      | 733 ++++++++++++++++++
 .../python/python3-pycares_4.6.0.bb           |   1 +
 2 files changed, 734 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pycares/CVE-2025-48945.patch

diff --git a/meta-python/recipes-devtools/python/python3-pycares/CVE-2025-48945.patch b/meta-python/recipes-devtools/python/python3-pycares/CVE-2025-48945.patch
new file mode 100644
index 0000000000..10f6fb8ce1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycares/CVE-2025-48945.patch
@@ -0,0 +1,733 @@
+From c9ac3072ad33cc3678fc451c720e2593770d6c5c Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Thu, 12 Jun 2025 08:57:19 -0500
+Subject: [PATCH] Fix shutdown race
+
+CVE: CVE-2025-48945
+
+Upstream-Status: Backport
+[https://github.com/saghul/pycares/commit/ebfd7d71eb8e74bc1057a361ea79a5906db510d4]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ examples/cares-asyncio-event-thread.py |  87 ++++++++++++
+ examples/cares-asyncio.py              |  34 ++++-
+ examples/cares-context-manager.py      |  80 +++++++++++
+ examples/cares-poll.py                 |  20 ++-
+ examples/cares-resolver.py             |  19 ++-
+ examples/cares-select.py               |  11 +-
+ examples/cares-selectors.py            |  23 ++-
+ src/pycares/__init__.py                | 185 ++++++++++++++++++++++---
+ tests/shutdown_at_exit_script.py       |  18 +++
+ 9 files changed, 431 insertions(+), 46 deletions(-)
+ create mode 100644 examples/cares-asyncio-event-thread.py
+ create mode 100644 examples/cares-context-manager.py
+ create mode 100644 tests/shutdown_at_exit_script.py
+
+diff --git a/examples/cares-asyncio-event-thread.py b/examples/cares-asyncio-event-thread.py
+new file mode 100644
+index 0000000..84c6854
+--- /dev/null
++++ b/examples/cares-asyncio-event-thread.py
+@@ -0,0 +1,87 @@
++import asyncio
++import socket
++from typing import Any, Callable, Optional
++
++import pycares
++
++
++class DNSResolver:
++    def __init__(self, loop: Optional[asyncio.AbstractEventLoop] = None) -> None:
++        # Use event_thread=True for automatic event handling in a separate thread
++        self._channel = pycares.Channel(event_thread=True)
++        self.loop = loop or asyncio.get_running_loop()
++
++    def query(
++        self, name: str, query_type: int, cb: Callable[[Any, Optional[int]], None]
++    ) -> None:
++        self._channel.query(name, query_type, cb)
++
++    def gethostbyname(
++        self, name: str, cb: Callable[[Any, Optional[int]], None]
++    ) -> None:
++        self._channel.gethostbyname(name, socket.AF_INET, cb)
++
++    def close(self) -> None:
++        """Thread-safe shutdown of the channel."""
++        # Simply call close() - it's thread-safe and handles everything
++        self._channel.close()
++
++
++async def main() -> None:
++    # Track queries
++    query_count = 0
++    completed_count = 0
++    cancelled_count = 0
++
++    def cb(query_name: str) -> Callable[[Any, Optional[int]], None]:
++        def _cb(result: Any, error: Optional[int]) -> None:
++            nonlocal completed_count, cancelled_count
++            if error == pycares.errno.ARES_ECANCELLED:
++                cancelled_count += 1
++                print(f"Query for {query_name} was CANCELLED")
++            else:
++                completed_count += 1
++                print(
++                    f"Query for {query_name} completed - Result: {result}, Error: {error}"
++                )
++
++        return _cb
++
++    loop = asyncio.get_running_loop()
++    resolver = DNSResolver(loop)
++
++    print("=== Starting first batch of queries ===")
++    # First batch - these should complete
++    resolver.query("google.com", pycares.QUERY_TYPE_A, cb("google.com"))
++    resolver.query("cloudflare.com", pycares.QUERY_TYPE_A, cb("cloudflare.com"))
++    query_count += 2
++
++    # Give them a moment to complete
++    await asyncio.sleep(0.5)
++
++    print("\n=== Starting second batch of queries (will be cancelled) ===")
++    # Second batch - these will be cancelled
++    resolver.query("github.com", pycares.QUERY_TYPE_A, cb("github.com"))
++    resolver.query("stackoverflow.com", pycares.QUERY_TYPE_A, cb("stackoverflow.com"))
++    resolver.gethostbyname("python.org", cb("python.org"))
++    query_count += 3
++
++    # Immediately close - this will cancel pending queries
++    print("\n=== Closing resolver (cancelling pending queries) ===")
++    resolver.close()
++    print("Resolver closed successfully")
++
++    print(f"\n=== Summary ===")
++    print(f"Total queries: {query_count}")
++    print(f"Completed: {completed_count}")
++    print(f"Cancelled: {cancelled_count}")
++
++
++if __name__ == "__main__":
++    # Check if c-ares supports threads
++    if pycares.ares_threadsafety():
++        # For Python 3.7+
++        asyncio.run(main())
++    else:
++        print("c-ares was not compiled with thread support")
++        print("Please see examples/cares-asyncio.py for sock_state_cb usage")
+diff --git a/examples/cares-asyncio.py b/examples/cares-asyncio.py
+index 0dbd0d2..e73de72 100644
+--- a/examples/cares-asyncio.py
++++ b/examples/cares-asyncio.py
+@@ -52,18 +52,38 @@ class DNSResolver(object):
+     def gethostbyname(self, name, cb):
+         self._channel.gethostbyname(name, socket.AF_INET, cb)
+ 
++    def close(self):
++        """Close the resolver and cleanup resources."""
++        if self._timer:
++            self._timer.cancel()
++            self._timer = None
++        for fd in self._fds:
++            self.loop.remove_reader(fd)
++            self.loop.remove_writer(fd)
++        self._fds.clear()
++        # Note: The channel will be destroyed safely in a background thread
++        # with a 1-second delay to ensure c-ares has completed its cleanup.
++        self._channel.close()
+ 
+-def main():
++
++async def main():
+     def cb(result, error):
+         print("Result: {}, Error: {}".format(result, error))
+-    loop = asyncio.get_event_loop()
++
++    loop = asyncio.get_running_loop()
+     resolver = DNSResolver(loop)
+-    resolver.query('google.com', pycares.QUERY_TYPE_A, cb)
+-    resolver.query('sip2sip.info', pycares.QUERY_TYPE_SOA, cb)
+-    resolver.gethostbyname('apple.com', cb)
+-    loop.run_forever()
++
++    try:
++        resolver.query('google.com', pycares.QUERY_TYPE_A, cb)
++        resolver.query('sip2sip.info', pycares.QUERY_TYPE_SOA, cb)
++        resolver.gethostbyname('apple.com', cb)
++
++        # Give some time for queries to complete
++        await asyncio.sleep(2)
++    finally:
++        resolver.close()
+ 
+ 
+ if __name__ == '__main__':
+-    main()
++    asyncio.run(main())
+ 
+diff --git a/examples/cares-context-manager.py b/examples/cares-context-manager.py
+new file mode 100644
+index 0000000..cb597b2
+--- /dev/null
++++ b/examples/cares-context-manager.py
+@@ -0,0 +1,80 @@
++#!/usr/bin/env python
++"""
++Example of using pycares Channel as a context manager with event_thread=True.
++
++This demonstrates the simplest way to use pycares with automatic cleanup.
++The event thread handles all socket operations internally, and the context
++manager ensures the channel is properly closed when done.
++"""
++
++import pycares
++import socket
++import time
++
++
++def main():
++    """Run DNS queries using Channel as a context manager."""
++    results = []
++
++    def callback(result, error):
++        """Store results from DNS queries."""
++        if error:
++            print(f"Error {error}: {pycares.errno.strerror(error)}")
++        else:
++            print(f"Result: {result}")
++        results.append((result, error))
++
++    # Use Channel as a context manager with event_thread=True
++    # This is the recommended pattern for simple use cases
++    with pycares.Channel(
++        servers=["8.8.8.8", "8.8.4.4"], timeout=5.0, tries=3, event_thread=True
++    ) as channel:
++        print("=== Making DNS queries ===")
++
++        # Query for A records
++        channel.query("google.com", pycares.QUERY_TYPE_A, callback)
++        channel.query("cloudflare.com", pycares.QUERY_TYPE_A, callback)
++
++        # Query for AAAA records
++        channel.query("google.com", pycares.QUERY_TYPE_AAAA, callback)
++
++        # Query for MX records
++        channel.query("python.org", pycares.QUERY_TYPE_MX, callback)
++
++        # Query for TXT records
++        channel.query("google.com", pycares.QUERY_TYPE_TXT, callback)
++
++        # Query using gethostbyname
++        channel.gethostbyname("github.com", socket.AF_INET, callback)
++
++        # Query using gethostbyaddr
++        channel.gethostbyaddr("8.8.8.8", callback)
++
++        print("\nWaiting for queries to complete...")
++        # Give queries time to complete
++        # In a real application, you would coordinate with your event loop
++        time.sleep(2)
++
++    # Channel is automatically closed when exiting the context
++    print("\n=== Channel closed automatically ===")
++
++    print(f"\nCompleted {len(results)} queries")
++
++    # Demonstrate that the channel is closed and can't be used
++    try:
++        channel.query("example.com", pycares.QUERY_TYPE_A, callback)
++    except RuntimeError as e:
++        print(f"\nExpected error when using closed channel: {e}")
++
++
++if __name__ == "__main__":
++    # Check if c-ares supports threads
++    if pycares.ares_threadsafety():
++        print(f"Using pycares {pycares.__version__} with c-ares {pycares.ARES_VERSION}")
++        print(
++            f"Thread safety: {'enabled' if pycares.ares_threadsafety() else 'disabled'}\n"
++        )
++        main()
++    else:
++        print("This example requires c-ares to be compiled with thread support")
++        print("Use cares-select.py or cares-asyncio.py instead")
+diff --git a/examples/cares-poll.py b/examples/cares-poll.py
+index e2796eb..a4ddbd7 100644
+--- a/examples/cares-poll.py
++++ b/examples/cares-poll.py
+@@ -48,6 +48,13 @@ class DNSResolver(object):
+     def gethostbyname(self, name, cb):
+         self._channel.gethostbyname(name, socket.AF_INET, cb)
+ 
++    def close(self):
++        """Close the resolver and cleanup resources."""
++        for fd in list(self._fd_map):
++            self.poll.unregister(fd)
++        self._fd_map.clear()
++        self._channel.close()
++
+ 
+ if __name__ == '__main__':
+     def query_cb(result, error):
+@@ -57,8 +64,11 @@ if __name__ == '__main__':
+         print(result)
+         print(error)
+     resolver = DNSResolver()
+-    resolver.query('google.com', pycares.QUERY_TYPE_A, query_cb)
+-    resolver.query('facebook.com', pycares.QUERY_TYPE_A, query_cb)
+-    resolver.query('sip2sip.info', pycares.QUERY_TYPE_SOA, query_cb)
+-    resolver.gethostbyname('apple.com', gethostbyname_cb)
+-    resolver.wait_channel()
++    try:
++        resolver.query('google.com', pycares.QUERY_TYPE_A, query_cb)
++        resolver.query('facebook.com', pycares.QUERY_TYPE_A, query_cb)
++        resolver.query('sip2sip.info', pycares.QUERY_TYPE_SOA, query_cb)
++        resolver.gethostbyname('apple.com', gethostbyname_cb)
++        resolver.wait_channel()
++    finally:
++        resolver.close()
+diff --git a/examples/cares-resolver.py b/examples/cares-resolver.py
+index 5b4c302..95afeeb 100644
+--- a/examples/cares-resolver.py
++++ b/examples/cares-resolver.py
+@@ -52,6 +52,14 @@ class DNSResolver(object):
+     def gethostbyname(self, name, cb):
+         self._channel.gethostbyname(name, socket.AF_INET, cb)
+ 
++    def close(self):
++        """Close the resolver and cleanup resources."""
++        self._timer.stop()
++        for handle in self._fd_map.values():
++            handle.close()
++        self._fd_map.clear()
++        self._channel.close()
++
+ 
+ if __name__ == '__main__':
+     def query_cb(result, error):
+@@ -62,8 +70,11 @@ if __name__ == '__main__':
+         print(error)
+     loop = pyuv.Loop.default_loop()
+     resolver = DNSResolver(loop)
+-    resolver.query('google.com', pycares.QUERY_TYPE_A, query_cb)
+-    resolver.query('sip2sip.info', pycares.QUERY_TYPE_SOA, query_cb)
+-    resolver.gethostbyname('apple.com', gethostbyname_cb)
+-    loop.run()
++    try:
++        resolver.query('google.com', pycares.QUERY_TYPE_A, query_cb)
++        resolver.query('sip2sip.info', pycares.QUERY_TYPE_SOA, query_cb)
++        resolver.gethostbyname('apple.com', gethostbyname_cb)
++        loop.run()
++    finally:
++        resolver.close()
+ 
+diff --git a/examples/cares-select.py b/examples/cares-select.py
+index 24bb407..dd8301c 100644
+--- a/examples/cares-select.py
++++ b/examples/cares-select.py
+@@ -25,9 +25,12 @@ if __name__ == '__main__':
+         print(result)
+         print(error)
+     channel = pycares.Channel()
+-    channel.gethostbyname('google.com', socket.AF_INET, cb)
+-    channel.query('google.com', pycares.QUERY_TYPE_A, cb)
+-    channel.query('sip2sip.info', pycares.QUERY_TYPE_SOA, cb)
+-    wait_channel(channel)
++    try:
++        channel.gethostbyname('google.com', socket.AF_INET, cb)
++        channel.query('google.com', pycares.QUERY_TYPE_A, cb)
++        channel.query('sip2sip.info', pycares.QUERY_TYPE_SOA, cb)
++        wait_channel(channel)
++    finally:
++        channel.close()
+     print('Done!')
+ 
+diff --git a/examples/cares-selectors.py b/examples/cares-selectors.py
+index 6b55520..fbb2f2d 100644
+--- a/examples/cares-selectors.py
++++ b/examples/cares-selectors.py
+@@ -47,6 +47,14 @@ class DNSResolver(object):
+     def gethostbyname(self, name, cb):
+         self._channel.gethostbyname(name, socket.AF_INET, cb)
+ 
++    def close(self):
++        """Close the resolver and cleanup resources."""
++        for fd in list(self._fd_map):
++            self.poll.unregister(fd)
++        self._fd_map.clear()
++        self.poll.close()
++        self._channel.close()
++
+ 
+ if __name__ == '__main__':
+     def query_cb(result, error):
+@@ -56,10 +64,13 @@ if __name__ == '__main__':
+         print(result)
+         print(error)
+     resolver = DNSResolver()
+-    resolver.query('google.com', pycares.QUERY_TYPE_A, query_cb)
+-    resolver.query('google.com', pycares.QUERY_TYPE_AAAA, query_cb)
+-    resolver.query('facebook.com', pycares.QUERY_TYPE_A, query_cb)
+-    resolver.query('sip2sip.info', pycares.QUERY_TYPE_SOA, query_cb)
+-    resolver.gethostbyname('apple.com', gethostbyname_cb)
+-    resolver.wait_channel()
++    try:
++        resolver.query('google.com', pycares.QUERY_TYPE_A, query_cb)
++        resolver.query('google.com', pycares.QUERY_TYPE_AAAA, query_cb)
++        resolver.query('facebook.com', pycares.QUERY_TYPE_A, query_cb)
++        resolver.query('sip2sip.info', pycares.QUERY_TYPE_SOA, query_cb)
++        resolver.gethostbyname('apple.com', gethostbyname_cb)
++        resolver.wait_channel()
++    finally:
++        resolver.close()
+ 
+diff --git a/src/pycares/__init__.py b/src/pycares/__init__.py
+index 26d82ab..596cd4b 100644
+--- a/src/pycares/__init__.py
++++ b/src/pycares/__init__.py
+@@ -11,10 +11,13 @@ from ._version import __version__
+ 
+ import socket
+ import math
+-import functools
+-import sys
++import threading
++import time
++import weakref
+ from collections.abc import Callable, Iterable
+-from typing import Any, Optional, Union
++from contextlib import suppress
++from typing import Any, Callable, Optional, Dict, Union
++from queue import SimpleQueue
+ 
+ IP4 = tuple[str, int]
+ IP6 = tuple[str, int, int, int]
+@@ -80,17 +83,25 @@ class AresError(Exception):
+ 
+ # callback helpers
+ 
+-_global_set = set()
++_handle_to_channel: Dict[Any, "Channel"] = {}  # Maps handle to channel to prevent use-after-free
++
+ 
+ @_ffi.def_extern()
+ def _sock_state_cb(data, socket_fd, readable, writable):
++    # Note: sock_state_cb handle is not tracked in _handle_to_channel
++    # because it has a different lifecycle (tied to the channel, not individual queries)
++    if _ffi is None:
++        return
+     sock_state_cb = _ffi.from_handle(data)
+     sock_state_cb(socket_fd, readable, writable)
+ 
+ @_ffi.def_extern()
+ def _host_cb(arg, status, timeouts, hostent):
++    # Get callback data without removing the reference yet
++    if _ffi is None or arg not in _handle_to_channel:
++        return
++
+     callback = _ffi.from_handle(arg)
+-    _global_set.discard(arg)
+ 
+     if status != _lib.ARES_SUCCESS:
+         result = None
+@@ -99,11 +110,15 @@ def _host_cb(arg, status, timeouts, hostent):
+         status = None
+ 
+     callback(result, status)
++    _handle_to_channel.pop(arg, None)
+ 
+ @_ffi.def_extern()
+ def _nameinfo_cb(arg, status, timeouts, node, service):
++    # Get callback data without removing the reference yet
++    if _ffi is None or arg not in _handle_to_channel:
++        return
++
+     callback = _ffi.from_handle(arg)
+-    _global_set.discard(arg)
+ 
+     if status != _lib.ARES_SUCCESS:
+         result = None
+@@ -112,11 +127,15 @@ def _nameinfo_cb(arg, status, timeouts, node, service):
+         status = None
+ 
+     callback(result, status)
++    _handle_to_channel.pop(arg, None)
+ 
+ @_ffi.def_extern()
+ def _query_cb(arg, status, timeouts, abuf, alen):
++    # Get callback data without removing the reference yet
++    if _ffi is None or arg not in _handle_to_channel:
++        return
++
+     callback, query_type = _ffi.from_handle(arg)
+-    _global_set.discard(arg)
+ 
+     if status == _lib.ARES_SUCCESS:
+         if query_type == _lib.T_ANY:
+@@ -139,11 +158,15 @@ def _query_cb(arg, status, timeouts, abuf, alen):
+         result = None
+ 
+     callback(result, status)
++    _handle_to_channel.pop(arg, None)
+ 
+ @_ffi.def_extern()
+ def _addrinfo_cb(arg, status, timeouts, res):
++    # Get callback data without removing the reference yet
++    if _ffi is None or arg not in _handle_to_channel:
++        return
++
+     callback = _ffi.from_handle(arg)
+-    _global_set.discard(arg)
+ 
+     if status != _lib.ARES_SUCCESS:
+         result = None
+@@ -152,6 +175,7 @@ def _addrinfo_cb(arg, status, timeouts, res):
+         status = None
+ 
+     callback(result, status)
++    _handle_to_channel.pop(arg, None)
+ 
+ def parse_result(query_type, abuf, alen):
+     if query_type == _lib.T_A:
+@@ -312,6 +336,53 @@ def parse_result(query_type, abuf, alen):
+     return result, status
+ 
+ 
++class _ChannelShutdownManager:
++    """Manages channel destruction in a single background thread using SimpleQueue."""
++
++    def __init__(self) -> None:
++        self._queue: SimpleQueue = SimpleQueue()
++        self._thread: Optional[threading.Thread] = None
++        self._thread_started = False
++
++    def _run_safe_shutdown_loop(self) -> None:
++        """Process channel destruction requests from the queue."""
++        while True:
++            # Block forever until we get a channel to destroy
++            channel = self._queue.get()
++
++            # Sleep for 1 second to ensure c-ares has finished processing
++            # Its important that c-ares is past this critcial section
++            # so we use a delay to ensure it has time to finish processing
++            # https://github.com/c-ares/c-ares/blob/4f42928848e8b73d322b15ecbe3e8d753bf8734e/src/lib/ares_process.c#L1422
++            time.sleep(1.0)
++
++            # Destroy the channel
++            if _lib is not None and channel is not None:
++                _lib.ares_destroy(channel[0])
++
++    def destroy_channel(self, channel) -> None:
++        """
++        Schedule channel destruction on the background thread with a safety delay.
++
++        Thread Safety and Synchronization:
++        This method uses SimpleQueue which is thread-safe for putting items
++        from multiple threads. The background thread processes channels
++        sequentially with a 1-second delay before each destruction.
++        """
++        # Put the channel in the queue
++        self._queue.put(channel)
++
++        # Start the background thread if not already started
++        if not self._thread_started:
++            self._thread_started = True
++            self._thread = threading.Thread(target=self._run_safe_shutdown_loop, daemon=True)
++            self._thread.start()
++
++
++# Global shutdown manager instance
++_shutdown_manager = _ChannelShutdownManager()
++
++
+ class Channel:
+     __qtypes__ = (_lib.T_A, _lib.T_AAAA, _lib.T_ANY, _lib.T_CAA, _lib.T_CNAME, _lib.T_MX, _lib.T_NAPTR, _lib.T_NS, _lib.T_PTR, _lib.T_SOA, _lib.T_SRV, _lib.T_TXT)
+     __qclasses__ = (_lib.C_IN, _lib.C_CHAOS, _lib.C_HS, _lib.C_NONE, _lib.C_ANY)
+@@ -334,6 +405,9 @@ class Channel:
+                  local_dev: Optional[str] = None,
+                  resolvconf_path: Union[str, bytes, None] = None):
+ 
++        # Initialize _channel to None first to ensure __del__ doesn't fail
++        self._channel = None
++
+         channel = _ffi.new("ares_channel *")
+         options = _ffi.new("struct ares_options *")
+         optmask = 0
+@@ -408,8 +482,9 @@ class Channel:
+         if r != _lib.ARES_SUCCESS:
+             raise AresError('Failed to initialize c-ares channel')
+ 
+-        self._channel = _ffi.gc(channel, lambda x: _lib.ares_destroy(x[0]))
+-
++        # Initialize all attributes for consistency
++        self._event_thread = event_thread
++        self._channel = channel
+         if servers:
+             self.servers = servers
+ 
+@@ -419,6 +494,46 @@ class Channel:
+         if local_dev:
+             self.set_local_dev(local_dev)
+ 
++    def __enter__(self):
++        """Enter the context manager."""
++        return self
++
++    def __exit__(self, exc_type, exc_val, exc_tb):
++        """Exit the context manager and close the channel."""
++        self.close()
++        return False
++
++    def __del__(self) -> None:
++        """Ensure the channel is destroyed when the object is deleted."""
++        if self._channel is not None:
++            # Schedule channel destruction using the global shutdown manager
++            self._schedule_destruction()
++
++    def _create_callback_handle(self, callback_data):
++        """
++        Create a callback handle and register it for tracking.
++
++        This ensures that:
++        1. The callback data is wrapped in a CFFI handle
++        2. The handle is mapped to this channel to keep it alive
++
++        Args:
++            callback_data: The data to pass to the callback (usually a callable or tuple)
++
++        Returns:
++            The CFFI handle that can be passed to C functions
++
++        Raises:
++            RuntimeError: If the channel is destroyed
++
++        """
++        if self._channel is None:
++            raise RuntimeError("Channel is destroyed, no new queries allowed")
++
++        userdata = _ffi.new_handle(callback_data)
++        _handle_to_channel[userdata] = self
++        return userdata
++
+     def cancel(self) -> None:
+         _lib.ares_cancel(self._channel[0])
+ 
+@@ -513,16 +628,14 @@ class Channel:
+         else:
+             raise ValueError("invalid IP address")
+ 
+-        userdata = _ffi.new_handle(callback)
+-        _global_set.add(userdata)
++        userdata = self._create_callback_handle(callback)
+         _lib.ares_gethostbyaddr(self._channel[0], address, _ffi.sizeof(address[0]), family, _lib._host_cb, userdata)
+ 
+     def gethostbyname(self, name: str, family: socket.AddressFamily, callback: Callable[[Any, int], None]) -> None:
+         if not callable(callback):
+             raise TypeError("a callable is required")
+ 
+-        userdata = _ffi.new_handle(callback)
+-        _global_set.add(userdata)
++        userdata = self._create_callback_handle(callback)
+         _lib.ares_gethostbyname(self._channel[0], parse_name(name), family, _lib._host_cb, userdata)
+ 
+     def getaddrinfo(
+@@ -545,8 +658,7 @@ class Channel:
+         else:
+             service = ascii_bytes(port)
+ 
+-        userdata = _ffi.new_handle(callback)
+-        _global_set.add(userdata)
++        userdata = self._create_callback_handle(callback)
+ 
+         hints = _ffi.new('struct ares_addrinfo_hints*')
+         hints.ai_flags = flags
+@@ -574,8 +686,7 @@ class Channel:
+         if query_class not in self.__qclasses__:
+             raise ValueError('invalid query class specified')
+ 
+-        userdata = _ffi.new_handle((callback, query_type))
+-        _global_set.add(userdata)
++        userdata = self._create_callback_handle((callback, query_type))
+         func(self._channel[0], parse_name(name), query_class, query_type, _lib._query_cb, userdata)
+ 
+     def set_local_ip(self, ip):
+@@ -613,13 +724,47 @@ class Channel:
+         else:
+             raise ValueError("Invalid address argument")
+ 
+-        userdata = _ffi.new_handle(callback)
+-        _global_set.add(userdata)
++        userdata = self._create_callback_handle(callback)
+         _lib.ares_getnameinfo(self._channel[0], _ffi.cast("struct sockaddr*", sa), _ffi.sizeof(sa[0]), flags, _lib._nameinfo_cb, userdata)
+ 
+     def set_local_dev(self, dev):
+         _lib.ares_set_local_dev(self._channel[0], dev)
+ 
++    def close(self) -> None:
++        """
++        Close the channel as soon as it's safe to do so.
++
++        This method can be called from any thread. The channel will be destroyed
++        safely using a background thread with a 1-second delay to ensure c-ares
++        has completed its cleanup.
++
++        Note: Once close() is called, no new queries can be started. Any pending
++        queries will be cancelled and their callbacks will receive ARES_ECANCELLED.
++
++        """
++        if self._channel is None:
++            # Already destroyed
++            return
++
++        # Cancel all pending queries - this will trigger callbacks with ARES_ECANCELLED
++        self.cancel()
++
++        # Schedule channel destruction
++        self._schedule_destruction()
++
++    def _schedule_destruction(self) -> None:
++        """Schedule channel destruction using the global shutdown manager."""
++        if self._channel is None:
++            return
++        channel = self._channel
++        self._channel = None
++        # Can't start threads during interpreter shutdown
++        # The channel will be cleaned up by the OS
++        # TODO: Change to PythonFinalizationError when Python 3.12 support is dropped
++        with suppress(RuntimeError):
++            _shutdown_manager.destroy_channel(channel)
++
++
+ 
+ class AresResult:
+     __slots__ = ()
+diff --git a/tests/shutdown_at_exit_script.py b/tests/shutdown_at_exit_script.py
+new file mode 100644
+index 0000000..4bab53c
+--- /dev/null
++++ b/tests/shutdown_at_exit_script.py
+@@ -0,0 +1,18 @@
++#!/usr/bin/env python3
++"""Script to test that shutdown thread handles interpreter shutdown gracefully."""
++
++import pycares
++import sys
++
++# Create a channel
++channel = pycares.Channel()
++
++# Start a query to ensure pending handles
++def callback(result, error):
++    pass
++
++channel.query('example.com', pycares.QUERY_TYPE_A, callback)
++
++# Exit immediately - the channel will be garbage collected during interpreter shutdown
++# This should not raise PythonFinalizationError
++sys.exit(0)
+\ No newline at end of file
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pycares_4.6.0.bb b/meta-python/recipes-devtools/python/python3-pycares_4.6.0.bb
index aa87112c88..90e52a4dec 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_4.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_4.6.0.bb
@@ -6,6 +6,7 @@ HOMEPAGE = "https://github.com/saghul/pycares"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1538fcaea82ebf2313ed648b96c69b1"
 
+SRC_URI += "file://CVE-2025-48945.patch"
 SRC_URI[sha256sum] = "b8a004b18a7465ac9400216bc3fad9d9966007af1ee32f4412d2b3a94e33456e"
 
 PYPI_PACKAGE = "pycares"
-- 
2.34.1


