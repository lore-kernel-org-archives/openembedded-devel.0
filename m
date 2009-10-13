Received: from [65.182.109.74] (helo=mta5.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1MxhqJ-00061V-DT
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Oct 2009 15:55:14 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta5.brinkster.com (Postfix) with ESMTP id 1AFCD2C0363
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 09:54:31 -0400 (EDT)
X-Virus-Scanned: amavisd-new at 
Received: from mta5.brinkster.com ([127.0.0.1])
	by localhost (mta5.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6UPqD5oVxZ76
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 09:54:26 -0400 (EDT)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta5.brinkster.com (Postfix) with ESMTP id 712AC2C03A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 09:54:23 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 13 Oct 2009 14:53:57 +0100
Message-ID: <008401ca4c0c$9ccc3e70$d664bb50$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcpMDJvU2Dsdmkc0TAmoyPJBqSburQ==
X-SA-Exim-Connect-IP: 65.182.109.74
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] keymaps: Add basic keymap support for the omap3pandora machine.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Oct 2009 13:55:15 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-us


Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>
---
 .../files/omap3-pandora/keymap-extension-2.6.map   |  192
++++++++++++++++++++
 recipes/keymaps/keymaps_1.0.bb                     |    4 +-
 2 files changed, 194 insertions(+), 2 deletions(-)
 create mode 100755
recipes/keymaps/files/omap3-pandora/keymap-extension-2.6.map

diff --git =
a/recipes/keymaps/files/omap3-pandora/keymap-extension-2.6.map
b/recipes/keymaps/files/omap3-pandora/keymap-extension-2.6.map
new file mode 100755
index 0000000..1e3030d
--- /dev/null
+++ b/recipes/keymaps/files/omap3-pandora/keymap-extension-2.6.map
@@ -0,0 +1,192 @@
+keymaps 0-2,4,8,12
+
+# Notes:
+# FN is setup as AltGr.
+# AltGr locking not yet working.
+
+# 	      Default 		Shift 		AltGr 		Control
Alt 		Ctrl+Alt =09
+
+# DPad/Buttons in keyboard mode (On Input2).
+
+# DPad - URDL
+keycode 103 =3D Up		Up		Prior
+keycode 106 =3D Right		Right		Incr_Console=09
+keycode 108 =3D Down		Down		Next
+keycode 105 =3D Left		Left		Decr_Console=09
+
+# Buttons - URDL
+keycode 307 =3D
+keycode 304 =3D=20
+keycode 305 =3D
+keycode 308 =3D
+
+# Left Trigger
+keycode 310 =3D
+
+# Right Trigger=20
+keycode 311 =3D=20
+
+# Special keys.
+keycode  29 =3D Control=09
+keycode  56 =3D Alt
+keycode  464 =3D AltGr		AltGr		AltGr_Lock
+
+
+keycode  14 =3D BackSpace		Delete		Insert
+     =20
+keycode  28 =3D Return         	Return		Return		Return
Return		Return=09
+keycode  40 =3D apostrophe       	quotedbl        tilde
+keycode  42 =3D Shift		VoidSymbol	Caps_Lock
+
+keycode  51 =3D comma            	less		semicolon
+keycode  52 =3D period		greater		colon	=09
+
+keycode  53 =3D slash		question	Num_Lock
+
+keycode  57 =3D space		bar		Tab
+
+
+# Number Bar
+
+keycode  2 =3D one		VoidSymbol	F1
+keycode  3 =3D two		VoidSymbol	F2
+keycode  4 =3D three		VoidSymbol	F3
+keycode  5 =3D four		asciitilde	F4
+keycode  6 =3D five		VoidSymbol	F5
+keycode  7 =3D six		VoidSymbol	F6
+keycode  8 =3D seven		ampersand	F7
+keycode  9 =3D eight		asterisk	F8
+keycode  10 =3D nine		VoidSymbol	F9
+keycode  11 =3D zero		VoidSymbol	F10
+
+
+# QWERTY Keypad
+
+keycode  16 =3D +q                +Q		Escape		Control_q
Meta_q
+keycode  17 =3D +w               	+W		at
Control_w	Meta_w
+keycode  18 =3D +e               	+E		three
Control_e	Meta_e
+keycode  19 =3D +r               	+R		four
Control_r	Meta_r
+keycode  20 =3D +t               	+T		five
Control_t	Meta_t
+keycode  21 =3D +y               	+Y		six
Control_y	Meta_y
+keycode  22 =3D +u               	+U		seven
Control_u	Meta_u
+keycode  23 =3D +i               	+I		eight
Control_i	Meta_i
+keycode  24 =3D +o               	+O		F11
Control_o	Meta_o
+keycode  25 =3D +p               	+P		F12
Control_p	Meta_p
+
+keycode  30 =3D +a            	+A		exclam   	Control_a
Meta_a
+keycode  31 =3D +s               	+S		quotedbl
Control_s	Meta_s
+keycode  32 =3D +d		+D		numbersign	Control_d
Meta_d
+keycode  33 =3D +f		+F		plus		Control_f
Meta_f
+keycode  34 =3D +g               	+G		equals
Control_g	Meta_g
+keycode  35 =3D +h               	+H		underscore
Control_h	Meta_h
+keycode  36 =3D +j               	+J		ampersand
Control_j	Meta_j
+keycode  37 =3D +k               	+K		sterling
Control_k	Meta_k
+keycode  38 =3D +l               	+L		yen
Control_l	Meta_l
+
+keycode  44 =3D +z               	+Z		VoidSymbol
Control_z	Meta_z
+keycode  45 =3D +x               	+X		question
Control_x	Meta_x
+keycode  46 =3D +c               	+C		Control_c
Control_c	Meta_c
+keycode  47 =3D +v               	+V		Control_v
Control_v	Meta_v
+keycode  48 =3D +b		+B		minus		Control_b
Meta_b
+keycode  49 =3D +n               	+N		dollar
Control_n	Meta_n
+keycode  50 =3D +m               	+M		equal
Control_m	Meta_m
+	=09
+
+string F1 =3D "\033[[A"
+string F2 =3D "\033[[B"
+string F3 =3D "\033[[C"
+string F4 =3D "\033[[D"
+string F5 =3D "\033[[E"
+string F6 =3D "\033[17~"
+string F7 =3D "\033[18~"
+string F8 =3D "\033[19~"
+string F9 =3D "\033[20~"
+string F10 =3D "\033[21~"
+string F11 =3D "\033[23~"
+string F12 =3D "\033[24~"
+string F13 =3D "\033[25~"
+string F14 =3D "\033[26~"
+string F15 =3D "\033[28~"
+string F16 =3D "\033[29~"
+string F17 =3D "\033[31~"
+string F18 =3D "\033[32~"
+string F19 =3D "\033[33~"
+string F20 =3D "\033[34~"
+string F33 =3D "\033[49~"
+string Find =3D "\033[1~"
+string Insert =3D "\033[2~"
+string Remove =3D "\033[3~"
+string Select =3D "\033[4~"
+string Prior =3D "\033[5~"
+string Next =3D "\033[6~"
+string Macro =3D "\033[M"
+string Pause =3D "\033[P"
+
+compose '`' 'A' to '=C0'
+compose '`' 'a' to '=E0'
+compose '\'' 'A' to '=C1'
+compose '\'' 'a' to '=E1'
+compose '^' 'A' to '=C2'
+compose '^' 'a' to '=E2'
+compose '~' 'A' to '=C3'
+compose '~' 'a' to '=E3'
+compose '"' 'A' to '=C4'
+compose '"' 'a' to '=E4'
+compose 'O' 'A' to '=C5'
+compose 'o' 'a' to '=E5'
+compose '0' 'A' to '=C5'
+compose '0' 'a' to '=E5'
+compose 'A' 'A' to '=C5'
+compose 'a' 'a' to '=E5'
+compose 'A' 'E' to '=C6'
+compose 'a' 'e' to '=E6'
+compose ',' 'C' to '=C7'
+compose ',' 'c' to '=E7'
+compose '`' 'E' to '=C8'
+compose '`' 'e' to '=E8'
+compose '\'' 'E' to '=C9'
+compose '\'' 'e' to '=E9'
+compose '^' 'E' to '=CA'
+compose '^' 'e' to '=EA'
+compose '"' 'E' to '=CB'
+compose '"' 'e' to '=EB'
+compose '`' 'I' to '=CC'
+compose '`' 'i' to '=EC'
+compose '\'' 'I' to '=CD'
+compose '\'' 'i' to '=ED'
+compose '^' 'I' to '=CE'
+compose '^' 'i' to '=EE'
+compose '"' 'I' to '=CF'
+compose '"' 'i' to '=EF'
+compose '-' 'D' to '=D0'
+compose '-' 'd' to '=F0'
+compose '~' 'N' to '=D1'
+compose '~' 'n' to '=F1'
+compose '`' 'O' to '=D2'
+compose '`' 'o' to '=F2'
+compose '\'' 'O' to '=D3'
+compose '\'' 'o' to '=F3'
+compose '^' 'O' to '=D4'
+compose '^' 'o' to '=F4'
+compose '~' 'O' to '=D5'
+compose '~' 'o' to '=F5'
+compose '"' 'O' to '=D6'
+compose '"' 'o' to '=F6'
+compose '/' 'O' to '=D8'
+compose '/' 'o' to '=F8'
+compose '`' 'U' to '=D9'
+compose '`' 'u' to '=F9'
+compose '\'' 'U' to '=DA'
+compose '\'' 'u' to '=FA'
+compose '^' 'U' to '=DB'
+compose '^' 'u' to '=FB'
+compose '"' 'U' to '=DC'
+compose '"' 'u' to '=FC'
+compose '\'' 'Y' to '=DD'
+compose '\'' 'y' to '=FD'
+compose 'T' 'H' to '=DE'
+compose 't' 'h' to '=FE'
+compose 's' 's' to '=DF'
+compose '"' 'y' to '=FF'
+compose 's' 'z' to '=DF'
+compose 'i' 'j' to '=FF'
diff --git a/recipes/keymaps/keymaps_1.0.bb =
b/recipes/keymaps/keymaps_1.0.bb
index a9b1e91..3cd1f5a 100755
--- a/recipes/keymaps/keymaps_1.0.bb
+++ b/recipes/keymaps/keymaps_1.0.bb
@@ -3,7 +3,7 @@ SECTION =3D "base"
 RDEPENDS_${PN} =3D "initscripts console-tools"
 LICENSE =3D "GPL"
 PACKAGE_ARCH =3D "${MACHINE}"
-PR =3D "r22"
+PR =3D "r23"
=20
 inherit update-rc.d
=20
@@ -18,7 +18,7 @@ SRC_URI_append_poodle       =3D " =
file://keymap-2.6.map"
 SRC_URI_append_h2200        =3D " file://keymap-2.6.map"
 SRC_URI_append_htcuniversal =3D " file://keymap-2.6.map"
 SRC_URI_append_qemux86      =3D " file://keymap-2.6.map"
-SRC_URI_append_omap3-pandora =3D " file://keymap-2.6.map"
+SRC_URI_append_omap3-pandora =3D " file://keymap-extension-2.6.map"
=20
 SRC_URI_append_jornada6xx   =3D " file://keymap-620lx-660lx \
 				file://keymap-br.map \
--=20
1.6.3.1





