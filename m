Return-Path: <brunovern.a@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1644871E63
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 07:41:50 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id c192so333010932lfe.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 23:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=fZVQ6jzVNUyTz+Kti+ej3WQpTz8C6DPYOeSrCCtCtCM=;
	b=oUqw7oe9Ai5zsbsXmdP31Yqb85WR/MFwqCq02+1jCuz8LoXHngw9MFd3batZsxSTGN
	XESWHejqgHxbFHxtZG7Yy3I7Ux1c42dAQTHzF8pdaWNK4dfLerY1xokmEXVeHwK7vUpk
	Ju3UXulH2IS3KDgha8REjU6UkwKECrcKkdvbcsKC19bGc1iDEQwHsOH1nwck/dmxRVob
	A5qY3+xlgrEx2R74il628mkzlSYTclA12elokAHfrOSdUX8Kqf//p9hl+o4rAtswkOql
	r5ikVgQTvKNpoNgHXv1oPGp7KhBP0MkjgkVZ6JQOpu2jGy9c3Gn3PDG+Xmghho4WXxW+
	aWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=fZVQ6jzVNUyTz+Kti+ej3WQpTz8C6DPYOeSrCCtCtCM=;
	b=jxvcSQSXLAMc4Zb8htzWyK+iCUFW9HcN1/IKdbGpIVbiI1CfEuYFc+3V7ACbeRVuC2
	+c+vpCnAODZWIG37c7Vl8yfQSi73APZvs8pvrKtoV5Li6w8GiUhNsgLu6Bh3pmweOIeF
	7Eo3nryVMT8ia5b38z0FhtTTWQ9k/eOzbbZmJ6szYxaZwZBLAyWYytJv1QjGjOyWiStk
	KxXcXo4d1E9dzC/DJbyxtjvtPGpIW8NuGhBrMx08DvyWUf/HQuqYRIyyzSbmMwrqX6In
	29TnbNyE3FN5+vtuTVKg62DWDVrpm8tfG2DZKv+aDhcEkhxWgrbWql07y2MFmtpfDfZS
	VQbg==
X-Gm-Message-State: ALoCoQn/RzLA4lOj+rMt6aTDnwSj4Rk0JTmjDLJgEKUjFue5rtmhGVSus6Nvi4V0goP6WdOlUvCwU8wU6zC0Fw2ik5lV8XyPvg==
X-Received: by 10.25.22.167 with SMTP id 39mr10110576lfw.153.1453189310179;
	Mon, 18 Jan 2016 23:41:50 -0800 (PST)
MIME-Version: 1.0
References: <CAF3KAoQkwWWr=xfifeqP_bK25_ysY_7+B2h7xT6L9P1Pf34KhQ@mail.gmail.com>
	<CAF3KAoS1+0fy16WjorADA3cqTjCPZwSJGOmjex6b1mKcEQw7oA@mail.gmail.com>
	<CAF3KAoTLPCK3NMm-NfVgJq80mvQBzz2WYw92p5jM6t2ySi0fAw@mail.gmail.com>
	<CAF3KAoRyD7EXhOBjECXnyZzTWAW8P65=GJScxr1TGtoveH_HTA@mail.gmail.com>
	<DC79C3D6-8838-4EEE-B607-84BAAF5B519D@gmail.com>
	<CAF3KAoTy2xZ6a2KC3ci95fQ1QnH9-KSAuD2jpZ4vLeoqAc_ZQw@mail.gmail.com>
	<CA1094E9-AA29-4D48-9025-D3CC6E5A7C68@gmail.com>
In-Reply-To: <CA1094E9-AA29-4D48-9025-D3CC6E5A7C68@gmail.com>
From: Bruno Vernay <brunovern.a@gmail.com>
Date: Tue, 19 Jan 2016 07:41:40 +0000
Message-ID: <CAF3KAoT-RZ-Ayq8D7c9x9_Nr7NXPW5qphV43NVWHQ_N0VUiYSA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] OpenLDAP modules
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
X-List-Received-Date: Tue, 19 Jan 2016 07:41:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Here is a first try at a patch fixing OpenLDAP.
I tested it on the Jethro branch and it works: from cleanall to the service
running in Qemu.

From ee7ad184b3b500a711486f378e4a68fbd2a5ae11 Mon Sep 17 00:00:00 2001
From: BrunoVernay <BrunoVern.a@gmail.com>
Date: Tue, 19 Jan 2016 08:36:01 +0100
Subject: [PATCH 1/1] Fixes build and configuration

---
 .../recipes-support/openldap/openldap_2.4.42.bb    | 28
+++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
index 49fcb56..23586b7 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
@@ -148,6 +148,8 @@ PACKAGES +=3D "${PN}-overlay-proxycache"
 # it was disabled for cross-compiling.
 CPPFLAGS_append =3D " -D_GNU_SOURCE -DURANDOM_DEVICE=3D\'/dev/urandom\'"

