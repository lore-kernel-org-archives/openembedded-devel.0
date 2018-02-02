Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1B7E27883F;
	Fri,  2 Feb 2018 11:42:53 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 141so11705985wme.3;
	Fri, 02 Feb 2018 03:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1jg3i6qzeJV4awGmQr1MuI4vcFqgQjppxNrTbJOaG98=;
	b=Z87DVxKdqsRkVFDaX6sdFfk6fDQfN+tFiEthcpHf7a3rIgRGHTEAOY5JJLuSIXAdLd
	TTbNaOX6oKtAR5awo8xPgQ8FREBDDn8IsQcMsDmYXsA0Pjpc7zq58LUEYZClzQ9jagoK
	nChiXzSdkTHElKmFPfeKmBOcsXyw5lcVUUWne+ovV72ODExxH3+/a5EnWERCuMD8fgw9
	F33ZMKqD98GARu1POl13jjBDB74yJ2w5Pw62kDOj2mI9aZSOqqjyhDNtJFezm4Olx22G
	YoVuZONxcS7EVl4cABKwnlCy2UEf0ian7KtwkX59wVN/EkWOlLJrTp73/Ll9VbBpyuo1
	7bYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1jg3i6qzeJV4awGmQr1MuI4vcFqgQjppxNrTbJOaG98=;
	b=RFPI00qKmc/IgJSMGgnqXQrggv50NkeU/fKQ43xFq/ogkYdTeGYVVP59NLAOX6rDmu
	3FHF2auTQGHm0ykK7Ssz+HzAy4oLhOhsyqzn25NoHd0RaJH9qcK/ZI+lnJe/eT/O5tyF
	o77PzNkbYX8RE7wPpAlb23cxjaGKUyOkaUL6cYttOnhSrQ151cCbZenhvB9jOvqfx5kC
	hLCn6f4Yxiw1t/36LpHJ+ogankEMLhdUKEMOIrrceIoa0lnhI4dNyo1AM15yxyIsCYOz
	J3kHhZgZhcAhNk3kFLpJ0LXaUVXEWr16OvW0lTbXkRXumrodjVYdaNsHd3DF0qS2SsW/
	cV+A==
X-Gm-Message-State: AKwxytc1rgghTqs/p40H4A4oYptiiTYNXgqIP2ljStc+HxZ0f/24iwBC
	opuWNxMvLJdM9/YEt9///qbvZQ==
X-Google-Smtp-Source: AH8x224x/nX1UATXkLUAADsjLSfmavwRt7iqLMhLQEeuFdwOFIpb8rrpp6Zoummivwl2sasuNo0vLw==
X-Received: by 10.28.156.81 with SMTP id f78mr27967675wme.131.1517571774387;
	Fri, 02 Feb 2018 03:42:54 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id x26sm448777wmc.27.2018.02.02.03.42.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Feb 2018 03:42:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 2 Feb 2018 12:42:55 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	akuster808 <akuster808@gmail.com>, Derek Straka <derek@asterius.io>
Message-ID: <20180202114255.GA1663@jama>
References: <151750087874.30832.4117930919339260762@git.openembedded.org>
	<CA+chaQfugMhAbs+u4jQYaGDgMoK-sSXfXFyxerOoM6H6feEpAQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQfugMhAbs+u4jQYaGDgMoK-sSXfXFyxerOoM6H6feEpAQ@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] branch rocko updated (6e3fc5b -> a65c1ac)
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
X-List-Received-Date: Fri, 02 Feb 2018 11:42:54 -0000
X-Groupsio-MsgNum: 70614
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 02, 2018 at 12:35:46PM +0100, Martin Jansa wrote:
> Why was this change backported to rocko?
>   add 0f1dff9  python-twisted: clean-up the dependencies
>=20
> It adds dependency on python3-hyperlink which isn't in rocko, only in
> master since:
>=20
> commit 378b8a6a8aa65fae704e9ceddc3f2e2b07585953
> Author: Derek Straka <derek@asterius.io>
> Date:   Wed Nov 1 11:37:51 2017 -0400
>=20
>     python-hyperlink: add a recipe for version 17.3.1
>=20
> and dependency on python-incremental also only in master since:
>=20
> commit 63791edb3f69269fc6e0b83863e76f6a4a35965c
> Author: Derek Straka <derek@asterius.io>
> Date:   Wed Nov 1 10:58:33 2017 -0400
>=20
>     python-incremental: add an initial recipe for version 17.5.0
>=20
>=20
> This is causing quite a 4 errors shown in world builds:

