Return-Path: <amarnath.valluri@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2641873D77
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2015 06:45:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 20 Apr 2015 23:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,614,1422950400"; d="scan'208";a="483541270"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Apr 2015 23:45:31 -0700
Received: from irsmsx155.ger.corp.intel.com (163.33.192.3) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 21 Apr 2015 07:45:30 +0100
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.83]) by
	irsmsx155.ger.corp.intel.com ([169.254.14.178]) with mapi id
	14.03.0224.002; Tue, 21 Apr 2015 07:45:30 +0100
From: "Valluri, Amarnath" <amarnath.valluri@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] toybox: Upgrade to v0.5.2
Thread-Index: AQHQezudwTMOdqOMpUeEvT6nulrnVp1XBs0i
Date: Tue, 21 Apr 2015 06:45:29 +0000
Message-ID: <D3C33C4430ACA6488F343D1125FCCECC3444BB72@irsmsx110.ger.corp.intel.com>
References: <D3C33C4430ACA6488F343D1125FCCECC3444BA6D@irsmsx110.ger.corp.intel.com>
In-Reply-To: <D3C33C4430ACA6488F343D1125FCCECC3444BA6D@irsmsx110.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.139]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] toybox: Upgrade to v0.5.2
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
X-List-Received-Date: Tue, 21 Apr 2015 06:45:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is gentle reminder, can someone review and accept the patch.

- Amarnath
________________________________________
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Valluri, Amarnath [amarnath.v=
alluri@intel.com]
Sent: Monday, April 20, 2015 10:28 AM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-oe][PATCH] toybox: Upgrade to v0.5.2

The patch applied to toybox is rebased onto the new release and updated.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 .../toybox/0001-Match-paths-with-busybox.patch     | 67 ++++++++++++------=
----
 .../toybox/{toybox_0.5.0.bb =3D> toybox_0.5.2.bb}    |  6 +-
 2 files changed, 39 insertions(+), 34 deletions(-)
 rename meta-oe/recipes-core/toybox/{toybox_0.5.0.bb =3D> toybox_0.5.2.bb} =
(92%)

diff --git a/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busyb=
ox.patch b/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox=
.patch
index e071f22..9eb965d 100644
--- a/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch
+++ b/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch
@@ -1,4 +1,4 @@
-From 27f5ca9f1e212e5ab00cde0bfc91282fc7ff5e16 Mon Sep 17 00:00:00 2001
+From 9b37b45067677563dc8daa73d73a015c20ad6222 Mon Sep 17 00:00:00 2001
 From: Paul Barker <paul@paulbarker.me.uk>
 Date: Mon, 18 Aug 2014 12:18:16 +0000
 Subject: [PATCH] Match paths with busybox
@@ -8,6 +8,9 @@ update-alternatives, the paths of the links installed by to=
ybox should match
 those installed by busybox. This is accomplished by changing the flags of =
a few
 tools within toybox.

+v3:
+    - Forward ported from v0.5.0 to v0.5.2
+
 v2:
     - Forward ported from v0.4.9 to v0.5.0
     - Move new 'mount' command
@@ -16,6 +19,8 @@ Signed-off-by: Paul Barker <paul@paulbarker.me.uk>

 Upstream-status: Inappropriate
     (specific to update-alternatives use in OpenEmbedded)
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
 ---
  toys/lsb/mount.c        | 2 +-
  toys/lsb/pidof.c        | 2 +-
@@ -45,7 +50,7 @@ Upstream-status: Inappropriate
  25 files changed, 29 insertions(+), 29 deletions(-)

 diff --git a/toys/lsb/mount.c b/toys/lsb/mount.c
-index 01f5c32..65a5aa2 100644
+index c334681..b076ca1 100644
 --- a/toys/lsb/mount.c
 +++ b/toys/lsb/mount.c
 @@ -6,7 +6,7 @@
@@ -54,7 +59,7 @@ index 01f5c32..65a5aa2 100644

 -USE_MOUNT(NEWTOY(mount, "?O:afnrvwt:o*[-rw]", TOYFLAG_USR|TOYFLAG_BIN|TOY=
FLAG_STAYROOT))
 +USE_MOUNT(NEWTOY(mount, "?O:afnrvwt:o*[-rw]", TOYFLAG_BIN|TOYFLAG_STAYROO=
T))
- USE_NFSMOUNT(NEWTOY(nfsmount, "?<2>2", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_ST=
AYROOT))
+ //USE_NFSMOUNT(NEWTOY(nfsmount, "?<2>2", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_=
STAYROOT))

  config MOUNT
 diff --git a/toys/lsb/pidof.c b/toys/lsb/pidof.c
@@ -84,20 +89,20 @@ index 6544265..a93327f 100644
  config CHVT
    bool "chvt"
 diff --git a/toys/other/ifconfig.c b/toys/other/ifconfig.c
-index f5d4215..5e7c54c 100644
+index 8db3ff0..445799d 100644
 --- a/toys/other/ifconfig.c
 +++ b/toys/other/ifconfig.c
 @@ -6,7 +6,7 @@
   *
   * Not in SUSv4.

