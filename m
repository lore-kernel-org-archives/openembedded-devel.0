Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 916D560657
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 23:37:48 +0000 (UTC)
Received: by pabla5 with SMTP id la5so8898367pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 16:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HIc4so5N+pqgfAx8Ad+8Eq/bdl/QVxKIUCT9LwJMTj8=;
	b=fcZbShKy6+f0v5SjemgLwJ46WSA67yf9GXVp/a7CKXX8ovigiOWIGXVnCyRTroXgak
	sGvH8kEiIB2PEi6XGCZoMUCSivvUK1PPrZTLmnd3TzDYtrOMBGbhqSPwzYPGNXylS3Bo
	IYFGYzyPFCJm/NlQEhR6CRM9c9xGmE6wWoDi3g5qV7nxalvyy92VS0zEQmm4lil3v2RE
	9s+SGExyuCeNWr1DzH381nuPZeUM3vAXC8f16303E6hy3fIGuYJRm/Zf4NtQaRBCOUQf
	nGWFiDukqRbx/brNK0rrF9svzq3sxPVjINUu3BQHefnu4Nb9hnPhaRPdoNs9JxuKKtxn
	WHFQ==
X-Received: by 10.68.190.5 with SMTP id gm5mr24381283pbc.81.1445902668784;
	Mon, 26 Oct 2015 16:37:48 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	nu5sm35910139pbb.65.2015.10.26.16.37.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Oct 2015 16:37:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Oct 2015 16:37:44 -0700
Message-Id: <1445902664-940-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][fido][dizzy][PATCH] squid: serveral missing security fixes
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
X-List-Received-Date: Mon, 26 Oct 2015 23:37:50 -0000

From: Armin Kuster <akuster@mvista.com>

SQUID-2015:2 - Squid-3.4 and older versions are not vulnerable.
CVE-2015-5400
CVE-2015-3455
CVE-2014-7142
CVE-2014-7141
CVE-2014-6270

see http://www.squid-cache.org/Advisories/

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../squid/files/CVE-2014-6270.patch                |  61 +++++
 .../squid/files/CVE-2014-7141_CVE-2014-7142.patch  | 282 ++++++++++++++++++++
 .../squid/files/CVE-2015-3455.patch                |  53 ++++
 .../squid/files/CVE-2015-5400.patch                | 292 +++++++++++++++++++++
 .../recipes-daemons/squid/squid_3.4.7.bb           |   4 +
 5 files changed, 692 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2014-6270.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2014-7141_CVE-2014-7142.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2015-3455.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2015-5400.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2014-6270.patch b/meta-networking/recipes-daemons/squid/files/CVE-2014-6270.patch
