Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nmo8R-0001wQ-0Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 13:57:22 +0100
Received: by fxm20 with SMTP id 20so1371370fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 04:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=wBp7tnO/4xIAhVGa5qf5cKmPEC+lx3EIRzim1k8wiao=;
	b=o12LBpSXo1843lA+KurxZoopNIrVCmFpEHCPHhKWrZ9vXsBbl6iGW1bNbNmerXU5P6
	RxfuqxLNy7jv4B8Xs8p4W81SF4NKhnwVNRucdH9A7+ACBE7yFW9jzcj7e/zP0Z+r2M4+
	AzdQZe3ZzreuxCT3Yq2hCsEpr0VRIV8J8FueM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=d/jva2ULWHkxBZ+Z6ywRXrnsGQd3cXdrKCnyJWMz4uaI86eLwINUK+2AOIteyATLfU
	KQFIttMEvPZgkH8Xmq7J+2lkI2rJ3MlqKA8SAllei+HS5Bdgy1FgoSZjbAP9ShIyjXSz
	brU3ROfsA4m3EkynAVW2ELMGw7frGmbgPbjTM=
MIME-Version: 1.0
Received: by 10.223.164.75 with SMTP id d11mr8273318fay.68.1267620855629; Wed, 
	03 Mar 2010 04:54:15 -0800 (PST)
In-Reply-To: <1267218939-6086-1-git-send-email-Martin.Jansa@gmail.com>
References: <1267218939-6086-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 3 Mar 2010 13:54:15 +0100
Message-ID: <141020e31003030454i59ed2d9fpcc32ac4ec1b65c0c@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Richard Purdie <rpurdie@linux.intel.com>
Subject: Re: [PATCH] package_ipk.bbclass DON'T PUSH THIS, but PLEASE read it
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
X-List-Received-Date: Wed, 03 Mar 2010 12:57:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2010 at 10:15 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> There is quite common error about non-existent lockfile path
>
> I've seen that everytime when recipe changes ARCH (ie when removed machin=
e specific config)
> and package is no longer in tmp/work/om-gta01.. but tmp/work/armv4t.., th=
en whole build works
> ok, but in the end it's looking for lockfile in right directory but in wr=
ong arch dir.
>
> Today I've seen similar error from mwester:
> 18:10:59 < mwester> ERROR: Error, lockfile path does not exist!: /u/slug/=
slugos/tmp/work/armv5teb-linux-gnueabi/gpsd-2.39-r0/packages-split

ping?

I think this is quite big bug as wrong vars can be used in more places
and create bigger problems than missing lockfile path.

At least please point me to example why we need collapsed subpackage
data in global scope.

RP: sorry for adding you to CC directly, but you would probably know,
if the variable name collapsing fuction from Poky:
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D634c76d02e57=
96f5e908b6d6a79dcfef6f8af3d1
should be somewhere in this code path.

Regards,