--USE_IFCONFIG(NEWTOY(ifconfig, "?a", TOYFLAG_BIN))
-+USE_IFCONFIG(NEWTOY(ifconfig, "?a", TOYFLAG_SBIN))
+-USE_IFCONFIG(NEWTOY(ifconfig, "^?a", TOYFLAG_BIN))
++USE_IFCONFIG(NEWTOY(ifconfig, "^?a", TOYFLAG_SBIN))

  config IFCONFIG
    bool "ifconfig"
 diff --git a/toys/other/insmod.c b/toys/other/insmod.c
-index 8aa959a..75fd7cd 100644
+index 81721a3..cb222a5 100644
 --- a/toys/other/insmod.c
 +++ b/toys/other/insmod.c
 @@ -2,7 +2,7 @@
@@ -123,20 +128,20 @@ index b8f5d82..4d16048 100644
  config LSMOD
    bool "lsmod"
 diff --git a/toys/other/netcat.c b/toys/other/netcat.c
-index 3c6f630..188c3d1 100644
+index d27aa88..0fd26f7 100644
 --- a/toys/other/netcat.c
 +++ b/toys/other/netcat.c
 @@ -4,7 +4,7 @@
   *
   * TODO: udp, ipv6, genericize for telnet/microcom/tail-f

--USE_NETCAT(OLDTOY(nc, netcat, USE_NETCAT_LISTEN("tl^L^")"w#p#s:q#f:", TOY=
FLAG_BIN))
-+USE_NETCAT(OLDTOY(nc, netcat, USE_NETCAT_LISTEN("tl^L^")"w#p#s:q#f:", TOY=
FLAG_USR|TOYFLAG_BIN))
- USE_NETCAT(NEWTOY(netcat, USE_NETCAT_LISTEN("tl^L^")"w#p#s:q#f:", TOYFLAG=
_BIN))
+-USE_NETCAT(OLDTOY(nc, netcat, TOYFLAG_BIN))
++USE_NETCAT(OLDTOY(nc, netcat, TOYFLAG_USR|TOYFLAG_BIN))
+ USE_NETCAT(NEWTOY(netcat, USE_NETCAT_LISTEN("^tlL")"w#p#s:q#f:", TOYFLAG_=
BIN))

  config NETCAT
 diff --git a/toys/other/pivot_root.c b/toys/other/pivot_root.c
-index 3e4beac..ce3d3a8 100644
+index 9a1f56c..7748032 100644
 --- a/toys/other/pivot_root.c
 +++ b/toys/other/pivot_root.c
 @@ -2,7 +2,7 @@
@@ -162,7 +167,7 @@ index 1c33362..fecd1ef 100644
  config READLINK
    bool "readlink"
 diff --git a/toys/other/reboot.c b/toys/other/reboot.c
-index 5cbc4f8..f8baafc 100644
+index 8baa4d8..a135888 100644
 --- a/toys/other/reboot.c
 +++ b/toys/other/reboot.c
 @@ -2,9 +2,9 @@
