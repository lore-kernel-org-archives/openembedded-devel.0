Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P9uXV-00020A-HL
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 08:58:46 +0200
Received: by wwb39 with SMTP id 39so1647347wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 23:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=hdB4LFv3D6oOo0PDT/i/B1BZMIfy+VuMhHwK1sX3jLE=;
	b=IzGcosSV7WdL/O1ql3JdFw1CNlubnP8NuuDDApE+4OFYEtTmbLUi4kj+DWp7Doe9rl
	3EhAItosurGv85X119JT/n8BN8VCKMPFZ+KxLhca7XHq/F03AoWvxe3ZxWkZg2utbdoK
	dwxm4zyH9KXC5oFOHwmHgQBhReSg+jv2qNQKE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=CCqi2Xi+psaEaVRsieVZwBW+6jko6sEhplEH07dM8zCSFJTvWcGd1ElKF0oQWzw4Vt
	o6qwR/6VkTnffwAl7NtB/NyGGpYFjsmB4VhnuAk5jqhpOUrpHUbnF7YR9SE4WFG+JwLW
	x8BjjX0xSTjcabak60yGQZDJLhzV0t8uhtppM=
MIME-Version: 1.0
Received: by 10.227.137.17 with SMTP id u17mr5021807wbt.129.1287903482493;
	Sat, 23 Oct 2010 23:58:02 -0700 (PDT)
Received: by 10.227.154.13 with HTTP; Sat, 23 Oct 2010 23:58:02 -0700 (PDT)
In-Reply-To: <1285368419-12062-1-git-send-email-raj.khem@gmail.com>
References: <1285368419-12062-1-git-send-email-raj.khem@gmail.com>
Date: Sun, 24 Oct 2010 08:58:02 +0200
Message-ID: <AANLkTimhhvUqQZSicuDE7qEHFdxUJjJJSv=ZioFwwdR8@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: bitbake-dev@lists.berlios.de, openembedded-devel@lists.openembedded.org
Subject: Re: [Bitbake-dev] [PATCH] fetchers: Use tar --exclude pattern to remove SCM files
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
X-List-Received-Date: Sun, 24 Oct 2010 06:58:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

This commit is usefull for sure, but breaks ie some EFL recipes.

ie python-elementary depends on elementary >=3D 0.7.0.52890
but elementary.pc says Version: 0.7.0.0

elementary.pc.in says Version: @VERSION@

