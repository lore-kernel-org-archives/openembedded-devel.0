Return-Path: <pawel.langowski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D563C04A94
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 11:07:48 +0000 (UTC)
Received: from 4.mo561.mail-out.ovh.net (4.mo561.mail-out.ovh.net [178.33.46.10])
 by mx.groups.io with SMTP id smtpd.web11.157956.1692184066975149409
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 04:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 178.33.46.10, mailfrom: pawel.langowski@3mdeb.com)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.16.164])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id D3B5023960
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 11:07:43 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-5h88g (unknown [10.111.172.174])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1E7E41FE0A;
	Wed, 16 Aug 2023 11:07:42 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.101])
	by ghost-submission-6684bf9d7b-5h88g with ESMTPSA
	id ZhCeMv6t3GQqhRUAK6ZoNQ
	(envelope-from <pawel.langowski@3mdeb.com>); Wed, 16 Aug 2023 11:07:42 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G004982c2837-dfa4-404b-a9ec-e807afec5fe7,
                    93A237E87ED1339E13AED04D535165A97E4753C9) smtp.auth=pawel.langowski@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Pawel Langowski <pawel.langowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [meta-networking][PATCH] meta-networking/recipes-connectivity: Add tayga recipe
Date: Wed, 16 Aug 2023 13:07:34 +0200
Message-ID: <20230816110739.1428994-1-pawel.langowski@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12537739891451277977
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddtledgfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrgifvghlucfnrghnghhofihskhhiuceophgrfigvlhdrlhgrnhhgohifshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgffftdekhfekgefgjefhteetledvuddvfeffgefgvdekhfehjefhgeegtdegfedunecuffhomhgrihhnpehlihhtvggthhdrohhrghenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeophgrfigvlhdrlhgrnhhgohifshhkihesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 11:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104425

Recipe for TAYGA - an out-of-kernel stateless NAT64 implementation for Li=
nux
---
 .../tayga/files/tayga.conf                    | 103 ++++++++++++++++++
 .../tayga/files/tayga.service                 |  12 ++
 .../recipes-connectivity/tayga/tayga_0.9.2.bb |  20 ++++
 3 files changed, 135 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/tayga/files/tayg=
a.conf
 create mode 100644 meta-networking/recipes-connectivity/tayga/files/tayg=
a.service
 create mode 100644 meta-networking/recipes-connectivity/tayga/tayga_0.9.=
2.bb

diff --git a/meta-networking/recipes-connectivity/tayga/files/tayga.conf =
b/meta-networking/recipes-connectivity/tayga/files/tayga.conf
new file mode 100644
index 000000000000..c1b6163a4591
--- /dev/null
+++ b/meta-networking/recipes-connectivity/tayga/files/tayga.conf
@@ -0,0 +1,103 @@
+#
+# Sample configuration file for TAYGA 0.9.2
+#
+# Modify this to use your own addresses!!
+#
+
+#
+# TUN device that TAYGA will use to exchange IPv4 and IPv6 packets with =
the
+# kernel.  You may use any name you like, but `nat64' is recommended.
+#
+# This device may be created before starting the tayga daemon by running
+# `tayga --mktun`.  This allows routing and firewall rules to be set up =
prior
+# to commencement of packet translation.
+#
+# Mandatory.
+#
+tun-device nat64
+
+#
+# TAYGA's IPv4 address.  This is NOT your router's IPv4 address!  TAYGA
+# requires its own address because it acts as an IPv4 and IPv6 router, a=
nd
+# needs to be able to send ICMP messages.  TAYGA will also respond to IC=
MP
+# echo requests (ping) at this address.
+#
+# This address can safely be located inside the dynamic-pool prefix.
+#
+# Mandatory.
+#
+ipv4-addr 192.168.254.1
+
+#
+# TAYGA's IPv6 address.  This is NOT your router's IPv6 address!  TAYGA
+# requires its own address because it acts as an IPv4 and IPv6 router, a=
nd
+# needs to be able to send ICMP messages.  TAYGA will also respond to IC=
MP
+# echo requests (ping6) at this address.
+#
+# You can leave ipv6-addr unspecified and TAYGA will construct its IPv6
+# address using ipv4-addr and the NAT64 prefix.
+#
+# Optional if the NAT64 prefix is specified, otherwise mandatory.  It is=
 also