@@ -170,11 +175,11 @@ index 5cbc4f8..f8baafc 100644
   * Copyright 2013 Elie De Brauwer <eliedebrauwer@gmail.com>

 -USE_REBOOT(NEWTOY(reboot, "n", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
--USE_REBOOT(OLDTOY(halt, reboot, "n", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
--USE_REBOOT(OLDTOY(poweroff, reboot, "n", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
+-USE_REBOOT(OLDTOY(halt, reboot, TOYFLAG_BIN|TOYFLAG_NEEDROOT))
+-USE_REBOOT(OLDTOY(poweroff, reboot, TOYFLAG_BIN|TOYFLAG_NEEDROOT))
 +USE_REBOOT(NEWTOY(reboot, "n", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
-+USE_REBOOT(OLDTOY(halt, reboot, "n", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
-+USE_REBOOT(OLDTOY(poweroff, reboot, "n", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
++USE_REBOOT(OLDTOY(halt, reboot, TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
++USE_REBOOT(OLDTOY(poweroff, reboot, TOYFLAG_SBIN|TOYFLAG_NEEDROOT))

  config REBOOT
    bool "reboot"
@@ -257,15 +262,15 @@ index 7f10c5e..1ab3ce8 100644
  config CUT
    bool "cut"
 diff --git a/toys/posix/df.c b/toys/posix/df.c
-index afb296b..6296dc9 100644
+index 141e8e5..5d37b45 100644
 --- a/toys/posix/df.c
 +++ b/toys/posix/df.c
 @@ -4,7 +4,7 @@
   *
   * See http://opengroup.org/onlinepubs/9699919799/utilities/df.html

--USE_DF(NEWTOY(df, "Pkt*a", TOYFLAG_USR|TOYFLAG_SBIN))
-+USE_DF(NEWTOY(df, "Pkt*a", TOYFLAG_BIN))
+-USE_DF(NEWTOY(df, "Pkt*a[-Pk]", TOYFLAG_USR|TOYFLAG_SBIN))
++USE_DF(NEWTOY(df, "Pkt*a[-Pk]", TOYFLAG_BIN))

  config DF
    bool "df"
@@ -283,20 +288,20 @@ index e8517d4..3ac4373 100644
  config HEAD
    bool "head"
 diff --git a/toys/posix/id.c b/toys/posix/id.c
-index b4d9c00..df79419 100644
+index 353aa04..7ab489e 100644
 --- a/toys/posix/id.c
 +++ b/toys/posix/id.c
 @@ -6,10 +6,10 @@
   *
   * See http://opengroup.org/onlinepubs/9699919799/utilities/id.html

--USE_ID(NEWTOY(id, ">1nGgru[!Ggu]", TOYFLAG_BIN))
-+USE_ID(NEWTOY(id, ">1nGgru[!Ggu]", TOYFLAG_USR|TOYFLAG_BIN))
- USE_GROUPS(OLDTOY(groups, id, NULL, TOYFLAG_USR|TOYFLAG_BIN))
--USE_LOGNAME(OLDTOY(logname, id, ">0", TOYFLAG_BIN))
--USE_LOGNAME(OLDTOY(whoami, id, ">0", TOYFLAG_BIN))
-+USE_LOGNAME(OLDTOY(logname, id, ">0", TOYFLAG_USR|TOYFLAG_BIN))
-+USE_LOGNAME(OLDTOY(whoami, id, ">0", TOYFLAG_USR|TOYFLAG_BIN))
+-USE_ID(NEWTOY(id, ">1"USE_ID_SELINUX("Z")"nGgru[!"USE_ID_SELINUX("Z")"Ggu=
]", TOYFLAG_BIN))
++USE_ID(NEWTOY(id, ">1"USE_ID_SELINUX("Z")"nGgru[!"USE_ID_SELINUX("Z")"Ggu=
]", TOYFLAG_USR|TOYFLAG_BIN))
+ USE_GROUPS(NEWTOY(groups, NULL, TOYFLAG_USR|TOYFLAG_BIN))
+-USE_LOGNAME(NEWTOY(logname, ">0", TOYFLAG_BIN))
+-USE_WHOAMI(OLDTOY(whoami, logname, TOYFLAG_BIN))
++USE_LOGNAME(NEWTOY(logname, ">0", TOYFLAG_USR|TOYFLAG_BIN))
++USE_WHOAMI(OLDTOY(whoami, logname, TOYFLAG_USR|TOYFLAG_BIN))

  config ID
    bool "id"
@@ -327,7 +332,7 @@ index 8c20644..489eb13 100644
  config RENICE
    bool "renice"
 diff --git a/toys/posix/tail.c b/toys/posix/tail.c
-index e1048be..ba0a55a 100644
+index e92c044..ba1d311 100644
 --- a/toys/posix/tail.c
 +++ b/toys/posix/tail.c
 @@ -4,7 +4,7 @@
@@ -366,7 +371,7 @@ index 3cfdb94..c127cfe 100644
  config UNIQ
    bool "uniq"
 diff --git a/toys/posix/who.c b/toys/posix/who.c
-index 2c8a2e6..d5cd001 100644
+index 876a562..414cdfc 100644
 --- a/toys/posix/who.c
 +++ b/toys/posix/who.c
 @@ -9,7 +9,7 @@
@@ -379,5 +384,5 @@ index 2c8a2e6..d5cd001 100644
  config WHO
    bool "who"
 --
-2.1.2
+1.8.1.2

diff --git a/meta-oe/recipes-core/toybox/toybox_0.5.0.bb b/meta-oe/recipes-=
core/toybox/toybox_0.5.2.bb
similarity index 92%
rename from meta-oe/recipes-core/toybox/toybox_0.5.0.bb
rename to meta-oe/recipes-core/toybox/toybox_0.5.2.bb
index 9bdba4d..bcd6a72 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.5.0.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.5.2.bb
@@ -1,10 +1,10 @@
 SUMMARY =3D "Toybox combines common utilities together into a single execu=
table."
 HOMEPAGE =3D "http://www.landley.net/toybox/"

-SRC_URI =3D "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.bz2 \
+SRC_URI =3D "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
     file://0001-Match-paths-with-busybox.patch"
-SRC_URI[md5sum] =3D "2cb6e8b34134038d86048e117f77765f"
-SRC_URI[sha256sum] =3D "2718b42154be041435df48d5b5140f4e307767c36b1017e0c8=
d0da7f75b327a7"
+SRC_URI[md5sum] =3D "b5d1242767c411b69dcd717da1c218b2"
+SRC_URI[sha256sum] =3D "dec7f6433ee0e130f224fc63760b347ad0572280c4de32f1aa=
efbee813a79a00"

 LICENSE =3D "BSD-0-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df0b8b3dd6431bcaa245da0a08bd0d51=
1"
--
1.8.1.2

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki
Business Identity Code: 0357606 - 4
Domiciled in Helsinki

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel
---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


