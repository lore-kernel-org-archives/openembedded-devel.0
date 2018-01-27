Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8D99778870
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 09:29:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jan 2018 01:29:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,421,1511856000"; d="scan'208";a="13446832"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 27 Jan 2018 01:29:10 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Jan 2018 01:29:01 -0800
Message-Id: <20180127092903.17475-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [meta-perl][PATCH 1/3] libencode-perl: upgrade 2.83 -> 2.94
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Jan 2018 09:29:09 -0000

* Fix RDEPENDS
* RCONFLICTS with perl-misc
* LIC_FILES_CHKSUM is based on META.json, which has changed
  but license remains the same

Changes:

2.94 2018/01/09 05:53:00
! lib/Encode/Alias.pm
  Fixed: deep recursion in Encode::find_encoding when decoding
  bad MIME header
  https://github.com/dankogai/p5-encode/pull/127
! Encode.pm
  Pulled: Include more information about Encode::is_utf8() that it
  should not be normally used
  https://github.com/dankogai/p5-encode/pull/126
  Pulled: Remove misleading documentation about UTF8 flag
  https://github.com/dankogai/p5-encode/pull/125

2.93 2017/10/06 22:21:53
! lib/Encode/MIME/Name.pm t/mime-name.t
  Pulled: Add "euc-cn" => "EUC-CN" alias to Encode::MIME::Name
  https://github.com/dankogai/p5-encode/pull/124
! encoding.pm
  Pulled: Propagate fatal errors from the encoding pragma back to the caller
  Resolves rt #100427
  https://github.com/dankogai/p5-encode/pull/123
  https://rt.cpan.org/Ticket/Display.html?id=100427
! lib/Encode/CN/HZ.pm lib/Encode/JP/JIS7.pm lib/Encode/MIME/Header.pm
  t/decode.t
  Pulled: Uninitialized value fixes #122
  https://github.com/dankogai/p5-encode/pull/122
! Makefile.PL
  Pulled: Fix -Werror=declaration-after-statement for gcc 4.1.2
  https://github.com/dankogai/p5-encode/pull/121

2.92 2017/07/18 07:15:29
! Encode.pm  MANIFEST lib/Encode/Alias.pm
+ t/use-Encode-Alias.t
  Pulled: Fix loading Encode::Alias before Encode
  https://github.com/dankogai/p5-encode/pull/118
! Makefile.PL
  Pulled: Fix gccversion Argument "630 20170516" isn't numeric
   https://github.com/dankogai/p5-encode/pull/118
! lib/Encode/MIME/Header.pm t/mime-header.t
  Pulled: Encode::MIME::Header: Fix parsing quoted-printable text
    in strict mode
  https://github.com/dankogai/p5-encode/pull/115
! Encode.pm
  use define_encoding() instead of tweaking $Encode::Encoding{utf8}.
  https://github.com/dankogai/p5-encode/commit/208d094b8cf82da488495400ea9a518841fd007a#commitcomment-22698036

2.91 2017/06/22 08:11:05
! Encode.pm
  Addressed: RT#122167: use parent q{Encode::Encoding}; fails:
    Can't locate object
  https://rt.cpan.org/Ticket/Display.html?id=122167
! Makefile.PL
  Pulled: fix gcc warnings for older gcc < 4.0
  https://github.com/dankogai/p5-encode/pull/114

2.90 2017/06/10 17:23:50
! Makefile.PL
  Pulled: Include all contributors into META
  https://github.com/dankogai/p5-encode/pull/111
! bin/enc2xs bin/ucmlint encoding.pm
  lib/Encode/Encoding.pm lib/Encode/GSM0338.pm t/CJKT.t
  Pulled: Where possible do not depend on value of $@,
    instead use return value of eval
  https://github.com/dankogai/p5-encode/pull/110
! Encode.xs
  Pulled: Fix more XS problems in Encode.xs file
  https://github.com/dankogai/p5-encode/pull/109
! encoding.pm lib/Encode/Encoding.pm t/guess.t
  Pulled: Small fixes
  https://github.com/dankogai/p5-encode/pull/108
! Encode.pm Makefile.PL
  Pulled: Load modules Encode::MIME::Name and Storable normally
  https://github.com/dankogai/p5-encode/pull/107
! Unicode/Unicode.pm lib/Encode/Alias.pm lib/Encode/Encoding.pm
  lib/Encode/Unicode/UTF7.pm
  Pulled: Remove no warnings 'redefine'; and correctly loaddependences
  https://github.com/dankogai/p5-encode/pull/106
