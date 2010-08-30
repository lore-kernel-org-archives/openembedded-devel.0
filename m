Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1Oq4RV-000203-T8
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 15:30:44 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id o7UDOWor031081
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 08:24:32 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id o7UDOW9e005337
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 08:24:32 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o7UDOWGW027128
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 08:24:32 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Mon, 30 Aug 2010 08:24:32 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Aug 2010 08:24:30 -0500
Thread-Topic: [oe] [PATCH] jpeg_8b: Allow using older versions of automake
Thread-Index: ActGJV677srKhkKDQb+cPPuoctKibgCII3Yg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310753C8F@dlee06.ent.ti.com>
References: <1282924252-22046-1-git-send-email-chase.maupin@ti.com>
	<AANLkTik_1G5-zR7CXWnho4nfkFJAap4OkRp10iKphL2t@mail.gmail.com>
In-Reply-To: <AANLkTik_1G5-zR7CXWnho4nfkFJAap4OkRp10iKphL2t@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.41
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] jpeg_8b: Allow using older versions of automake
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
X-List-Received-Date: Mon, 30 Aug 2010 13:30:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Khem,

I'd be happy to make the patch but in this case the resulting differences i=
n configure appear to be just changes to line numbers in the script because=
 my patch caused a new comment line to be inserted.  I'm not sure if this p=
atch to configure would add anything but clutter.  However, if you still wa=
nt it I'll add it to the patch and resend.  The changes to configure would =
be (and sorry for any outlook mangling):

diff -burpN orig/configure new/configure
--- orig/configure	2010-08-30 08:03:01.485893044 -0500
+++ new/configure	2010-08-30 08:08:57.961780786 -0500
@@ -2950,6 +2950,7 @@ am__tar=3D'${AMTAR} chof - "$$tardir"'; am
 # Make --enable-silent-rules the default.
 # To get verbose build output you may configure
 # with --disable-silent-rules or use "make V=3D1".
+# only use if available
 # Check whether --enable-silent-rules was given.
 if test "${enable_silent_rules+set}" =3D set; then :
   enableval=3D$enable_silent_rules;
@@ -6950,13 +6951,13 @@ if test "${lt_cv_nm_interface+set}" =3D se
 else
   lt_cv_nm_interface=3D"BSD nm"
   echo "int some_variable =3D 0;" > conftest.$ac_ext
-  (eval echo "\"\$as_me:6953: $ac_compile\"" >&5)
+  (eval echo "\"\$as_me:6954: $ac_compile\"" >&5)
   (eval "$ac_compile" 2>conftest.err)
   cat conftest.err >&5
-  (eval echo "\"\$as_me:6956: $NM \\\"conftest.$ac_objext\\\"\"" >&5)
+  (eval echo "\"\$as_me:6957: $NM \\\"conftest.$ac_objext\\\"\"" >&5)
   (eval "$NM \"conftest.$ac_objext\"" 2>conftest.err > conftest.out)
   cat conftest.err >&5
-  (eval echo "\"\$as_me:6959: output\"" >&5)
+  (eval echo "\"\$as_me:6960: output\"" >&5)
   cat conftest.out >&5
   if $GREP 'External.*some_variable' conftest.out > /dev/null; then
     lt_cv_nm_interface=3D"MS dumpbin"
@@ -8147,7 +8148,7 @@ ia64-*-hpux*)
   ;;
 *-*-irix6*)
   # Find out which ABI we are using.
-  echo '#line 8150 "configure"' > conftest.$ac_ext
+  echo '#line 8151 "configure"' > conftest.$ac_ext
   if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } =
>&5
   (eval $ac_compile) 2>&5
   ac_status=3D$?
@@ -9404,11 +9405,11 @@ else
    -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
    -e 's: [^ ]*conftest\.: $lt_compiler_flag&:; t' \
    -e 's:$: $lt_compiler_flag:'`
-   (eval echo "\"\$as_me:9407: $lt_compile\"" >&5)
+   (eval echo "\"\$as_me:9408: $lt_compile\"" >&5)
    (eval "$lt_compile" 2>conftest.err)
    ac_status=3D$?
    cat conftest.err >&5
-   echo "$as_me:9411: \$? =3D $ac_status" >&5
+   echo "$as_me:9412: \$? =3D $ac_status" >&5
    if (exit $ac_status) && test -s "$ac_outfile"; then
      # The compiler can only warn and ignore the option if not recognized
      # So say no if there are warnings other than the usual output.
@@ -9743,11 +9744,11 @@ else
    -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
    -e 's: [^ ]*conftest\.: $lt_compiler_flag&:; t' \
    -e 's:$: $lt_compiler_flag:'`
