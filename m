Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id A1A5876DEB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 13:52:57 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so28512528wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 06:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0lapnZemrqqKMuF8vk/TWF00k30/wTEMGymuonMLuvU=;
	b=ML+e65YJA6VACZuUFSYE4CD3HbItknteCZ9ZTYfvCSUxsQD2wRqhMN6/DCDph5LQOk
	TX2Y3SmgoWzkmgotgwRRHjMwJ9b/WTH5TcgLV/CBIfsLNbCwoFXWOTXSLabqibWJVmkQ
	LeUKuLyIvZvy7c9n+vFMt8Txmiaglh4QTvbJYqy9pZz5ALp10CEJXzhnws57YojLulRJ
	3oJY2zVC+XnHmB2FU0R+NnU3Kb67UtcjAXeG9Scbsn2MD5M2+v6tOTFAJvDWIQvpLZcF
	4aiqTVx4BWa2O3QCVj7lYf5Y08TYHKT/dsDhWFUhACmZDOTBkb/4EaIwTFD7BLpmpYLJ
	yJAw==
X-Received: by 10.194.60.243 with SMTP id k19mr10015458wjr.8.1442325176973;
	Tue, 15 Sep 2015 06:52:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gc8sm20067981wib.2.2015.09.15.06.52.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Sep 2015 06:52:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 Sep 2015 15:52:59 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150915135259.GB2379@jama>
References: <1441963483-11926-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1441963483-11926-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH] collectd: fix a floating dependence on openjdk
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
X-List-Received-Date: Tue, 15 Sep 2015 13:52:57 -0000
X-Groupsio-MsgNum: 57364
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline

--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2015 at 05:24:43PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> 1. fix a floating dependence on openjdk
> 2. fix the host contamination, since the default value of java home
> is /usr/lib/jvm:
>    warning: library search path "/usr/lib/jvm/jre-1.7.0/lib/amd64/server"=
 is unsafe for cross-compilation

Does it need native dependency as well when enabled?

Without this patch one of my jenkins world builds was stuck (for many
hours calling /usr/lib/jvm/default-java/bin/java until I've killed that
process to unstuck whole build:

| make[3]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/core2-64-oe-linux/collectd/5.5.0-r0/build/src'
| make[2]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/core2-64-oe-linux/collectd/5.5.0-r0/build/src'
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/core2-64-oe-linux/collectd/5.5.0-r0/build/src'
| Making all in bindings
| make[1]: Entering directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wo=
rk/core2-64-oe-linux/collectd/5.5.0-r0/build/bindings'
| Making all in java
| make[2]: Entering directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wo=
rk/core2-64-oe-linux/collectd/5.5.0-r0/build/bindings/java'
| /usr/lib/jvm/default-java/bin/javac -d "." "/home/jenkins/oe/world/shr-co=
re/tmp-glibc/work/core2-64-oe-linux/collectd/5.5.0-r0/collectd-5.5.0/bindin=
gs/java/org/collectd/api"/*.java
| #
| [thread 47538775656192 also had an error]
| # There is insufficient memory for the Java Runtime Environment to contin=
ue.
| # pthread_getattr_np
| # An error report file with more information is saved as:
| # /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/collec=
td/5.5.0-r0/build/bindings/java/hs_err_pid29126.log
| make[2]: *** [java-build-stamp] Terminated
| make[2]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/core2-64-oe-linux/collectd/5.5.0-r0/build/bindings/java'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/core2-64-oe-linux/collectd/5.5.0-r0/build/bindings'
| make: *** [all-recursive] Error 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/collectd/5.5.0-r0/temp/l=
og.do_compile.6936)
NOTE: recipe collectd-5.5.0-r0: task do_compile: Failed

>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-oe/recipes-extended/collectd/collectd_5.5.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb b/meta-o=
e/recipes-extended/collectd/collectd_5.5.0.bb
> index 55d7b38..6a3476f 100644
> --- a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
> +++ b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
> @@ -25,6 +25,7 @@ SYSTEMD_SERVICE_${PN} =3D "collectd.service"
>  FPLAYOUT ?=3D "--with-fp-layout=3Dnothing"
> =20
>  PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[openjdk] =3D "--with-java=3D${STAGING_DIR_TARGET}${libdir}=
/jvm,--without-java,openjdk-7"
>  PACKAGECONFIG[snmp] =3D "--enable-snmp,--disable-snmp --with-libnetsnmp=
=3Dno,net-snmp"
>  PACKAGECONFIG[libmemcached] =3D "--with-libmemcached,--without-libmemcac=
hed,libmemcached"
>  PACKAGECONFIG[iptables] =3D "--enable-iptables,--disable-iptables,iptabl=
es"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlX4IroACgkQN1Ujt2V2gBzx6wCeKJQvoY7lyqhWU+86QfT2Y0py
CWQAn2ZrCPRTLbyiHFRHx6pU0yYOfnwC
=Wti3
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
