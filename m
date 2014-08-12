Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6C44365E11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 09:01:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7C91IHJ000518
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 02:01:19 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 12 Aug 2014 02:01:18 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Aug 2014 17:01:19 +0800
Message-ID: <1407834079-15377-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] quagga: uprev it to 0.99.23
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Aug 2014 09:01:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Roy Li <rongqing.li@windriver.com>

uprev it to 0.99.23
remove patches which have been in the latest version

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...d-CVE-2012-1820-DoS-in-bgp_capability_orf.patch |   87 ----------------
 ...bgpd-relax-ORF-capability-length-handling.patch |   42 --------
 ...1-doc-fix-makeinfo-errors-and-one-warning.patch |   61 -----------
 ...-CVE-2013-2236-stack-overrun-in-apiserver.patch |  106 --------------------
 ...uild-fix-extract.pl-for-cross-compilation.patch |   31 ------
 .../quagga/files/fix-for-lib-inpath.patch          |   19 ----
 ...ingering-IP-address-after-deletion-BZ-486.patch |   64 ------------
 .../quagga/files/quagga-0.99.17-libcap.patch       |   64 ------------
 .../quagga/files/quagga-fix-CVE-2013-6051.patch    |   29 ------
 .../quagga/files/work-with-new-readline.patch      |   34 -------
 .../recipes-protocols/quagga/quagga.inc            |   13 +--
 .../recipes-protocols/quagga/quagga_0.99.21.bb     |   16 ---
 .../recipes-protocols/quagga/quagga_0.99.23.bb     |    9 ++
 13 files changed, 12 insertions(+), 563 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/0001-bgpd-CVE-2012-1820-DoS-in-bgp_capability_orf.patch
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/0001-bgpd-relax-ORF-capability-length-handling.patch
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/0001-doc-fix-makeinfo-errors-and-one-warning.patch
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/0001-ospfd-CVE-2013-2236-stack-overrun-in-apiserver.patch
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/build-fix-extract.pl-for-cross-compilation.patch
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/fix-for-lib-inpath.patch
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/lingering-IP-address-after-deletion-BZ-486.patch
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/quagga-0.99.17-libcap.patch
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/quagga-fix-CVE-2013-6051.patch
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/work-with-new-readline.patch
 delete mode 100644 meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
 create mode 100644 meta-networking/recipes-protocols/quagga/quagga_0.99.23.bb

