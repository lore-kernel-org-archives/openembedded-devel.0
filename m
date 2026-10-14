Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4CACC6B1D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:39:09 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9477.1791970741582938230
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ik8ExPhG;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c45111bebso2329544f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791970740; x=1792575540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfblI3BNjII+ab4ScUgnygzyj4NNhqrz6s13cxChd1c=;
        b=Ik8ExPhGfPW/hvBEwdDfSmFkYT8jMVQ1bf+dPGO0tNZpJNUpqd0cvhdbDi60RR9Wbz
         e9BddOOD1BTGnOUDG2hj2Zv9ylYrNGkYZCXd1z/k6x2Bs/qHPI2iCXurJCleES+UJE6T
         5AvXCmodgTcmXOAfKznJrcv0KBXT9vMFQnQvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970740; x=1792575540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfblI3BNjII+ab4ScUgnygzyj4NNhqrz6s13cxChd1c=;
        b=az8KHxRbVmSaSkimUvH9RtONXoUn/NuLJdaFk2ofWyKER14EQJr1ctek/pU3Wtw0lV
         HZCOXzhwExZ9nMCA6r+QdPW49qtM1vL7iOnb3XuhCvaSS2avSvUh8Jv7XrQK+odMs7s3
         XD7f5c0cdSjLKMKguHUSZ0cXAyzhX+VhoKL62spywhHWSTp47JTW3iHDJaziMeWB+Q/f
         XU1qFWOT3sWabM8wYU91+nJQVaTrHid0sPfq6HQRDhQfh+emdY2mn89PELQhIeZvF/ZB
         H65RDbkogDPsjCLG56qEUbe4w9NNoITMHbUtUlkMu3e+6Af7arNLZaXqkHUDBSFLM9xl
         T9Lg==
X-Gm-Message-State: AFq9FYLQ0xJPpR3xuMXsLQ3cSSjZsEY/cVnP6GmzCszSS3j6lRNgMYas
	F+YFFe+bJuC/8URBAokIgvHjKqJGHzl+LUf2ZNmkDZi7XQ4NZnrLrZQz5pFWemfkeSE1C4b08+m
	6VCzc
X-Gm-Gg: AYBFou2oUY8wVnYslA96X3+g5IOnMznuThVDluG8v+AGP7xvZr1f/o7C8157KulDt10
	zPRc7Lz58x8LMVBDklxG/7oBUsGKlweSOHk6nMGz9IA9N+EFt33W5Yjab6Y2tyRQGHcQiRCApeq
	U65NBhyIRTc/ujVvYpHi1uFA15t5v19zO8IrNszUNQ3i/IcuBf4dXoCmvBialuDYwjfdZKBHAA+
	1d+h81fr0B7l7ny0qLW1OTNHpzyEan0w6G5X6FhmVqMs9DfxITLFVu5a0NJzcV6YJ9JHFdFqTBa
	T1lvGY+/8Fdbi6uKCPTz81l6tMkCxcYgCOea0X9kifw4ss0ntOv1aWYDvy/6vX7l30XPP+T4/PU
	qTk1J+ISjWzg7jWRJ6fakXMPqqUECPLxaVk9SfUSKefQoobA3SPsRjN1mMRGLvIN/vxMHIY0T7U
	qnAaYlQlGcE3rhy+OMLXIJf9jxyaOWNEOP/Mv0zaq9XtIW5+IcuBKc5YfGcTYrgNfFbbsIEbSAF
	EevpsX1slCg/edjfCFxcKOtK1KpqLbU7LCefwwxLiMdcL5l03jFz6WVJmL6x9r4eSFYEb9Lot/w
	NKlDdaPfxdwSBNul5VPu5g4=