It's actually quite a bit more ERROR messages, here is more complete
list:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'python3-incremental' (but meta-oe/meta-python/rec=
ipes-devtools/python/python3-twisted_17.9.0.bb RDEPENDS on or otherwise req=
uires it)
NOTE: Runtime target 'python3-incremental' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-incremental']
NOTE: Runtime target 'python3-twisted-runner' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-twisted-runner', 'py=
thon3-incremental']
ERROR: Nothing RPROVIDES 'python3-twisted' (but meta-oe/meta-python/recipes=
-devtools/python/python3-twisted_17.9.0.bb RDEPENDS on or otherwise require=
s it)
No eligible RPROVIDERs exist for 'python3-twisted'
NOTE: Runtime target 'python3-twisted' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-twisted']
ERROR: Nothing RPROVIDES 'python3-constantly' (but meta-oe/meta-python/reci=
pes-devtools/python/python3-twisted_17.9.0.bb RDEPENDS on or otherwise requ=
ires it)
NOTE: Runtime target 'python3-constantly' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-constantly']
ERROR: Nothing RPROVIDES 'python3-twisted-web' (but meta-oe/meta-python/rec=
ipes-devtools/python/python3-twisted_17.9.0.bb RDEPENDS on or otherwise req=
uires it)
No eligible RPROVIDERs exist for 'python3-twisted-web'
NOTE: Runtime target 'python3-twisted-web' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-twisted-web']
ERROR: Nothing RPROVIDES 'python3-twisted-words' (but meta-oe/meta-python/r=
ecipes-devtools/python/python3-twisted_17.9.0.bb RDEPENDS on or otherwise r=
equires it)
No eligible RPROVIDERs exist for 'python3-twisted-words'
NOTE: Runtime target 'python3-twisted-words' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-twisted-words']
ERROR: Nothing RPROVIDES 'python3-twisted-protocols' (but meta-oe/meta-pyth=
on/recipes-devtools/python/python3-twisted_17.9.0.bb RDEPENDS on or otherwi=
se requires it)
No eligible RPROVIDERs exist for 'python3-twisted-protocols'
NOTE: Runtime target 'python3-twisted-protocols' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-twisted-protocols']
ERROR: Nothing RPROVIDES 'python3-twisted-bin' (but meta-oe/meta-python/rec=
ipes-devtools/python/python3-twisted_17.9.0.bb RDEPENDS on or otherwise req=
uires it)
No eligible RPROVIDERs exist for 'python3-twisted-bin'
NOTE: Runtime target 'python3-twisted-bin' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-twisted-bin']
ERROR: Nothing RPROVIDES 'python3-automat' (but meta-oe/meta-python/recipes=
-devtools/python/python3-twisted_17.9.0.bb RDEPENDS on or otherwise require=
s it)
NOTE: Runtime target 'python3-automat' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-automat']
ERROR: Nothing RPROVIDES 'python3-hyperlink' (but meta-oe/meta-python/recip=
es-devtools/python/python3-twisted_17.9.0.bb RDEPENDS on or otherwise requi=
res it)
NOTE: Runtime target 'python3-hyperlink' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-hyperlink']
ERROR: Nothing RPROVIDES 'python3-twisted-names' (but meta-oe/meta-python/r=
ecipes-devtools/python/python3-twisted_17.9.0.bb RDEPENDS on or otherwise r=
equires it)
No eligible RPROVIDERs exist for 'python3-twisted-names'
NOTE: Runtime target 'python3-twisted-names' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-twisted-names']
ERROR: Nothing RPROVIDES 'python3-twisted-mail' (but meta-oe/meta-python/re=
cipes-devtools/python/python3-twisted_17.9.0.bb RDEPENDS on or otherwise re=
quires it)
No eligible RPROVIDERs exist for 'python3-twisted-mail'
NOTE: Runtime target 'python3-twisted-mail' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-twisted-mail']
ERROR: Nothing RPROVIDES 'python-automat' (but meta-oe/meta-python/recipes-=
devtools/python/python-twisted_17.9.0.bb RDEPENDS on or otherwise requires =
it)
NOTE: Runtime target 'python-automat' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-automat']
NOTE: Runtime target 'python-txws' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-txws', 'python-twiste=
d', 'python-automat']
NOTE: Runtime target 'python-twisted-runner' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-runner', 'pyt=
hon-automat']
NOTE: Runtime target 'python-twisted-bin' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-bin', 'python=
-automat']
NOTE: Runtime target 'python-twisted-names' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-names', 'pyth=
on-automat']
NOTE: Runtime target 'python-twisted-conch' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-conch', 'pyth=
on-automat']
NOTE: Runtime target 'python-twisted' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted', 'python-aut=
omat']
NOTE: Runtime target 'python-twisted-mail' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-mail', 'pytho=
n-automat']
NOTE: Runtime target 'python-twisted-words' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-words', 'pyth=
on-automat']
NOTE: Runtime target 'python-twisted-web' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-web', 'python=
-automat']
ERROR: Nothing RPROVIDES 'python-constantly' (but meta-oe/meta-python/recip=
es-devtools/python/python-twisted_17.9.0.bb RDEPENDS on or otherwise requir=
es it)
NOTE: Runtime target 'python-constantly' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-constantly']
ERROR: Nothing RPROVIDES 'python3-twisted-dev' (but meta-oe/meta-python/rec=
ipes-devtools/python/python3-twisted_17.9.0.bb RDEPENDS on or otherwise req=
uires it)
No eligible RPROVIDERs exist for 'python3-twisted-dev'
NOTE: Runtime target 'python3-twisted-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-twisted-dev']
ERROR: Nothing RPROVIDES 'python-twisted-dev' (but meta-oe/meta-python/reci=
pes-devtools/python/python-twisted_17.9.0.bb RDEPENDS on or otherwise requi=
res it)
No eligible RPROVIDERs exist for 'python-twisted-dev'
NOTE: Runtime target 'python-twisted-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-dev']
ERROR: Nothing RPROVIDES 'python-txws-dev' (but meta-oe/meta-python/recipes=
-connectivity/python-txws/python-txws_0.9.1.bb RDEPENDS on or otherwise req=
uires it)
No eligible RPROVIDERs exist for 'python-txws-dev'
NOTE: Runtime target 'python-txws-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-txws-dev']
ERROR: Nothing RPROVIDES 'python-incremental' (but meta-oe/meta-python/reci=
pes-devtools/python/python-twisted_17.9.0.bb RDEPENDS on or otherwise requi=
res it)
NOTE: Runtime target 'python-incremental' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-incremental']
ERROR: Nothing RPROVIDES 'python-twisted-core' (but meta-oe/meta-python/rec=
ipes-devtools/python/python-twisted_17.9.0.bb RDEPENDS on or otherwise requ=
ires it)
No eligible RPROVIDERs exist for 'python-twisted-core'
NOTE: Runtime target 'python-twisted-core' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-core']
ERROR: Nothing RPROVIDES 'python-twisted-protocols' (but meta-oe/meta-pytho=
n/recipes-devtools/python/python-twisted_17.9.0.bb RDEPENDS on or otherwise=
 requires it)
