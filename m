Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NeniG-0005dl-3p
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 11:53:12 +0100
Received: by fxm25 with SMTP id 25so5719940fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 02:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ssPb+2e0EwJXqEDvfh//qaNIvq6t0LPbHxXper9kpyQ=;
	b=lqXQlJG1NQQumxvnriEUpc+jpb+unUbg9LYmymMCtWZSL3iMd+yo5/970Bsq2iUf57
	GYfqPAjan1XZO+EQnLneM7QOkg8EPFC8j8UK6GlcMzhRbyGH/p1qs8DmXJfq42oj3TZh
	Zo1vBUWL7BlXQQ6G9+/xycj5RnH70urBFmnew=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=bAuaOTJAOz3q+o6d2jk59tplK+4XhvLWcJ8920Ae/qcu0hAqDVmIKeXozPw6BKH9MR
	ibb7/mC1Xb82AkVsLmtMb40xhA6uZYg0xmVdpPJxWyGCvQDP06rIvlQUwMi8iMYniKTS
	JHySnoLaxBRdQdKbe2XJhquC6O7/VpC9ozEdM=
MIME-Version: 1.0
Received: by 10.223.73.82 with SMTP id p18mr3067040faj.34.1265712623888; Tue, 
	09 Feb 2010 02:50:23 -0800 (PST)
In-Reply-To: <E1Ne4Jc-0005sN-7y@melo.openembedded.org>
References: <E1Ne4Jc-0005sN-7y@melo.openembedded.org>
Date: Tue, 9 Feb 2010 11:50:23 +0100
Message-ID: <141020e31002090250k2b14f4a4w35b2322952665a46@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Koen Kooi : efl: bump SRCREV for comp fixes
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
X-List-Received-Date: Tue, 09 Feb 2010 10:53:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 7, 2010 at 11:24 AM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 17367574b9a7e5030e8ec5e69d10119d647f2170
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3D17367574b9a7e5030e8ec5e69d10119d647f2170
>
> Author: Koen Kooi <koen@openembedded.org>
> Date: =A0 Fri Feb =A05 20:16:18 2010 +0100
>
> efl: bump SRCREV for comp fixes
> -EFL_SRCREV ?=3D "45765"
> +EFL_SRCREV ?=3D "45902"

With this revision epsilon started to fail (python-epsilon was failing
before too).
http://tinderbox.openembedded.net/packages/epsilon/
http://tinderbox.openembedded.net/packages/python-epsilon/

I asked upstream devs on #edevel for simple fix and they said, that
epsilon is so unsupported that they would rather move it from OLD/ to
BROKEN/.

What's right way to handle that in OE?
Is it worth maintaining epsilon alive in oe.dev and asking upstream to
include patches for epsilon or can we move epsilon + apps depending on
it to obsoleted?

We cannot bump ecore, because of epsilon which is pity. If we move
epsilon to recipes/obsoleted then there is few apps still using that:
e17/exhibit_svn.bb:DEPENDS =3D "evas ecore epsilon edje eet etk efreet"
efl1/epdf/fix-plugin-path-check.patch:    requirements=3D"$requirements
epsilon imlib2"
efl1/epsilon_svn.bb:FILES_${PN}-thumbd =3D "${bindir}/epsilon
${bindir}/epsilon_thumbd"
efl1/esmart_svn.bb:DEPENDS =3D "evas ecore edje imlib2 epsilon libtool"
efl1/ewl_svn.bb:DEPENDS =3D "evas ecore edje emotion efreet epsilon"
omview/omview_svn.bb:DEPENDS +=3D " evas ewl epsilon"
python/python-epsilon_svn.bb:DEPENDS +=3D "epsilon python-ecore"
tasks/task-efl.bb:  epsilon \
tasks/task-openmoko-feed.bb:  eet evas ecore embryo epsilon edje
efreet emotion epdf \
tasks/task-python-efl-examples.bb:  python-epsilon-examples \
tasks/task-python-efl.bb:  python-epsilon \

Regards,