X-Received: by 2002:a05:6000:288a:b0:488:89ad:56c0 with SMTP id ffacd0b85a97d-48dbaadbf6amr28388287f8f.11.1791970739459;
        Wed, 14 Oct 2026 02:38:59 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5b03sm11495875f8f.30.2026.10.14.02.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:38:58 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] nmap: Upgrade 7.99 -> 7.991
Date: Wed, 14 Oct 2026 12:38:55 +0300
Message-ID: <20261014093855.2600846-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130886

Upgrade to release 7.991:

- Upgraded included OpenSSL t- version 3.0.21 on all platforms.
- Fixed a memory-consumption hang in Ncat's HTTP proxy code that
  affected both connect and listen modes, reported by kumama_nui.
- Patched our included libssh2 source with upstream fixes for
  CVE-2025-15661, CVE-2026-7598, CVE-2026-55199, CVE-2026-55200,
  CVE-2026-58050, and CVE-2026-58051. The version number has been
  annotated as 1.11.1_NMAP1
- [Zenmap][GH#3347] Fixed several issues leading t- crashes when
  parsing, editing, or saving command profiles containing '%'
  characters.
- [NSE][GH#2272] smb-enum-shares failed t- produce output for valid
  shares when an error was encountered on one share.
- [GH#3410] Fixed an issue where DNS resolution would incorrectly
  fail t- match the same name in a different case.
- [NSE][GH#1066] Added service names for SSL-protected services
  like amt-soap-https t- portrules for several scripts, ensuring
  they run on these as well as the standard unencrypted services.
- Audited and converted most instances of strcat, strcpy, and
  sprintf t- use bounded functions instead.
- [NSE][GH#2221] mysql-dump-hashes now uses the correct column name
  for MySQL 5.7+
- [NSE][GH#2238] http-referer-checker was incorrectly fetching
  off-host URLs. Now only URLs on the target are fetched.
- [GH#2122] When an interface is specified with -e, als- bind t-
  the IP address for that device s- that it works for non-Linux
  systems and non-root users.
- [Nsock][GH#1939] When nsock_iod_set_localaddr() is used,
  nsock_connect_*() will now treat errors in bind(2) as connection
  failure.
- [GH#2732] Fix a potential crash on 32-bit platforms in debug mode
  due to incorrect format specifier for 64-bit integer type.
  [Christopher Chavez]
- [GH#3201][GH#3367] Increase line length limit for
  nmap-service-probes and correctly handle lines that are to- long.
  [@liquidpele, Ashutosh Kumar Singh]
- [GH#3414] Avoid out-of-bounds read when parsing PTR domain names.
  [@toor11 (Juri)]
- [GH#2245] Ensure variables updated by signal handlers are
  volatile sig_atomic_t.
- [Ncat][GH#1410] Fix an assertion failure (count <= INT_MAX) in
  ncat -lk in some cases where stdin or a listening socket produces
  an error.
- [NSE][GH#1946] Fix a cryptic error in smb-enum-services, "Server
  returned less data than needed for header" when smb.start_smb()
  failed.
- Fixed an issue with parsing nmap-service-probes that could cause
  a corrupted file t- crash Nmap. Reported by Muhammed Hussein.
- [NSE][GH#2016] Removed hostmap-bfk.nse, since the service it used
  shut down.
- Fixed several issues reported by Himanshu Anand: infinite loop in
  TCP options parsing and out-of-bounds memory read in IPv4 OS
  detection; integer underflow in IPv6 extension header processing;
  and undefined behavior in DNS label parsing.
- [GH#2721] Added checks for returned pointers from OpenSSL
  allocation functions.
- [GH#1546] Fix an incorrect assertion "timeout / 1000 <= (long)
  o.scan_delay" in traceroute which failed for timeouts greater
  than 1 second when there was n- scan delay.
- [GH#3175] The --stats-every option can now be used in conjunction
  with --noninteractive. Previously, n- stats messages were printed
  if a TTY was not attached.
- [GH#3375] Nmap can now be built with OpenSSL 4.0
- [Nping][GH#1751] The --rate option will not accept a rate higher
  than 1000 packets per second, since Nsock timers have millisecond
  resolution. Use --delay 0 for unlimited rate.
- [Nping] Fixed several issues with Nping in IPv6 mode including:
  + [GH#1261] Incorrect BPF generated leading t- "expression
    rejects all packets"
  + [GH#3215] Incorrect constant used t- check for IP version in
    Ech- Server
- [NSE][GH#3368] Fixed an out-of-memory issue in packet.lua when
  parsing a zero-length TCP header option. [Maxim Suhanov]
- Fixed an issue where Nmap OS scan trusts a packet's ip_len t-
  size a CRC32 computation over TCP RST payload data, which may
  result in reading arbitrary heap data. Reported by Michael
  Bommarito.
- [Ncat][GH#3005] Correctly report listening port number. `ncat -l
  -p 0` will cause Ncat t- listen on an ephemeral port, but it was
  reporting itself as listening on port 0.
- [Ncat][GH#1672] Fixed an issue where Ncat in server mode would
  quit without printing the last received data on a connection,
  particularly affecting SCTP.
- [Ncat][GH#2827] Fixed an issue where Ncat in --send-only mode
  would ignore disconnects and crash when it tries t- send data t-
  a disconnected client.
- [Ncat][GH#3291] Fixed an issue where Ncat on Windows would quit
  after 2 minutes due t- an OS-enforced timeout on the half-open
  TCP socket used to emulate STDIN.
- [Nping][GH#564] Allow Nping t- fall back t- TCP Connect mode on
  Windows when Npcap is not installed.
- [Ncat] Fixed several issues reported by Muhammed Hussein
  involving crashes in Ncat's server-mode HTTP proxy, as well as
  one code-quality issue with its Telnet negotiation code.
- [Nsock][GH#2595] Fix an issue where Nsock's SOCKS4 proxy code
  would send additional null bytes on Windows and other platforms
  where the compiler does not understand __attribute__((packed)).
  [Daniel Miller]
- The --release-memory option is now a no-op. Nmap will always run
  finalization routines that release allocated memory before
  closing.
- Fixed an integer underflow in service_scan.cc that would cause
  little-endian integers extracted from the beginning of a service
  banner t- be interpreted as 0. Discovered with AFL++ by Malek
  Althubiany.
- [Nsock][GH#583] Use OpenSSL security levels and callbacks t-
  prevent errors connecting t- certain insecure targets when using
  NSOCK_SSL_MAX_SPEED. The default, as used in Ncat, now uses
  stricter-than-default security level.
- [GH#410] If a target times out due t- --host-timeout, d- not
  perform traceroute.
- [Nping][GH#380] Disallow combining Ethernet-related options like
  --dest-mac with --send-ip
- [NSE][GH#3250][GH#3206] Fix assertion failures in cases where
  connect or send returns immediately with a status other than
  ERROR, e.g. TIMEOUT or CANCELED. [Daniel Miller]
- [Ncat][GH#290] Enable ncat -l --ssl t- use DHE and ECDHE cipher
  suites for perfect forward secrecy.
- Fix a crash when writing long CPE strings t- output. Reported by
  Harshit Gupta. [Daniel Miller]
- [Ncat] Fix several cases where Ncat's SOCKS5 client could
  interpret uninitialized data as protocol data, triggered by a
  malicious SOCKS5 proxy server. N- code execution or application
  crash is possible. Reported by Govind Pratap Singh. [Daniel
  Miller]
- [Nping] Fix a out-of-bounds access in Nping Ech- client allowing
  a malicious Nping EchoServer t- zer- 32 bytes of memory outside
  the packet buffer. Reported by Harshit Gupta. [Daniel Miller]
- Fix a 1-byte overrun (read) while reading certain crafted DNS
  labels, reported by Peter Parker. [Daniel Miller]
- [NSE][GH#3317] Function url.build_path was mangling special
  characters in URL path segments. [nnposter]

Drop 0004-libdnet-fix-PF_PACKET-conftest-nested-function.patch
because the check for PF_PACKET that failed with clang has been
fixed with commit 33c39cd38 in the upstream of nmap.

Set OEQA_BUILDPATHS_SKIP to ignore upstream HOME path match and
avoid buildpaths QA error.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../files/0002-Fix-building-with-libc.patch   | 29 ++++++--------
 ...x-PF_PACKET-conftest-nested-function.patch | 38 -------------------
 .../nmap/{nmap_7.99.bb => nmap_7.991.bb}      |  5 ++-
 3 files changed, 15 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-security/nmap/files/0004-libdnet-fix-PF_PACKET-conftest-nested-function.patch
 rename meta-oe/recipes-security/nmap/{nmap_7.99.bb => nmap_7.991.bb} (94%)

diff --git a/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch b/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
index 064be8ff85..6c2fdc6458 100644
--- a/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
+++ b/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
@@ -1,4 +1,4 @@
-From 2a361989b5f84ec23ba7ccb6e527a5590ff55deb Mon Sep 17 00:00:00 2001
+From c634826b85bc4b67890a18379025d1bdd530efa0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 20 Jan 2019 23:11:56 -0800
 Subject: [PATCH] Fix building with libc++
@@ -6,15 +6,16 @@ Subject: [PATCH] Fix building with libc++
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
- nping/EchoServer.cc | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
+ nping/EchoServer.cc | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
-index 40cd4d6..04433e1 100644
+index 41108fc67..d392039a6 100644
 --- a/nping/EchoServer.cc
 +++ b/nping/EchoServer.cc
-@@ -282,14 +282,14 @@ int EchoServer::nep_listen_socket(){
+@@ -212,14 +212,14 @@ int EchoServer::nep_listen_socket(){
          server_addr6.sin6_len = sizeof(struct sockaddr_in6);
      #endif
      /* Bind to local address and the specified port */
@@ -32,7 +33,7 @@ index 40cd4d6..04433e1 100644
                  nping_print(VB_1, "Server bound to port %d", port);
              }
          }
-@@ -320,12 +320,12 @@ int EchoServer::nep_listen_socket(){
+@@ -250,12 +250,12 @@ int EchoServer::nep_listen_socket(){
  #endif
  
      /* Bind to local address and the specified port */
@@ -47,7 +48,7 @@ index 40cd4d6..04433e1 100644
                  nping_fatal(QT_3, "Could not bind to port %d (%s).", port, strerror(errno));
              }else{
                  nping_print(VB_1, "Server bound to port %d", port);
-@@ -561,7 +561,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4, IPv6Header *ip6, TCPHe
+@@ -491,7 +491,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4, IPv6Header *ip6, TCPHe
                              nping_print(DBG_3, ";");
                              /* The payload magic may affect the score only between
                               * zero and 4 bytes. This is done to prevent long
@@ -56,16 +57,7 @@ index 40cd4d6..04433e1 100644
                               * increasing the score a lot and cause problems for
                               * the matching logic. */
                              current_score+= MIN(4, fspec->len)*FACTOR_PAYLOAD_MAGIC;
-@@ -571,7 +571,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4, IPv6Header *ip6, TCPHe
-                     default:
-                         nping_warning(QT_2, "Bogus field specifier found in client #%d context. Please report a bug", ctx->getIdentifier());
-                     break;
--                }           
-+                }
-             } /* End of field specifiers loop */
- 
-             nping_print(DBG_3, "%s() current_score=%.02f candidate_score=%.02f", __func__, current_score, candidate_score);
-@@ -650,7 +650,7 @@ clientid_t EchoServer::nep_match_packet(const u8 *pkt, size_t pktlen){
+@@ -581,7 +581,7 @@ clientid_t EchoServer::nep_match_packet(const u8 *pkt, size_t pktlen){
                  }else{
                      if( (tcplen=tcp.validate())==OP_FAILURE){
                          return CLIENT_NOT_FOUND;
@@ -74,3 +66,6 @@ index 40cd4d6..04433e1 100644
                          if( (int)pktlen > (iplen+tcplen) ){
                             if( payload.storeRecvData(pkt+iplen+tcplen, pktlen-iplen-tcplen)!=OP_FAILURE)
                                 payload_included=true;
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-security/nmap/files/0004-libdnet-fix-PF_PACKET-conftest-nested-function.patch b/meta-oe/recipes-security/nmap/files/0004-libdnet-fix-PF_PACKET-conftest-nested-function.patch
deleted file mode 100644
index 89571978ea..0000000000
--- a/meta-oe/recipes-security/nmap/files/0004-libdnet-fix-PF_PACKET-conftest-nested-function.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 24 Jun 2026 00:00:00 +0000
-Subject: [PATCH] libdnet: fix PF_PACKET conftest nested function
-
-The bundled libdnet-stripped AC_DNET_LINUX_PF_PACKET check used
-"int foo() { return ETH_P_ALL; }" as the AC_TRY_COMPILE body, which the
-generated configure places inside main(). clang rejects nested function
-definitions ("function definition is not allowed here"), so the check
-fails and configure aborts with "Ethernet support not found". Use a plain
-expression statement that still references ETH_P_ALL. Patch both the macro
-source and the shipped configure.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
---- a/libdnet-stripped/m4/acinclude.m4
-+++ b/libdnet-stripped/m4/acinclude.m4
-@@ -149,7 +149,7 @@
-     [AC_MSG_CHECKING(for Linux PF_PACKET sockets)
-     AC_TRY_COMPILE([#include <netpacket/packet.h>
-                     #include <linux/if_ether.h>],
--                   [int foo() { return ETH_P_ALL; }],
-+                   [(void) ETH_P_ALL;],
-     ac_cv_dnet_linux_pf_packet=yes,
-     ac_cv_dnet_linux_pf_packet=no)
-     AC_MSG_RESULT($ac_cv_dnet_linux_pf_packet)
---- a/libdnet-stripped/configure
-+++ b/libdnet-stripped/configure
-@@ -15219,7 +15219,7 @@
- int
- main (void)
- {
--int foo() { return ETH_P_ALL; }
-+(void) ETH_P_ALL;
-   ;
-   return 0;
- }
diff --git a/meta-oe/recipes-security/nmap/nmap_7.99.bb b/meta-oe/recipes-security/nmap/nmap_7.991.bb
similarity index 94%
rename from meta-oe/recipes-security/nmap/nmap_7.99.bb
rename to meta-oe/recipes-security/nmap/nmap_7.991.bb
index ea792d30f6..1553b36247 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.99.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.991.bb
@@ -10,9 +10,8 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
            file://0001-Include-time.h-header-to-pass-clang-compilation.patch \
            file://0002-Fix-building-with-libc.patch \
            file://0001-fix-racing-between-build-ncat-and-build-lua.patch \
-           file://0004-libdnet-fix-PF_PACKET-conftest-nested-function.patch \
            "
-SRC_URI[sha256sum] = "df512492ffd108e53a27a06f26d8635bbe89e0e569455dc8ffef058c035d51b2"
+SRC_URI[sha256sum] = "a5d507f29437bef3bedd4771ff9aaa8fc1c2a109ddba1f5b1cf12027456929be"
 
 UPSTREAM_CHECK_REGEX = "nmap-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -70,3 +69,5 @@ do_install:append() {
 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"
 
 RDEPENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'ndiff', 'python3-difflib python3-asyncio python3-xml', '', d)}"
+
+OEQA_BUILDPATHS_SKIP = "${HOME}"
-- 
2.47.3