! Encode.pm Encode.xs Unicode/Unicode.pm Unicode/Unicode.xs
  Pulled: Remove PP stubs and reformat predefine_encodings()
  https://github.com/dankogai/p5-encode/pull/104
! Encode.pm Encode.xs
  Pulled: Run Encode XS BOOT code at compile time
  https://github.com/dankogai/p5-encode/pull/103
! Encode.pm Unicode/Unicode.pm lib/Encode/Encoding.pm
  lib/Encode/Guess.pm lib/Encode/JP/JIS7.pm lib/Encode/MIME/Header.pm
  lib/Encode/MIME/Header/ISO_2022_JP.pm
  Pulled: Use Encode::define_encoding and propagate carp/croak message
  https://github.com/dankogai/p5-encode/pull/102
! t/truncated_utf8.t t/utf8messages.t
  Pulled: Fixes for older perl versions
  https://github.com/dankogai/p5-encode/pull/101
! Encode.xs encoding.pm t/enc_eucjp.t t/enc_utf8.t
  Pulled: cperl fixes: encoding undeprecated, no strict hashpairs
  https://github.com/dankogai/p5-encode/pull/100
! MANIFEST
  Pulled: Add missing tests into MANIFEST file
  https://github.com/dankogai/p5-encode/pull/99
! Encode.xs t/fallback.t
  Pulled: Cleanup code for handling fallback/replacement characters
  https://github.com/dankogai/p5-encode/pull/98

2.89 2017/04/21 05:20:14
! Encode.pm Encode.xs MANIFEST t/enc_eucjp.t t/enc_utf8.t
+ t/utf8messages.t
  Pulled: Fixes for Encode::utf8
  https://github.com/dankogai/p5-encode/pull/97
! Encode.pm
  Pulled: Fix documentation about CHECK coderef
  https://github.com/dankogai/p5-encode/pull/96
! Encode.xs
  Pulled: For efficiency use newSVpvn() instead of newSVpv()
    in do_fallback_cb()
  https://github.com/dankogai/p5-encode/pull/95
! Encode.xs
  Pulled Call Encode callback function with integer argument correctly
  https://github.com/dankogai/p5-encode/pull/94
! lib/Encode/CN/HZ.pm lib/Encode/GSM0338.pm lib/Encode/JP/JIS7.pm
  lib/Encode/KR/2022_KR.pm lib/Encode/MIME/Header.pm
  lib/Encode/MIME/Header/ISO_2022_JP.pm lib/Encode/Unicode/UTF7.pm
  t/undef.t
  Pulled: Fix all Encode modules so their encode(undef) and decode(undef)
    calls returns undef
  https://github.com/dankogai/p5-encode/pull/93
+ t/whatwg-aliases.json t/whatwg-aliases.t
  Pulled: New (failing) tests for aliases defined in WHATWG Encoding spec #92
  https://github.com/dankogai/p5-encode/pull/92
! Encode.pm
  Pulled: Update documentation for UTF-8
  https://github.com/dankogai/p5-encode/pull/91
! Encode.xs t/truncated_utf8.t
  Pulled: Consume correct number of bytes on malformed
! Encode.pm Unicode/Unicode.pm
  Pulled: document str2bytes and bytes2str
  https://github.com/dankogai/p5-encode/pull/86
! Encode.xs t/fallback.t t/truncated_utf8.t
  Pulled: Fix appending correct number of Unicode replacement characters
  https://github.com/dankogai/p5-encode/pull/84

2.88 2016/11/29 23:29:23
! t/taint.t
  Pulled: Fix test t/taint.t to pass when Encode::ConfigLocal is present
  https://github.com/dankogai/p5-encode/pull/83
! Makefile.PL Unicode/Makefile.PL bin/enc2xs lib/Encode/Alias.pm
  t/Aliases.t t/enc_data.t t/enc_module.t t/encoding.t t/jperl.t
  Pulled: various fixes
  https://github.com/dankogai/p5-encode/pull/82
! t/mime-header.t
  Pulled: Fix test t/mime-header.t to pass on HP-UX 11.23/64 U
    with perl v5.8.3
  https://github.com/dankogai/p5-encode/pull/81
! t/Encode.t
  Pulled: Extend COW tests for UTF-8 and Latin1
  https://github.com/dankogai/p5-encode/pull/80
