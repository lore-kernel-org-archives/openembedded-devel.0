Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 8416365C85
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 14:52:00 +0000 (UTC)
Received: (qmail 28864 invoked by uid 1003); 13 Feb 2015 14:52:01 -0000
Received: from unknown (HELO ?192.168.11.101?)
	(philip@opensdr.com@108.44.84.240)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	13 Feb 2015 14:52:01 -0000
Message-ID: <54DE0F85.2080208@balister.org>
Date: Fri, 13 Feb 2015 09:51:49 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1423751798-25797-1-git-send-email-philip@balister.org>
	<20150212204413.GG2272@jama>
In-Reply-To: <20150212204413.GG2272@jama>
Subject: Re: [meta-python][PATCH] python-pyzmq : Add recipe for Python Zero Message Queue bindings.
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
X-List-Received-Date: Fri, 13 Feb 2015 14:52:02 -0000
X-Groupsio-MsgNum: 54291
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="WqobVBJv6dS3g3nqtHUaIJj1TK3G1mhSv"

--WqobVBJv6dS3g3nqtHUaIJj1TK3G1mhSv
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Sorry, temporary insanity. Fixing and resending.

Philip

On 02/12/2015 03:44 PM, Martin Jansa wrote:
> On Thu, Feb 12, 2015 at 09:36:38AM -0500, Philip Balister wrote:
>> Signed-off-by: Philip Balister <philip@balister.org>
>=20
> Drop space before ":" in subject.
>=20
>> ---
>>  .../python/python-pyzmq/club-rpath-out.patch       | 26 +++++++++++++=
++++++++
>>  .../recipes-devtools/python/python-pyzmq_14.5.0.bb | 27 +++++++++++++=
+++++++++
>>  2 files changed, 53 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python-pyzmq/c=
lub-rpath-out.patch
>>  create mode 100644 meta-python/recipes-devtools/python/python-pyzmq_1=
4.5.0.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-pyzmq/club-rpa=
th-out.patch b/meta-python/recipes-devtools/python/python-pyzmq/club-rpat=
h-out.patch
>> new file mode 100644
>> index 0000000..2dc3b73
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.=
patch
>> @@ -0,0 +1,26 @@
>> +diff --git a/setup.py b/setup.py
>> +index 62df445..1fdbdeb 100755
>> +--- a/setup.py
>> ++++ b/setup.py
>> +@@ -213,12 +213,6 @@ def settings_from_prefix(prefix=3DNone, bundle_l=
ibzmq_dylib=3DFalse):
>> +                 pass
>> +                 # unused rpath args for OS X:
>> +                 # settings['extra_link_args'] =3D ['-Wl,-rpath','-Wl=
,$ORIGIN/..']
>> +-            else:
>> +-                settings['runtime_library_dirs'] +=3D ['$ORIGIN/..']=

>> +-        elif sys.platform !=3D 'darwin':
>> +-            settings['runtime_library_dirs'] +=3D [
>> +-                os.path.abspath(x) for x in settings['library_dirs']=

>> +-            ]
>> +    =20
>> +     return settings
>> +=20
>> +@@ -592,8 +586,6 @@ class Configure(build_ext):
>> +                 pass
>> +                 # unused rpath args for OS X:
>> +                 # settings['extra_link_args'] =3D ['-Wl,-rpath','-Wl=
,$ORIGIN/../zmq']
>> +-            else:
>> +-                settings['runtime_library_dirs'] =3D [ os.path.abspa=
th(pjoin('.', 'zmq')) ]
>> +        =20
>> +         line()
>> +         info("Configure: Autodetecting ZMQ settings...")
>> diff --git a/meta-python/recipes-devtools/python/python-pyzmq_14.5.0.b=
b b/meta-python/recipes-devtools/python/python-pyzmq_14.5.0.bb
>> new file mode 100644
>> index 0000000..8b921b5
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-pyzmq_14.5.0.bb
>> @@ -0,0 +1,27 @@
>> +SUMMARY =3D "Pyzmq provides Zero message queue access for the Python =
language"
>> +HOMEPAGE =3D "http://zeromq.org/bindings:python"
>> +SECTION =3D "devel/python"
>> +LICENSE =3D "BSD"
>> +LIC_FILES_CHKSUM =3D "file://COPYING.BSD;md5=3D11c65680f637c3df7f58bb=
c8d133e96e"
>> +DEPENDS =3D "zeromq"
>> +
>> +SRC_URI =3D "https://pypi.python.org/packages/source/p/pyzmq/pyzmq-${=
PV}.tar.gz \
>> +           file://club-rpath-out.patch \
>> +"
>> +SRC_URI[md5sum] =3D "8d3351a8ca2ca2a272a3f96bcb963e41"
>> +SRC_URI[sha256sum] =3D "5d6e045634456cf5496f50871fd3e3a5ede2b90433284=
dbfe985bb67c97f77bd"
>> +
>> +S =3D "${WORKDIR}/pyzmq-${PV}"
>> +
>> +inherit setuptools pkgconfig
>> +
>> +FILES_${PN}-dbg =3D+ "${PYTHON_SITEPACKAGES_DIR}/zmq/backend/cython/.=
debug"
>> +
>> +do_compile_prepend() {
>> +	echo [global] > ${S}/setup.cfg
>> +	echo zmq_prefix =3D ${STAGING_DIR_HOST} >> ${S}/setup.cfg
>> +	echo have_sys_un_h =3D True >> ${S}/setup.cfg
>> +	echo skip_check_zmq =3D True >> ${S}/setup.cfg
>> +	echo libzmq_extension =3D False >> ${S}/setup.cfg
>> +	echo no_libzmq_extension =3D True >> ${S}/setup.cfg
>=20
> Use 4 spaces for indentation, no tabs in meta-oe and other sane layers!=

>=20
>> +}
>> --=20
>> 2.1.0
>>
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
>=20


--WqobVBJv6dS3g3nqtHUaIJj1TK3G1mhSv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJU3g+KAAoJEMDJd4rr0merJtUIAMNONs+UlLITdVOUBg0W8J/F
ECgF64mxGG2oGSdpi7HN+YS5Sk+IreJJ9472jA3EbPcq/eDaP6rKksl7bEKpK/WZ
4Vcli7Baf55EAC4j27ETjhvLnR4py9m1E6jvdXr/Jg8EmKlYhREvSV4ljLxnKmYL
Z0MMFF/qGhrBbPd/71X9y7HH9k8/14T3Stcys3ADr08mk+UGiiTXiqpaAnb+a20z
QNGGvAPYGHGkXEPD5IocEVsH0DZ27eDb41zNsENHWq/Mgn296xf9sluRR8hDY0qE
xbrASqx/Idec/MMxtGosevi7p3JtTA/PDN0eFFB2JyfI/UiVoVYNaLLIdgMQB8A=
=SRvu
-----END PGP SIGNATURE-----

--WqobVBJv6dS3g3nqtHUaIJj1TK3G1mhSv--
