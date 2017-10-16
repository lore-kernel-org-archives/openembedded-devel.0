Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 434F571C7A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 16:55:26 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	id 1e48fn-0004o5-VP from Joe_MacDonald@mentor.com ;
	Mon, 16 Oct 2017 09:55:27 -0700
Received: from burninator.cal.mentorg.com (147.34.91.1) by
	SVR-ORW-FEM-06.mgc.mentorg.com (147.34.97.120) with Microsoft SMTP
	Server id 14.3.224.2; Mon, 16 Oct 2017 09:55:27 -0700
Received: by burninator.cal.mentorg.com (Postfix, from userid 1000)	id
	28202580894; Mon, 16 Oct 2017 12:55:26 -0400 (EDT)
Date: Mon, 16 Oct 2017 12:55:26 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20171016165523.gevuu7qpwcx2waxk@mentor.com>
References: <CAGhGL2Bd662Mb87cei+iHMMhUw4jyaAE9_pdGfBa3pE7BMQ=TQ@mail.gmail.com>
	<10260041.MN3fDUgrsp@peggleto-mobl.ger.corp.intel.com>
	<CA+chaQeTz0HknzwEBTjnh=AySYPe0_oDP6Zv4M_74RjnthQRzw@mail.gmail.com>
	<20171013025743.nlxch4j5pao44wmg@mentor.com>
	<CA+chaQdNB+DsZighTTg58sA-RyFMPEP0TCuJzrPG-FJNjQmdNQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQdNB+DsZighTTg58sA-RyFMPEP0TCuJzrPG-FJNjQmdNQ@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-800 http://www.vim.org
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Yocto security responses.
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
X-List-Received-Date: Mon, 16 Oct 2017 16:55:27 -0000
X-Groupsio-MsgNum: 69210
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xjipi2umakia2w2j"
Content-Disposition: inline

--xjipi2umakia2w2j
Content-Type: multipart/mixed; boundary="ausalc2vhk7rczrf"
Content-Disposition: inline

--ausalc2vhk7rczrf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: Yocto security responses.] On 17.10.16 (Mon 00:49) Martin Jansa wrote:

> On Fri, Oct 13, 2017 at 4:57 AM, Joe MacDonald <Joe_MacDonald@mentor.com>
> wrote:
>=20
>     Not to be brusque about it, but I've said all I intend to say on that
>     patch and I've regularly marked it rejected in patchwork, but it keeps
>     getting pulled back into the 'master-next' state, I assume by a script
>     of some sort, so dnsmasq continues to be something that warrants spec=
ial
>     attention, because I know I manually have to tell my own automated
>     processes to ignore it.  :-/
>=20
>=20
> Thanks for merge to master, the meta-networking patches are usually in
> master-next until they are merged.
>=20
> I just do the rebase regularly and if they are still there after rebase I
> sometimes don't dig in ML or patchwork status to find out if they are sti=
ll in
> review (and should stay in master-next) or already definitely refused and=
 I
> should drop them while rebasing.
>=20
> Currently there are 4 pending meta-networking changes:
> pick 6302b49 dnsmasq: disable the service by default
> pick 45559fa openconnect: fix parallel compilation failure
> pick aac7e9d squid: upgrade to 3.5.27
> pick ff5e841 libmnl: Move to oe-core
> (and my WIP spice changes which I haven't sent to ML yet).
>=20
> I'll drop the first now as discussed in this thread (even when https://
> patchwork.openembedded.org/patch/137644/ is still marked in patchwork as
> "Master Next" not "Rejected").
>=20
> I'll drop the 2nd as well based on the discussion in https://patchwork.
> openembedded.org/patch/143205/
>=20
> The 3rd one is for some reason marked as Changes Requested, but doesn't i=
nclude
> any ML discussion in https://patchwork.openembedded.org/patch/143406/

Weird, I can't find my reply on the mailing list either.  Attached here
so maybe it'll get archived this time.  Short version, I wanted
confirmation on the behaviour with gcc7 and the patch that was being
removed and if we were going to see a v2 on this, I'd rather not have
the unnecessary whitespace reformatting in the next version.

> and the last one should imho be merged, because in last batch you've
> merged: b8210dd iproute2: Move tipc enablement to oe-core which
> already depends on libmnl in oe-core.

I plan to do that today, there's another issue that I thought needed
quick turnaround on it, but it seems not.  Since I'm here, though, I'll
take care of b8210dd.

--=20
-Joe MacDonald.
:wq

