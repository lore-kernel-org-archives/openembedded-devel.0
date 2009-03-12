Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lhr2Q-0003xr-Ei
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 20:57:54 +0100
Received: by wa-out-1112.google.com with SMTP id n7so639380wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 12:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=J8AQbvMa2MTJc2vrPt/mkL9baJnMSwBHlUStDAP4pqc=;
	b=RnToywMaOciW4LPuS8jXBqtGa6CT0egPs5jZoKETuAck2CFibCMmz53fKBTD7EQ0+w
	YcgqZ2yJvdQ3Do/wOT4uKjU0bNPV1xjiOINjNshY40Y8ri1ouI+uon6a3MeCs5zk8dcW
	aqKRxmbt1DhyEN0fAlmUMp+FiQGqLh8J6g+W8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=eviGzHHlKENZasEut3CBX7FQvuN8H4aH1+wDMKfQuUnD1OVhXgT0fm2xGVQe0B02pu
	6KQkumQSnjC3aGXyxCgAjyYA3ZZdhlJ9uK0mpuoIHx1UCQR0ELY9a5TDV3q6aLPEPFkS
	6MYGmubAtRIbtOtqkJ3DR9vy3/uHRF+R/FrpI=
Received: by 10.114.124.1 with SMTP id w1mr231276wac.132.1236887859265;
	Thu, 12 Mar 2009 12:57:39 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-1-99.dsl.pltn13.sbcglobal.net
	[71.146.1.99])
	by mx.google.com with ESMTPS id n30sm862155wag.21.2009.03.12.12.57.38
	(version=SSLv3 cipher=RC4-MD5); Thu, 12 Mar 2009 12:57:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Mar 2009 12:57:24 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-9-generic; KDE/4.2.1; x86_64; ; )
References: <49bdfd00903100733s3af6dc2o48f09b48593fe51f@mail.gmail.com>
	<20090312085123.GD30336@ibawizard.net>
	<1236863674.6250.21.camel@northpole>
In-Reply-To: <1236863674.6250.21.camel@northpole>
MIME-Version: 1.0
Message-Id: <200903121257.36869.raj.khem@gmail.com>
Cc: openembedded-devel@openembedded.org
Subject: Re: Problem building kernel - too many files open
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
X-List-Received-Date: Thu, 12 Mar 2009 19:57:54 -0000
X-Groupsio-MsgNum: 8383
Content-Type: multipart/signed; boundary="nextPart2721008.VXHQ5vIBlM";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2721008.VXHQ5vIBlM
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 12 March 2009 06:14:34 Jader wrote:
> Hello.
> I had the same problem. It's inside classes/kernel.bbclass:298
> (reproduced below):
>
>
> python populate_packages_prepend () {
> 	def extract_modinfo(file):
> 		import tempfile, os, re
> 		tempfile.tempdir =3D bb.data.getVar("WORKDIR", d, 1)
> 		tmpfile =3D tempfile.mkstemp()[1]
> 		cmd =3D "PATH=3D\"%s\" %sobjcopy -j .modinfo -O binary %s %s" %
> (bb.data.getVar("PATH", d, 1), bb.data.getVar("HOST_PREFIX", d, 1) or "",
> file, tmpfile) os.system(cmd)
> 		f =3D open(tmpfile)
> 		l =3D f.read().split("\000")
> 		f.close()
> 		os.unlink(tmpfile)
>
>
> tempfile.mkstemp() is used to create a temporary file. This function
> return a tuple with an OS file descriptor and a filename. Filename is
> stored in "tmpfile" but descriptor is not stored anywhere, but it is
> still open because it's only an integer to python so it is not closed at
> the end of the function.
>
> For each iteration in which this function is called, a new OS file
> descriptor is opened, but not closed. The solution is to store the file
> descriptor and close it:

How about using TemporaryFile () to create the file instead of mkstemp ?
we do not have to worry about cleaning it up once it is closed.=20

>
>
> python populate_packages_prepend () {
> 	def extract_modinfo(file):
> 		import tempfile, os, re
> 		tempfile.tempdir =3D bb.data.getVar("WORKDIR", d, 1)
> 		tf =3D tempfile.mkstemp()
> 		tmpfile =3D tf[1]
> 		cmd =3D "PATH=3D\"%s\" %sobjcopy -j .modinfo -O binary %s %s" %
> (bb.data.getVar("PATH", d, 1), bb.data.getVar("HOST_PREFIX", d, 1) or "",
> file, tmpfile) os.system(cmd)
> 		f =3D open(tmpfile)
> 		l =3D f.read().split("\000")
> 		f.close()
> 		os.close(tf[0])
> 		os.unlink(tmpfile)
>
>
> There's a patch attached. As I=E1=B8=BF new to git, I don know it it was =
created
> in the right way. Used command following:
>
>
> git format-patch cab70860b89f0fd856c5de1c37c6a3d31fd3cc9d --stdout classes
> >kernel.bbclass.patch
>
>
> Jader H. Silva
> 2MI Tecnologia
>
> Em Qui, 2009-03-12 =C3=A0s 09:51 +0100, Petr =C5=A0tetiar escreveu:
> > Marco Cavallini <koansoftware@gmail.com> [2009-03-12 09:02:08]:
> > > Piero Pezzin ha scritto:
> >
> > [...]
> >
> > > >>> During kernel building, I got the following error:
> > > >>>
> > > >>> OTE: package linux-2.6.28: started
> > > >>> NOTE: package linux-2.6.28-r6: task do_package: started
> > > >>> ERROR: Error in executing:
> > > >>> /home/piero/work/qong-nobk/openembedded/openembedded/packages/lin=
ux
> > > >>>/ linux_2.6.28.bb
> > > >>> ERROR: Exception:exceptions.IOError Message:[Errno 24] Too many
> > > >>> open
> > > >>
> > > >> files:
> > >
> > > this is a known error.
> > > Nobody solved it yet.
> >
> > Maybe, that increasing the numbers of max. file handles and number of
> > max. inodes might help you:
> >
> > /proc/sys/fs/file-max
> > /proc/sys/fs/inode-max
> >
> > -- ynezz
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

=2D-=20
Khem Raj

--nextPart2721008.VXHQ5vIBlM
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkm5aSUACgkQHnJKy6V6em71wgCgl8Q1sINHkVN7t/iSPjk/6HZM
tvwAoJH0N1gugIbOJ3e6dg8ALt5iHQSD
=h5qF
-----END PGP SIGNATURE-----

--nextPart2721008.VXHQ5vIBlM--
