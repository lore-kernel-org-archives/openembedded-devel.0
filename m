Received: from [64.38.50.130] (helo=golum.citiwave.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lists@citiwave.net>) id 1Jqkhx-00037j-2o
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 09:57:01 +0200
Received: from adsl111-158.kln.forthnet.gr ([77.49.230.158] helo=vtzanPC)
	by golum.citiwave.net with esmtp (Exim 4.68)
	(envelope-from <lists@citiwave.net>) id 1JqkhP-000325-LG
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 10:56:28 +0300
From: "lists" <lists@citiwave.net>
To: <openembedded-devel@lists.openembedded.org>
References: <200804281451.05548.geoffrey@pager.net>	<200804282349.46539.zecke@selfish.org>	<c384c5ea0804281519o596e224bw252bbac9cca4abc6@mail.gmail.com>
	<c384c5ea0804282203n7b743ed7w41e5e4c201b81a13@mail.gmail.com>
In-Reply-To: <c384c5ea0804282203n7b743ed7w41e5e4c201b81a13@mail.gmail.com>
Date: Tue, 29 Apr 2008 10:56:27 +0300
Message-ID: <00f901c8a9ce$8937ed00$9ba7c700$@net>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Aciptq/hd+hawtO4RpSPb6co3dReRgAFiCqA
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - golum.citiwave.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - citiwave.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Firefox 2.0.0.3 - alix - glib2 - libidl2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Tue, 29 Apr 2008 07:57:02 -0000
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: el

I was able to build firefox 2 months ago.=20
I see those missing glib.h and IDL.h which are indeed exist in staging =
inc path

[avr@dev org.openembedded.dev]$ ls =
tmp/staging/i586-angstrom-linux/usr/include/glib-2.0/glib.h
tmp/staging/i586-angstrom-linux/usr/include/glib-2.0/glib.h

[avr@dev org.openembedded.dev]$ ls =
tmp/staging/i586-angstrom-linux/usr/include/libIDL-2.0/libIDL/IDL.h
tmp/staging/i586-angstrom-linux/usr/include/libIDL-2.0/libIDL/IDL.h

mozilla configure script :

line 6305
if test ! -f "${_GLIB_PREFIX_DIR}/include/glib.h"; then
        { echo "configure: error: Cannot find =
$_GLIB_PREFIX_DIR/include/glib.h ." 1>&2; exit 1; }
    Fi

And line 6330

if test ! -f "${_LIBIDL_PREFIX_DIR}/include/libIDL/IDL.h"; then
        { echo "configure: error: Cannot find =
$_LIBIDL_PREFIX_DIR/include/libIDL/IDL.h ." 1>&2; exit 1; }
    Fi

As you can see those paths are different than the ones installed by glib =
and libidl.


Below is the error while trying to complile.

Any patch suggestions for those new glib/idl versions?



| ccache gcc -o host_xpidl.o -c =
-isystem/home/avr/OE/org.openembedded.dev/tmp/staging/i686-linux/usr/incl=
ude -Os -DXP_UNIX -O3  =
`PKG_CONFIG_PATH=3D/home/avr/OE/org.openembedded.dev/tmp/staging/i686-lin=
ux/usr/lib/pkgconfig pkg-config libIDL-2.0 --cflags` =
-DMDCPUCFG=3D\"md/_linux.cfg\"   -I../../../dist/include/xpcom =
-I../../../dist/include -I../../../dist/include/nspr    =
-I../../../dist/sdk/include -I../../../dist/include/nspr xpidl.c
| In file included from xpidl.c:42:
| xpidl.h:49:18: error: glib.h: No such file or directory
| xpidl.h:53:24: error: libIDL/IDL.h: No such file or directory
| In file included from xpidl.c:42:
| xpidl.h:83: error: expected '=3D', ',', ';', 'asm' or '__attribute__' =
before 'enable_debug'
| xpidl.h:84: error: expected '=3D', ',', ';', 'asm' or '__attribute__' =
before 'enable_warnings'
| xpidl.h:85: error: expected '=3D', ',', ';', 'asm' or '__attribute__' =
before 'verbose_mode'
| xpidl.h:86: error: expected '=3D', ',', ';', 'asm' or '__attribute__' =
before 'emit_typelib_annotations'
| xpidl.h:87: error: expected '=3D', ',', ';', 'asm' or '__attribute__' =
before 'explicit_output_filename'
| xpidl.h:97: error: expected declaration specifiers or '...' before '*' =
token
| xpidl.h:97: error: 'gboolean' declared as function returning a =
function
| xpidl.h:103: error: expected specifier-qualifier-list before =
'nodeHandler'
| xpidl.h:133: error: expected specifier-qualifier-list before 'IDL_ns'
| xpidl.h:141: error: expected specifier-qualifier-list before =
'GHashTable'
| xpidl.h:159: error: expected ')' before 'p'
| xpidl.h:180: error: 'xpidl_process_node' declared as function =
returning a function
| xpidl.h:205: error: 'xpidl_sprint_iid' declared as function returning =
a function
| xpidl.h:212: error: 'xpidl_parse_iid' declared as function returning a =
function
| xpidl.h:244: error: expected '=3D', ',', ';', 'asm' or '__attribute__' =
before 'find_underlying_type'
| xpidl.h:251: error: expected ')' before 'const_tree'
| xpidl.h:257: error: expected ')' before 'method_tree'
| xpidl.h:263: error: expected ')' before 'method_tree'
| xpidl.h:269: error: expected ')' before 'method_tree'
| xpidl.h:276: error: 'check_native' declared as function returning a =
function
| xpidl.h:279: error: expected declaration specifiers or '...' before =
'GSList'
| xpidl.c:63: error: function 'enable_debug' is initialized like a =
variable
| xpidl.c:63: error: 'FALSE' undeclared here (not in a function)
| xpidl.c:64: error: function 'enable_warnings' is initialized like a =
variable
| xpidl.c:65: error: function 'verbose_mode' is initialized like a =
variable
| xpidl.c:66: error: function 'emit_typelib_annotations' is initialized =
like a variable
| xpidl.c:67: error: function 'explicit_output_filename' is initialized =
like a variable
| xpidl.c: In function 'main':
| xpidl.c:107: error: function 'create_old_typelib' is initialized like =
a variable
| xpidl.c:131: error: 'TRUE' undeclared (first use in this function)
| xpidl.c:131: error: (Each undeclared identifier is reported only once
| xpidl.c:131: error: for each function it appears in.)
| xpidl.c:144: error: expected '=3D', ',', ';', 'asm' or '__attribute__' =
before '*' token
| xpidl.c:144: error: 'typelib_version_string' undeclared (first use in =
this function)
| xpidl.c:157: warning: the address of 'create_old_typelib', will always =
evaluate as 'true'
| make[6]: *** [host_xpidl.o] Error 1


Thanks

Bill