+# mandatory if the NAT64 prefix is 64:ff9b::/96 and ipv4-addr is a priva=
te
+# (RFC1918) address.
+#
+#ipv6-addr 2001:db8:1::2
+ipv6-addr fdaa:bb:1::1
+
+#
+# The NAT64 prefix.  The IPv4 address space is mapped into the IPv6 addr=
ess
+# space by prepending this prefix to the IPv4 address.  Using a /96 pref=
ix is
+# recommended in most situations, but all lengths specified in RFC 6052 =
are
+# supported.
+#
+# This must be a prefix selected from your organization's IPv6 address s=
pace
+# or the Well-Known Prefix 64:ff9b::/96.  Note that using the Well-Known
+# Prefix will prohibit IPv6 hosts from contacting IPv4 hosts that have p=
rivate
+# (RFC1918) addresses, per RFC 6052.
+#
+# The NAT64 prefix need not be specified if all required address mapping=
s are
+# listed in `map' directives.  (See below.)
+#
+# Optional.
+#
+##prefix 2001:db8:1:ffff::/96
+prefix 64:ff9b::/96
+
+#
+# Dynamic pool prefix.  IPv6 hosts which send traffic through TAYGA (and=
 do
+# not correspond to a static map or an IPv4-translatable address in the =
NAT64
+# prefix) will be assigned an IPv4 address from the dynamic pool.  Dynam=
ic
+# maps are valid for 124 minutes after the last matching packet is seen.
+#
+# If no unassigned addresses remain in the dynamic pool (or no dynamic p=
ool is
+# configured), packets from unknown IPv6 hosts will be rejected with an =
ICMP
+# unreachable error.
+#
+# Optional.
+#
+dynamic-pool 192.168.254.0/24
+
+#
+# Persistent data storage directory.  The dynamic.map file, which saves =
the
+# dynamic maps that are created from dynamic-pool, is stored in this
+# directory.  Omit if you do not need these maps to be persistent betwee=
n
+# instances of TAYGA.
+#
+# Optional.
+#
+data-dir /var/spool/tayga
+
+#
+# Establishes a single-host map.  If an IPv6 host should be consistently
+# reachable at a specific IPv4 address, the mapping can be specified in =
a
+# `map' directive.  (IPv6 hosts numbered with an IPv4-translatable addre=
ss do
+# not need map directives.)
+#
+# IPv4 addresses specified in the `map' directive can safely be located =
inside
+# the dynamic-pool prefix.
+#
+# Optional.
+#
+#map 192.168.5.42 2001:db8:1:4444::1
+#map 192.168.5.43 2001:db8:1:4444::2
+#map 192.168.255.2 2001:db8:1:569::143
diff --git a/meta-networking/recipes-connectivity/tayga/files/tayga.servi=
ce b/meta-networking/recipes-connectivity/tayga/files/tayga.service
new file mode 100644
index 000000000000..0bffeb92a501
--- /dev/null
+++ b/meta-networking/recipes-connectivity/tayga/files/tayga.service
@@ -0,0 +1,12 @@
+[Unit]
+SourcePath=3D/usr/sbin/tayga
+Description=3DLSB: userspace NAT64
+
+[Service]
+Type=3Dforking
+ExecStart=3D/usr/sbin/tayga -d --config /etc/tayga.conf
+RemainAfterExit=3Dyes
+TimeoutStopSec=3Dinfinity
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb b/=
meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
new file mode 100644
index 000000000000..12d0d14e0d49
--- /dev/null
+++ b/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
@@ -0,0 +1,20 @@
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
+
+SRC_URI =3D "http://www.litech.org/tayga/tayga-${PV}.tar.bz2"
+SRC_URI[md5sum] =3D "7a7b24165ce008df772f398d86fa280e"
+SRC_URI[sha256sum] =3D "2b1f7927a9d2dcff9095aff3c271924b052ccfd2faca9588=
b277431a44f0009c"
+
+SRC_URI +=3D "file://tayga.conf \
+            file://tayga.service"
+
+SYSTEMD_PACKAGES =3D "${PN}"
+SYSTEMD_SERVICE:${PN} =3D "tayga.service"
+
+do_install:append() {
+  install -m 0644 ${WORKDIR}/tayga.conf ${D}${sysconfdir}/tayga.conf
+  install -d ${D}${systemd_unitdir}/system/
+  install -m 0644 ${WORKDIR}/tayga.service ${D}${systemd_unitdir}/system=
/
+}
+
+inherit autotools systemd
--=20
2.41.0