diff --git a/meta-networking/recipes-protocols/quagga/files/0001-bgpd-CVE-2012-1820-DoS-in-bgp_capability_orf.patch b/meta-networking/recipes-protocols/quagga/files/0001-bgpd-CVE-2012-1820-DoS-in-bgp_capability_orf.patch
deleted file mode 100644
index 5a2ee1b..0000000
--- a/meta-networking/recipes-protocols/quagga/files/0001-bgpd-CVE-2012-1820-DoS-in-bgp_capability_orf.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From fe9bb6459afe0d55e56619cdc5061d8407cd1f15 Mon Sep 17 00:00:00 2001
-From: Denis Ovsienko <infrastation@yandex.ru>
-Date: Thu, 19 Apr 2012 20:34:13 +0400
-Subject: [PATCH] bgpd: CVE-2012-1820, DoS in bgp_capability_orf()
-
-Upstream-Status: Backport
-
-An ORF (code 3) capability TLV is defined to contain exactly one
-AFI/SAFI block. Function bgp_capability_orf(), which parses ORF
-capability TLV, uses do-while cycle to call its helper function
-bgp_capability_orf_entry(), which actually processes the AFI/SAFI data
-block. The call is made at least once and repeated as long as the input
-buffer has enough data for the next call.
-
-The helper function, bgp_capability_orf_entry(), uses "Number of ORFs"
-field of the provided AFI/SAFI block to verify, if it fits the input
-buffer. However, the check is made based on the total length of the ORF
-TLV regardless of the data already consumed by the previous helper
-function call(s). This way, the check condition is only valid for the
-first AFI/SAFI block inside an ORF capability TLV.
-
-For the subsequent calls of the helper function, if any are made, the
-check condition may erroneously tell, that the current "Number of ORFs"
-field fits the buffer boundary, where in fact it does not. This makes it
-possible to trigger an assertion by feeding an OPEN message with a
-specially-crafted malformed ORF capability TLV.
-
-This commit fixes the vulnerability by making the implementation follow
-the spec.
----
- bgpd/bgp_open.c |   26 ++------------------------
- 1 files changed, 2 insertions(+), 24 deletions(-)
-
-diff --git a/bgpd/bgp_open.c b/bgpd/bgp_open.c
-index d045dde..af711cc 100644
---- a/bgpd/bgp_open.c
-+++ b/bgpd/bgp_open.c
-@@ -230,7 +230,7 @@ bgp_capability_orf_entry (struct peer *peer, struct capability_header *hdr)
-     }
-   
-   /* validate number field */
--  if (sizeof (struct capability_orf_entry) + (entry.num * 2) > hdr->length)
-+  if (sizeof (struct capability_orf_entry) + (entry.num * 2) != hdr->length)
-     {
-       zlog_info ("%s ORF Capability entry length error,"
-                  " Cap length %u, num %u",
-@@ -334,28 +334,6 @@ bgp_capability_orf_entry (struct peer *peer, struct capability_header *hdr)
- }
- 
- static int
--bgp_capability_orf (struct peer *peer, struct capability_header *hdr)
--{
--  struct stream *s = BGP_INPUT (peer);
--  size_t end = stream_get_getp (s) + hdr->length;
--  
--  assert (stream_get_getp(s) + sizeof(struct capability_orf_entry) <= end);
--  
--  /* We must have at least one ORF entry, as the caller has already done
--   * minimum length validation for the capability code - for ORF there must
--   * at least one ORF entry (header and unknown number of pairs of bytes).
--   */
--  do
--    {
--      if (bgp_capability_orf_entry (peer, hdr) == -1)
--        return -1;
--    } 
--  while (stream_get_getp(s) + sizeof(struct capability_orf_entry) < end);
--  
--  return 0;
--}
--
--static int
- bgp_capability_restart (struct peer *peer, struct capability_header *caphdr)
- {
-   struct stream *s = BGP_INPUT (peer);
-@@ -573,7 +551,7 @@ bgp_capability_parse (struct peer *peer, size_t length, int *mp_capability,
-             break;
-           case CAPABILITY_CODE_ORF:
-           case CAPABILITY_CODE_ORF_OLD:
--            if (bgp_capability_orf (peer, &caphdr))
-+            if (bgp_capability_orf_entry (peer, &caphdr))
-               return -1;
-             break;
-           case CAPABILITY_CODE_RESTART:
--- 
-1.7.5.4
-
diff --git a/meta-networking/recipes-protocols/quagga/files/0001-bgpd-relax-ORF-capability-length-handling.patch b/meta-networking/recipes-protocols/quagga/files/0001-bgpd-relax-ORF-capability-length-handling.patch
deleted file mode 100644
index 0ec02dc..0000000
--- a/meta-networking/recipes-protocols/quagga/files/0001-bgpd-relax-ORF-capability-length-handling.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 5e728e929942d39ce5a4ab3d01c33f7b688c4e3f Mon Sep 17 00:00:00 2001
-From: David Lamparter <equinox@opensourcerouting.org>
-Date: Wed, 23 Jan 2013 05:50:24 +0100
-Subject: [PATCH] bgpd: relax ORF capability length handling
-
-Upstream-Status: Backport
-
-commit fe9bb64... "bgpd: CVE-2012-1820, DoS in bgp_capability_orf()"
-made the length test in bgp_capability_orf_entry() stricter and is now
-causing us to refuse (with CEASE) ORF capabilites carrying any excess
-data.  This does not conform to the robustness principle as laid out by
-RFC1122 ("be liberal in what you accept").
-
-Even worse, RFC5291 is quite unclear on how to use the ORF capability
-with multiple AFI/SAFIs.  It can be interpreted as either "use one
-instance, stuff everything in" but also as "use multiple instances".
-So, if not for applying robustness, we end up clearing sessions from
-implementations going by the former interpretation.  (or if anyone dares
-add a byte of padding...)
-
-Cc: Denis Ovsienko <infrastation@yandex.ru>
-Signed-off-by: David Lamparter <equinox@opensourcerouting.org>
----
- bgpd/bgp_open.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/bgpd/bgp_open.c b/bgpd/bgp_open.c
-index af711cc..7bf3501 100644
---- a/bgpd/bgp_open.c
-+++ b/bgpd/bgp_open.c
-@@ -230,7 +230,7 @@ bgp_capability_orf_entry (struct peer *peer, struct capability_header *hdr)
-     }
-   
-   /* validate number field */
--  if (sizeof (struct capability_orf_entry) + (entry.num * 2) != hdr->length)
-+  if (sizeof (struct capability_orf_entry) + (entry.num * 2) > hdr->length)
-     {
-       zlog_info ("%s ORF Capability entry length error,"
-                  " Cap length %u, num %u",
--- 
-1.7.5.4
-
diff --git a/meta-networking/recipes-protocols/quagga/files/0001-doc-fix-makeinfo-errors-and-one-warning.patch b/meta-networking/recipes-protocols/quagga/files/0001-doc-fix-makeinfo-errors-and-one-warning.patch
deleted file mode 100644
index 24fdac5..0000000
--- a/meta-networking/recipes-protocols/quagga/files/0001-doc-fix-makeinfo-errors-and-one-warning.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From d6cbd8bbc34529a1aff74b5ee73366b89526c961 Mon Sep 17 00:00:00 2001
-From: Joe MacDonald <joe@deserted.net>
-Date: Fri, 22 Mar 2013 08:54:44 +0000
-Subject: [PATCH] doc: fix makeinfo errors and one warning
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-commit 4afa50b added few lines that are syntactically incorrect
-with leading plus sign.
-
-Upstream-Status: Backport [http://git.savannah.gnu.org/gitweb/?p=quagga.git;a=commit;h=b58c90807c9d0bfa9601704c7490a16070906004]
-
-Cc: Denis Ovsienko <infrastation@yandex.ru>
-Signed-off-by: Timo Teräs <timo.teras@iki.fi>
-Signed-off-by: David Lamparter <equinox@opensourcerouting.org>
-Signed-off-by: Joe MacDonald <joe@deserted.net>
----
- doc/ipv6.texi   |    4 ++--
- doc/quagga.texi |    6 +++---
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/doc/ipv6.texi b/doc/ipv6.texi
-index b6cc437..2482c1c 100644
---- a/doc/ipv6.texi
-+++ b/doc/ipv6.texi
-@@ -136,8 +136,8 @@ for the lowest preference possible.
- Default: 0
- @end deffn
- 
--+@deffn {Interface Command} {ipv6 nd home-agent-lifetime <0-65520>} {}
--+@deffnx {Interface Command} {no ipv6 nd home-agent-lifetime [<0-65520>]} {}
-+@deffn {Interface Command} {ipv6 nd home-agent-lifetime <0-65520>} {}
-+@deffnx {Interface Command} {no ipv6 nd home-agent-lifetime [<0-65520>]} {}
- The value to be placed in Home Agent Option, when Home Agent config flag is set, 
- which indicates to hosts Home Agent Lifetime. The default value of 0 means to
- place the current Router Lifetime value.
-diff --git a/doc/quagga.texi b/doc/quagga.texi
-index ff913aa..b4105ac 100644
---- a/doc/quagga.texi
-+++ b/doc/quagga.texi
-@@ -1,13 +1,13 @@
- \input texinfo @c -*- texinfo -*-
-+@c Set variables - sourced from defines.texi
-+@include defines.texi
-+
- @c %**start of header
- @setchapternewpage odd
- @settitle @uref{http://www.quagga.net,,@value{PACKAGE_NAME}}
- @setfilename quagga.info
- @c %**end of header
- 
--@c Set variables - sourced from defines.texi
--@include defines.texi
--
- @c automake will automatically generate version.texi
- @c and set EDITION, VERSION, UPDATED and UPDATED-MONTH
- @include version.texi
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-protocols/quagga/files/0001-ospfd-CVE-2013-2236-stack-overrun-in-apiserver.patch b/meta-networking/recipes-protocols/quagga/files/0001-ospfd-CVE-2013-2236-stack-overrun-in-apiserver.patch
deleted file mode 100644
index 30b05c2..0000000
--- a/meta-networking/recipes-protocols/quagga/files/0001-ospfd-CVE-2013-2236-stack-overrun-in-apiserver.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-Subject: [PATCH] ospfd: CVE-2013-2236, stack overrun in apiserver
-
-Upstream-Status: Backport
-
-the OSPF API-server (exporting the LSDB and allowing announcement of
-Opaque-LSAs) writes past the end of fixed on-stack buffers.  This leads
-to an exploitable stack overflow.
-
-For this condition to occur, the following two conditions must be true:
-- Quagga is configured with --enable-opaque-lsa
-- ospfd is started with the "-a" command line option
-
-If either of these does not hold, the relevant code is not executed and
-the issue does not get triggered.
-
-Since the issue occurs on receiving large LSAs (larger than 1488 bytes),
-it is possible for this to happen during normal operation of a network.
-In particular, if there is an OSPF router with a large number of
-interfaces, the Router-LSA of that router may exceed 1488 bytes and
-trigger this, leading to an ospfd crash.
-
-For an attacker to exploit this, s/he must be able to inject valid LSAs
-into the OSPF domain.  Any best-practice protection measure (using
-crypto authentication, restricting OSPF to internal interfaces, packet
-filtering protocol 89, etc.) will prevent exploitation.  On top of that,
-remote (not on an OSPF-speaking network segment) attackers will have
-difficulties bringing up the adjacency needed to inject a LSA.
-
-This patch only performs minimal changes to remove the possibility of a
-stack overrun.  The OSPF API in general is quite ugly and needs a
-rewrite.
-
-Reported-by: Ricky Charlet <ricky.charlet@hp.com>
-Cc: Florian Weimer <fweimer@redhat.com>
-Signed-off-by: David Lamparter <equinox@opensourcerouting.org>
----
- ospfd/ospf_api.c |   25 ++++++++++++++++++-------
- 1 files changed, 18 insertions(+), 7 deletions(-)
-
-diff --git a/ospfd/ospf_api.c b/ospfd/ospf_api.c
-index 74a49e3..fae942e 100644
---- a/ospfd/ospf_api.c
-+++ b/ospfd/ospf_api.c
-@@ -472,6 +472,9 @@ new_msg_register_event (u_int32_t seqnum, struct lsa_filter_type *filter)
-   emsg->filter.typemask = htons (filter->typemask);
-   emsg->filter.origin = filter->origin;
-   emsg->filter.num_areas = filter->num_areas;
-+  if (len > sizeof (buf))
-+    len = sizeof(buf);
-+  /* API broken - missing memcpy to fill data */
-   return msg_new (MSG_REGISTER_EVENT, emsg, seqnum, len);
- }
- 
-@@ -488,6 +491,9 @@ new_msg_sync_lsdb (u_int32_t seqnum, struct lsa_filter_type *filter)
-   smsg->filter.typemask = htons (filter->typemask);
-   smsg->filter.origin = filter->origin;
-   smsg->filter.num_areas = filter->num_areas;
-+  if (len > sizeof (buf))
-+    len = sizeof(buf);
-+  /* API broken - missing memcpy to fill data */
-   return msg_new (MSG_SYNC_LSDB, smsg, seqnum, len);
- }
- 
-@@ -501,13 +507,15 @@ new_msg_originate_request (u_int32_t seqnum,
-   int omsglen;
-   char buf[OSPF_API_MAX_MSG_SIZE];
- 
--  omsglen = sizeof (struct msg_originate_request) - sizeof (struct lsa_header)
--    + ntohs (data->length);
--
-   omsg = (struct msg_originate_request *) buf;
-   omsg->ifaddr = ifaddr;
-   omsg->area_id = area_id;
--  memcpy (&omsg->data, data, ntohs (data->length));
-+
-+  omsglen = ntohs (data->length);
-+  if (omsglen > sizeof (buf) - offsetof (struct msg_originate_request, data))
-+    omsglen = sizeof (buf) - offsetof (struct msg_originate_request, data);
-+  memcpy (&omsg->data, data, omsglen);
-+  omsglen += sizeof (struct msg_originate_request) - sizeof (struct lsa_header);
- 
-   return msg_new (MSG_ORIGINATE_REQUEST, omsg, seqnum, omsglen);
- }
-@@ -627,13 +635,16 @@ new_msg_lsa_change_notify (u_char msgtype,
-   assert (data);
- 
-   nmsg = (struct msg_lsa_change_notify *) buf;
--  len = ntohs (data->length) + sizeof (struct msg_lsa_change_notify)
--    - sizeof (struct lsa_header);
-   nmsg->ifaddr = ifaddr;
-   nmsg->area_id = area_id;
-   nmsg->is_self_originated = is_self_originated;
-   memset (&nmsg->pad, 0, sizeof (nmsg->pad));
--  memcpy (&nmsg->data, data, ntohs (data->length));
-+
-+  len = ntohs (data->length);
-+  if (len > sizeof (buf) - offsetof (struct msg_lsa_change_notify, data))
-+    len = sizeof (buf) - offsetof (struct msg_lsa_change_notify, data);
-+  memcpy (&nmsg->data, data, len);
-+  len += sizeof (struct msg_lsa_change_notify) - sizeof (struct lsa_header);
- 
-   return msg_new (msgtype, nmsg, seqnum, len);
- }
--- 
-1.7.5.4
-
diff --git a/meta-networking/recipes-protocols/quagga/files/build-fix-extract.pl-for-cross-compilation.patch b/meta-networking/recipes-protocols/quagga/files/build-fix-extract.pl-for-cross-compilation.patch
deleted file mode 100644
index 7e5beef..0000000
--- a/meta-networking/recipes-protocols/quagga/files/build-fix-extract.pl-for-cross-compilation.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Backport
-
-From ed6e297972318a0070ad4d973401fbc6e0def558 Mon Sep 17 00:00:00 2001
-From: Serj Kalichev <serj.kalichev@gmail.com>
-Date: Fri, 7 Sep 2012 13:29:42 +0400
-Subject: [PATCH] build: fix extract.pl for cross compilation
-
-extract.pl should invoke the C preprocessor for the target system, not the
-host.
-
-* vtysh/extract.pl.in: use @CPP@ to get target cpp
----
- vtysh/extract.pl.in |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/vtysh/extract.pl.in b/vtysh/extract.pl.in
-index 7612aff..4c3a47f 100755
---- a/vtysh/extract.pl.in
-+++ b/vtysh/extract.pl.in
-@@ -63,7 +63,7 @@ $ignore{'"show history"'} = "ignore";
- foreach (@ARGV) {
-     $file = $_;
- 
--    open (FH, "cpp -DHAVE_CONFIG_H -DVTYSH_EXTRACT_PL -DHAVE_IPV6 -I@top_builddir@ -I@srcdir@/ -I@srcdir@/.. -I@top_srcdir@/lib -I@top_srcdir@/isisd/topology @SNMP_INCLUDES@ @CPPFLAGS@ $file |");
-+    open (FH, "@CPP@ -DHAVE_CONFIG_H -DVTYSH_EXTRACT_PL -DHAVE_IPV6 -I@top_builddir@ -I@srcdir@/ -I@srcdir@/.. -I@top_srcdir@/lib -I@top_srcdir@/isisd/topology @SNMP_INCLUDES@ @CPPFLAGS@ $file |");
-     local $/; undef $/;
-     $line = <FH>;
-     close (FH);
--- 
-1.7.1
-
diff --git a/meta-networking/recipes-protocols/quagga/files/fix-for-lib-inpath.patch b/meta-networking/recipes-protocols/quagga/files/fix-for-lib-inpath.patch
deleted file mode 100644
index 50f0ad5..0000000
--- a/meta-networking/recipes-protocols/quagga/files/fix-for-lib-inpath.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-At first this worked, then I tried a clean build in a directory that
-contained lib in it (oe/build/titan-glibc) and vtysh no longer
-worked. It's test for the lib directory was excepting anything
-containing lib.
-
-With this patch you still cannot have lib in the path anywhere, but
-at least things containing lib will now work.
-
---- quagga-0.99.2/vtysh/extract.pl.in	2005/11/16 04:12:04	1.1
-+++ quagga-0.99.2/vtysh/extract.pl.in	2005/11/16 04:12:16
-@@ -89,7 +89,7 @@
- 	$cmd =~ s/\s+$//g;
- 
-         # $protocol is VTYSH_PROTO format for redirection of user input
--    	if ($file =~ /lib/) {
-+    	if ($file =~ /\/lib\//) {
-            if ($file =~ /keychain.c/) {
-               $protocol = "VTYSH_RIPD";
-            }
diff --git a/meta-networking/recipes-protocols/quagga/files/lingering-IP-address-after-deletion-BZ-486.patch b/meta-networking/recipes-protocols/quagga/files/lingering-IP-address-after-deletion-BZ-486.patch
deleted file mode 100644
index 42bdc20..0000000
--- a/meta-networking/recipes-protocols/quagga/files/lingering-IP-address-after-deletion-BZ-486.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 7f062c217b262e362a3362c677dea6c5e820adf1 Mon Sep 17 00:00:00 2001
-From: David Lamparter <equinox@diac24.net>
-Date: Mon, 1 Feb 2010 16:41:26 +0100
-Subject: [PATCH] zebra: lingering IP address after deletion (BZ#486)
-
-Upstream-status: Backport
-
-zebra address bookkeeping is a mess. this is just a workaround to have
-IPv4 address deletion somewhat working on Linux.
-
-the if_unset_prefix call is synchronous, when it returns success the
-address deletion completed successfully. this is either signaled by a
-netlink ACK or by an OK return value from ioctl().
-
-This version is wrapped by #ifdef HAVE_NETLINK so we don't touch the
-BSDs for now.
-
-* zebra/interface.c: On Linux, update zebra internal state after
-  deleting an address.
-
-Signed-off-by: David Lamparter <equinox@opensourcerouting.org>
----
- zebra/interface.c |   21 ++++++++++++++++++---
- 1 file changed, 18 insertions(+), 3 deletions(-)
-
-diff --git a/zebra/interface.c b/zebra/interface.c
-index 2242259..3578b79 100644
---- a/zebra/interface.c
-+++ b/zebra/interface.c
-@@ -1297,13 +1297,28 @@ ip_address_uninstall (struct vty *vty, struct interface *ifp,
- 	       safe_strerror(errno), VTY_NEWLINE);
-       return CMD_WARNING;
-     }
-+  /* success! call returned that the address deletion went through.
-+   * this is a synchronous operation, so we know it succeeded and can
-+   * now update all internal state. */
-+
-+  /* the HAVE_NETLINK check is only here because, on BSD, although the
-+   * call above is still synchronous, we get a second confirmation later
-+   * through the route socket, and we don't want to touch that behaviour
-+   * for now.  It should work without the #ifdef, but why take the risk...
-+   * -- equinox 2012-07-13 */
-+#ifdef HAVE_NETLINK
-+
-+  /* Remove connected route. */
-+  connected_down_ipv4 (ifp, ifc);
- 
--#if 0
-   /* Redistribute this information. */
-   zebra_interface_address_delete_update (ifp, ifc);
- 
--  /* Remove connected route. */
--  connected_down_ipv4 (ifp, ifc);
-+  /* IP address propery set. */
-+  UNSET_FLAG (ifc->conf, ZEBRA_IFC_REAL);
-+
-+  /* remove from interface, remark secondaries */
-+  if_subnet_delete (ifp, ifc);
- 
-   /* Free address information. */
-   listnode_delete (ifp->connected, ifc);
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-protocols/quagga/files/quagga-0.99.17-libcap.patch b/meta-networking/recipes-protocols/quagga/files/quagga-0.99.17-libcap.patch
deleted file mode 100644
index 9563ea2..0000000
--- a/meta-networking/recipes-protocols/quagga/files/quagga-0.99.17-libcap.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 63e97633d01908da6d3776ac61e4033e6fa91e5c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@gmail.com>
-Date: Sun, 5 Sep 2010 18:19:09 +0200
-Subject: [PATCH] build: fix linking position for libcap
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
- * lib/Makefile.am: link libzebra to libcap, since it uses symbols
-   from there.
- * zebra/Makefile.am: no need to link libcap here now, since it's not
-   used directly (libtool with apply transitive dependencies for
-   static linking).
-
-Signed-off-by: Diego Elio Pettenò <flameeyes@gmail.com>
-
-Imported from Gentoo by Paul Eggleton <paul.eggleton@linux.intel.com>
-Upstream-Status: Pending
-
----
- lib/Makefile.am   |    2 +-
- zebra/Makefile.am |    5 ++---
- 2 files changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/lib/Makefile.am b/lib/Makefile.am
-index 315e919..6e69993 100644
---- a/lib/Makefile.am
-+++ b/lib/Makefile.am
-@@ -18,7 +18,7 @@ BUILT_SOURCES = memtypes.h route_types.h
- 
- libzebra_la_DEPENDENCIES = @LIB_REGEX@
- 
--libzebra_la_LIBADD = @LIB_REGEX@
-+libzebra_la_LIBADD = @LIB_REGEX@ $(LIBCAP)
- 
- pkginclude_HEADERS = \
- 	buffer.h checksum.h command.h filter.h getopt.h hash.h \
-diff --git a/zebra/Makefile.am b/zebra/Makefile.am
-index 542f36f..d09a209 100644
---- a/zebra/Makefile.am
-+++ b/zebra/Makefile.am
-@@ -5,7 +5,6 @@ DEFS = @DEFS@ -DSYSCONFDIR=\"$(sysconfdir)/\" -DMULTIPATH_NUM=@MULTIPATH_NUM@
- INSTALL_SDATA=@INSTALL@ -m 600
- 
- LIB_IPV6 = @LIB_IPV6@
--LIBCAP = @LIBCAP@
- 
- ipforward = @IPFORWARD@
- if_method = @IF_METHOD@
-@@ -39,9 +38,9 @@ noinst_HEADERS = \
- 	connected.h ioctl.h rib.h rt.h zserv.h redistribute.h debug.h rtadv.h \
- 	interface.h ipforward.h irdp.h router-id.h kernel_socket.h
- 
--zebra_LDADD = $(otherobj) $(LIBCAP) $(LIB_IPV6) ../lib/libzebra.la
-+zebra_LDADD = $(otherobj) ../lib/libzebra.la $(LIB_IPV6)
- 
--testzebra_LDADD = $(LIBCAP) $(LIB_IPV6) ../lib/libzebra.la
-+testzebra_LDADD = ../lib/libzebra.la $(LIB_IPV6)
- 
- zebra_DEPENDENCIES = $(otherobj)
- 
--- 
-1.7.2.2
-
diff --git a/meta-networking/recipes-protocols/quagga/files/quagga-fix-CVE-2013-6051.patch b/meta-networking/recipes-protocols/quagga/files/quagga-fix-CVE-2013-6051.patch
deleted file mode 100644
index fde9e0c..0000000
--- a/meta-networking/recipes-protocols/quagga/files/quagga-fix-CVE-2013-6051.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-
-From 8794e8d229dc9fe29ea31424883433d4880ef408
-From: Paul Jakma <paul@quagga.net>
-Date: Mon, 13 Feb 2012 13:53:07 +0000
-Subject: bgpd: Fix regression in args consolidation, total should be inited from args
-
-bgpd: Fix regression in args consolidation, total should be inited from args
-
-* bgp_attr.c: (bgp_attr_unknown) total should be initialised from the args.
-
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-
-diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
-index 65af824..839f64d 100644
---- a/bgpd/bgp_attr.c
-+++ b/bgpd/bgp_attr.c
-
-@@ -1646,7 +1646,7 @@
- static bgp_attr_parse_ret_t
- bgp_attr_unknown (struct bgp_attr_parser_args *args)
- {
--  bgp_size_t total;
-+  bgp_size_t total = args->total;
-   struct transit *transit;
-   struct attr_extra *attre;
-   struct peer *const peer = args->peer; 
diff --git a/meta-networking/recipes-protocols/quagga/files/work-with-new-readline.patch b/meta-networking/recipes-protocols/quagga/files/work-with-new-readline.patch
deleted file mode 100644
index 2bd333a..0000000
--- a/meta-networking/recipes-protocols/quagga/files/work-with-new-readline.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 66df315d2a270a254c613a4d2e72c0ea47f15a71 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 27 Mar 2014 09:35:29 +0000
-Subject: [PATCH] vtysh/vtysh.c: works with new readline
-
-The Function and CPPFunction had been removed by in readline 6.3, use
-the new functions to replace them.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- vtysh/vtysh.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/vtysh/vtysh.c b/vtysh/vtysh.c
-index 431c08e..fdd82fb 100644
---- a/vtysh/vtysh.c
-+++ b/vtysh/vtysh.c
-@@ -2212,9 +2212,9 @@ void
- vtysh_readline_init (void)
- {
-   /* readline related settings. */
--  rl_bind_key ('?', (Function *) vtysh_rl_describe);
-+  rl_bind_key ('?', (rl_command_func_t *) vtysh_rl_describe);
-   rl_completion_entry_function = vtysh_completion_entry_function;
--  rl_attempted_completion_function = (CPPFunction *)new_completion;
-+  rl_attempted_completion_function = (rl_completion_func_t *)new_completion;
-   /* do not append space after completion. It will be appended
-    * in new_completion() function explicitly. */
-   rl_completion_append_character = '\0';
--- 
-1.8.3.4
-
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 5ab43b3..7d4211a 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -12,10 +12,8 @@ DEPENDS = "readline ncurses perl-native"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'snmp', 'net-snmp', '', d)}"
 SNMP_CONF="${@base_contains('DISTRO_FEATURES', 'snmp', '--enable-snmp', '', d)}"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
-                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
-
-INC_PR = "r2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=81bcece21748c91ba9992349a91ec11d \
+                    file://COPYING.LIB;md5=01ef24401ded36cd8e5d18bfe947240c"
 
 # the "ip" command from busybox is not sufficient (flush by protocol flushes all routes)
 RDEPENDS_${PN} += "iproute2"
@@ -23,10 +21,7 @@ RDEPENDS_${PN} += "iproute2"
 QUAGGASUBDIR = ""
 # ${QUAGGASUBDIR} is deal with old versions. Set to "/attic" for old
 # versions and leave it empty for recent versions.
-SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz;name=quagga-${PV} \
-           file://fix-for-lib-inpath.patch \
-           file://quagga-0.99.17-libcap.patch \
-           file://quagga-fix-CVE-2013-6051.patch \
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz; \
            file://Zebra-sync-zebra-routing-table-with-the-kernel-one.patch \
            file://quagga.init \
            file://quagga.default \
@@ -36,8 +31,6 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz;name
            file://quagga.pam \
            file://ripd-fix-two-bugs-after-received-SIGHUP.patch \
            file://quagga-Avoid-duplicate-connected-address.patch \
-           file://0001-bgpd-CVE-2012-1820-DoS-in-bgp_capability_orf.patch \
-           file://0001-bgpd-relax-ORF-capability-length-handling.patch \
 "
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
diff --git a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
deleted file mode 100644
index 596d703..0000000
--- a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require quagga.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://0001-doc-fix-makeinfo-errors-and-one-warning.patch \
-            file://lingering-IP-address-after-deletion-BZ-486.patch \
-            file://build-fix-extract.pl-for-cross-compilation.patch \
-            file://babel-close-the-stdout-stderr-as-in-other-daemons.patch \
-            file://work-with-new-readline.patch \
-            file://0001-ospfd-CVE-2013-2236-stack-overrun-in-apiserver.patch \
-"
-
-SRC_URI[quagga-0.99.21.md5sum] = "99840adbe57047c90dfba6b6ed9aec7f"
-SRC_URI[quagga-0.99.21.sha256sum] = "9b8aea9026b4771a28e254a66cbd854723bcd0d71eebd0201d11838d4eb392ee"
-
-QUAGGASUBDIR = ""
diff --git a/meta-networking/recipes-protocols/quagga/quagga_0.99.23.bb b/meta-networking/recipes-protocols/quagga/quagga_0.99.23.bb
new file mode 100644
index 0000000..a56767e
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/quagga_0.99.23.bb
@@ -0,0 +1,9 @@
+require quagga.inc
+
+SRC_URI += "file://babel-close-the-stdout-stderr-as-in-other-daemons.patch \
+"
+
+SRC_URI[md5sum] = "d17145e62b6ea14f0f13bb63f59e5166"
+SRC_URI[sha256sum] = "2c7798204f35dc7acea9f206647e8aa3957cae3b21733cdff413b506481a101c"
+
+QUAGGASUBDIR = ""
-- 
1.7.10.4