-   (eval echo "\"\$as_me:9746: $lt_compile\"" >&5)
+   (eval echo "\"\$as_me:9747: $lt_compile\"" >&5)
    (eval "$lt_compile" 2>conftest.err)
    ac_status=3D$?
    cat conftest.err >&5
-   echo "$as_me:9750: \$? =3D $ac_status" >&5
+   echo "$as_me:9751: \$? =3D $ac_status" >&5
    if (exit $ac_status) && test -s "$ac_outfile"; then
      # The compiler can only warn and ignore the option if not recognized
      # So say no if there are warnings other than the usual output.
@@ -9848,11 +9849,11 @@ else
    -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
    -e 's: [^ ]*conftest\.: $lt_compiler_flag&:; t' \
    -e 's:$: $lt_compiler_flag:'`
-   (eval echo "\"\$as_me:9851: $lt_compile\"" >&5)
+   (eval echo "\"\$as_me:9852: $lt_compile\"" >&5)
    (eval "$lt_compile" 2>out/conftest.err)
    ac_status=3D$?
    cat out/conftest.err >&5
-   echo "$as_me:9855: \$? =3D $ac_status" >&5
+   echo "$as_me:9856: \$? =3D $ac_status" >&5
    if (exit $ac_status) && test -s out/conftest2.$ac_objext
    then
      # The compiler can only warn and ignore the option if not recognized
@@ -9903,11 +9904,11 @@ else
    -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
    -e 's: [^ ]*conftest\.: $lt_compiler_flag&:; t' \
    -e 's:$: $lt_compiler_flag:'`
-   (eval echo "\"\$as_me:9906: $lt_compile\"" >&5)
+   (eval echo "\"\$as_me:9907: $lt_compile\"" >&5)
    (eval "$lt_compile" 2>out/conftest.err)
    ac_status=3D$?
    cat out/conftest.err >&5
-   echo "$as_me:9910: \$? =3D $ac_status" >&5
+   echo "$as_me:9911: \$? =3D $ac_status" >&5
    if (exit $ac_status) && test -s out/conftest2.$ac_objext
    then
      # The compiler can only warn and ignore the option if not recognized
@@ -12270,7 +12271,7 @@ else
   lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
   lt_status=3D$lt_dlunknown
   cat > conftest.$ac_ext <<_LT_EOF
-#line 12273 "configure"
+#line 12274 "configure"
 #include "confdefs.h"
=20
 #if HAVE_DLFCN_H
@@ -12366,7 +12367,7 @@ else
   lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
   lt_status=3D$lt_dlunknown
   cat > conftest.$ac_ext <<_LT_EOF
-#line 12369 "configure"
+#line 12370 "configure"
 #include "confdefs.h"
=20
 #if HAVE_DLFCN_H



Sincerely,
Chase Maupin
Software Applications
Catalog DSP Products
e-mail: chase.maupin@ti.com
phone: (281) 274-3285

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Friday, August 27, 2010 3:19 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] jpeg_8b: Allow using older versions of automake
>=20
> On Fri, Aug 27, 2010 at 8:50 AM, Chase Maupin <chasemaupin03@gmail.com>
> wrote:
> >
> >
> > Signed-off-by: Chase Maupin <chase.maupin@ti.com>
>=20
> patch looks ok. I would suggest to regenerate configure and also
> include in the patch. If we use autotools class do_configure
> then configure is regenerated so that may not be needed but it does
> not hurt to have it patched
>=20
> > ---
> > =A0...igure-make-jpeg-work-with-older-autotools.patch | =A0 30
> ++++++++++++++++++++
> > =A0recipes/jpeg/jpeg_8b.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A07 +++-
> > =A02 files changed, 35 insertions(+), 2 deletions(-)
> > =A0create mode 100644 recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-wor=
k-
> with-older-autotools.patch
> >
> > diff --git a/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with-
> older-autotools.patch b/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-
> work-with-older-autotools.patch
> > new file mode 100644
> > index 0000000..dd6fd52
> > --- /dev/null
> > +++ b/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with-older-
> autotools.patch
> > @@ -0,0 +1,30 @@
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


