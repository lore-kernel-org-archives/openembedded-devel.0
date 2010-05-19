Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.moussaud@gmail.com>) id 1OEm8c-0008WI-OG
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 18:28:56 +0200
Received: by ewy21 with SMTP id 21so458825ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 May 2010 09:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=DOmAppZ8sc0MqrDIZhURr3tiSY/GGYStctXdB1pY46w=;
	b=TarussRPGgwdTPyNiPcOoIUSV94pz4ndGUkeDPhxI2pSobiwRABl767htIttF/kPj+
	MKcH5JJkEch/0wznepWbeBcMJ8syBbqyhTnl5wsGAp1dHcPSPs/Ukag+VKoESELe5qAI
	JI1BoAKGTXkHaem5GL9TZX1sFbr1cC9CaANCk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=s3OE5oxRH//gM/mcbX5+vVlbIAM2YI9ORHFNz8W5MIcRcH+YrLjVfDClfnrXrYyF9y
	lI5a17IuxntuvN1cqxgEGm7lcxf/s0U1I1yQIQGzBZQq7R+7CYqY3FlAIVGIELd/cJE7
	EeEw7W2JbjmlSM9gwXn+aMoPESR0gtyJRv57s=
Received: by 10.103.79.19 with SMTP id g19mr918165mul.75.1274286293478; Wed, 
	19 May 2010 09:24:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.115.212 with HTTP; Wed, 19 May 2010 09:24:33 -0700 (PDT)
In-Reply-To: <4B718115.1010104@tycoelectronics.com>
References: <mailman.1729.1265722552.14961.openembedded-devel@lists.openembedded.org>
	<4B718115.1010104@tycoelectronics.com>
From: David MOUSSAUD <d.moussaud@gmail.com>
Date: Wed, 19 May 2010 18:24:33 +0200
Message-ID: <AANLkTik6gpgWgU6ETC-aEYyyuRnAhu1fRlLU-zDA9dDU@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.221
X-SA-Exim-Mail-From: d.moussaud@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,WEIRD_PORT
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: error trying to build parted 1.8.8 : configure.ac:173: error: AC_REQUIRE: circular dependency of AC_GNU_SOURCE
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
X-List-Received-Date: Wed, 19 May 2010 16:28:56 -0000
X-Groupsio-MsgNum: 19421
Content-Type: multipart/mixed; boundary=0016e65b5dd6dd72c20486f4e5a4

--0016e65b5dd6dd72c20486f4e5a4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

that patch works for me.


diff --git a/recipes/parted/files/extensions-m4.patch
b/recipes/parted/files/extensions-m4.patch
new file mode 100644
index 0000000..1ec53f7
--- /dev/null
+++ b/recipes/parted/files/extensions-m4.patch
@@ -0,0 +1,26 @@
+diff -Nru parted-1.8.8/m4/extensions.m4 parted-1.8.8.patched/m4/extensions=
.m4
+--- parted-1.8.8/m4/extensions.m4	2006-10-12 10:01:18.000000000 +0200
++++ parted-1.8.8.patched/m4/extensions.m4	2010-05-19 18:14:35.000000000 +0=
200
+@@ -1,4 +1,4 @@
+-# serial 4  -*- Autoconf -*-
++# serial 5  -*- Autoconf -*-
+ # Enable extensions on systems that normally disable them.
+
+ # Copyright (C) 2003, 2006 Free Software Foundation, Inc.
+@@ -16,6 +16,7 @@
+ # ------------------------
+ # Enable extensions on systems that normally disable them,
+ # typically due to standards-conformance issues.
++m4_ifdef([AC_USE_SYSTEM_EXTENSIONS], [], [
+ AC_DEFUN([AC_USE_SYSTEM_EXTENSIONS],
+ [
+   AC_BEFORE([$0], [AC_COMPILE_IFELSE])
+@@ -48,7 +49,7 @@
+     AC_DEFINE([__EXTENSIONS__])
+   AC_DEFINE([_POSIX_PTHREAD_SEMANTICS])
+   AC_DEFINE([_TANDEM_SOURCE])
+-])
++])])
+
+ # gl_USE_SYSTEM_EXTENSIONS
+ # ------------------------
diff --git a/recipes/parted/parted_1.8.8.bb b/recipes/parted/parted_1.8.8.b=
b
index 2890e23..82369f1 100644
--- a/recipes/parted/parted_1.8.8.bb
+++ b/recipes/parted/parted_1.8.8.bb
@@ -3,11 +3,12 @@ HOMEPAGE =3D "http://www.gnu.org/software/parted/parted.h=
tml"
 LICENSE =3D "GPLv3"
 SECTION =3D "console/tools"
 DEPENDS =3D "readline util-linux-ng"
