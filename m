Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OhJpw-0000wf-VQ for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 12:08:33 +0200
Received: from f053037080.adsl.alicedsl.de ([78.53.37.80]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OhJps-0006O7-Ig for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 10:07:32 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1281087632-11759-3-git-send-email-rep.dot.nop@gmail.com>
References: <1281087632-11759-1-git-send-email-rep.dot.nop@gmail.com>
	<1281087632-11759-3-git-send-email-rep.dot.nop@gmail.com>
Date: Fri, 06 Aug 2010 12:07:29 +0200
Message-ID: <1281089249.3809.68.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/4] git: add 1.7.2.1
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
X-List-Received-Date: Fri, 06 Aug 2010 10:08:33 -0000
X-Groupsio-MsgNum: 21943
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-uSsK21LevQPjQVR6JoFL"

--=-uSsK21LevQPjQVR6JoFL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Bernhard,


Am Freitag, den 06.08.2010, 11:40 +0200 schrieb Bernhard Reutner-Fischer:
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>

[=E2=80=A6]

> diff --git a/recipes/git/files/git-less-hardlinks.diff b/recipes/git/file=
s/git-less-hardlinks.diff
> index 183fe8f..be4924c 100644
> --- a/recipes/git/files/git-less-hardlinks.diff
> +++ b/recipes/git/files/git-less-hardlinks.diff
> @@ -33,17 +33,18 @@ This patch isn't complete though:
>   	ln -s $< $@ 2>/dev/null || \
>   	cp $< $@
>  =20
> -@@ -1830,13 +1828,11 @@
> +@@ -2081,14 +2081,12 @@
>   		cp "$$bindir/git$X" "$$execdir/git$X"; } ; } && \
> - 	{ for p in $(BUILT_INS); do \
> + 	for p in $(BUILT_INS); do \
>   		$(RM) "$$execdir/$$p" && \
>  -		ln "$$execdir/git$X" "$$execdir/$$p" 2>/dev/null || \
>   		ln -s "git$X" "$$execdir/$$p" 2>/dev/null || \
>   		cp "$$execdir/git$X" "$$execdir/$$p" || exit; \
> - 	  done; } && \
> - 	{ for p in $(REMOTE_CURL_ALIASES); do \
> + 	done && \
> + 	remote_curl_aliases=3D"$(REMOTE_CURL_ALIASES)" && \
> + 	for p in $$remote_curl_aliases; do \
>   		$(RM) "$$execdir/$$p" && \
>  -		ln "$$execdir/git-remote-http$X" "$$execdir/$$p" 2>/dev/null || \
>   		ln -s "git-remote-http$X" "$$execdir/$$p" 2>/dev/null || \
>   		cp "$$execdir/git-remote-http$X" "$$execdir/$$p" || exit; \
> - 	  done; } && \
> + 	done && \

did you take Yann=E2=80=99s patches into consideration [1].

> diff --git a/recipes/git/git-native_1.7.0.2.bb b/recipes/git/git-native_1=
.7.0.2.bb
> deleted file mode 100644
> index b55070a..0000000
> --- a/recipes/git/git-native_1.7.0.2.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require git.inc
> -inherit native
> -DEPENDS =3D "openssl-native curl-native zlib-native expat-native"
> -PR =3D "r4"
> -SRC_URI[src.md5sum] =3D "76518fa774b36de81d160b85fa4f19c1"
> -SRC_URI[src.sha256sum] =3D "5601df7fc282fdd66de196b282694eb77dcfc50438f0=
1587de144b3ead1a6b2f"
> -
> -EXTRA_OECONF_append =3D " --without-python"
> diff --git a/recipes/git/git.inc b/recipes/git/git.inc
> index 8275adb..1e69682 100644
> --- a/recipes/git/git.inc
> +++ b/recipes/git/git.inc
> @@ -4,8 +4,6 @@ LICENSE =3D "GPL"
> =20
>  SRC_URI =3D "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz=
2;name=3Dsrc"
> =20
> -S =3D "${WORKDIR}/git-${PV}"
> -
>  inherit autotools
> =20
>  EXTRA_OEMAKE =3D "NO_TCLTK=3D1"
> diff --git a/recipes/git/git_1.7.0.2.bb b/recipes/git/git_1.7.0.2.bb
> deleted file mode 100644
> index a3a73f0..0000000
> --- a/recipes/git/git_1.7.0.2.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -require git.inc
> -
> -SRC_URI[src.md5sum] =3D "76518fa774b36de81d160b85fa4f19c1"
> -SRC_URI[src.sha256sum] =3D "5601df7fc282fdd66de196b282694eb77dcfc50438f0=
1587de144b3ead1a6b2f"
> -
> -SRC_URI +=3D "file://git-less-hardlinks.diff"
> -
> -EXTRA_OECONF +=3D "ac_cv_snprintf_returns_bogus=3Dno ac_cv_c_c99_format=
=3Dyes"
> -
> -
> -DEPENDS =3D "openssl curl zlib expat"
> -RDEPENDS_${PN} =3D "perl perl-module-file-path cpio findutils sed"
> -
> -# Dropbear ssh needs a wrapper script, so install openssh-ssh to make it=
 work out of the box
