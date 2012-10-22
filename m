Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQEij-0004FR-2z
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 11:54:53 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so857941eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 02:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KWC71i9PU+mLX/D/osk1RFgqBR1Ml/1X2XW+ErmdIlo=;
	b=V+eOLswQLTtAeCcsFSPB5m3hKGvsrs13gd58PzHejU3UadNHV3PLkawuFlHsT9pTEb
	iQUlg0GoMzfHhKKZcbYznPH/Iwqx9Iqbg06vZe0U6rLztjVyF5g0+IQAzZTnhvatuz2H
	i06MGgDiqTnEDE6ylhcDJuVk8toAc3RPAbtW6Ed16DdM7pAAoB3+gpbwJikCg6b7Nkj/
	9h8dwsv6UxOHUhgc/lruhD/YalWcqoWuWYodhr9D1pTA/TcAsVUkEhi1Nk8QpXlAxN5l
	ecjQ2zN42CN/zux7gAY64R3DgmptAjX1H6UHhtHD9uitYq5Bj7iEG1BuKn0U30zRwf+J
	z6Yg==
Received: by 10.14.203.65 with SMTP id e41mr11245472eeo.34.1350898888798;
	Mon, 22 Oct 2012 02:41:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm15090679eel.14.2012.10.22.02.41.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 02:41:27 -0700 (PDT)
Date: Mon, 22 Oct 2012 11:41:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121022094143.GC3269@jama.jama.net>
References: <20121019164922.1E2EC103B4@opal>
	<CALbNGRQkhneW4PXcmXTObg_wkbtjBm3AEWrSr2nwT7MB+otbtg@mail.gmail.com>
	<CALbNGRTcv1gpbYSc5wCwYi5fwyZ2taWzyTwN3dumUvyTQTagOw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTcv1gpbYSc5wCwYi5fwyZ2taWzyTwN3dumUvyTQTagOw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Richard Purdie : autotools: Use STAGING_DATADIR_NATIVE for config.rpath
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
X-List-Received-Date: Mon, 22 Oct 2012 09:54:53 -0000
X-Groupsio-MsgNum: 41197
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Content-Disposition: inline

--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 22, 2012 at 11:31:57AM +0200, Andreas M=FCller wrote:
> On Mon, Oct 22, 2012 at 11:29 AM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > On Fri, Oct 19, 2012 at 6:49 PM,  <git@git.openembedded.org> wrote:
> >> Module: openembedded-core.git
> >> Branch: master-next
> >> Commit: 0ea24447842e6b76ccfee0881f557e1a82e89ef1
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3D0ea24447842e6b76ccfee0881f557e1a82e89ef1
> >>
> >> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> Date:   Thu Oct 18 15:58:25 2012 +0000
> >>
> >> autotools: Use STAGING_DATADIR_NATIVE for config.rpath
> >>
> >> For builds that don't use gettext, config.rpath may not exist in the t=
arget
> >> datadir. This change uses the native directory where it will always
> >> be present due to gettext-minimal-native (which allows us to autoreconf
> >> recipes using gettext even if we don't have gettext built).
> >>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>
> > I think this causes here for shadow-native:
> >
> > ERROR: Function failed: do_configure (see
> > /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/shadow-native-4.1.4.=
3-r8/temp/log.do_configure.19593
> > for further information)
> > ERROR: Logfile of failure stored in:
> > /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/shadow-native-4.1.4.=
3-r8/temp/log.do_configure.19593
> > Log data follows:
> > | DEBUG: Executing python function sysroot_cleansstate
> > | DEBUG: Python function sysroot_cleansstate finished
> > | DEBUG: Executing shell function autotools_preconfigure
> > | DEBUG: Shell function autotools_preconfigure finished
> > | DEBUG: Executing shell function do_configure
> > | automake (GNU automake) 1.12.3
> > | Copyright (C) 2012 Free Software Foundation, Inc.
> > | License GPLv2+: GNU GPL version 2 or later
> > <http://gnu.org/licenses/gpl-2.0.html>
> > | This is free software: you are free to change and redistribute it.
> > | There is NO WARRANTY, to the extent permitted by law.
> > |
> > | Written by Tom Tromey <tromey@redhat.com>
> > |        and Alexandre Duret-Lutz <adl@gnu.org>.
> > | AUTOV is 1.12
> > | cp: cannot stat
> > `/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/share/gette=
xt/config.rpath':
> > No such file or directory
> > | ERROR: Function failed: do_configure (see
> > /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/shadow-native-4.1.4.=
3-r8/temp/log.do_configure.19593
> > for further information)
> >
> > Maybe some PR bump here and there required?
> >
> After forcing rebuild gettext-minimal-native shadow-native builds fine.

yes, see
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October/031119.=
html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCFFNcACgkQN1Ujt2V2gBxi6wCfftgrBrXCSNL6lugJrPnFvJSh
9KYAnju7vYXNYauhoI5PHUB2b4VUTEYE
=fqJJ
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
