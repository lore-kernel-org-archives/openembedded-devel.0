Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <patda293@student.liu.se>) id 1Q90cD-0003PS-24
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 21:48:09 +0200
Received: by eye27 with SMTP id 27so1411301eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2011 12:45:52 -0700 (PDT)
Received: by 10.14.122.201 with SMTP id t49mr1709628eeh.25.1302464752404;
	Sun, 10 Apr 2011 12:45:52 -0700 (PDT)
Received: from risca-hp.localnet (h241n2-n-a31.ias.bredband.telia.com
	[217.208.43.241])
	by mx.google.com with ESMTPS id q53sm3234048eeh.11.2011.04.10.12.45.51
	(version=SSLv3 cipher=OTHER); Sun, 10 Apr 2011 12:45:51 -0700 (PDT)
From: "Patrik =?iso-8859-1?q?Dahlstr=F6m?= (student)" <patda293@student.liu.se>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2011 21:45:44 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.37-sabayon; KDE/4.6.2; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201104102145.44766.patda293@student.liu.se>
Subject: python-numpy prone to use host libraries
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
X-List-Received-Date: Sun, 10 Apr 2011 19:48:09 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have been resolving issues regarding python-numpy this whole day and I wo=
uld=20
like to share my findings. python-numpy is a package required by opencv_2.2=
,=20
which is a dependency of gst-plugins-bad making it essential to quite a lot=
 of=20
images.

=46irst of all, python-numpy requires a fortran compiler and gcc-4.5 specif=
ically=20
disables the fortran language per default. From gcc-4.5.inc

# Language Overrides
=46ORTRAN =3D ""

I am unsure what the best approach is, but I resolved this by changing to
=46ORTRAN =3D ",fortran"

Looking at the compile log of python-numpy there were several instances of =
the=20
following:

blas_info:
  libraries blas not found in=20
/home/bitbake/build/tmp_beagleboard/sysroots/x86_64-linux/usr/lib
  libraries blas not found in /usr/local/lib64
  libraries blas not found in /usr/local/lib
  FOUND:
    libraries =3D ['blas']
    library_dirs =3D ['/usr/lib64']
    language =3D f77

  FOUND:
    libraries =3D ['blas']
    library_dirs =3D ['/usr/lib64']
    define_macros =3D [('NO_ATLAS_INFO', 1)]
    language =3D f77

It clearly tries to link against my host libraries and fails. My resort was=
=20
simply to remove my host libraries (not needed at the moment). However, the=
re=20
are other ways to counter this problem.
Looking at the python-numpy sources, there is a file called site.cfg.exampl=
e.=20
In it, there is descriptions on how to supply python-numpy with configurati=
on=20
information about non-Python dependencies. It shouldn't be any problem=20
generating site.cfg files for relevant parts of the python-numpy source.
I am however uncertain on how to proceed with this and could use some=20
assistance.

=2D-=20
MvH / with best regards
Patrik Dahlstr=F6m
Ordf=F6rande/president - http://www.studentfiket.com/
Penga-Mas (Kass=F6r)/cashier - Dalarnas Nation

"Alla djur, utom m=E4nniskan, vet att livets huvudsakliga mening =E4r att n=
juta av=20
det! --Samuel Butler

"Every animal, except man, knows that the fundamental meaning of life is to=
=20
enjoy it" --Samuel Butler

()  ascii ribbon campaign - against html e-mail=20
/\  www.asciiribbon.org   - against proprietary attachments