+LDFLAGS +=3D "-pthread"
+
 do_configure() {
     cp ${STAGING_DATADIR_NATIVE}/libtool/build-aux/ltmain.sh ${S}/build
     rm -f ${S}/libtool
@@ -166,7 +168,7 @@ LEAD_SONAME =3D "libldap-${LDAP_VER}.so.*"
 PACKAGES +=3D "${PN}-slapd ${PN}-slurpd ${PN}-bin"

 # Package contents - shift most standard contents to -bin
-FILES_${PN} =3D "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.*
${localstatedir}/openldap-data"
+FILES_${PN} =3D "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.*
${localstatedir}/${BPN}/data"
 FILES_${PN}-slapd =3D "${sysconfdir}/init.d ${libexecdir}/slapd ${sbindir}
${localstatedir}/run ${localstatedir}/volatile/run \
     ${sysconfdir}/openldap/slapd.* ${sysconfdir}/openldap/schema \
     ${sysconfdir}/openldap/DB_CONFIG.example ${systemd_unitdir}/system/*"
@@ -195,6 +197,18 @@ do_install_append() {
     install -d ${D}${systemd_unitdir}/system/
     install -m 0644 ${WORKDIR}/slapd.service ${D}${systemd_unitdir}/system=
/
     sed -i -e 's,@SBINDIR@,${sbindir},g'
${D}${systemd_unitdir}/system/*.service
+
+    # Uses mdm as the database
+    #  and localstatedir as data directory ...
+    sed -e 's/# modulepath/modulepath/' \
+        -e 's/# moduleload\s*back_bdb.*/moduleload    back_mdb/' \
+        -e 's/database\s*bdb/database        mdb/' \
+        -e 's%^directory\s*.*%directory   ${localstatedir}/${BPN}/data/%' =
\
+        -i ${D}${sysconfdir}/openldap/slapd.conf
+
+    mkdir -p ${D}${localstatedir}/${BPN}/data
+
+
 }

 INITSCRIPT_PACKAGES =3D "${PN}-slapd"
@@ -206,8 +220,20 @@ SYSTEMD_AUTO_ENABLE_${PN}-slapd ?=3D "disable"

 PACKAGES_DYNAMIC +=3D "^${PN}-backends.* ^${PN}-backend-.*"

+# The modules require their .so to be dynamicaly loaded
+INSANE_SKIP_${PN}-backend-dnssrv  +=3D "dev-so"
+INSANE_SKIP_${PN}-backend-ldap    +=3D "dev-so"
+INSANE_SKIP_${PN}-backend-meta    +=3D "dev-so"
+INSANE_SKIP_${PN}-backend-mdb     +=3D "dev-so"
+INSANE_SKIP_${PN}-backend-monitor +=3D "dev-so"
+INSANE_SKIP_${PN}-backend-null    +=3D "dev-so"
+INSANE_SKIP_${PN}-backend-passwd  +=3D "dev-so"
+INSANE_SKIP_${PN}-backend-shell   +=3D "dev-so"
+
+
 python populate_packages_prepend () {
     backend_dir    =3D d.expand('${libexecdir}/openldap')
+    do_split_packages(d, backend_dir, 'back_([a-z]*)\.so$',
'openldap-backend-%s', 'OpenLDAP %s backend', prepend=3DTrue,
extra_depends=3D'', allow_links=3DTrue)
     do_split_packages(d, backend_dir, 'back_([a-z]*)\-.*\.so\..*$',
'openldap-backend-%s', 'OpenLDAP %s backend', extra_depends=3D'',
allow_links=3DTrue)

     metapkg =3D "${PN}-backends"
--=20
2.5.0




On Thu, Jan 14, 2016 at 7:19 PM Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Jan 14, 2016, at 9:22 AM, Bruno Vernay <brunovern.a@gmail.com> wrote=
:
> >
> > Thanks it works also.
> >
> > The second issue, that I still cannot resolve is that OpenLDAP requires=
 a
> > .la or .so to load its modules.
> > The openldap config specify a file name like "back_mdb" and expect
> either a
> > back_mdb.la or back_mdb.so
> >
> > but both la or so are limited to -dev in Yocto, I don't see how to
> overcome
> > this rule???
>
> you can reset e.g. FILES_SOLIBSDEV =3D =E2=80=9C"
>
> >
> > Regards
> >
> >
> > On Wed, Jan 13, 2016 at 7:36 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >>
> >>> On Jan 13, 2016, at 8:46 AM, Bruno Vernay <brunovern.a@gmail.com>
> wrote:
> >>>
> >>> Adding this to my bbappend did the trick ...
> >>>
> >>> TARGET_CC_ARCH +=3D "-lpthread=E2=80=9D
> >>
> >> make it -pthread and add it to LDFLAGS
> >>
> >>>
> >>> I may submit a patch
> >>>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

