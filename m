Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1A95E7722C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 16:53:10 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so42812861wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 08:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=VKBm9dvWNo4b98omSO9L5Wz65O7elYBxJONpFyD4TrI=;
	b=FpuoOtjz8sPMwQcsZgiCdxrkWa9dozGyhLgrN9NeADPUi0OvCiB3gmO1oA8oAWXTEY
	qM/g3HjyLdoXHkQjXnWaJoit0onOm1HCKvmBAgfvvi4/l/dvwQh1N+PFwaUwyOiawU0l
	99F1Pu7+pP+Vf9RPmQ69OScGeiBpykncGCO66v/IvDzOMY86cUFlMesFF9PfZ+HQpj2F
	fGiNgfcxInrlJgeWkhBhN6EpC7gnhGoY0d5sDMYmi1LhtkNgNzig4efLhvj6SN7riKgd
	FKJFnEGGDpQRMDd7Co/zIcpw74QqytRCdNf0CxWCwukthM2e3kAc6vte9q8kMt9tRCSy
	ul0w==
X-Received: by 10.28.132.18 with SMTP id g18mr17709940wmd.64.1447347190313;
	Thu, 12 Nov 2015 08:53:10 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	q3sm15346564wjr.34.2015.11.12.08.53.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Nov 2015 08:53:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <20151112164335.GJ2574@jama>
Date: Thu, 12 Nov 2015 17:53:08 +0100
Message-Id: <7996762E-73ED-45E0-911F-1A08E33F2F4F@gmail.com>
References: <3A08034A-59A7-41B3-9B13-06CB92592BED@gmail.com>
	<20151112164335.GJ2574@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-oe][PATCH v2 1/3] samba: fix dependencies and QA issues
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
X-List-Received-Date: Thu, 12 Nov 2015 16:53:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 12.11.2015 um 17:43 schrieb Martin Jansa <martin.jansa@gmail.com>:
>=20
> On Thu, Nov 12, 2015 at 05:17:25PM +0100, Jens Rehsack wrote:
>>=20
>> Fix remaining QA issues (dependency-wise) like
>>=20
>>  WARNING: QA Issue: samba rdepends on libacl, but it isn't a build =
dependency? [build-deps]
>>  WARNING: QA Issue: samba rdepends on libavahi-client, but it isn't a =
build dependency? [build-deps]
>=20
> More issues were reported in:
> =
http://lists.openembedded.org/pipermail/openembedded-core/2015-November/11=
2665.html
>=20
> Is it fixed somewhere else (there is another patchset for samba/waf) =
or can you look into them?

Can I look into them later? :s/remaining/some/ :)

> WARN: samba: samba rdepends on cyrus-sasl, but it isn't a build =
dependency?
> WARN: samba: samba rdepends on dmapi, but it isn't a build dependency?
> WARN: samba: samba rdepends on libaio, but it isn't a build =
dependency?
> WARN: samba: samba rdepends on libbsd, but it isn't a build =
dependency?
> WARN: samba: samba rdepends on libpam, but it isn't a build =
dependency?

Especially that seems to be similar to my critic against waf for libldb =
- I'd like
to dig a bit into waf before jumping in the face of the next "I can do =
it better
than autoconf" folks (yeah, autoconf is ugly and cryptic, but =
unfortunately
building is a complex thing and autoconf is explicit about each step and =
allows
intercepting everywhere which should make it packagers darling ^^)

> WARN: samba: samba-python rdepends on libbsd, but it isn't a build =
dependency?