! Encode.xs Unicode/Unicode.xs
  Pulled: Rmv impediment to compiling under C++11
  https://github.com/dankogai/p5-encode/pull/78
! Encode.xs Unicode/Unicode.xs
  Pulled: Do not use expressions in macros SvTRUE, SvPV, SvIV,
    attr and attr_true
  https://github.com/dankogai/p5-encode/pull/77
! Unicode/Unicode.xs t/magic.t
  Pulled: Fix handling of undef, COW and magic scalar argument
    in Unicode.xs
  https://github.com/dankogai/p5-encode/pull/76
! Encode.xs encoding.pm
  Fix 2 of 3 problems Steve Hay found.
  1. C89 compiler failures (patch attached).
  2. encoding.pm has changed slightly but has no $VERSION++
  Message-Id: <CADED=K6ve_DAzRXPX=EsjtUDnZppAaw+BP1Ziw_fU5f32k+Wyg@mail.gmail.com>

2.87 2016/10/28 05:03:52
! Encode.xs t/taint.t
  Pulled: Disable _utf8_on and _utf8_off for tainted values
  https://github.com/dankogai/p5-encode/pull/74
! Encode.xs MANIFEST t/rt65541.t t/rt76824.t t/rt86327.t
  Pulled: Fix crash 'panic: sv_setpvn called with negative strlen'
  https://github.com/dankogai/p5-encode/pull/73
! Encode.xs MANIFEST t/rt113164.t
  Pulled: Fix crash caused by undefined behaviour between
  two sequence points
  https://github.com/dankogai/p5-encode/pull/72
! Encode.xs  MANIFEST lib/Encode/CN/HZ.pm lib/Encode/Encoder.pm
  t/decode.t t/magic.t t/rt85489.t t/utf8ref.t
  Pulled: Fix handling of undef, ref, typeglob, UTF8, COW and magic
  scalar argument in all XS functions
  https://github.com/dankogai/p5-encode/pull/70
! Encode/_T.e2x t/at-cn.t t/at-tw.t t/enc_data.t t/enc_module.t
  t/encoding-locale.t t/encoding.t t/jperl.t t/mime-name.t t/undef.t
  Pulled: Fix unit tests
  https://github.com/dankogai/p5-encode/pull/69
! Encode.pm lib/Encode/MIME/Header.pm lib/Encode/MIME/Name.pm
  t/mime-header.t t/mime-name.t t/taint.t
  Pulled: Encode::MIME::Header clean up
  https://github.com/dankogai/p5-encode/pull/68
! Encode.xs
  Pulled: Generate CHECK value functions with newCONSTSUB()
    instead with direct XS
  https://github.com/dankogai/p5-encode/pull/67
! Encode.xs
  Pulled: Encode::utf8: Fix count of replacement characters
  for overflowed and overlong UTF-8 sequences
  https://github.com/dankogai/p5-encode/pull/65
! Encode.xs t/fallback.t t/utf8strict.t
  Pulled: Encode::utf8: Fix processing invalid UTF-8 subsequences
  https://github.com/dankogai/p5-encode/pull/63
! Encode.pm t/utf8ref.t
  Pulled: Fix return value of Encode::encode_utf8(undef)
  https://rt.cpan.org/Ticket/Display.html?id=116904
  https://github.com/dankogai/p5-encode/pull/62

2.86 2016/08/10 18:08:45
! encoding.pm t/enc_data.t t/enc_eucjp.t t/enc_module.t t/enc_utf8.t
  t/encoding.t t/jperl.t
  Fixed: #116196: [PATCH] Synchronize encoding.pm with blead
  https://rt.cpan.org/Ticket/Display.html?id=116196
! Byte/Makefile.PL
  Patched: #111421: Won't build with statically built perls
  https://rt.cpan.org/Public/Bug/Display.html?id=111421
! Encode.xs encoding.pm
  Pulled: Fixes for 5.8.x compilation failures
  https://github.com/dankogai/p5-encode/pull/60
! Encode.xs
  Patched: RT#116817 [PATCH] Avoid a C++ comment
  https://rt.cpan.org/Ticket/Display.html?id=116817

2.85 2016/08/04 03:15:58
! Encode.pm bin/enc2xs bin/encguess bin/piconv bin/ucmlint bin/unidump
  Pulled: CVE-2016-1238: avoid loading optional modules from .
  https://github.com/dankogai/p5-encode/pull/58