>
> So with a bit of debugging (in patch) it's clear that it's broken after e=
xecuting read_subpackage_metadata function
> NOTE: WORKDIR-before /OE/tmpdir-dev-shr/work/armv5te-oe-linux-gnueabi/gps=
d-2.90-r4.0
> NOTE: WORKDIR-after =A0/OE/tmpdir-dev-shr/work/armv5te-oe-linux-gnueabi/g=
psd-2.90-r0
>
> If I comment-out that last setVar as used in patch it works OK.
>
> I'm not sure why we wan't all those subpkg data with same keys set direct=
ly in data. But just grep for values it wants to set I can see
>
> where broken WORKDIR goes from:
> bitbake@jama ~/build.dev.shr.spitz $ grep "PR\|PKGR" variables.set.log
> NOTE: Setting pkg 'libgps' subdata key 'PR', value 'r0'
> NOTE: Setting pkg 'libgps' subdata key 'PKGR', value 'r0.4'
> NOTE: Setting pkg 'python-pygps' subdata key 'PR', value 'r0'
> NOTE: Setting pkg 'python-pygps' subdata key 'PKGR', value 'r0.4'
> NOTE: Setting pkg 'gpsd-udev' subdata key 'PR', value 'r4.0'
> NOTE: Setting pkg 'gpsd-udev' subdata key 'PKGR', value 'r4.0.4'
> NOTE: Setting pkg 'gpsd-conf' subdata key 'PR', value 'r0'
> NOTE: Setting pkg 'gpsd-conf' subdata key 'PKGR', value 'r0.4'
> NOTE: Setting pkg 'gpsd-gpsctl' subdata key 'PR', value 'r0'
> NOTE: Setting pkg 'gpsd-gpsctl' subdata key 'PKGR', value 'r0.4'
> NOTE: Setting pkg 'gps-utils' subdata key 'PR', value 'r0'
> NOTE: Setting pkg 'gps-utils' subdata key 'PKGR', value 'r0.4'
> NOTE: Setting pkg 'gpsd-dbg' subdata key 'PR', value 'r0'
> NOTE: Setting pkg 'gpsd-dbg' subdata key 'PKGR', value 'r0.4'
> NOTE: Setting pkg 'gpsd' subdata key 'PR', value 'r0'
> NOTE: Setting pkg 'gpsd' subdata key 'PKGR', value 'r0.4'
> NOTE: Setting pkg 'gpsd-doc' subdata key 'PR', value 'r0'
> NOTE: Setting pkg 'gpsd-doc' subdata key 'PKGR', value 'r0.4'
> NOTE: Setting pkg 'gpsd-dev' subdata key 'PR', value 'r0'
> NOTE: Setting pkg 'gpsd-dev' subdata key 'PKGR', value 'r0.4'
> NOTE: Setting pkg 'gpsd-static' subdata key 'PR', value 'r0'
> NOTE: Setting pkg 'gpsd-static' subdata key 'PKGR', value 'r0.4'
> NOTE: Setting pkg 'gpsd-locale' subdata key 'PR', value 'r0'
> NOTE: Setting pkg 'gpsd-locale' subdata key 'PKGR', value 'r0.4'
>
> so the right value is only in gpsd-udev, but that's only because gpsd-ude=
v is new subpackage and wasn't been built before
> NOTE: pkg: gpsd-udev
> NOTE: pkg: gpsd-udev - /OE/tmpdir-dev-shr/pkgdata/armv5te-oe-linux-gnueab=
i/runtime/gpsd-udev
> while other recipes have both arch
> NOTE: pkg: python-pygps
> NOTE: pkg: python-pygps - /OE/tmpdir-dev-shr/pkgdata/spitz-oe-linux-gnuea=
bi/runtime/python-pygps
> NOTE: pkg: python-pygps - /OE/tmpdir-dev-shr/pkgdata/armv5te-oe-linux-gnu=
eabi/runtime/python-pygps
>
> In this case when I return last arch found, then it works again, but that=
's only because we're changing app from spitz to armv5te,
> when someone adds some machine specific config then, right version will b=
e in spitz and wrong in armv5te
>
> Please someone fix this :).
> ---
> =A0classes/package_ipk.bbclass | =A0 =A04 ++++
> =A0classes/packagedata.bbclass | =A0 =A09 ++++++++-
> =A02 files changed, 12 insertions(+), 1 deletions(-)
>
> diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
> index 420c892..44241d6 100644
> --- a/classes/package_ipk.bbclass
> +++ b/classes/package_ipk.bbclass
> @@ -320,7 +320,11 @@ python do_package_write_ipk () {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bb.debug(1, "No PACKAGES defined, nothing =
to package")
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return
>
> + =A0 =A0 =A0 workdir =3D bb.data.getVar('WORKDIR', d, 1)
> + =A0 =A0 =A0 bb.note("WORKDIR-before %s" % workdir)
> =A0 =A0 =A0 =A0bb.build.exec_func("read_subpackage_metadata", d)
> + =A0 =A0 =A0 workdir =3D bb.data.getVar('WORKDIR', d, 1)
> + =A0 =A0 =A0 bb.note("WORKDIR-after %s" % workdir)
> =A0 =A0 =A0 =A0bb.build.exec_func("do_package_ipk", d)
> =A0}
> =A0do_package_write_ipk[dirs] =3D "${D}"
> diff --git a/classes/packagedata.bbclass b/classes/packagedata.bbclass
> index 86f18a9..581c020 100644
> --- a/classes/packagedata.bbclass
> +++ b/classes/packagedata.bbclass
> @@ -27,10 +27,15 @@ def get_subpkgedata_fn(pkg, d):
> =A0 =A0 =A0 =A0archs.reverse()
> =A0 =A0 =A0 =A0pkgdata =3D bb.data.expand('${TMPDIR}/pkgdata/', d)
> =A0 =A0 =A0 =A0targetdir =3D bb.data.expand('${TARGET_VENDOR}-${TARGET_OS=
}/runtime/', d)
> + =A0 =A0 =A0 bb.note("pkg: %s" % pkg)
> + =A0 =A0 =A0 rval =3D None
> =A0 =A0 =A0 =A0for arch in archs:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fn =3D pkgdata + arch + targetdir + pkg
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if os.path.exists(fn):
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return fn
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.note("pkg: %s - %s" % (p=
kg, fn))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rval =3D fn
> + =A0 =A0 =A0 if rval !=3D None:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return rval
> =A0 =A0 =A0 =A0return bb.data.expand('${PKGDATA_DIR}/runtime/%s' % pkg, d=
)
>
> =A0def has_subpkgdata(pkg, d):
> @@ -51,11 +56,13 @@ python read_subpackage_metadata () {
> =A0 =A0 =A0 =A0data =3D read_pkgdata(bb.data.getVar('PN', d, 1), d)
>
> =A0 =A0 =A0 =A0for key in data.keys():
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.note("Setting key '%s', value '%s'" % (k=
ey, data[key]));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bb.data.setVar(key, data[key], d)
>
> =A0 =A0 =A0 =A0for pkg in bb.data.getVar('PACKAGES', d, 1).split():
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sdata =3D read_subpkgdata(pkg, d)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for key in sdata.keys():
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.note("Setting pkg '%s' s=
ubdata key '%s', value '%s'" % (pkg, key, sdata[key]));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bb.data.setVar(key, sdata[=
key], d)
> =A0}
>
> --
> 1.7.0
>
>