>> broken perl library path, having a default PACKAGECONFIG, but allow
>> user-defined one and rely on PACKAGECONFIG instead of =
DISTRO_FEATURES.
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>> meta-oe/recipes-connectivity/samba/samba_4.1.12.bb | 41 =
++++++++++++++++------
>> 1 file changed, 30 insertions(+), 11 deletions(-)
>>=20
>> diff --git a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb =
b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
>> index af2cc1f..04df8a3 100644
>> --- a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
>> +++ b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
>> @@ -38,26 +38,40 @@ SRC_URI =3D =
"${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
>> SRC_URI[md5sum] =3D "232016d7581a1ba11e991ec2674553c4"
>> SRC_URI[sha256sum] =3D =
"033604674936bf5c77d7df299b0626052b84a41505a6a6afe902f6274fc29898"
>>=20
>> -inherit systemd waf-samba
>> +inherit systemd waf-samba cpan-base perlnative
>>=20
>> -DEPENDS +=3D "readline virtual/libiconv zlib popt talloc libtdb =
libtevent libldb krb5 ctdb cups"
>> -RDEPENDS_${PN} +=3D "openldap"
>> +DEPENDS +=3D "readline virtual/libiconv zlib popt talloc libtdb =
libtevent libldb krb5 ctdb"
>>=20
>> -PACKAGECONFIG =3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', =
'', d)}"
>> -PACKAGECONFIG +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', =
'systemd', '', d)}"
>> +SYSVINITTYPE_linuxstdbase =3D "lsb"
>> +SYSVINITTYPE =3D "sysv"
>>=20
>> -PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam"
>> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'pam', =
'pam', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', =
'sysvinit', '${SYSVINITTYPE}', '', d)} \
>> +                   ${@base_contains('DISTRO_FEATURES', 'systemd', =
'systemd', '', d)} \
>> +                   ${@base_contains('DISTRO_FEATURES', 'zeroconf', =
'zeroconf', '', d)} \
>> +                   acl aio cups ldap \
>> +"
>> +
>> +RDEPENDS_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'lsb', =
'lsb', '', d)}"
>> +
>> +PACKAGECONFIG[acl] =3D =
"--with-acl-support,---without-acl-support,acl"
>> +PACKAGECONFIG[aio] =3D =
"--with-aio-support,---without-aio-support,libaio"
>> PACKAGECONFIG[fam] =3D "--with-fam,--without-fam,gamin"
>> +PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam"
>> +PACKAGECONFIG[lsb] =3D ",,lsb"
>> +PACKAGECONFIG[cups] =3D "--enable-cups,--disable-cups,cups"
>> +PACKAGECONFIG[ldap] =3D "--with-ldap,--without-ldap,openldap"
>> PACKAGECONFIG[systemd] =3D "--with-systemd,--without-systemd,systemd"
>> +PACKAGECONFIG[zeroconf] =3D "--enable-avahi,--disable-avahi,avahi"
>>=20
>> =
SAMBA4_IDMAP_MODULES=3D"idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb=
2"
>> =
-SAMBA4_PDB_MODULES=3D"pdb_tdbsam,pdb_ldap,pdb_ads,pdb_smbpasswd,pdb_wbc_s=
am,pdb_samba4"
>> +SAMBA4_PDB_MODULES=3D"pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG',=
 'ldap', 'pdb_ldap,', '', =
d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
>> =
SAMBA4_AUTH_MODULES=3D"auth_unix,auth_wbc,auth_server,auth_netlogond,auth_=
script,auth_samba4"
>> =
SAMBA4_MODULES=3D"${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4_A=
UTH_MODULES}"
>>=20
>> =
SAMBA4_LIBS=3D"heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,!teven=
t,!pytevent,!tdb,!pytdb,!ldb,!pyldb"
>>=20
>> -PERL_VERNDORLIB=3D"${datadir}/perl5/vendor_perl/"
>> +PERL_VERNDORLIB=3D"${libdir}/perl5/vendor_perl/${PERLVERSION}"
>>=20
>> EXTRA_OECONF +=3D "--enable-fhs \
>>                  --with-piddir=3D${localstatedir}/run \
>> @@ -85,7 +99,7 @@ LDFLAGS +=3D "-Wl,-z,relro,-z,now"
>> do_install_append() {
>>     rmdir --ignore-fail-on-non-empty "${D}/${localstatedir}/run"
>>=20
>> -    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', =
'false', d)}; then
>> +    if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', =
'false', d)}; then
>>         install -d ${D}${systemd_unitdir}/system
>>         for i in nmb smb winbind; do
>>             install -m 0644 packaging/systemd/$i.service =
${D}${systemd_unitdir}/system
>> @@ -97,11 +111,16 @@ do_install_append() {
>> 	install -d ${D}${sysconfdir}/tmpfiles.d
>> 	echo "d ${localstatedir}/log/samba 0755 root root -" \
>>> ${D}${sysconfdir}/tmpfiles.d/99-${BPN}.conf
>> -    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', =
'false', d)}; then
>> +    elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', =
'false', d)}; then
>> 	install -d ${D}${sysconfdir}/init.d
>> 	install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d
>> 	update-rc.d -r ${D} samba.sh start 20 3 5 .
>> 	update-rc.d -r ${D} samba.sh start 20 0 1 6 .
>> +    elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', =
'false', d)}; then
>> +	install -d ${D}${sysconfdir}/init.d
>> +	install -m 0755 packaging/sysv/samba.init =
${D}${sysconfdir}/init.d/samba.sh
>> +	update-rc.d -r ${D} samba.sh start 20 3 5 .
>> +	update-rc.d -r ${D} samba.sh start 20 0 1 6 .
>>     fi
>>=20
>>     install -d ${D}${sysconfdir}/samba
>> @@ -160,4 +179,4 @@ FILES_${PN}-python-dbg =3D =
"${libdir}/python${PYTHON_BASEVERSION}/site-packages/.d
>>                           =
${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/dcerpc/.debug/* =
\
>>                          "
>>=20
>> -FILES_${PN}-pidl =3D "${datadir}/perl5/vendor_perl/*"
>> +FILES_${PN}-pidl =3D "${bindir}/pidl ${PERL_VERNDORLIB}/*"
>> --=20
>> 2.4.9 (Apple Git-60)
>>=20
>>=20
>> --=20
>> Jens Rehsack - rehsack@gmail.com
>>=20
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Jens Rehsack - rehsack@gmail.com


