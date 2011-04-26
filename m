Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QEla9-0000xJ-Vc
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 18:57:51 +0200
Received: by wye20 with SMTP id 20so706086wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2011 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ZLyRLlBivlV508wt3LxUsxiC0+nkw2DVuLi6MPR0U/4=;
	b=FxShg2e6XuWWDFMytM6D1yQbqrwAJkeq2karq2/L3GxGy6YMDaiql7/3uQE8dWwWCe
	daw74qSLJRb9wSX6jPH7xBbCngSw7e2rDPCE8ihabcbIs08b9X+gRbSgJ9Tk6NtA3EhV
	el4f4C+dHYIdJtkziR1tjc4OqknsPm7mQYAw0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=NIollylO3eoxWeMjb8LU6Xk/rFTXya3hiok/CUjD7R8P6DCRWyUOzlIEoApItPYZr2
	EZrIaL0eS48wNN/IYcKjzcEfNILByDFMoq95aYfV0qA5jy4yal74m1v3iqURAGs+3+/V
	+cInEdZccmbbwe15pzta1RNcMOw41qIcwwyUc=
MIME-Version: 1.0
Received: by 10.216.82.77 with SMTP id n55mr1024986wee.52.1303836919150; Tue,
	26 Apr 2011 09:55:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Tue, 26 Apr 2011 09:55:18 -0700 (PDT)
In-Reply-To: <1303814757-9940-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1303814757-9940-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Date: Tue, 26 Apr 2011 13:55:18 -0300
X-Google-Sender-Auth: OKzt8ocTZp9q0QPzFI7OKQnHf_Q
Message-ID: <BANLkTinABcMt1UQQjU+1cYQYLR90y24OMw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] gitpkgv.bbclass: cache GITPKGV result
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
X-List-Received-Date: Tue, 26 Apr 2011 16:57:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Tue, Apr 26, 2011 at 07:45, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> gitpkgv runs the 'git rev-list | wc -l' several times when processing a
> package using GITPKGV. =A0This takes ages for packages like the linux
> kernel which has a) a large repository and b) lots of subpackages.
>
> This patch caches the result of 'git rev-list' into the sources cache
> directory and uses it on the next run. =A0Because collisions of the sha1
> hash are very unlikely, the git revision is used directly as the key.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
> =A0classes/gitpkgv.bbclass | =A0 29 +++++++++++++++++++++++------
> =A01 files changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/classes/gitpkgv.bbclass b/classes/gitpkgv.bbclass
> index bedceb9..76c660b 100644
> --- a/classes/gitpkgv.bbclass
> +++ b/classes/gitpkgv.bbclass
> @@ -50,8 +50,11 @@ def gitpkgv_drop_tag_prefix(version):
> =A0def get_git_pkgv(d, use_tags):
> =A0 =A0 =A0 =A0import os
> =A0 =A0 =A0 =A0import bb
> + =A0 =A0 =A0 from pipes import quote
>
> =A0 =A0 =A0 =A0urls =3D bb.data.getVar('SRC_URI', d, 1).split()
> + =A0 =A0 =A0 cachedir =3D bb.data.expand("${DL_DIR}/gitpkgv", d)
> + =A0 =A0 =A0 bb.mkdirhier(cachedir)
>
> =A0 =A0 =A0 =A0for url in urls:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(type, host, path, user, pswd, parm) =3D b=
b.decodeurl(bb.data.expand(url, d))
> @@ -63,22 +66,36 @@ def get_git_pkgv(d, use_tags):
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return Non=
e
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rev =3D bb.fetch.get_srcre=
v(d).split('+')[1]
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rev_file =3D os.path.join(c=
achedir, rev)
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cwd =3D os.getcwd()
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 os.chdir(repodir)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vars =3D { 'repodir' : quot=
e(repodir),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0'rev' : =
quote(rev),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 commits =3D bb.fetch.runfet=
chcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=3DTrue).str=
ip()
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if not os.path.exists(rev_f=
ile) or os.path.getsize(rev_file)=3D=3D0:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 commits =3D=
 bb.fetch.runfetchcmd(
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0"cd %(repodir)s && "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0"git rev-list %(rev)s -- 2> /dev/null | wc -l" % vars,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0d, quiet=3DTrue).strip()
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if commits =
!=3D "0":
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 oe.path.remove(rev_file, recurse=3DFalse)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 open(rev_file, "w").write("%d\n" % commits)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 commits =3D=
 open(rev_file, "r").readline(128).strip()
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if use_tags:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0try:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ver =3D gitpkgv_drop_tag_prefix(bb.fetch.runfetchcmd("git describe %s =
2>/dev/null" % rev, d, quiet=3DTrue).strip())
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 tmp =3D bb.fetch.runfetchcmd(
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "cd %(repodir)s && "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "git describe %(rev)s 2>/dev/null" % vars,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 d, quiet=3DTrue).strip()
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ver =3D gitpkgv_drop_tag_prefix(tmp)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0except Exc=
eption:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0ver =3D "0.0-%s-g%s" % (commits, rev[:7])
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ver =3D "%=
s+%s" % (commits, rev[:7])
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 os.chdir(cwd)
> -
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ver
>
> =A0 =A0 =A0 =A0return "0+0"
> --
> 1.7.4.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