and finally VERSION is defined in configure.ac:
m4_define([v_maj], [0])
m4_define([v_min], [7])
m4_define([v_mic], [0])
m4_define([v_rev], m4_esyscmd([(svnversion "${SVN_REPO_PATH:-.}" |
grep -v export || echo 0) | awk -F : '{printf("%s\n", $1);}' | tr -d '
:MSP\n']))
m4_if(v_rev, [0], [m4_define([v_rev], m4_esyscmd([git log 2> /dev/null
| (grep -m1 git-svn-id || echo 0) | sed -e 's/.*@\([0-9]*\).*/\1/' |
tr -d '\n']))])

and this works OK on checkout with .svn dirs included, but results to
0 after this patch.

Any hints how to resolve it?

Regards,

On Sat, Sep 25, 2010 at 12:46 AM, Khem Raj <raj.khem@gmail.com> wrote:
> This option will exclude the SCM metadata from tar files.
>
> Tested with gcc where svn tar which used to be 156M for gcc 4.5
> is now 77M
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0lib/bb/fetch/bzr.py | =A0 =A02 +-
> =A0lib/bb/fetch/cvs.py | =A0 =A02 +-
> =A0lib/bb/fetch/git.py | =A0 =A02 +-
> =A0lib/bb/fetch/hg.py =A0| =A0 =A02 +-
> =A0lib/bb/fetch/svn.py | =A0 =A02 +-
> =A05 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/lib/bb/fetch/bzr.py b/lib/bb/fetch/bzr.py
> index 8b0bd9f..3ca125f 100644
> --- a/lib/bb/fetch/bzr.py
> +++ b/lib/bb/fetch/bzr.py
> @@ -107,7 +107,7 @@ class Bzr(Fetch):
> =A0 =A0 =A0 =A0 os.chdir(ud.pkgdir)
> =A0 =A0 =A0 =A0 # tar them up to a defined filename
> =A0 =A0 =A0 =A0 try:
> - =A0 =A0 =A0 =A0 =A0 =A0runfetchcmd("tar -czf %s %s" % (ud.localpath, os=
.path.basename(ud.pkgdir)), d)
> + =A0 =A0 =A0 =A0 =A0 =A0runfetchcmd("tar --exclude '.bzr' --exclude '.bz=
rtags' -czf %s %s" % (ud.localpath, os.path.basename(ud.pkgdir)), d)
> =A0 =A0 =A0 =A0 except:
> =A0 =A0 =A0 =A0 =A0 =A0 t, v, tb =3D sys.exc_info()
> =A0 =A0 =A0 =A0 =A0 =A0 try:
> diff --git a/lib/bb/fetch/cvs.py b/lib/bb/fetch/cvs.py
> index 1064b09..42d71ba 100644
> --- a/lib/bb/fetch/cvs.py
> +++ b/lib/bb/fetch/cvs.py
> @@ -162,7 +162,7 @@ class Cvs(Fetch):
> =A0 =A0 =A0 =A0 # tar them up to a defined filename
> =A0 =A0 =A0 =A0 if 'fullpath' in ud.parm:
> =A0 =A0 =A0 =A0 =A0 =A0 os.chdir(pkgdir)
> - =A0 =A0 =A0 =A0 =A0 =A0myret =3D os.system("tar -czf %s %s" % (ud.local=
path, localdir))
> + =A0 =A0 =A0 =A0 =A0 =A0myret =3D os.system("tar --exclude 'CVS' -czf %s=
 %s" % (ud.localpath, localdir))
> =A0 =A0 =A0 =A0 else:
> =A0 =A0 =A0 =A0 =A0 =A0 os.chdir(moddir)
> =A0 =A0 =A0 =A0 =A0 =A0 os.chdir('..')
> diff --git a/lib/bb/fetch/git.py b/lib/bb/fetch/git.py
> index 1b1bc95..4acaa87 100644
> --- a/lib/bb/fetch/git.py
> +++ b/lib/bb/fetch/git.py
> @@ -149,7 +149,7 @@ class Git(Fetch):
>
> =A0 =A0 =A0 =A0 os.chdir(codir)
> =A0 =A0 =A0 =A0 logger.info("Creating tarball of git checkout")
> - =A0 =A0 =A0 =A0runfetchcmd("tar -czf %s %s" % (ud.localpath, os.path.jo=
in(".", "*") ), d)
> + =A0 =A0 =A0 =A0runfetchcmd("tar --exclude '.git' -czf %s %s" % (ud.loca=
lpath, os.path.join(".", "*") ), d)
>
> =A0 =A0 =A0 =A0 os.chdir(ud.clonedir)
> =A0 =A0 =A0 =A0 bb.utils.prunedir(codir)
> diff --git a/lib/bb/fetch/hg.py b/lib/bb/fetch/hg.py
> index ab00d43..9c11deb 100644
> --- a/lib/bb/fetch/hg.py
> +++ b/lib/bb/fetch/hg.py
> @@ -145,7 +145,7 @@ class Hg(Fetch):
>
> =A0 =A0 =A0 =A0 os.chdir(ud.pkgdir)
> =A0 =A0 =A0 =A0 try:
> - =A0 =A0 =A0 =A0 =A0 =A0runfetchcmd("tar -czf %s %s" % (ud.localpath, ud=
.module), d)
> + =A0 =A0 =A0 =A0 =A0 =A0runfetchcmd("tar --exclude '.hg' --exclude '.hgr=
ags' -czf %s %s" % (ud.localpath, ud.module), d)
> =A0 =A0 =A0 =A0 except:
> =A0 =A0 =A0 =A0 =A0 =A0 t, v, tb =3D sys.exc_info()
> =A0 =A0 =A0 =A0 =A0 =A0 try:
> diff --git a/lib/bb/fetch/svn.py b/lib/bb/fetch/svn.py
> index 34f8132..c236e41 100644
> --- a/lib/bb/fetch/svn.py
> +++ b/lib/bb/fetch/svn.py
> @@ -159,7 +159,7 @@ class Svn(Fetch):
> =A0 =A0 =A0 =A0 os.chdir(ud.pkgdir)
> =A0 =A0 =A0 =A0 # tar them up to a defined filename
> =A0 =A0 =A0 =A0 try:
> - =A0 =A0 =A0 =A0 =A0 =A0runfetchcmd("tar -czf %s %s" % (ud.localpath, ud=
.module), d)
> + =A0 =A0 =A0 =A0 =A0 =A0runfetchcmd("tar --exclude '.svn' -czf %s %s" % =
(ud.localpath, ud.module), d)
> =A0 =A0 =A0 =A0 except:
> =A0 =A0 =A0 =A0 =A0 =A0 t, v, tb =3D sys.exc_info()
> =A0 =A0 =A0 =A0 =A0 =A0 try:
> --
> 1.7.1
>
> _______________________________________________
> Bitbake-dev mailing list
> Bitbake-dev@lists.berlios.de
> https://lists.berlios.de/mailman/listinfo/bitbake-dev
>