No eligible RPROVIDERs exist for 'python-twisted-protocols'
NOTE: Runtime target 'python-twisted-protocols' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-protocols']
ERROR: Nothing RPROVIDES 'python-twisted-news' (but meta-oe/meta-python/rec=
ipes-devtools/python/python-twisted_17.9.0.bb RDEPENDS on or otherwise requ=
ires it)
No eligible RPROVIDERs exist for 'python-twisted-news'
NOTE: Runtime target 'python-twisted-news' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-news']
ERROR: Nothing RPROVIDES 'python3-twisted-core' (but meta-oe/meta-python/re=
cipes-devtools/python/python3-twisted_17.9.0.bb RDEPENDS on or otherwise re=
quires it)
No eligible RPROVIDERs exist for 'python3-twisted-core'
NOTE: Runtime target 'python3-twisted-core' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-twisted-core']
ERROR: Nothing RPROVIDES 'python3-twisted-conch' (but meta-oe/meta-python/r=
ecipes-devtools/python/python3-twisted_17.9.0.bb RDEPENDS on or otherwise r=
equires it)
No eligible RPROVIDERs exist for 'python3-twisted-conch'
NOTE: Runtime target 'python3-twisted-conch' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-twisted-conch']
ERROR: Nothing RPROVIDES 'python-hyperlink' (but meta-oe/meta-python/recipe=
s-devtools/python/python-twisted_17.9.0.bb RDEPENDS on or otherwise require=
s it)
NOTE: Runtime target 'python-hyperlink' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-hyperlink']