! Encode.pm t/utf8warnings.t
  Pulled: Rethrow 'utf8' warnings in from_to as well #57
  https://github.com/dankogai/p5-encode/pull/57
! Encode.xs
  Pulled and fixed:
    Encode::utf8: Performance optimization for strict UTF-8 encoder #56
  https://github.com/dankogai/p5-encode/pull/56
! t/Encode.t
  s/use Test/use Test::More/
! t/Encode.t t/decode.t
  Skip tests that pass typeglobs to decode if perl < v5.16
! Encode.xs t/cow.t
  Patched: #115540 (from_to affecting COW strings)
  https://rt.cpan.org/Ticket/Display.html?id=115540
! Encode.xs t/Encode.t t/decode.t
  Merged: RT#115168:
    [PATCH] Passing regex globals to decode() results in wrong result
  https://rt.cpan.org/Ticket/Display.html?id=115168
! Makefile.pl
  Pulled: t/encoding-locale.t fails with Test::More@0.80 or before.
  https://github.com/dankogai/p5-encode/pull/55
! Encode.pm
  Pulled: In-place modifications made explicit in docs for encode(),
  decode() and decode_utf8()
  https://github.com/dankogai/p5-encode/pull/54

2.84 2016/04/11 07:17:02
! lib/Encode/MIME/Header.pm
  Pulled: Encode::MIME::Header:
    Update description that this module is only for unstructured header
  https://github.com/dankogai/p5-encode/pull/53
! lib/Encode/MIME/Header.pm t/mime-header.t
  Pulled: Encode::MIME::Header: Fix valid_q_chars, '-' needs to be escaped
  https://github.com/dankogai/p5-encode/pull/52

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../{libencode-perl_2.83.bb => libencode-perl_2.94.bb}    | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_2.83.bb => libencode-perl_2.94.bb} (72%)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_2.83.bb b/meta-perl/recipes-perl/libencode/libencode-perl_2.94.bb
similarity index 72%
rename from meta-perl/recipes-perl/libencode/libencode-perl_2.83.bb
rename to meta-perl/recipes-perl/libencode/libencode-perl_2.94.bb
index 1189ff941..9861c56e0 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_2.83.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_2.94.bb
@@ -12,11 +12,11 @@ AUTHOR = "Dan Kogai <dankogai+cpan@gmail.com>"
 HOMEPAGE = "https://metacpan.org/release/Encode"
 SECTION = "lib"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://META.json;md5=fdbebc82e925d8acbce42cfad131c4d1"
+LIC_FILES_CHKSUM = "file://META.json;md5=d8e909447b983532b2b460c830e7a7e4"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[md5sum] = "0d3f59e8ea704497647eded665919053"
-SRC_URI[sha256sum] = "5d3a90e30aabe78dfcf5e816ffb1da1e33475892dbd0075320315cdce5682988"
+SRC_URI[md5sum] = "f995e0eb9e52d01ed57abe835bf3ccb6"
+SRC_URI[sha256sum] = "acb3a4af5e3ee38f94de8baa7454e0b836a0649e7ac4180f28dfca439ad60cff"
 
 UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
@@ -24,8 +24,15 @@ S = "${WORKDIR}/Encode-${PV}"
 
 inherit cpan
 
+#  file /usr/bin/enc2xs from install of perl-misc-5.24.1-r0.i586 conflicts with file from package libencode-perl-2.94-r0.i586
+#  file /usr/bin/encguess from install of perl-misc-5.24.1-r0.i586 conflicts with file from package libencode-perl-2.94-r0.i586
+#  file /usr/bin/piconv from install of perl-misc-5.24.1-r0.i586 conflicts with file from package libencode-perl-2.94-r0.i586
+RCONFLICTS_${PN} = "perl-misc"
+
 RDEPENDS_${PN} += " perl-module-bytes \
                     perl-module-constant \
+                    perl-module-parent \
+                    perl-module-storable \
                     perl-module-xsloader \
 "
 
@@ -49,7 +56,7 @@ RPROVIDES_${PN} += "libencode-alias-perl \
                     libencode-mime-name-perl \
                     libencode-symbol-perl \
                     libencode-tw-perl \
-                    libencode-unicode--perl \
+                    libencode-unicode-perl \
                     libencode-unicode-utf7-perl \
                     libencoding-perl \
                     libencode-internal-perl \
-- 
2.13.6


