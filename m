Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB9D66ABDA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 02:24:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5G2Ok0A004560
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jun 2014 19:24:47 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 15 Jun 2014 19:24:46 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 15 Jun 2014 22:24:44 -0400
Message-ID: <1402885484-31549-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] quagga: Security Advisory - CVE-2012-1820
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
X-List-Received-Date: Mon, 16 Jun 2014 02:24:49 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The bgp_capability_orf function in bgpd in Quagga 0.99.20.1 and earlier
allows remote attackers to cause a denial of service (assertion failure
and daemon exit) by leveraging a BGP peering relationship and sending a
malformed Outbound Route Filtering (ORF) capability TLV in an OPEN
message.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-1820

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...d-CVE-2012-1820-DoS-in-bgp_capability_orf.patch | 87 ++++++++++++++++++++++
 ...bgpd-relax-ORF-capability-length-handling.patch | 42 +++++++++++
 .../recipes-protocols/quagga/quagga.inc            |  2 +
 3 files changed, 131 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/0001-bgpd-CVE-2012-1820-DoS-in-bgp_capability_orf.patch
 create mode 100644 meta-networking/recipes-protocols/quagga/files/0001-bgpd-relax-ORF-capability-length-handling.patch

diff --git a/meta-networking/recipes-protocols/quagga/files/0001-bgpd-CVE-2012-1820-DoS-in-bgp_capability_orf.patch b/meta-networking/recipes-protocols/quagga/files/0001-bgpd-CVE-2012-1820-DoS-in-bgp_capability_orf.patch
new file mode 100644
index 0000000..5a2ee1b
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/0001-bgpd-CVE-2012-1820-DoS-in-bgp_capability_orf.patch
@@ -0,0 +1,87 @@
+From fe9bb6459afe0d55e56619cdc5061d8407cd1f15 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <infrastation@yandex.ru>
+Date: Thu, 19 Apr 2012 20:34:13 +0400
+Subject: [PATCH] bgpd: CVE-2012-1820, DoS in bgp_capability_orf()
+
+Upstream-Status: Backport
+
+An ORF (code 3) capability TLV is defined to contain exactly one
+AFI/SAFI block. Function bgp_capability_orf(), which parses ORF
+capability TLV, uses do-while cycle to call its helper function
+bgp_capability_orf_entry(), which actually processes the AFI/SAFI data
+block. The call is made at least once and repeated as long as the input
+buffer has enough data for the next call.
+
+The helper function, bgp_capability_orf_entry(), uses "Number of ORFs"
+field of the provided AFI/SAFI block to verify, if it fits the input
+buffer. However, the check is made based on the total length of the ORF
+TLV regardless of the data already consumed by the previous helper
+function call(s). This way, the check condition is only valid for the
+first AFI/SAFI block inside an ORF capability TLV.
+
+For the subsequent calls of the helper function, if any are made, the
+check condition may erroneously tell, that the current "Number of ORFs"
+field fits the buffer boundary, where in fact it does not. This makes it
+possible to trigger an assertion by feeding an OPEN message with a
+specially-crafted malformed ORF capability TLV.
+
+This commit fixes the vulnerability by making the implementation follow
+the spec.
+---
+ bgpd/bgp_open.c |   26 ++------------------------
+ 1 files changed, 2 insertions(+), 24 deletions(-)
+
+diff --git a/bgpd/bgp_open.c b/bgpd/bgp_open.c
+index d045dde..af711cc 100644
+--- a/bgpd/bgp_open.c
++++ b/bgpd/bgp_open.c
+@@ -230,7 +230,7 @@ bgp_capability_orf_entry (struct peer *peer, struct capability_header *hdr)
+     }
+   
+   /* validate number field */
+-  if (sizeof (struct capability_orf_entry) + (entry.num * 2) > hdr->length)
++  if (sizeof (struct capability_orf_entry) + (entry.num * 2) != hdr->length)
+     {
+       zlog_info ("%s ORF Capability entry length error,"
+                  " Cap length %u, num %u",
+@@ -334,28 +334,6 @@ bgp_capability_orf_entry (struct peer *peer, struct capability_header *hdr)
+ }
+ 
+ static int
+-bgp_capability_orf (struct peer *peer, struct capability_header *hdr)
+-{
+-  struct stream *s = BGP_INPUT (peer);
+-  size_t end = stream_get_getp (s) + hdr->length;
+-  
+-  assert (stream_get_getp(s) + sizeof(struct capability_orf_entry) <= end);
+-  
+-  /* We must have at least one ORF entry, as the caller has already done
+-   * minimum length validation for the capability code - for ORF there must
+-   * at least one ORF entry (header and unknown number of pairs of bytes).
+-   */
+-  do
+-    {
+-      if (bgp_capability_orf_entry (peer, hdr) == -1)
+-        return -1;
+-    } 
+-  while (stream_get_getp(s) + sizeof(struct capability_orf_entry) < end);
+-  
+-  return 0;
+-}
+-
+-static int
+ bgp_capability_restart (struct peer *peer, struct capability_header *caphdr)
+ {
+   struct stream *s = BGP_INPUT (peer);
+@@ -573,7 +551,7 @@ bgp_capability_parse (struct peer *peer, size_t length, int *mp_capability,
+             break;
+           case CAPABILITY_CODE_ORF:
+           case CAPABILITY_CODE_ORF_OLD:
+-            if (bgp_capability_orf (peer, &caphdr))
++            if (bgp_capability_orf_entry (peer, &caphdr))
+               return -1;
+             break;
+           case CAPABILITY_CODE_RESTART:
+-- 
+1.7.5.4
+
diff --git a/meta-networking/recipes-protocols/quagga/files/0001-bgpd-relax-ORF-capability-length-handling.patch b/meta-networking/recipes-protocols/quagga/files/0001-bgpd-relax-ORF-capability-length-handling.patch
new file mode 100644
index 0000000..0ec02dc
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/0001-bgpd-relax-ORF-capability-length-handling.patch
@@ -0,0 +1,42 @@
+From 5e728e929942d39ce5a4ab3d01c33f7b688c4e3f Mon Sep 17 00:00:00 2001
+From: David Lamparter <equinox@opensourcerouting.org>
+Date: Wed, 23 Jan 2013 05:50:24 +0100
+Subject: [PATCH] bgpd: relax ORF capability length handling
+
+Upstream-Status: Backport
+
+commit fe9bb64... "bgpd: CVE-2012-1820, DoS in bgp_capability_orf()"
+made the length test in bgp_capability_orf_entry() stricter and is now
+causing us to refuse (with CEASE) ORF capabilites carrying any excess
+data.  This does not conform to the robustness principle as laid out by
+RFC1122 ("be liberal in what you accept").
+
+Even worse, RFC5291 is quite unclear on how to use the ORF capability
+with multiple AFI/SAFIs.  It can be interpreted as either "use one
+instance, stuff everything in" but also as "use multiple instances".
+So, if not for applying robustness, we end up clearing sessions from
+implementations going by the former interpretation.  (or if anyone dares
+add a byte of padding...)
+
+Cc: Denis Ovsienko <infrastation@yandex.ru>
+Signed-off-by: David Lamparter <equinox@opensourcerouting.org>
+---
+ bgpd/bgp_open.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/bgpd/bgp_open.c b/bgpd/bgp_open.c
+index af711cc..7bf3501 100644
+--- a/bgpd/bgp_open.c
++++ b/bgpd/bgp_open.c
+@@ -230,7 +230,7 @@ bgp_capability_orf_entry (struct peer *peer, struct capability_header *hdr)
+     }
+   
+   /* validate number field */
+-  if (sizeof (struct capability_orf_entry) + (entry.num * 2) != hdr->length)
++  if (sizeof (struct capability_orf_entry) + (entry.num * 2) > hdr->length)
+     {
+       zlog_info ("%s ORF Capability entry length error,"
+                  " Cap length %u, num %u",
+-- 
+1.7.5.4
+
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 5eeb18b..5ab43b3 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -36,6 +36,8 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz;name
            file://quagga.pam \
            file://ripd-fix-two-bugs-after-received-SIGHUP.patch \
            file://quagga-Avoid-duplicate-connected-address.patch \
+           file://0001-bgpd-CVE-2012-1820-DoS-in-bgp_capability_orf.patch \
+           file://0001-bgpd-relax-ORF-capability-length-handling.patch \
 "
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
-- 
2.0.0