new file mode 100644
index 0000000..8f87634
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2014-6270.patch
@@ -0,0 +1,61 @@
+Fix: CVE-2014-3609
+
+revno: 13172
+revision-id: squid3@treenet.co.nz-20140915045834-qo85nnsinp9wu4gt
+parent: squid3@treenet.co.nz-20140827142207-n6y0r0iuv4sq6hvg
+author: Sebastian Krahmer <krahmer@suse.com>
+committer: Amos Jeffries <squid3@treenet.co.nz>
+branch nick: 3.4
+timestamp: Sun 2014-09-14 22:58:34 -0600
+message:
+  Fix off by one in SNMP subsystem
+------------------------------------------------------------
+# Bazaar merge directive format 2 (Bazaar 0.90)
+# revision_id: squid3@treenet.co.nz-20140915045834-qo85nnsinp9wu4gt
+# target_branch: http://bzr.squid-cache.org/bzr/squid3/3.4
+# testament_sha1: 72ffc18d9c25a0412efc813dc5cde1c63e8ebe46
+# timestamp: 2014-09-15 11:08:17 +0000
+# source_branch: http://bzr.squid-cache.org/bzr/squid3/3.4
+# base_revision_id: squid3@treenet.co.nz-20140827142207-\
+#   n6y0r0iuv4sq6hvg
+# 
+# Begin patch
+
+Upstream-Status: Backport
+
+http://www.squid-cache.org/Versions/v3/3.4/changesets/squid-3.4-13172.patch
+
+Signed-of-by: Armin Kuster <akuster@mvista.com>
+
+=== modified file 'src/snmp_core.cc'
+--- a/src/snmp_core.cc	2014-02-18 08:46:49 +0000
++++ b/src/snmp_core.cc	2014-09-15 04:58:34 +0000
+@@ -362,7 +362,7 @@
+ void
+ snmpHandleUdp(int sock, void *not_used)
+ {
+-    LOCAL_ARRAY(char, buf, SNMP_REQUEST_SIZE);
++    static char buf[SNMP_REQUEST_SIZE];
+     Ip::Address from;
+     SnmpRequest *snmp_rq;
+     int len;
+@@ -371,16 +371,11 @@
+ 
+     Comm::SetSelect(sock, COMM_SELECT_READ, snmpHandleUdp, NULL, 0);
+ 
+-    memset(buf, '\0', SNMP_REQUEST_SIZE);
++    memset(buf, '\0', sizeof(buf));
+ 
+-    len = comm_udp_recvfrom(sock,
+-                            buf,
+-                            SNMP_REQUEST_SIZE,
+-                            0,
+-                            from);
++    len = comm_udp_recvfrom(sock, buf, sizeof(buf)-1, 0, from);
+ 
+     if (len > 0) {
+-        buf[len] = '\0';
+         debugs(49, 3, "snmpHandleUdp: FD " << sock << ": received " << len << " bytes from " << from << ".");
+ 
+         snmp_rq = (SnmpRequest *)xcalloc(1, sizeof(SnmpRequest));
+
diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2014-7141_CVE-2014-7142.patch b/meta-networking/recipes-daemons/squid/files/CVE-2014-7141_CVE-2014-7142.patch
new file mode 100644
index 0000000..5d4c620
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2014-7141_CVE-2014-7142.patch
@@ -0,0 +1,282 @@
+Fix: CVE-2014-7141 CVE-2014-7142
+
+revno: 13173
+revision-id: squid3@treenet.co.nz-20140915050614-6uo8tfwrpbrd47kw
+parent: squid3@treenet.co.nz-20140915045834-qo85nnsinp9wu4gt
+author: Amos Jeffries <squid3@treenet.co.nz>, Sebastian Krahmer <krahmer@suse.com>
+committer: Amos Jeffries <squid3@treenet.co.nz>
+branch nick: 3.4
+timestamp: Sun 2014-09-14 23:06:14 -0600
+message:
+  Fix various ICMP handling issues in Squid pinger
+  
+  * ICMP code type logging display could over-read the registered type
+    string arrays.
+  
+  * Malformed ICMP packets were accepted into processing with undefined
+    and potentially nasty results.
+  
+  Both sets of flaws can result in pinger segmentation fault and halting
+  the Squid functionality relying on pinger for correct operation.
+  
+   Thanks to the OpenSUSE project for analysis and resolution of these.
+------------------------------------------------------------
+# Bazaar merge directive format 2 (Bazaar 0.90)
+# revision_id: squid3@treenet.co.nz-20140915050614-6uo8tfwrpbrd47kw
+# target_branch: http://bzr.squid-cache.org/bzr/squid3/3.4
+# testament_sha1: 234c1592673c5317e1b323018226e04941cc61a8
+# timestamp: 2014-09-15 11:08:18 +0000
+# source_branch: http://bzr.squid-cache.org/bzr/squid3/3.4
+# base_revision_id: squid3@treenet.co.nz-20140915045834-\
+#   qo85nnsinp9wu4gt
+# 
+# Begin patch
+
+Upstream-Status: Backport
+
+http://www.squid-cache.org/Versions/v3/3.4/changesets/squid-3.4-13173.patch
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+=== modified file 'src/icmp/Icmp4.cc'
+--- a/src/icmp/Icmp4.cc	2013-06-03 14:05:16 +0000
++++ b/src/icmp/Icmp4.cc	2014-09-15 05:06:14 +0000
+@@ -41,26 +41,38 @@
+ #include "IcmpPinger.h"
+ #include "Debug.h"
+ 
+-const char *icmpPktStr[] = {
+-    "Echo Reply",
+-    "ICMP 1",
+-    "ICMP 2",
+-    "Destination Unreachable",
+-    "Source Quench",
+-    "Redirect",
+-    "ICMP 6",
+-    "ICMP 7",
+-    "Echo",
+-    "ICMP 9",
+-    "ICMP 10",
+-    "Time Exceeded",
+-    "Parameter Problem",
+-    "Timestamp",
+-    "Timestamp Reply",
+-    "Info Request",
+-    "Info Reply",
+-    "Out of Range Type"
+-};
++static const char *
++IcmpPacketType(uint8_t v)
++{
++    static const char *icmpPktStr[] = {
++        "Echo Reply",
++        "ICMP 1",
++        "ICMP 2",
++        "Destination Unreachable",
++        "Source Quench",
++        "Redirect",
++        "ICMP 6",
++        "ICMP 7",
++        "Echo",
++        "ICMP 9",
++        "ICMP 10",
++        "Time Exceeded",
++        "Parameter Problem",
++        "Timestamp",
++        "Timestamp Reply",
++        "Info Request",
++        "Info Reply",
++        "Out of Range Type"
++    };
++
++    if (v > 17) {
++        static char buf[50];
++        snprintf(buf, sizeof(buf), "ICMP %u (invalid)", v);
++        return buf;
++    }
++
++    return icmpPktStr[v];
++}
+ 
+ Icmp4::Icmp4() : Icmp()
+ {
+@@ -187,6 +199,12 @@
+                  from->ai_addr,
+                  &from->ai_addrlen);
+ 
++    if (n <= 0) {
++        debugs(42, DBG_CRITICAL, HERE << "Error when calling recvfrom() on ICMP socket.");
++        Ip::Address::FreeAddrInfo(from);
++        return;
++    }
++
+     preply.from = *from;
+ 
+ #if GETTIMEOFDAY_NO_TZP
+@@ -243,9 +261,15 @@
+ 
+     preply.psize = n - iphdrlen - (sizeof(icmpEchoData) - MAX_PKT4_SZ);
+ 
++    if (preply.psize < 0) {
++        debugs(42, DBG_CRITICAL, HERE << "Malformed ICMP packet.");
++        Ip::Address::FreeAddrInfo(from);
++        return;
++    }
++
+     control.SendResult(preply, (sizeof(pingerReplyData) - MAX_PKT4_SZ + preply.psize) );
+ 
+-    Log(preply.from, icmp->icmp_type, icmpPktStr[icmp->icmp_type], preply.rtt, preply.hops);
++    Log(preply.from, icmp->icmp_type, IcmpPacketType(icmp->icmp_type), preply.rtt, preply.hops);
+     Ip::Address::FreeAddrInfo(from);
+ }
+ 
+
+=== modified file 'src/icmp/Icmp6.cc'
+--- a/src/icmp/Icmp6.cc	2013-06-03 14:05:16 +0000
++++ b/src/icmp/Icmp6.cc	2014-09-15 05:06:14 +0000
+@@ -50,57 +50,61 @@
+ 
+ // Icmp6 OP-Codes
+ // see http://www.iana.org/assignments/icmpv6-parameters
+-// NP: LowPktStr is for codes 0-127
+-static const char *icmp6LowPktStr[] = {
+-    "ICMP 0",			// 0
+-    "Destination Unreachable",	// 1 - RFC2463
+-    "Packet Too Big", 		// 2 - RFC2463
+-    "Time Exceeded",		// 3 - RFC2463
+-    "Parameter Problem",		// 4 - RFC2463
+-    "ICMP 5",			// 5
+-    "ICMP 6",			// 6
+-    "ICMP 7",			// 7
+-    "ICMP 8",			// 8
+-    "ICMP 9",			// 9
+-    "ICMP 10"			// 10
+-};
+-
+-// NP: HighPktStr is for codes 128-255
+-static const char *icmp6HighPktStr[] = {
+-    "Echo Request",					// 128 - RFC2463
+-    "Echo Reply",					// 129 - RFC2463
+-    "Multicast Listener Query",			// 130 - RFC2710
+-    "Multicast Listener Report",			// 131 - RFC2710
+-    "Multicast Listener Done",			// 132 - RFC2710
+-    "Router Solicitation",				// 133 - RFC4861
+-    "Router Advertisement",				// 134 - RFC4861
+-    "Neighbor Solicitation",			// 135 - RFC4861
+-    "Neighbor Advertisement",			// 136 - RFC4861
+-    "Redirect Message",				// 137 - RFC4861
+-    "Router Renumbering",				// 138 - Crawford
+-    "ICMP Node Information Query",			// 139 - RFC4620
+-    "ICMP Node Information Response",		// 140 - RFC4620
+-    "Inverse Neighbor Discovery Solicitation",	// 141 - RFC3122
+-    "Inverse Neighbor Discovery Advertisement",	// 142 - RFC3122
+-    "Version 2 Multicast Listener Report",		// 143 - RFC3810
+-    "Home Agent Address Discovery Request",		// 144 - RFC3775
+-    "Home Agent Address Discovery Reply",		// 145 - RFC3775
+-    "Mobile Prefix Solicitation",			// 146 - RFC3775
+-    "Mobile Prefix Advertisement",			// 147 - RFC3775
+-    "Certification Path Solicitation",		// 148 - RFC3971
+-    "Certification Path Advertisement",		// 149 - RFC3971
+-    "ICMP Experimental (150)",			// 150 - RFC4065
+-    "Multicast Router Advertisement",		// 151 - RFC4286
+-    "Multicast Router Solicitation",		// 152 - RFC4286
+-    "Multicast Router Termination",			// 153 - [RFC4286]
+-    "ICMP 154",
+-    "ICMP 155",
+-    "ICMP 156",
+-    "ICMP 157",
+-    "ICMP 158",
+-    "ICMP 159",
+-    "ICMP 160"
+-};
++static const char *
++IcmpPacketType(uint8_t v)
++{
++    // NP: LowPktStr is for codes 0-127
++    static const char *icmp6LowPktStr[] = {
++        "ICMPv6 0",			// 0
++        "Destination Unreachable",	// 1 - RFC2463
++        "Packet Too Big", 		// 2 - RFC2463
++        "Time Exceeded",		// 3 - RFC2463
++        "Parameter Problem",		// 4 - RFC2463
++    };
++
++    // low codes 1-4 registered
++    if (0 < v && v < 5)
++        return icmp6LowPktStr[(int)(v&0x7f)];
++
++    // NP: HighPktStr is for codes 128-255
++    static const char *icmp6HighPktStr[] = {
++        "Echo Request",					// 128 - RFC2463
++        "Echo Reply",					// 129 - RFC2463
++        "Multicast Listener Query",			// 130 - RFC2710
++        "Multicast Listener Report",			// 131 - RFC2710
++        "Multicast Listener Done",			// 132 - RFC2710
++        "Router Solicitation",				// 133 - RFC4861
++        "Router Advertisement",				// 134 - RFC4861
++        "Neighbor Solicitation",			// 135 - RFC4861
++        "Neighbor Advertisement",			// 136 - RFC4861
++        "Redirect Message",				// 137 - RFC4861
++        "Router Renumbering",				// 138 - Crawford
++        "ICMP Node Information Query",			// 139 - RFC4620
++        "ICMP Node Information Response",		// 140 - RFC4620
++        "Inverse Neighbor Discovery Solicitation",	// 141 - RFC3122
++        "Inverse Neighbor Discovery Advertisement",	// 142 - RFC3122
++        "Version 2 Multicast Listener Report",		// 143 - RFC3810
++        "Home Agent Address Discovery Request",		// 144 - RFC3775
++        "Home Agent Address Discovery Reply",		// 145 - RFC3775
++        "Mobile Prefix Solicitation",			// 146 - RFC3775
++        "Mobile Prefix Advertisement",			// 147 - RFC3775
++        "Certification Path Solicitation",		// 148 - RFC3971
++        "Certification Path Advertisement",		// 149 - RFC3971
++        "ICMP Experimental (150)",			// 150 - RFC4065
++        "Multicast Router Advertisement",		// 151 - RFC4286
++        "Multicast Router Solicitation",		// 152 - RFC4286
++        "Multicast Router Termination",			// 153 - [RFC4286]
++    };
++
++    // high codes 127-153 registered
++    if (127 < v && v < 154)
++        return icmp6HighPktStr[(int)(v&0x7f)];
++
++    // give all others a generic display
++    static char buf[50];
++    snprintf(buf, sizeof(buf), "ICMPv6 %u", v);
++    return buf;
++}
+ 
+ Icmp6::Icmp6() : Icmp()
+ {
+@@ -236,6 +240,12 @@
+                  from->ai_addr,
+                  &from->ai_addrlen);
+ 
++    if (n <= 0) {
++        debugs(42, DBG_CRITICAL, HERE << "Error when calling recvfrom() on ICMPv6 socket.");
++        Ip::Address::FreeAddrInfo(from);
++        return;
++    }
++
+     preply.from = *from;
+ 
+ #if GETTIMEOFDAY_NO_TZP
+@@ -291,8 +301,7 @@
+ 
+         default:
+             debugs(42, 8, HERE << preply.from << " said: " << icmp6header->icmp6_type << "/" << (int)icmp6header->icmp6_code << " " <<
+-                   ( icmp6header->icmp6_type&0x80 ? icmp6HighPktStr[(int)(icmp6header->icmp6_type&0x7f)] : icmp6LowPktStr[(int)(icmp6header->icmp6_type&0x7f)] )
+-                  );
++                   IcmpPacketType(icmp6header->icmp6_type));
+         }
+         Ip::Address::FreeAddrInfo(from);
+         return;
+@@ -331,7 +340,7 @@
+ 
+     Log(preply.from,
+         icmp6header->icmp6_type,
+-        ( icmp6header->icmp6_type&0x80 ? icmp6HighPktStr[(int)(icmp6header->icmp6_type&0x7f)] : icmp6LowPktStr[(int)(icmp6header->icmp6_type&0x7f)] ),
++        IcmpPacketType(icmp6header->icmp6_type),
+         preply.rtt,
+         preply.hops);
+ 
+
diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2015-3455.patch b/meta-networking/recipes-daemons/squid/files/CVE-2015-3455.patch
new file mode 100644
index 0000000..409f9a7
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2015-3455.patch
@@ -0,0 +1,53 @@
+Fix: CVE-2015-3455
+
+------------------------------------------------------------
+revno: 13222
+revision-id: squid3@treenet.co.nz-20150501071651-songz1j26frb2ytz
+parent: squid3@treenet.co.nz-20150501071104-vd21fu43lvmqoqwa
+author: Amos Jeffries <amosjeffries@squid-cache.org>, Christos Tsantilas <chtsanti@users.sourceforge.net>
+committer: Amos Jeffries <squid3@treenet.co.nz>
+branch nick: 3.4
+timestamp: Fri 2015-05-01 00:16:51 -0700
+message:
+  Fix X509 server certificate domain matching
+  
+  The X509 certificate domain fields may contain non-ASCII encodings.
+  Ensure the domain match algorithm is only passed UTF-8 ASCII-compatible
+  strings.
+------------------------------------------------------------
+# Bazaar merge directive format 2 (Bazaar 0.90)
+# revision_id: squid3@treenet.co.nz-20150501071651-songz1j26frb2ytz
+# target_branch: http://bzr.squid-cache.org/bzr/squid3/3.4
+# testament_sha1: e38694c3e222c506740510557d2a7a122786225c
+# timestamp: 2015-05-01 07:17:25 +0000
+# source_branch: http://bzr.squid-cache.org/bzr/squid3/3.4
+# base_revision_id: squid3@treenet.co.nz-20150501071104-\
+#   vd21fu43lvmqoqwa
+# 
+# Begin patch
+
+Upstream-Status: Backport
+
+http://www.squid-cache.org/Versions/v3/3.4/changesets/squid-3.4-13222.patch
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+=== modified file 'src/ssl/support.cc'
+--- a/src/ssl/support.cc	2015-01-24 05:07:58 +0000
++++ b/src/ssl/support.cc	2015-05-01 07:16:51 +0000
+@@ -209,7 +209,13 @@
+     if (cn_data->length > (int)sizeof(cn) - 1) {
+         return 1; //if does not fit our buffer just ignore
+     }
+-    memcpy(cn, cn_data->data, cn_data->length);
++    char *s = reinterpret_cast<char*>(cn_data->data);
++    char *d = cn;
++    for (int i = 0; i < cn_data->length; ++i, ++d, ++s) {
++        if (*s == '\0')
++            return 1; // always a domain mismatch. contains 0x00
++        *d = *s;
++    }
+     cn[cn_data->length] = '\0';
+     debugs(83, 4, "Verifying server domain " << server << " to certificate name/subjectAltName " << cn);
+     return matchDomainName(server, cn[0] == '*' ? cn + 1 : cn);
+
diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2015-5400.patch b/meta-networking/recipes-daemons/squid/files/CVE-2015-5400.patch
new file mode 100644
index 0000000..41af2b1
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2015-5400.patch
@@ -0,0 +1,292 @@
+Fix: CVE-2015-5400
+
+------------------------------------------------------------
+revno: 13225
+revision-id: squid3@treenet.co.nz-20150709032133-qg1patn5zngt4o4h
+parent: squid3@treenet.co.nz-20150501100500-3utkhrao1yrd8ig6
+author: Alex Rousskov <rousskov@measurement-factory.com>
+committer: Amos Jeffries <squid3@treenet.co.nz>
+branch nick: 3.4
+timestamp: Wed 2015-07-08 20:21:33 -0700
+message:
+  Do not blindly forward cache peer CONNECT responses.
+  
+  Squid blindly forwards cache peer CONNECT responses to clients. This
+  may break things if the peer responds with something like HTTP 403
+  (Forbidden) and keeps the connection with Squid open:
+    -  The client application issues a CONNECT request.
+    -  Squid forwards this request to a cache peer.
+    -  Cache peer correctly responds back with a "403 Forbidden".
+    -  Squid does not parse cache peer response and
+       just forwards it as if it was a Squid response to the client.
+    -  The TCP connections are not closed.
+  
+  At this stage, Squid is unaware that the CONNECT request has failed. All
+  subsequent requests on the user agent TCP connection are treated as
+  tunnelled traffic. Squid is forwarding these requests to the peer on the
+  TCP connection previously used for the 403-ed CONNECT request, without
+  proper processing. The additional headers which should have been applied
+  by Squid to these requests are not applied, and the requests are being
+  forwarded to the cache peer even though the Squid configuration may
+  state that these requests must go directly to the origin server.
+  
+  This fixes Squid to parse cache peer responses, and if an error response
+  found, respond with "502 Bad Gateway" to the client and close the
+  connections.
+------------------------------------------------------------
+# Bazaar merge directive format 2 (Bazaar 0.90)
+# revision_id: squid3@treenet.co.nz-20150709032133-qg1patn5zngt4o4h
+# target_branch: http://bzr.squid-cache.org/bzr/squid3/3.4
+# testament_sha1: 6cbce093f30c8a09173eb610eaa423c7c305ff23
+# timestamp: 2015-07-09 03:40:35 +0000
+# source_branch: http://bzr.squid-cache.org/bzr/squid3/3.4
+# base_revision_id: squid3@treenet.co.nz-20150501100500-\
+#   3utkhrao1yrd8ig6
+# 
+# Begin patch
+
+Upstream-Status: Backport
+http://www.squid-cache.org/Versions/v3/3.4/changesets/squid-3.4-13225.patch
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+=== modified file 'src/tunnel.cc'
+--- a/src/tunnel.cc	2014-04-26 10:58:22 +0000
++++ b/src/tunnel.cc	2015-07-09 03:21:33 +0000
+@@ -122,6 +122,10 @@
+                  (request->flags.interceptTproxy || request->flags.intercepted));
+     }
+ 
++    /// Sends "502 Bad Gateway" error response to the client,
++    /// if it is waiting for Squid CONNECT response, closing connections.
++    void informUserOfPeerError(const char *errMsg);
++
+     class Connection
+     {
+ 
+@@ -139,13 +143,14 @@
+ 
+         void error(int const xerrno);
+         int debugLevelForError(int const xerrno) const;
+-        /// handles a non-I/O error associated with this Connection
+-        void logicError(const char *errMsg);
+         void closeIfOpen();
+         void dataSent (size_t amount);
++        /// writes 'b' buffer, setting the 'writer' member to 'callback'.
++        void write(const char *b, int size, AsyncCall::Pointer &callback, FREE * free_func);
+         int len;
+         char *buf;
+         int64_t *size_ptr;		/* pointer to size in an ConnStateData for logging */
++        AsyncCall::Pointer writer; ///< pending Comm::Write callback
+ 
+         Comm::ConnectionPointer conn;    ///< The currently connected connection.
+ 
+@@ -195,13 +200,14 @@
+     TunnelStateData *tunnelState = (TunnelStateData *)params.data;
+     debugs(26, 3, HERE << tunnelState->server.conn);
+     tunnelState->server.conn = NULL;
++    tunnelState->server.writer = NULL;
+ 
+     if (tunnelState->noConnections()) {
+         delete tunnelState;
+         return;
+     }
+ 
+-    if (!tunnelState->server.len) {
++    if (!tunnelState->client.writer) {
+         tunnelState->client.conn->close();
+         return;
+     }
+@@ -213,13 +219,14 @@
+     TunnelStateData *tunnelState = (TunnelStateData *)params.data;
+     debugs(26, 3, HERE << tunnelState->client.conn);
+     tunnelState->client.conn = NULL;
++    tunnelState->client.writer = NULL;
+ 
+     if (tunnelState->noConnections()) {
+         delete tunnelState;
+         return;
+     }
+ 
+-    if (!tunnelState->client.len) {
++    if (!tunnelState->server.writer) {
+         tunnelState->server.conn->close();
+         return;
+     }
+@@ -343,6 +350,23 @@
+         handleConnectResponse(len);
+ }
+ 
++void
++TunnelStateData::informUserOfPeerError(const char *errMsg)
++{
++    server.len = 0;
++    if (!clientExpectsConnectResponse()) {
++        // closing the connection is the best we can do here
++        debugs(50, 3, server.conn << " closing on error: " << errMsg);
++        server.conn->close();
++        return;
++    }
++    ErrorState *err  = new ErrorState(ERR_CONNECT_FAIL, Http::scBadGateway, request.getRaw());
++    err->callback = tunnelErrorComplete;
++    err->callback_data = this;
++    *status_ptr = Http::scBadGateway;
++    errorSend(http->getConn()->clientConnection, err);
++}
++
+ /* Read from client side and queue it for writing to the server */
+ void
+ TunnelStateData::ReadConnectResponseDone(const Comm::ConnectionPointer &, char *buf, size_t len, comm_err_t errcode, int xerrno, void *data)
+@@ -374,7 +398,7 @@
+     const bool parsed = rep.parse(connectRespBuf, eof, &parseErr);
+     if (!parsed) {
+         if (parseErr > 0) { // unrecoverable parsing error
+-            server.logicError("malformed CONNECT response from peer");
++            informUserOfPeerError("malformed CONNECT response from peer");
+             return;
+         }
+ 
+@@ -383,7 +407,7 @@
+         assert(!parseErr);
+ 
+         if (!connectRespBuf->hasSpace()) {
+-            server.logicError("huge CONNECT response from peer");
++            informUserOfPeerError("huge CONNECT response from peer");
+             return;
+         }
+ 
+@@ -397,7 +421,8 @@
+ 
+     // bail if we did not get an HTTP 200 (Connection Established) response
+     if (rep.sline.status() != Http::scOkay) {
+-        server.logicError("unsupported CONNECT response status code");
++        // if we ever decide to reuse the peer connection, we must extract the error response first
++        informUserOfPeerError("unsupported CONNECT response status code");
+         return;
+     }
+ 
+@@ -416,13 +441,6 @@
+ }
+ 
+ void
+-TunnelStateData::Connection::logicError(const char *errMsg)
+-{
+-    debugs(50, 3, conn << " closing on error: " << errMsg);
+-    conn->close();
+-}
+-
+-void
+ TunnelStateData::Connection::error(int const xerrno)
+ {
+     /* XXX fixme xstrerror and xerrno... */
+@@ -517,7 +535,7 @@
+     debugs(26, 3, HERE << "Schedule Write");
+     AsyncCall::Pointer call = commCbCall(5,5, "TunnelBlindCopyWriteHandler",
+                                          CommIoCbPtrFun(completion, this));
+-    Comm::Write(to.conn, from.buf, len, call, NULL);
++    to.write(from.buf, len, call, NULL);
+ }
+ 
+ /* Writes data from the client buffer to the server side */
+@@ -526,6 +544,7 @@
+ {
+     TunnelStateData *tunnelState = (TunnelStateData *)data;
+     assert (cbdataReferenceValid (tunnelState));
++    tunnelState->server.writer = NULL;
+ 
+     tunnelState->writeServerDone(buf, len, flag, xerrno);
+ }
+@@ -575,6 +594,7 @@
+ {
+     TunnelStateData *tunnelState = (TunnelStateData *)data;
+     assert (cbdataReferenceValid (tunnelState));
++    tunnelState->client.writer = NULL;
+ 
+     tunnelState->writeClientDone(buf, len, flag, xerrno);
+ }
+@@ -592,7 +612,14 @@
+ }
+ 
+ void
+-TunnelStateData::writeClientDone(char *buf, size_t len, comm_err_t flag, int xerrno)
++TunnelStateData::Connection::write(const char *b, int size, AsyncCall::Pointer &callback, FREE * free_func)
++{
++    writer = callback;
++    Comm::Write(conn, b, size, callback, free_func);
++}
++
++void
++TunnelStateData::writeClientDone(char *, size_t len, comm_err_t flag, int xerrno)
+ {
+     debugs(26, 3, HERE << client.conn << ", " << len << " bytes written, flag=" << flag);
+ 
+@@ -712,6 +739,7 @@
+ {
+     TunnelStateData *tunnelState = (TunnelStateData *)data;
+     debugs(26, 3, HERE << conn << ", flag=" << flag);
++    tunnelState->client.writer = NULL;
+ 
+     if (flag != COMM_OK) {
+         *tunnelState->status_ptr = Http::scInternalServerError;
+@@ -728,6 +756,7 @@
+ {
+     TunnelStateData *tunnelState = (TunnelStateData *)data;
+     debugs(26, 3, conn << ", flag=" << flag);
++    tunnelState->server.writer = NULL;
+     assert(tunnelState->waitingForConnectRequest());
+ 
+     if (flag != COMM_OK) {
+@@ -768,7 +797,7 @@
+     else {
+         AsyncCall::Pointer call = commCbCall(5,5, "tunnelConnectedWriteDone",
+                                              CommIoCbPtrFun(tunnelConnectedWriteDone, tunnelState));
+-        Comm::Write(tunnelState->client.conn, conn_established, strlen(conn_established), call, NULL);
++        tunnelState->client.write(conn_established, strlen(conn_established), call, NULL);
+     }
+ }
+ 
+@@ -955,29 +984,20 @@
+     debugs(11, 2, "Tunnel Server REQUEST: " << tunnelState->server.conn << ":\n----------\n" <<
+            Raw("tunnelRelayConnectRequest", mb.content(), mb.contentSize()) << "\n----------");
+ 
+-    if (tunnelState->clientExpectsConnectResponse()) {
+-        // hack: blindly tunnel peer response (to our CONNECT request) to the client as ours.
+-        AsyncCall::Pointer writeCall = commCbCall(5,5, "tunnelConnectedWriteDone",
+-                                       CommIoCbPtrFun(tunnelConnectedWriteDone, tunnelState));
+-        Comm::Write(srv, &mb, writeCall);
+-    } else {
+-        // we have to eat the connect response from the peer (so that the client
+-        // does not see it) and only then start shoveling data to the client
+-        AsyncCall::Pointer writeCall = commCbCall(5,5, "tunnelConnectReqWriteDone",
+-                                       CommIoCbPtrFun(tunnelConnectReqWriteDone,
+-                                                      tunnelState));
+-        Comm::Write(srv, &mb, writeCall);
+-        tunnelState->connectReqWriting = true;
+-
+-        tunnelState->connectRespBuf = new MemBuf;
+-        // SQUID_TCP_SO_RCVBUF: we should not accumulate more than regular I/O buffer
+-        // can hold since any CONNECT response leftovers have to fit into server.buf.
+-        // 2*SQUID_TCP_SO_RCVBUF: HttpMsg::parse() zero-terminates, which uses space.
+-        tunnelState->connectRespBuf->init(SQUID_TCP_SO_RCVBUF, 2*SQUID_TCP_SO_RCVBUF);
+-        tunnelState->readConnectResponse();
+-
+-        assert(tunnelState->waitingForConnectExchange());
+-    }
++    AsyncCall::Pointer writeCall = commCbCall(5,5, "tunnelConnectReqWriteDone",
++                                   CommIoCbPtrFun(tunnelConnectReqWriteDone, tunnelState));
++
++    tunnelState->server.write(mb.buf, mb.size, writeCall, mb.freeFunc());
++    tunnelState->connectReqWriting = true;
++
++    tunnelState->connectRespBuf = new MemBuf;
++    // SQUID_TCP_SO_RCVBUF: we should not accumulate more than regular I/O buffer
++    // can hold since any CONNECT response leftovers have to fit into server.buf.
++    // 2*SQUID_TCP_SO_RCVBUF: HttpMsg::parse() zero-terminates, which uses space.
++    tunnelState->connectRespBuf->init(SQUID_TCP_SO_RCVBUF, 2*SQUID_TCP_SO_RCVBUF);
++    tunnelState->readConnectResponse();
++
++    assert(tunnelState->waitingForConnectExchange());
+ 
+     AsyncCall::Pointer timeoutCall = commCbCall(5, 4, "tunnelTimeout",
+                                      CommTimeoutCbPtrFun(tunnelTimeout, tunnelState));
+
diff --git a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb b/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
index c5f616d..25940f7 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.4.7.bb
@@ -20,6 +20,10 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://squid-use-serial-tests-config-needed-by-ptest.patch \
            file://run-ptest \
            file://volatiles.03_squid \
+           file://CVE-2014-6270.patch \
+           file://CVE-2014-7141_CVE-2014-7142.patch \
+           file://CVE-2015-3455.patch \
+           file://CVE-2015-5400.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
-- 
2.3.5