--ausalc2vhk7rczrf
Content-Type: application/mbox
Content-Disposition: attachment; filename="squid.mbox"
Content-Transfer-Encoding: quoted-printable

From joe@deserted.net Fri Sep 22 14:22:54 2017
Date: Fri, 22 Sep 2017 14:22:54 -0400
From: Joe MacDonald <joe@deserted.net>
To: Dengke Du <dengke.du@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-networking][PATCH] squid: upgrade to 3.5.27
Message-ID: <20170922182254.GA23735@deserted.net>
References: <1503983946-187275-1-git-send-email-dengke.du@windriver.com>
 <c7d8d623-cf9a-3ee6-41f6-9424e8eebe37@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=3Dutf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c7d8d623-cf9a-3ee6-41f6-9424e8eebe37@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.24 (2015-08-30)
Status: RO
Content-Length: 8558
Lines: 218

[Re: [oe] [meta-networking][PATCH] squid: upgrade to 3.5.27] On 17.09.12 (T=
=3D
ue 13:57) Dengke Du wrote:

> Ping.
>=3D20
>=3D20
> On 2017=3DE5=3DB9=3DB408=3DE6=3D9C=3D8829=3DE6=3D97=3DA5 13:19, Dengke Du=
 wrote:
> >Signed-off-by: Dengke Du <dengke.du@windriver.com>
> >---
> >  .../0001-Before-use-rpc-rpc.h-check-it-first.patch | 32 ++++++++++++++=
+
> >  ...e-noexcept-instead-of-throw-for-C-11-comp.patch | 48 --------------=
=3D
--------
> >  .../recipes-daemons/squid/files/gcc7-fixes.patch   | 17 --------
> >  .../squid/{squid_3.5.26.bb =3D3D> squid_3.5.27.bb}     | 11 +++--
> >  4 files changed, 39 insertions(+), 69 deletions(-)
> >  create mode 100644 meta-networking/recipes-daemons/squid/files/0001-Be=
=3D
fore-use-rpc-rpc.h-check-it-first.patch
> >  delete mode 100644 meta-networking/recipes-daemons/squid/files/0001-Sq=
=3D
uidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch
> >  delete mode 100644 meta-networking/recipes-daemons/squid/files/gcc7-fi=
=3D
xes.patch
> >  rename meta-networking/recipes-daemons/squid/{squid_3.5.26.bb =3D3D> s=
qu=3D
id_3.5.27.bb} (93%)
> >
> >diff --git a/meta-networking/recipes-daemons/squid/files/0001-Before-use=
=3D
-rpc-rpc.h-check-it-first.patch b/meta-networking/recipes-daemons/squid/fil=
=3D
es/0001-Before-use-rpc-rpc.h-check-it-first.patch
> >new file mode 100644
> >index 0000000..485b18c
> >--- /dev/null
> >+++ b/meta-networking/recipes-daemons/squid/files/0001-Before-use-rpc-rp=
=3D
c.h-check-it-first.patch
> >@@ -0,0 +1,32 @@
> >+From b5de7a89f31a17d37beb5d22857bbf829dbfb367 Mon Sep 17 00:00:00 2001
> >+From: Dengke Du <dengke.du@windriver.com>
> >+Date: Mon, 28 Aug 2017 23:17:04 -0400
> >+Subject: [PATCH] Before use rpc/rpc.h, check it first.
> >+
> >+When generate configure using *.m4, the ../NIS/required.m4, we should
> >+check the rpc/rpc.h first before using it.
> >+
> >+Upstream-Status: Pending
> >+
> >+Signed-off-by: Dengke Du <dengke.du@windriver.com>
> >+---
> >+ helpers/basic_auth/NIS/required.m4 | 3 ++-
> >+ 1 file changed, 2 insertions(+), 1 deletion(-)
> >+
> >+diff --git a/helpers/basic_auth/NIS/required.m4 b/helpers/basic_auth/NI=
=3D
S/required.m4
> >+index fdb1360..ec4fe69 100755
> >+--- a/helpers/basic_auth/NIS/required.m4
> >++++ b/helpers/basic_auth/NIS/required.m4
> >+@@ -6,7 +6,8 @@
> >+ ##
> >+
> >+ BUILD_HELPER=3D3D"NIS"
> >+-AC_CHECK_HEADERS([sys/types.h rpc/rpc.h rpcsvc/ypclnt.h rpcsvc/yp_prot=
=3D
=3D2Eh crypt.h],[],[BUILD_HELPER=3D3D""],AC_INCLUDES_DEFAULT([
> >++AC_CHECK_HEADERS([rpc/rpc.h])
> >++AC_CHECK_HEADERS([sys/types.h rpcsvc/ypclnt.h rpcsvc/yp_prot.h crypt.h=
=3D
],[],[BUILD_HELPER=3D3D""],AC_INCLUDES_DEFAULT([
> >+ #if HAVE_RPC_RPC_H
> >+ #include <rpc/rpc.h>
> >+ #endif
> >+--
> >+2.8.1
> >+
> >diff --git a/meta-networking/recipes-daemons/squid/files/0001-SquidNew-u=
=3D
se-noexcept-instead-of-throw-for-C-11-comp.patch b/meta-networking/recipes-=
=3D
daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-co=
=3D
mp.patch
> >deleted file mode 100644
> >index 48674c3..0000000
> >--- a/meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noex=
=3D
cept-instead-of-throw-for-C-11-comp.patch
> >+++ /dev/null
> >@@ -1,48 +0,0 @@
> >-From f9150a0dc092ab2cbd47ee428436b747dce323a9 Mon Sep 17 00:00:00 2001
> >-From: Khem Raj <raj.khem@gmail.com>
> >-Date: Sun, 23 Apr 2017 10:28:28 -0700
> >-Subject: [PATCH] SquidNew: use noexcept instead of throw for C++11 comp=
=3D
ilers
> >-
> >-Fixes errors with gcc7 which is more pedantic about c++11
> >-conformance regarding deprecated features
> >-
> >-include/SquidNew.h:21:51: error: dynamic exception specifications are d=
=3D
eprecated in C++11
> >-_SQUID_EXTERNNEW_ void *operator new[] (size_t size) throw (std::bad_al=
=3D
loc)
> >-                                                       ^~~~~
> >-
> >-Signed-off-by: Khem Raj <raj.khem@gmail.com>

Did you confirm this isn't a problem with the updated version and we can
safely discard this patch?  The same question for the following gcc7
patch as well.

> >----
> >- include/SquidNew.h | 8 ++++----
> >- 1 file changed, 4 insertions(+), 4 deletions(-)
> >-
> >-diff --git a/include/SquidNew.h b/include/SquidNew.h
> >-index 39fcee0..c960347 100644
> >---- a/include/SquidNew.h
> >-+++ b/include/SquidNew.h
> >-@@ -18,19 +18,19 @@
> >-  */
> >- #include <new>
> >-
> >--_SQUID_EXTERNNEW_ void *operator new(size_t size) throw (std::bad_allo=
=3D
c)
> >-+_SQUID_EXTERNNEW_ void *operator new(size_t size) noexcept(false)
> >- {
> >-     return xmalloc(size);
> >- }
> >--_SQUID_EXTERNNEW_ void operator delete (void *address) throw()
> >-+_SQUID_EXTERNNEW_ void operator delete (void *address) noexcept(true)
> >- {
> >-     xfree(address);
> >- }
> >--_SQUID_EXTERNNEW_ void *operator new[] (size_t size) throw (std::bad_a=
=3D
lloc)
> >-+_SQUID_EXTERNNEW_ void *operator new[] (size_t size) noexcept(false)
> >- {
> >-     return xmalloc(size);
> >- }
> >--_SQUID_EXTERNNEW_ void operator delete[] (void *address) throw()
> >-+_SQUID_EXTERNNEW_ void operator delete[] (void *address) noexcept(true=
)
> >- {
> >-     xfree(address);
> >- }
> >---
> >-2.12.2
> >-
> >diff --git a/meta-networking/recipes-daemons/squid/files/gcc7-fixes.patc=
=3D
h b/meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch
> >deleted file mode 100644
> >index cc1ea78..0000000
> >--- a/meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch
> >+++ /dev/null
> >@@ -1,17 +0,0 @@
> >-../../squid-3.5.26/src/DiskIO/DiskThreads/aiops.cc: In function 'void s=
=3D
quidaio_init()':                                                           =
=3D
   ../../squid-3.5.26/src/DiskIO/DiskThreads/DiskThreads.h:30:50: error: '*=
=3D
' in boolean context, suggest '&&' instead [-Werror=3D3Dint-in-bool-context=
] =3D
     #define NUMTHREADS (Config.cacheSwap.n_configured*16)
> >-
> >-
> >-Upstream-Status: Backport
> >-Index: squid-3.5.26/src/DiskIO/DiskThreads/aiops.cc
> >-=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=
=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D
=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=
=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D
=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=3D3D=
=3D3D=3D3D=3D3D=3D3D
> >---- squid-3.5.26.orig/src/DiskIO/DiskThreads/aiops.cc
> >-+++ squid-3.5.26/src/DiskIO/DiskThreads/aiops.cc
> >-@@ -290,7 +290,7 @@ squidaio_init(void)
> >-     /* Create threads and get them to sit in their wait loop */
> >-     squidaio_thread_pool =3D3D memPoolCreate("aio_thread", sizeof(squi=
da=3D
io_thread_t));
> >-
> >--    assert(NUMTHREADS);
> >-+    assert(NUMTHREADS !=3D3D 0);
> >-
> >-     for (i =3D3D 0; i < NUMTHREADS; ++i) {
> >-         threadp =3D3D (squidaio_thread_t *)squidaio_thread_pool->alloc=
();
> >diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb b/met=
=3D
a-networking/recipes-daemons/squid/squid_3.5.27.bb
> >similarity index 93%
> >rename from meta-networking/recipes-daemons/squid/squid_3.5.26.bb
> >rename to meta-networking/recipes-daemons/squid/squid_3.5.27.bb
> >index a78a091..4626852 100644
> >--- a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
> >+++ b/meta-networking/recipes-daemons/squid/squid_3.5.27.bb
> >@@ -21,13 +21,12 @@ SRC_URI =3D3D "http://www.squid-cache.org/Versions/v=
${=3D
MAJ_VER}/${MIN_VER}/${BPN}-${P
> >             file://volatiles.03_squid \
> >             file://set_sysroot_patch.patch \
> >             file://squid-don-t-do-squid-conf-tests-at-build-time.patch =
\
> >-           file://0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-=
=3D
comp.patch \
> >             file://0001-configure-Check-for-Wno-error-format-truncation=
=3D
-comp.patch \
> >-           file://gcc7-fixes.patch \
> >             file://0001-tools.cc-fixed-unused-result-warning.patch \
> >+           file://0001-Before-use-rpc-rpc.h-check-it-first.patch \
> >             "

It also looks like you've reformatted the spacing on the recipe, please
don't do that.

-J.

> >-SRC_URI[md5sum] =3D3D "dc1830cd361e077814aa39bcc3691d8b"
> >-SRC_URI[sha256sum] =3D3D "41d8845863dcd026c856508cd1599d417c8947ffd96e8=
6e=3D
24085f9893cb8b8c2"
> >+SRC_URI[md5sum] =3D3D "c17a3ed3a40cd59c23f48b8539dafcd8"
> >+SRC_URI[sha256sum] =3D3D "467da134eaf0f7962ba5881793d106772fb05fefa4aea=
7d=3D
9569eec0412c52433"
> >  LIC_FILES_CHKSUM =3D3D "file://COPYING;md5=3D3Dc492e2d6d32ec5c1aad0e06=
09a1=3D
41ce9 \
> >                      file://errors/COPYRIGHT;md5=3D3D8861130fae91400bcf=
99=3D
b66f133172b3 \
> >@@ -68,6 +67,10 @@ do_compile_ptest() {
> >      oe_runmake -C ${TESTDIR} buildtest-TESTS
> >  }
> >+do_compile_prepend() {
> >+    sed -i 's,$(PERL),/usr/bin/perl,g' `find ${S} -name Makefile.in`
> >+}
> >+
> >  do_install_ptest() {
> >      cp -rf ${B}/${TESTDIR} ${D}${PTEST_PATH}
> >      cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}
>=3D20
--=3D20
-Joe MacDonald.
:wq



--ausalc2vhk7rczrf--

--xjipi2umakia2w2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEkMd/b97HINT8/zEqSfx99yw59pYFAlnk5HsACgkQSfx99yw5
9paiHQf/Qsfh2dcQ9Vp0DtQEuJjtuT2CMjwC4aC9gkU/b466OXEDmWydjMWmT606
UwGP494GmoR/OJy8VIQtOPBIyuvj0mntCs7419pLSANSF2Y2Gi3+kejxyCvyyAfP
hayuDoEozzymvGNK60AA0nC6cnBKN6HQKRz33EnpI0nb/uD0ZmMn9n/khl/WpZRk
eFDqoH2jA/asdhWOVhbXaGes2lUZtNhyQxFSMCbeFiLXhK3tAWdCwlo9FAcZpCJ3
kWqzBcERMbvKoHNpw2yELc7QRRrJCQ72jA2wBpWdkMyyaUYtB7jNikD4MEgdrhcy
5ze3HUxzPfELfLx2ypr/MFA1MtHqCw==
=vEJ4
-----END PGP SIGNATURE-----

--xjipi2umakia2w2j--
