Received: from [209.85.220.220] (helo=mail-fx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MAVKB-0005W3-OX
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 May 2009 22:38:39 +0200
Received: by fxm20 with SMTP id 20so6765347fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 13:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zLgT5w3oypt5VW+4nW0xBhMFOtdVPZx6Xv+Ugdokm7Q=;
	b=sUWtNtI2L05SZAWCB3ZcvUwyqWWf/L+3n4zopUSrhWfNE6rJE/fwu+wv7HrtNuWd/A
	3UYacIo1RNpA+5Dp8mmjEC3oNJQa9zdatDLU4WJh3tJAm5KotqMDwK87qZo9iLizDUiD
	i2Pekum8wYaAH05lO9guKpgLyagldYzqO0q9M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cxRYNTU2kj7P4IsOUzGj4X56upqLv4/rkPczqkkVIu+ZcrCkUrs5778GsdpcdJIsHq
	yziBYSIGZE72ViHeThniHqLyZjMq4Lr5K6MXUQ2Q58sW747WU/rfi1lFgDWP6fnB65+t
	9Bmhe7SWqGxxuqvmBzZn9U77sJCeslbi4LQqE=
MIME-Version: 1.0
Received: by 10.103.172.7 with SMTP id z7mr2430922muo.15.1243715403376; Sat, 
	30 May 2009 13:30:03 -0700 (PDT)
In-Reply-To: <1243198440-8833-1-git-send-email-ihar.hrachyshka@gmail.com>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243198440-8833-1-git-send-email-ihar.hrachyshka@gmail.com>
Date: Sat, 30 May 2009 23:30:03 +0300
Message-ID: <fce2a370905301330s3b97729fq53be735044773d55@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/4] udev: fixed obsolete udevadm syntax for udev init.d script.
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
X-List-Received-Date: Sat, 30 May 2009 20:38:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Any change we can get it in tree?

On Sun, May 24, 2009 at 11:54 PM, Ihar Hrachyshka
<ihar.hrachyshka@gmail.com> wrote:
> Fixed the following warning message when executing udev init script:
> "udevadm control commands requires the --<command> format, this will
> stop working in a future release."
>
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> ---
> =C2=A0recipes/udev/udev-141/init | =C2=A0 =C2=A04 ++--
> =C2=A0recipes/udev/udev_141.bb =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A02 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/udev/udev-141/init b/recipes/udev/udev-141/init
> index efe4470..7188b5a 100644
> --- a/recipes/udev/udev-141/init
> +++ b/recipes/udev/udev-141/init
> @@ -56,10 +56,10 @@ kill_udevd > "/dev/null" 2>&1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo -e '\000\000\000\000' > /proc/sys/kernel=
/hotplug
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 /sbin/udevd -d
>
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0/sbin/udevadm control env STARTUP=3D1
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0/sbin/udevadm control --env STARTUP=3D1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "$not_first_b=
oot" !=3D "" ];then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/sbin/udevadm trigger --subsystem-nomatch=3Dtty --subsystem-nomat=
ch=3Dmem --subsystem-nomatch=3Dvc --subsystem-nomatch=3Dvtconsole --subsyst=
em-nomatch=3Dmisc --subsystem-nomatch=3Ddcon --subsystem-nomatch=3Dpci_bus =
=C2=A0--subsystem-nomatch=3Dgraphics =C2=A0--subsystem-nomatch=3Dbacklight =
--subsystem-nomatch=3Dvideo4linux =C2=A0--subsystem-nomatch=3Dplatform
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (/sbin/udevadm settle --timeout=3D3; /sbin/udevadm control env START=
UP=3D)&
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (/sbin/udevadm settle --timeout=3D3; /sbin/udevadm control --env STA=
RTUP=3D)&
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ "$DEVCACHE" !=3D "" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f /tmp/uname
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f /tmp/cmdline
> diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
> index e7438fb..7e26798 100644
> --- a/recipes/udev/udev_141.bb
> +++ b/recipes/udev/udev_141.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "GPL"
> =C2=A0# Untested
> =C2=A0DEFAULT_PREFERENCE =3D "-1"
>
> -PR =3D "r6"
> +PR =3D "r7"
>
> =C2=A0SRC_URI =3D "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-=
${PV}.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mount.blacklist \
> --
> 1.6.3.1
>
>