>=20
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'python-incremental' (but
> meta-oe/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python-incremental' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python-incremental']
> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'python-twisted', 'python-incremental']
>=20
> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.
>=20
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'python3-hyperlink' (but
> meta-oe/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python3-hyperlink' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-hyperlink']
> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'python3-twisted', 'python3-hyperlink']
>=20
> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.
>=20
> On Thu, Feb 1, 2018 at 5:01 PM, <git@git.openembedded.org> wrote:
>=20
> > This is an automated email from the git hooks/post-receive script.
> >
> > armin_kuster pushed a change to branch rocko
> > in repository meta-openembedded.
> >
> >     from 6e3fc5b  python-cffi: update to version 1.11.2
> >      add d8f82c4  README: update maintainers list for rocko
> >      add a1f65f1  debootstrap: change license to MIT
> >      add 4e67423  UFL: add missing license
> >      add 9132eef  python-cryptography: add -pthread to LD_FLAGS
> >      add 0f1dff9  python-twisted: clean-up the dependencies
> >      add a68639a  python-twisted: restore RDEPENDS on -news for py2
> >      add 5d285be  gpsd: fix /etc/default/gpsd ALTERNATIVES logic
> >      new 7b404fd  gperftools: Fix build on musl/mips
> >      new 96eab89  tslib: update project homepage
> >      new c5939bd  libpwquality: fix Nothing RPROVIDES
> > 'lib32-python3-libpwquality'
> >      new f83f290  libreport: fix Nothing RPROVIDES
> > 'lib32-python3-libreport'
> >      new 9afe8a4  samba: add missing RDEPENDS
> >      new 1985f77  gpsd: add missing python-pygps RDEPENDS
> >      new 4bea809  android-tools: do_unpack_extra task removed
> >      new 6ef007b  mariadb: Added missing installation of
> > mysqld_safe_helper to FILES_${PN}-server
> >      new 52bdf26  polkit: add consolekit only when x11 is enabled
> >      new 45a874a  hiredis: fix paths in pkgconfig conf file
> >      new ab3630f  xfce4-screenshooter: create src dir before build
> >      new 45bcac8  php: Security Advisory - php - CVE-2017-16642
> >      new be07dad  Allow native builds of python-asyn1crypto
> >      new 0fb0fd2  phpmyadmin: update to version 4.7.5
> >      new b4289b2  postgresql: Update to 9.4.14
> >      new 1caf212  postgresql: Update to 9.4.15
> >      new c993fd1  dfu-utils-native: fix do_deploy sstate handling
> >      new 731a262  Move RDEPENDS on libasound-module to bluez4 since it =
has
> > been removed from bluez5
> >      new f48be7e  passwdqc: add pam-passwdqc to RDEPENDS
> >      new 846e009  openldap: fix QA Warning
> >      new 859dfb0  phpmyadmin: update to version 4.7.6
> >      new f224492  Adding LUA to SDK
> >      new c31b240  fltk-native: remove fltk-config from image
> >      new 7cfbfe0  fltk: remove fltk-native from DEPENDS
> >      new 4bdaf0c  Add FLTK to licenses to avoid warning when building f=
ltk
> > / fltk-native
> >      new ed6ed8d  hwloc: fix multilib problem
> >      new e8abea8  leveldb: fix checking for SSE flag
> >      new f351bea  open-isns: Fix build with musl
> >      new 8349bbd  dovecot: Fix parallel build
> >      new b54c140  dnsmasq: update SRC_URI for versions 2.69 and earlier
> >      new f80ff75  arptables: Fix do_install task
> >      new e4c768c  net-snmp: support openssl without 3des
> >      new fc88b63  stunnel: fix compile error when openssl disable des
> > support
> >      new 18b570e  networkmanager: add consolekit only when x11 is enabl=
ed
> >      new a0d7f74  dialog: update SRC_URI
> >      new a65c1ac  uw-imap: update SRC_URI
> >
> > The 36 revisions listed above as "new" are entirely new to this
> > repository and will be described in separate emails.  The revisions
> > listed as "add" were already present in the repository and have only
> > been added to this reference.
> >
> >
> > Summary of changes:
> >  meta-filesystems/README                            |   12 +-
> >  meta-gnome/README                                  |   11 +-
> >  meta-initramfs/README                              |   10 +-
> >  meta-multimedia/README                             |   15 +-
> >  meta-networking/MAINTAINERS                        |    7 +-
> >  .../networkmanager/networkmanager_1.4.4.bb         |    3 +-
> >  .../recipes-connectivity/samba/samba_4.6.7.bb      |    3 +-
> >  .../net-snmp/net-snmp-fix-for-disable-des.patch    |   32 +
> >  .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |    4 +-
> >  .../recipes-support/arptables/arptables_git.bb     |    3 +-
> >  .../recipes-support/dnsmasq/dnsmasq.inc            |    4 +-
> >  .../dovecot/0001-doveadm-Fix-parallel-build.patch  |   38 +
> >  .../recipes-support/dovecot/dovecot_2.2.29.bb      |    4 +-
> >  ....h-endian.h-is-available-on-musl-on-linux.patch |   38 +
> >  .../recipes-support/open-isns/open-isns_0.97.bb    |    6 +-
> >  .../stunnel/stunnel/fix-openssl-no-des.patch       |   54 +
> >  .../recipes-support/stunnel/stunnel_5.35.bb        |    4 +-
> >  meta-oe/README                                     |   10 +-
> >  meta-oe/licenses/{QWTv1.0 =3D> FLTK}                 |  281 +-
> >  meta-oe/licenses/UFL                               |   97 +
> >  .../packagegroups/packagegroup-tools-bluetooth.bb  |    2 +-
> >  .../android-tools/android-tools_5.1.1.r37.bb       |   18 -
> >  .../debootstrap/debootstrap_1.0.67.bb              |    2 +-
> >  meta-oe/recipes-devtools/lua/lua_5.3.4.bb          |    2 +-
> >  .../php/php-7.1.9/CVE-2017-16642.patch             | 5241
> > ++++++++++++++++++++
> >  meta-oe/recipes-devtools/php/php_7.1.9.bb          |    1 +
> >  meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb  |    2 +-
> >  .../recipes-extended/dialog/dialog_1.3-20160828.bb |    2 +-
> >  meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb |    3 +-
> >  meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb     |    9 +-
> >  ...uild_detect_platform-Check-for-__SSE4_2__.patch |    5 +-
> >  .../libpwquality/libpwquality_1.4.0.bb             |    4 +-
> >  .../recipes-extended/libreport/libreport_2.9.2.bb  |    6 +-
> >  meta-oe/recipes-extended/polkit/polkit_0.113.bb    |    4 +-
> >  meta-oe/recipes-graphics/tslib/tslib_1.1.bb        |    2 +-
> >  meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb       |   14 +-
> >  .../dfu-util/dfu-util-native_0.9.bb                |    7 +-
> >  meta-oe/recipes-support/fltk/fltk-native.bb        |    5 +
> >  meta-oe/recipes-support/fltk/fltk.bb               |    2 +-
> >  .../gperftools/gperftools/sgidef.patch             |   17 +
> >  .../recipes-support/gperftools/gperftools_2.6.1.bb |    1 +
> >  meta-oe/recipes-support/mysql/mariadb.inc          |    1 +
> >  .../recipes-support/openldap/openldap_2.4.45.bb    |    1 +
> >  meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb |    2 +-
> >  .../{postgresql_9.4.13.bb =3D> postgresql_9.4.15.bb} |    4 +-
> >  meta-perl/README                                   |    9 +-
> >  meta-python/README                                 |    4 +-
> >  .../recipes-devtools/python/python-asn1crypto.inc  |    1 +
> >  .../python/python-cryptography.inc                 |    2 +
> >  .../recipes-devtools/python/python-twisted.inc     |    4 +-
> >  .../python/python-twisted_17.9.0.bb                |    8 +-
> >  .../python/python3-twisted_17.9.0.bb               |    2 +-
> >  meta-webserver/README                              |    4 +-
> >  .../{phpmyadmin_4.7.3.bb =3D> phpmyadmin_4.7.6.bb}   |    4 +-
> >  meta-xfce/README                                   |   11 +-
> >  .../xfce4-screenshooter_1.9.1.bb                   |    1 +
> >  56 files changed, 5785 insertions(+), 258 deletions(-)
> >  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/
> > net-snmp-fix-for-disable-des.patch
> >  create mode 100644 meta-networking/recipes-support/dovecot/dovecot/000=
1-
> > doveadm-Fix-parallel-build.patch
> >  create mode 100644 meta-networking/recipes-support/open-isns/open-isns/
> > 0001-util.h-endian.h-is-available-on-musl-on-linux.patch
> >  create mode 100644 meta-networking/recipes-support/stunnel/stunnel/fix-
> > openssl-no-des.patch
> >  copy meta-oe/licenses/{QWTv1.0 =3D> FLTK} (72%)
> >  create mode 100644 meta-oe/licenses/UFL
> >  create mode 100644 meta-oe/recipes-devtools/php/
> > php-7.1.9/CVE-2017-16642.patch
> >  create mode 100644 meta-oe/recipes-support/gperftools/gperftools/sgide=
f.
> > patch
> >  rename meta-oe/recipes-support/postgresql/{postgresql_9.4.13.bb =3D>
> > postgresql_9.4.15.bb} (67%)
> >  rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.7.3.bb =3D>
> > phpmyadmin_4.7.6.bb} (90%)
> >
> > --
> > To stop receiving notification emails like this one, please contact
> > the administrator of this repository.
> > --
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWnROvgAKCRA3VSO3ZXaA
HHmZAJ9RUisQpIgzSsaYqvIZ1zw3X57X3QCgrDbgKsRXbKgwG6F9Jgj2yos4ugg=
=2czq
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
