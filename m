Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P2eq1-0006Sl-1b
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 08:47:55 +0200
Received: by fxm8 with SMTP id 8so3193660fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Oct 2010 23:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=iL1e51sQInE+QysVtJMtz4fs8NBfnK2txXMd+8TW8t0=;
	b=DKWxMYZscJ3/AC/1DCCy5ABIb9+UuDFVTKLIs9OoGMZHY2RO8qGt3iz6YkbGTwDUBU
	/PJAAlDO0BJXgy+WV97jr3a1w2D3bjCJI+got5XNGvmJve6bHhP7nPkStJ6Jd6EA/dqV
	Zv65XYqHiWj7lnb28qGUS5beGfF+yeuMwE5Ls=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=JBRPTOT9Vczqg63Pb7ZeT4/XZD43rBTNH37i2s5P7zCO9WKR/V+m7Ps/AMS9eAQPpv
	FkmU7RY6h8mBxRqwHzQ+/7pCsxiDuB82sMpN1SzwLqRylWyu/fS9bA004fT6rajf/1m3
	z6h+qu1nao8dR+hm0kfjqmK/IfdRfM4kt7dT4=
Received: by 10.103.6.7 with SMTP id j7mr2474817mui.91.1286174854783; Sun, 03
	Oct 2010 23:47:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.107.20 with HTTP; Sun, 3 Oct 2010 23:47:14 -0700 (PDT)
In-Reply-To: <1286129412.4310.30.camel@mattotaupa>
References: <1286121284.4310.15.camel@mattotaupa>
	<1286129412.4310.30.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 3 Oct 2010 23:47:14 -0700
Message-ID: <AANLkTini=2H3kMPywmF9w2tAOeJcGAaghnOv6rCiwmGN@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] python-{native}-2.6.5: Fix parallel build.
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
X-List-Received-Date: Mon, 04 Oct 2010 06:47:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 3, 2010 at 11:10 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Sorry, I forgot to add the patch iteration to the subject line. It is v3
> and it has the ID 3153 in Patchwork [1].

you have my ack for this patch

