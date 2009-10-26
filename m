Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1N2FQg-0003gi-4z
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 03:35:33 +0100
Received: by yxe5 with SMTP id 5so6608319yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Oct 2009 19:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=FUVVseCmpbTEgObHWWekSS9mLKSW9OpV8hMqIRSKMQM=;
	b=XD90K94vVg07huxzoAt73xGg3G3RfRtDXe7L739b0NOC/bxeNt8iNMna22ZBG8yN50
	es69eaATm65EEsqvzRm1Ycf3D4fhwRZyHtr7hSuBwT/+5hjmNzLCm8HceIQ1Eo24fFYu
	/accG9HpTn4Hlxiv8d1XKcFMeZWv3rTFg5Dbg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=i96ok/rEWsvktgOSIa4woYE7MQUhQlWXoj6Kim3bBIJxKIFJwn0tjD4dMO3vjkb+bN
	AgsaX/PVEPwWGhk+Wm492WRCLJoU8c3N7XD4uped4e9vWJ6Nnz6lQCYaHjKBVAFMIWFW
	sHrULrxPqOlQuUqIB8CibvE+lUtNUY1HfGc/Y=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.101.111.12 with SMTP id o12mr154196anm.51.1256524465138; Sun, 
	25 Oct 2009 19:34:25 -0700 (PDT)
In-Reply-To: <1256521920-9126-1-git-send-email-msmith@cbnco.com>
References: <1256521920-9126-1-git-send-email-msmith@cbnco.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 25 Oct 2009 19:34:05 -0700
X-Google-Sender-Auth: 537fc69733ea48aa
Message-ID: <b6ebd0a50910251934oc73dd22g492291ab51dd99f@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] gitver.bbclass: fix git dependency tracking
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
X-List-Received-Date: Mon, 26 Oct 2009 02:35:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Good catch, looks good.

Acked-by: Chris Larson <clarson@kergoth.com>

On Sun, Oct 25, 2009 at 6:52 PM, Michael Smith <msmith@cbnco.com> wrote:
> .git/HEAD doesn't usually change on a commit, but the ref it points to
> (e.g. .git/refs/heads/master) should. Handle this and another couple of
> cases: if a tag is added without a new commit, or if the ref is in
> packed-refs.
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
> =C2=A0classes/gitver.bbclass | =C2=A0 32 +++++++++++++++++++++-----------
> =C2=A01 files changed, 21 insertions(+), 11 deletions(-)
>
> diff --git a/classes/gitver.bbclass b/classes/gitver.bbclass
> index 92c053a..5b4ba8d 100644
> --- a/classes/gitver.bbclass
> +++ b/classes/gitver.bbclass
> @@ -8,20 +8,14 @@
>
> =C2=A0GITVER =3D "${@get_git_pv('${S}', d)}"
>
> -def gitver_mark_dependency(d):
> - =C2=A0 =C2=A0from bb.data import expand
> - =C2=A0 =C2=A0from bb.parse import mark_dependency
> - =C2=A0 =C2=A0from os.path import abspath
> -
> - =C2=A0 =C2=A0fn =3D abspath(expand("${S}/.git/HEAD", d))
> - =C2=A0 =C2=A0mark_dependency(d, fn)
> -
> =C2=A0def get_git_pv(path, d, tagadjust=3DNone):
> =C2=A0 =C2=A0 from subprocess import Popen, PIPE
> - =C2=A0 =C2=A0from os.path import join
> + =C2=A0 =C2=A0import os
> =C2=A0 =C2=A0 from bb import error
> + =C2=A0 =C2=A0from bb.parse import mark_dependency
>
> - =C2=A0 =C2=A0env =3D {"GIT_DIR": join(d.getVar("S", True), ".git")}
> + =C2=A0 =C2=A0gitdir =3D os.path.abspath(os.path.join(d.getVar("S", True=
), ".git"))
> + =C2=A0 =C2=A0env =3D { "GIT_DIR": gitdir }
>
> =C2=A0 =C2=A0 def popen(cmd, **kwargs):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 kwargs["stderr"] =3D PIPE
> @@ -39,7 +33,23 @@ def get_git_pv(path, d, tagadjust=3DNone):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return stdout.rstrip()
>
> - =C2=A0 =C2=A0gitver_mark_dependency(d)
> + =C2=A0 =C2=A0# Force the recipe to be reparsed so the version gets bump=
ed
> + =C2=A0 =C2=A0# if the active branch is switched, or if the branch chang=
es.
> + =C2=A0 =C2=A0mark_dependency(d, os.path.join(gitdir, "HEAD"))
> +
> + =C2=A0 =C2=A0ref =3D popen(["git", "symbolic-ref", "HEAD"])
> + =C2=A0 =C2=A0reffile =3D os.path.join(gitdir, ref)
> + =C2=A0 =C2=A0if ref and os.path.exists(reffile):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0mark_dependency(d, reffile)
> + =C2=A0 =C2=A0else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# The ref might be hidden in packed-refs. Fo=
rce a reparse if anything
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# in the working copy changes.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0mark_dependency(d, os.path.join(gitdir, "ind=
ex"))
> +
> + =C2=A0 =C2=A0# Catch new tags.
> + =C2=A0 =C2=A0tagdir =3D os.path.join(gitdir, "refs", "tags")
> + =C2=A0 =C2=A0if os.path.exists(tagdir):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0mark_dependency(d, tagdir)
>
> =C2=A0 =C2=A0 ver =3D popen(["git", "describe", "--tags"], cwd=3Dpath)
> =C2=A0 =C2=A0 if not ver:
> --
> 1.6.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