-PR =3D "r3"
+PR =3D "r4"

 SRC_URI =3D "${GNU_MIRROR}/parted/parted-${PV}.tar.gz \
 	   file://use_llseek_syscall.patch;patch=3D1 \
 	   file://parted-1.8.x.patch;patch=3D1 \
+	   file://extensions-m4.patch;patch=3D1 \
 "

 EXTRA_OECONF =3D "--disable-Werror ac_cv_func_calloc_0_nonnull=3Dyes"


regards,
David

On Tue, Feb 9, 2010 at 5:36 PM, Jay Snyder
<jay.snyder@tycoelectronics.com> wrote:
> I'm trying to build parted 1.8.8 on OE:
>
>
> NOTE: Running task 551 of 565 (ID: 3,
> /home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb, do_unpac=
k)
> NOTE: Running task 552 of 565 (ID: 13,
> /home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb,
> do_distribute_sources)
> NOTE: Unpacking ../downloads/parted-1.8.8.tar.gz to
> tmp/work/i686-angstrom-linux/parted-1.8.8-r2/
> =A0NOTE: Running task 553 of 565 (ID: 4,
> /home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb, do_patch=
)
> =A0 =A0 =A0 =A0 =A0 NOTE: Applying patch 'use_llseek_syscall.patch'
> (../2009-12-04/openembedded/recipes/parted/files/use_llseek_syscall.patch=
)
>
> NOTE: Applying patch 'parted-1.8.x.patch'
> (../2009-12-04/openembedded/recipes/parted/files/parted-1.8.x.patch)
>
> NOTE: Running task 554 of 565 (ID: 5,
> /home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb,
> do_configure) =A0 =A0 =A0 =A0 ERROR: function do_configure failed
>
> ERROR: log data follows
> (/home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/temp/log.do_=
configure.24731)
>
> | automake (GNU automake) 1.10.2
>
> | Copyright (C) 2008 Free Software Foundation, Inc.
>
> | License GPLv2+: GNU GPL version 2 or later
> <http://gnu.org/licenses/gpl.html>
>
> | This is free software: you are free to change and redistribute it.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 | There is NO WARRANTY, to
> the extent permitted by law.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|
>
> | Written by Tom Tromey <tromey@redhat.com>
>
> | =A0 =A0 =A0 =A0and Alexandre Duret-Lutz <adl@gnu.org>.
>
> | AUTOV is 1.10
>
> | NOTE: Executing autoreconf --verbose --install --force --exclude=3Dauto=
point
> -I
> /home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/parted-1.8.8/=
m4/
> -I/home/oe/build/tmp/staging/i686-angstrom-linux/usr/share/aclocal-1.10 -=
I
> /home/oe/build/tmp/staging/i686-angstrom-linux/usr/share/aclocal
> | autoreconf: Entering directory `.'
> | autoreconf: running: aclocal -I
> /home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/parted-1.8.8/=
m4/
> -I /home/oe/build/tmp/staging/i686-angstrom-linux/usr/share/aclocal-1.10 =
-I
> /home/oe/build/tmp/staging/i686-angstrom-linux/usr/share/aclocal --force =
-I
> m4
> | configure.ac:173: error: AC_REQUIRE: circular dependency of AC_GNU_SOUR=
CE
> |
> /home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/parted-1.8.8/=
m4/extensions.m4:19:
> AC_USE_SYSTEM_EXTENSIONS is expanded from...
> | ../../lib/autoconf/specific.m4:332: AC_GNU_SOURCE is expanded from...
> |
> /home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/parted-1.8.8/=
m4/gnulib-comp.m4:23:
> gl_EARLY is expanded from...
> | configure.ac:173: the top level
> | autom4te: /home/oe/build/tmp/staging/x86_64-linux/usr/bin/m4 failed wit=
h
> exit status: 1
> | aclocal: autom4te failed with exit status: 1
> | autoreconf: aclocal failed with exit status: 1
> | FATAL: autoreconf execution failed.
> NOTE: Task failed:
> /home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/temp/log.do_c=
onfigure.24731
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb do_config=
ure
> failed
> ERROR: Task 5
> (/home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb,
> do_configure) failed
> NOTE: Tasks Summary: Attempted 553 tasks of which 548 didn't need to be
> rerun and 1 failed.
> ERROR: '/home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb'
> failed
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

--0016e65b5dd6dd72c20486f4e5a4
Content-Type: application/octet-stream; name="parted-build-error.patch"
Content-Disposition: attachment; filename="parted-build-error.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g9ed42qw0

ZGlmZiAtLWdpdCBhL3JlY2lwZXMvcGFydGVkL2ZpbGVzL2V4dGVuc2lvbnMtbTQucGF0Y2ggYi9y
ZWNpcGVzL3BhcnRlZC9maWxlcy9leHRlbnNpb25zLW00LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAuLjFlYzUzZjcKLS0tIC9kZXYvbnVsbAorKysgYi9yZWNpcGVzL3Bh
cnRlZC9maWxlcy9leHRlbnNpb25zLW00LnBhdGNoCkBAIC0wLDAgKzEsMjYgQEAKK2RpZmYgLU5y
dSBwYXJ0ZWQtMS44LjgvbTQvZXh0ZW5zaW9ucy5tNCBwYXJ0ZWQtMS44LjgucGF0Y2hlZC9tNC9l
eHRlbnNpb25zLm00CistLS0gcGFydGVkLTEuOC44L200L2V4dGVuc2lvbnMubTQJMjAwNi0xMC0x
MiAxMDowMToxOC4wMDAwMDAwMDAgKzAyMDAKKysrKyBwYXJ0ZWQtMS44LjgucGF0Y2hlZC9tNC9l
eHRlbnNpb25zLm00CTIwMTAtMDUtMTkgMTg6MTQ6MzUuMDAwMDAwMDAwICswMjAwCitAQCAtMSw0
ICsxLDQgQEAKKy0jIHNlcmlhbCA0ICAtKi0gQXV0b2NvbmYgLSotCisrIyBzZXJpYWwgNSAgLSot
IEF1dG9jb25mIC0qLQorICMgRW5hYmxlIGV4dGVuc2lvbnMgb24gc3lzdGVtcyB0aGF0IG5vcm1h
bGx5IGRpc2FibGUgdGhlbS4KKyAKKyAjIENvcHlyaWdodCAoQykgMjAwMywgMjAwNiBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KK0BAIC0xNiw2ICsxNiw3IEBACisgIyAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KKyAjIEVuYWJsZSBleHRlbnNpb25zIG9uIHN5c3RlbXMgdGhhdCBub3Jt
YWxseSBkaXNhYmxlIHRoZW0sCisgIyB0eXBpY2FsbHkgZHVlIHRvIHN0YW5kYXJkcy1jb25mb3Jt
YW5jZSBpc3N1ZXMuCisrbTRfaWZkZWYoW0FDX1VTRV9TWVNURU1fRVhURU5TSU9OU10sIFtdLCBb
CisgQUNfREVGVU4oW0FDX1VTRV9TWVNURU1fRVhURU5TSU9OU10sCisgWworICAgQUNfQkVGT1JF
KFskMF0sIFtBQ19DT01QSUxFX0lGRUxTRV0pCitAQCAtNDgsNyArNDksNyBAQAorICAgICBBQ19E
RUZJTkUoW19fRVhURU5TSU9OU19fXSkKKyAgIEFDX0RFRklORShbX1BPU0lYX1BUSFJFQURfU0VN
QU5USUNTXSkKKyAgIEFDX0RFRklORShbX1RBTkRFTV9TT1VSQ0VdKQorLV0pCisrXSldKQorIAor
ICMgZ2xfVVNFX1NZU1RFTV9FWFRFTlNJT05TCisgIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
ZGlmZiAtLWdpdCBhL3JlY2lwZXMvcGFydGVkL3BhcnRlZF8xLjguOC5iYiBiL3JlY2lwZXMvcGFy
dGVkL3BhcnRlZF8xLjguOC5iYgppbmRleCAyODkwZTIzLi44MjM2OWYxIDEwMDY0NAotLS0gYS9y
ZWNpcGVzL3BhcnRlZC9wYXJ0ZWRfMS44LjguYmIKKysrIGIvcmVjaXBlcy9wYXJ0ZWQvcGFydGVk
XzEuOC44LmJiCkBAIC0zLDExICszLDEyIEBAIEhPTUVQQUdFID0gImh0dHA6Ly93d3cuZ251Lm9y
Zy9zb2Z0d2FyZS9wYXJ0ZWQvcGFydGVkLmh0bWwiCiBMSUNFTlNFID0gIkdQTHYzIgogU0VDVElP
TiA9ICJjb25zb2xlL3Rvb2xzIgogREVQRU5EUyA9ICJyZWFkbGluZSB1dGlsLWxpbnV4LW5nIgot
UFIgPSAicjMiCitQUiA9ICJyNCIKIAogU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L3BhcnRlZC9w
YXJ0ZWQtJHtQVn0udGFyLmd6IFwKIAkgICBmaWxlOi8vdXNlX2xsc2Vla19zeXNjYWxsLnBhdGNo
O3BhdGNoPTEgXAogCSAgIGZpbGU6Ly9wYXJ0ZWQtMS44LngucGF0Y2g7cGF0Y2g9MSBcCisJICAg
ZmlsZTovL2V4dGVuc2lvbnMtbTQucGF0Y2g7cGF0Y2g9MSBcCiAiCiAgICAgICAgICAgIAogRVhU
UkFfT0VDT05GID0gIi0tZGlzYWJsZS1XZXJyb3IgYWNfY3ZfZnVuY19jYWxsb2NfMF9ub25udWxs
PXllcyIK

--0016e65b5dd6dd72c20486f4e5a4--