> -RRECOMMENDS_${PN} =3D "openssh-ssh"
> -
> -PR =3D "r6"
> -
> -do_install_append() {
> -	# Fix broken hardlinks
> -	for gitprog in git-receive-pack git-upload-archive ; do
> -		rm ${D}${bindir}/$gitprog=20
> -		ln -sf ${bindir}/git ${D}${bindir}/$gitprog
> -	done
> -	rm ${D}${libexecdir}/git-core/git && ln -sf ${bindir}/git ${D}${libexec=
dir}/git-core/git
> -}
> -
> -FILES_${PN}-dbg +=3D "${libexecdir}/git-core/.debug"
> diff --git a/recipes/git/git_1.7.2.1.bb b/recipes/git/git_1.7.2.1.bb
> new file mode 100644
> index 0000000..4e07d86
> --- /dev/null
> +++ b/recipes/git/git_1.7.2.1.bb
> @@ -0,0 +1,29 @@
> +require git.inc
> +
> +SRC_URI[src.md5sum] =3D "24a443a120a0ab372185cb6bc0dbd934"
> +SRC_URI[src.sha256sum] =3D "5446b4ece3b8d81b1fcbcd6c4b91f1961b6f4047a3f6=
173e3200bee368724921"
> +
> +SRC_URI +=3D "file://git-less-hardlinks.diff"
> +BBCLASSEXTEND =3D "native"
> +
> +EXTRA_OECONF +=3D "ac_cv_snprintf_returns_bogus=3Dno ac_cv_c_c99_format=
=3Dyes"
> +EXTRA_OECONF_append-native =3D " --without-python"
> +
> +DEPENDS =3D "openssl curl zlib expat"
> +RDEPENDS_${PN} =3D "perl perl-module-file-path cpio findutils sed"
> +
> +# Dropbear ssh needs a wrapper script, so install openssh-ssh to make it=
 work out of the box
> +RRECOMMENDS_${PN} =3D "openssh-ssh"
> +
> +PR =3D "r0"
> +
> +do_install_append() {
> +	# Fix broken hardlinks
> +	#for gitprog in git-receive-pack git-upload-archive ; do
> +	#	rm ${D}${bindir}/$gitprog=20
> +	#	ln -sf ${bindir}/git ${D}${bindir}/$gitprog
> +	#done
> +	#rm ${D}${libexecdir}/git-core/git && ln -sf ${bindir}/git ${D}${libexe=
cdir}/git-core/git
> +}

Can this be removed?

> +FILES_${PN}-dbg +=3D "${libexecdir}/git-core/.debug"

It would be great if you could comment the changes in the commit
message.


Thanks,

Paul


[1] http://patchwork.openembedded.org/patch/2543/

--=-uSsK21LevQPjQVR6JoFL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxb3uEACgkQPX1aK2wOHVhwSQCfb04zFc6yqX3U+sW32tZFTn4M
p4EAn3d3iC4loqAJnZ32hYGylmxOPECs
=vOqj
-----END PGP SIGNATURE-----

--=-uSsK21LevQPjQVR6JoFL--