>
> Am Sonntag, den 03.10.2010, 17:54 +0200 schrieb Paul Menzel:
>> Date: Sat, 2 Oct 2010 12:51:03 +0200
>>
>> Randomly the build failed for me with the following error message.
>>
>> =C2=A0 =C2=A0 libpython2.6.so: undefined reference to `_PyParser_Grammar=
'
>>
>> The applied patch in [5] tried to fix this problem, but it turns out tha=
t this also was due to a possible race. This is already known in OpenOffice=
 too [3].
>>
>> R. David Murray (dmalcolm) <dmalcolm@fedoraproject.org> fixed this in Fe=
dora [1] and I applied his patch.
>>
>> I reported this issue upstream [4] and this will only be fixed in Python=
 2.7, so we have to keep this patch for Python 2.6.
>>
>> I put 00 in front of the name of the patch file because I did not want t=
o rename the other patches.
>>
>> I build tested this with `MACHINE =3D " beagleboard"` for `angstrom-2008=
.1` and `minimal-{eglibc,uclibc,libc}`.
>>
>> [1] http://pkgs.fedoraproject.org/gitweb/?p=3Dpython.git;a=3Dcommitdiff;=
h=3Db95f6cc2ca6a009f97436c6aa16cfd70547353d9
>> [2] http://www.openoffice.org/issues/show_bug.cgi?id=3D114866
>> [3] http://doc.services.openoffice.org/wiki/RedTinderboxStatusInEIS
>> [4] http://bugs.python.org/issue10013
>> [5] http://patchwork.openembedded.org/patch/1899/
>>
>> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
>> ---
>> v1 =E2=86=92 v2: comments by Khem and Tom, add accidentely removed =C2=
=BB\=C2=AB at the line ending.
>> v2 =E2=86=92 v3: Reorder patches, so that they can be applied to python =
and python-native.
>> ---
>> =C2=A0.../python/python-2.6.5/00-fix-parallel-make.patch | =C2=A0 40 +++=
+++++++++++++++++
>> =C2=A0.../01-use-proper-tools-for-cross-build.patch =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 14 +++---
>> =C2=A0recipes/python/python-native_2.6.5.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +-
>> =C2=A0recipes/python/python_2.6.5.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 +-
>> =C2=A04 files changed, 51 insertions(+), 9 deletions(-)
>> =C2=A0create mode 100644 recipes/python/python-2.6.5/00-fix-parallel-mak=
e.patch
>>
>> diff --git a/recipes/python/python-2.6.5/00-fix-parallel-make.patch b/re=
cipes/python/python-2.6.5/00-fix-parallel-make.patch
>> new file mode 100644
>> index 0000000..c80ca19
>> --- /dev/null
>> +++ b/recipes/python/python-2.6.5/00-fix-parallel-make.patch
>> @@ -0,0 +1,40 @@
>> +upstream: <http://bugs.python.org/issue10013>
>> +comment: As in the comment in the issue tracker this is fixed for py3k =
a little differently <http://svn.python.org/view?view=3Drev&revision=3D8406=
8>. This patch is taken from Fedora.
>> +
>> +diff -up Python-2.7/Makefile.pre.in.fix-parallel-make Python-2.7/Makefi=
le.pre.in
>> +--- Python-2.7/Makefile.pre.in.fix-parallel-make =C2=A0 =C2=A0 2010-07-=
22 15:01:39.567996932 -0400
>> ++++ Python-2.7/Makefile.pre.in =C2=A0 =C2=A0 =C2=A0 2010-07-22 15:47:02=
.437998509 -0400
>> +@@ -197,6 +197,7 @@ SIGNAL_OBJS=3D =C2=A0 =C2=A0 @SIGNAL_OBJS@
>> +
>> + ######################################################################=
####
>> + # Grammar
>> ++GRAMMAR_STAMP=3D =C2=A0 =C2=A0 =C2=A0$(srcdir)/grammar-stamp
>> + GRAMMAR_H=3D =C2=A0$(srcdir)/Include/graminit.h
>> + GRAMMAR_C=3D =C2=A0$(srcdir)/Python/graminit.c
>> + GRAMMAR_INPUT=3D =C2=A0 =C2=A0 =C2=A0$(srcdir)/Grammar/Grammar
>> +@@ -514,10 +515,24 @@ Modules/getpath.o: $(srcdir)/Modules/get
>> + Modules/python.o: $(srcdir)/Modules/python.c
>> + =C2=A0 =C2=A0 $(MAINCC) -c $(PY_CFLAGS) -o $@ $(srcdir)/Modules/python=
.c
>> +
>> ++# GNU "make" interprets rules with two dependents as two copies of the=
 rule.
>> ++#
>> ++# In a parallel build this can lead to pgen being run twice, once for =
each of
>> ++# GRAMMAR_H and GRAMMAR_C, leading to race conditions in which the com=
piler
>> ++# reads a partially-overwritten copy of one of these files, leading to=
 syntax
>> ++# errors (or linker errors if the fragment happens to be syntactically=
 valid C)
>> ++#
>> ++# See http://www.gnu.org/software/hello/manual/automake/Multiple-Outpu=
ts.html
>> ++# for more information.
>> ++#
>> ++# Introduce ".grammar-stamp" as a contrived single output from PGEN to=
 avoid
>> ++# this:
>> ++$(GRAMMAR_H) $(GRAMMAR_C): $(GRAMMAR_STAMP)
>> +
>> +-$(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
>> ++$(GRAMMAR_STAMP): $(PGEN) $(GRAMMAR_INPUT)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -@$(INSTALL) -d Include
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -$(PGEN) $(GRAMMAR_INPUT) $(=
GRAMMAR_H) $(GRAMMAR_C)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touch $(GRAMMAR_STAMP)
>> +
>> + $(PGEN): =C2=A0 =C2=A0$(PGENOBJS)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CC) $(OPT) $(LDFLAGS) $(PG=
ENOBJS) $(LIBS) -o $(PGEN)
>> diff --git a/recipes/python/python-2.6.5/01-use-proper-tools-for-cross-b=
uild.patch b/recipes/python/python-2.6.5/01-use-proper-tools-for-cross-buil=
d.patch
>> index e89faa4..4b485ec 100644
>> --- a/recipes/python/python-2.6.5/01-use-proper-tools-for-cross-build.pa=
tch
>> +++ b/recipes/python/python-2.6.5/01-use-proper-tools-for-cross-build.pa=
tch
>> @@ -14,7 +14,7 @@ Index: Python-2.6.1/Makefile.pre.in
>>
>> =C2=A0 # The task to run while instrument when building the profile-opt =
target
>> =C2=A0 PROFILE_TASK=3D =C2=A0 =C2=A0 =C2=A0 $(srcdir)/Tools/pybench/pybe=
nch.py -n 2 --with-gc --with-syscheck
>> -@@ -205,7 +206,7 @@ GRAMMAR_INPUT=3D =C2=A0 $(srcdir)/Grammar/Grammar
>> +@@ -206,7 +207,7 @@ GRAMMAR_INPUT=3D =C2=A0 $(srcdir)/Grammar/Grammar
>> =C2=A0 #################################################################=
#########
>> =C2=A0 # Parser
>> =C2=A0 PGEN=3D =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Parser/p=
gen$(EXE)
>> @@ -23,7 +23,7 @@ Index: Python-2.6.1/Makefile.pre.in
>> =C2=A0 POBJS=3D =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Parser/acceler.o \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Parser/grammar1.o \
>> -@@ -394,8 +395,8 @@ platform: $(BUILDPYTHON)
>> +@@ -395,8 +396,8 @@ platform: $(BUILDPYTHON)
>> =C2=A0 # Build the shared modules
>> =C2=A0 sharedmods: $(BUILDPYTHON)
>> =C2=A0 =C2=A0 =C2=A0 @case $$MAKEFLAGS in \
>> @@ -34,16 +34,16 @@ Index: Python-2.6.1/Makefile.pre.in
>> =C2=A0 =C2=A0 =C2=A0 esac
>>
>> =C2=A0 # Build static library
>> -@@ -513,7 +514,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
>> +@@ -531,7 +532,7 @@ $(GRAMMAR_H) $(GRAMMAR_C): $(GRAMMAR_STAMP)
>>
>> - $(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
>> + $(GRAMMAR_STAMP): $(PGEN) $(GRAMMAR_INPUT)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -@$(INSTALL) -d Include
>> =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-$(PGEN) $(GRAMMAR_INPU=
T) $(GRAMMAR_H) $(GRAMMAR_C)
>> =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-$(HOSTPGEN) $(GRAMMAR_=
INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 touch $(GRAMMAR_STAMP)
>>
>> =C2=A0 $(PGEN): =C2=A0 =C2=A0$(PGENOBJS)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CC) $(OPT) $(LDFLAGS) $(PG=
ENOBJS) $(LIBS) -o $(PGEN)
>> -@@ -879,23 +880,23 @@ libinstall: =C2=A0 =C2=A0build_all $(srcdir)/Lib/=
$(PL
>> +@@ -902,23 +903,23 @@ libinstall: =C2=A0 =C2=A0build_all $(srcdir)/Lib/=
$(PL
>> =C2=A0 =C2=A0 =C2=A0 done
>> =C2=A0 =C2=A0 =C2=A0 $(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDE=
ST)/LICENSE.txt
>> =C2=A0 =C2=A0 =C2=A0 PYTHONPATH=3D$(DESTDIR)$(LIBDEST) =C2=A0$(RUNSHARED=
) \
>> @@ -72,7 +72,7 @@ Index: Python-2.6.1/Makefile.pre.in
>>
>> =C2=A0 # Create the PLATDIR source directory, if one wasn't distributed.=
.
>> =C2=A0 $(srcdir)/Lib/$(PLATDIR):
>> -@@ -993,7 +994,7 @@ libainstall: =C2=A0 =C2=A0 all
>> +@@ -1016,7 +1017,7 @@ libainstall: =C2=A0 all
>> =C2=A0 # Install the dynamically loadable modules
>> =C2=A0 # This goes into $(exec_prefix)
>> =C2=A0 sharedinstall:
>> diff --git a/recipes/python/python-native_2.6.5.bb b/recipes/python/pyth=
on-native_2.6.5.bb
>> index 76fbbb6..51a1fb1 100644
>> --- a/recipes/python/python-native_2.6.5.bb
>> +++ b/recipes/python/python-native_2.6.5.bb
>> @@ -1,9 +1,10 @@
>> =C2=A0require python.inc
>> =C2=A0DEPENDS =3D "openssl-native bzip2-full-native zlib-native readline=
-native sqlite3-native"
>> -PR =3D "${INC_PR}.0"
>> +PR =3D "${INC_PR}.1"
>>
>> =C2=A0FILESPATHPKG .=3D ":python-${PV}:python"
>> =C2=A0SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.t=
ar.bz2 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00-fix-parallel-make.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00-fix-bindir-libdir-fo=
r-cross.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://04-default-is-optimized=
.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://05-enable-ctypes-cross-=
build.patch \
>> diff --git a/recipes/python/python_2.6.5.bb b/recipes/python/python_2.6.=
5.bb
>> index ecd9f78..c8393c1 100644
>> --- a/recipes/python/python_2.6.5.bb
>> +++ b/recipes/python/python_2.6.5.bb
>> @@ -3,10 +3,11 @@ DEPENDS =3D "python-native db gdbm openssl readline sq=
lite3 tcl zlib\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@base_contains('DISTRO_FEATU=
RES', 'tk', 'tk', '', d)}"
>> =C2=A0DEPENDS_sharprom =3D "python-native db readline zlib gdbm openssl"
>> =C2=A0# set to .0 on every increase of INC_PR
>> -PR =3D "${INC_PR}.0"
>> +PR =3D "${INC_PR}.1"
>>
>> =C2=A0SRC_URI =3D "\
>> =C2=A0 =C2=A0http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2=
 \
>> + =C2=A0file://00-fix-parallel-make.patch \
>> =C2=A0 =C2=A0file://00-fix-bindir-libdir-for-cross.patch \
>> =C2=A0 =C2=A0file://01-use-proper-tools-for-cross-build.patch \
>> =C2=A0 =C2=A0file://02-remove-test-for-cross.patch \
>
>
> Thanks,
>
> Paul
>
>
> [1] http://patchwork.openembedded.org/patch/3153/
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


