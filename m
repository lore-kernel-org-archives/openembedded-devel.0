Received: from [209.85.198.248] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1K0Vb9-0005py-Jz
	for openembedded-devel@openembedded.org; Mon, 26 May 2008 07:50:21 +0200
Received: by rv-out-0708.google.com with SMTP id k29so1947483rvb.0
	for <openembedded-devel@openembedded.org>;
	Sun, 25 May 2008 22:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type:date:message-id:mime-version:x-mailer;
	bh=DP743Ov2PeX5S/9gUfNrQYNWBl9TSNZdG7T1VkXvdSs=;
	b=Av12bY+vI8rhrGkHCSyHOeg92Z0QOqhEVdT8UHYUZVnNsyB+2P+G2Zt94w1Om/Gp7X9Kb3jlSg1bey8J12dnLK5qZfyWo22Xatux+FaQffrC2i/CS4HvUFzTL+pLOy69vf3ZOXGEhazJMofKPbXcCbTBcdctm4st6Ri1ZCi7P5M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer;
	b=F3IQpcDPwvKsOzjtREDr2M0+bpE3Vhv+QkmDyGGCGpfdPpej3b4ekF37J57xiYuMZMi02NFY/2NsGT+oE9hLLY4HvBHSomaDj7uUIPyS+wFmOMpTxVObrhQ6JoM4Gu+Jajj2GfL59eWgJTm7lEXG0kFGMNQt0KR3xmDXFT7WoWY=
Received: by 10.114.180.18 with SMTP id c18mr5102342waf.128.1211780826444;
	Sun, 25 May 2008 22:47:06 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.2.3])
	by mx.google.com with ESMTPS id v38sm24355129wah.14.2008.05.25.22.47.05
	(version=SSLv3 cipher=RC4-MD5); Sun, 25 May 2008 22:47:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun, 25 May 2008 22:47:04 -0700
Message-Id: <1211780824.10806.52.camel@isis>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1 
Subject: [PATCH] glibc staging puts .a files in /lib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 26 May 2008 05:50:22 -0000
X-Groupsio-MsgNum: 5243
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-vhEplSS6F+h+51/SRqSi"

--=-vhEplSS6F+h+51/SRqSi
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi=20

I have been seeing this problem where link would fail for libgcc when
building libgcc with some weird messages like=20

version node not found for symbol __longjmp@@GLIBC_2.3.4

also Leon was seeing same issue on eglibc. I tracked this problem to
this problem in eglibc that it was installing libc.a in $sysroot/lib=20
where as all .a files should be in $sysroot/usr/lib then I saw that this
was being done in do_stage in glibc-stage.inc=20

Anyway the problem was that in glibc we use install-lib and
install-headers targets which does not put the /usr/lib/libc.so
and /usr/lib/libpthread.so scripts. If we did use 'install' these
scripts would be installed correctly.

Anyway then do_stage tries to manually generate those files and I am
seeing that even in glibc these paths are not correct and .a files are
copied into $sysroot/lib

The attached patch fixes it for glibc. Eglibc also needs similar fix but
I decided to use make install in eglibc which makes it much easier.

OK ?

Thanks

-Khem

#
# old_revision [273d68b8b346bda4dde4800b40123921d50c6fc8]
#
# patch "packages/glibc/glibc-stage.inc"
#  from [c50ef9d6a30c9a54b38d3166f9c5c13a1535a9e6]
#    to [8abe1d7d9fd4c34d725a7f26db2110bb66ec3e16]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/glibc/glibc-stage.inc	c50ef9d6a30c9a54b38d3166f9c5c13a1535a9e6
+++ packages/glibc/glibc-stage.inc	8abe1d7d9fd4c34d725a7f26db2110bb66ec3e16
@@ -16,8 +16,8 @@ do_stage() {
 		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${STAGING_INCDIR}/rpcsvc/
 	done
 	for i in libc.a libc_pic.a libc_nonshared.a; do
-		install -m 0644 ${B}/$i ${STAGING_DIR_HOST}/${layout_base_libdir}/ || di=
e "failed to install $i"
+		install -m 0644 ${B}/$i ${STAGING_DIR_HOST}/${layout_libdir}/ || die "fa=
iled to install $i"
 	done
-	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_DIR_H=
OST}/${layout_base_libdir}/libpthread.so
-	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_DIR_HOST}/${layou=
t_base_libdir}/libc.so
+	echo 'GROUP ( ${layout_base_libdir}/libpthread.so.0 ${layout_libdir}/libp=
thread_nonshared.a )' > ${STAGING_DIR_HOST}/${layout_libdir}/libpthread.so
+	echo 'GROUP ( ${layout_base_libdir}/libc.so.6 ${layout_libdir}/libc_nonsh=
ared.a )' > ${STAGING_DIR_HOST}/${layout_libdir}/libc.so
 }


--=-vhEplSS6F+h+51/SRqSi
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBIOk7YHnJKy6V6em4RAiXVAJ0RAkpIp+OtM0ExsgCRvxc78C4gAgCdFVjX
6iItH8U0AnAsspskQGvbZJ0=
=CljZ
-----END PGP SIGNATURE-----

--=-vhEplSS6F+h+51/SRqSi--
