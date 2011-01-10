Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PcDAn-0002Ar-OR
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 09:32:18 +0100
Received: by wyb40 with SMTP id 40so19774628wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jan 2011 00:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=n4EfYvGYcO2NhAjEb0hrQE+ccCq+teCH6GhZ5sJZjl0=;
	b=UYUi/GrpVbf8uGtK/G/Qfwv3bxIh37Dzxxhpm7u/ROfjHEyF51IYSzm8Sw/8p+vVY8
	SG7z7sRVleRk/i32Cxd4h8g0IVuvXUifsqgUGG6qWa3Aoo/NB6esMfxkebayIiopeXQq
	fg+v3DbwhytghknpVC+vrpesbJlq3DDhlRihM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=p26japsMxUNTylwtP+JQkp5FN/rF3UCej6ToFuX5S+cUbZgTgxlSMNVSrUCXWffrHf
	yfdF6lfZD6qRioEmZp1qNdbVRXI7/chxBrmQspBJs5gbGs0yks43Oeuwz7IaB1W/F1oo
	GZlmgkPo3SXtEQiGYnnewP51NUDsBIlmvUxM8=
MIME-Version: 1.0
Received: by 10.227.156.9 with SMTP id u9mr2343040wbw.142.1294648305819; Mon,
	10 Jan 2011 00:31:45 -0800 (PST)
Received: by 10.227.13.69 with HTTP; Mon, 10 Jan 2011 00:31:45 -0800 (PST)
In-Reply-To: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
References: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 10 Jan 2011 09:31:45 +0100
Message-ID: <AANLkTik6N-zh9_o819ipEyu7-k3k5Nt24+GbVTg0q24n@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] xorg: upgrade to X11R7.6 and remove preferred-xorg-versions*.inc files
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
X-List-Received-Date: Mon, 10 Jan 2011 08:32:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2010 at 2:48 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * X11R7.6-RC1 was already released
> =A0http://www.x.org/releases/X11R7.6-RC1/doc/xorg-docs/ReleaseNotes.html
> =A0so it's IMHO time to start migration there
> * preferred-xorg-versions-live.inc was tracking latest stable released
> =A0tarballs, but only reason I was maintaining it was to overwrite older
> =A0preferred-xorg-versions-X11R7.5.inc if your distribution included ie
> =A0X11R7.5.inc and you wanted live.inc from local.conf
> * default recipe versions without any preferred-xorg-versions include
> =A0are now the same as live.inc
> * we will get better test coverage if we use same versions
> * if someone really needs older release then pinning only core stuff
> =A0like xserver/libx11 will be probably better, than pinning every xorg
> =A0app/proto/font etc.
> * I can slow down adding newest xorg stuff or ie keep it everytime for
> =A0at least a week on ML for another review and test on more targets
> =A0(I'm testing it only on om-gta02/spitz/nokia900)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0.../include/angstrom-2010-preferred-versions.inc =A0 | =A0 =A01 -
> =A0.../preferred-xorg-versions-X11R7.5-latest.inc =A0 =A0 | =A0126 ------
> =A0.../include/preferred-xorg-versions-X11R7.5.inc =A0 =A0| =A0286 ------=
-------
> =A0.../include/preferred-xorg-versions-live.inc =A0 =A0 =A0 | =A0450 ----=
----------------
> =A0conf/distro/jlime-2010.1.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A01 -
> =A0conf/distro/metano.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A01 -
> =A0conf/distro/micro.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A05 -
> =A0conf/distro/minimal.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A01 -
> =A0.../bump.preferred-xorg-versions-7.5.sh =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A07 -
> =A0.../bump.preferred-xorg-versions-live.sh =A0 =A0 =A0 =A0 =A0 | =A0 25 =
--
> =A010 files changed, 0 insertions(+), 903 deletions(-)
> =A0delete mode 100644 conf/distro/include/preferred-xorg-versions-X11R7.5=
-latest.inc
> =A0delete mode 100644 conf/distro/include/preferred-xorg-versions-X11R7.5=
.inc
> =A0delete mode 100644 conf/distro/include/preferred-xorg-versions-live.in=
c

Can I get more comments on this? :)

Or just push and see who complains? :/


