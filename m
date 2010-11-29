Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PNBFJ-0004Bp-5T
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 22:26:50 +0100
Received: by gxk20 with SMTP id 20so2397387gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 13:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Yadyn38r6xYKCvay9Z4SzF/CBcEBmppuGWt4KqmTX9Y=;
	b=OO5FlnOWMeShE67Cq2S+eBcpBY4YnUBL/F3cdJyDXmA9efBgvcAfEnR/iFS6KTZFQR
	vxtpasNAKhGi/EEsujN1m1+NsdynBGW10oIUfKqCLmR6G2nxLW6JEHnmcAgNTiUIAcFP
	W+rQP36ig7yML/pS9ewGQPpU054QvtaB0Um/k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=B6KCnxJ85VJzN/0/zAm3p0ZzmI90DDVxrLWo5f2LWEhIjQBLvStHgydbq66jnJMD+v
	sfTHpJSealo/Z/8jKgoq4BMNAeimfyGj674xi2p0Z+ZmGa6ossiGEbOblJK5G9tH05ui
	T69rFyTsoxukneA61f8q/GScN8mw4bL+cKSN0=
Received: by 10.90.9.22 with SMTP id 22mr9748206agi.102.1291065928285; Mon, 29
	Nov 2010 13:25:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Mon, 29 Nov 2010 13:25:08 -0800 (PST)
In-Reply-To: <icvtl2$4pb$1@dough.gmane.org>
References: <ico541$f8$1@dough.gmane.org>
	<1290952831-12085-1-git-send-email-eric@eukrea.com>
	<icvtl2$4pb$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Nov 2010 13:25:08 -0800
Message-ID: <AANLkTimOybgRmUYFmJXQEaZMDx9vbf=b3KzxLgv10WPu@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] add task-qt4-x11 and qt4-x11 base & demo images
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
X-List-Received-Date: Mon, 29 Nov 2010 21:26:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2010 at 2:01 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 28-11-10 15:00, Eric B=C3=A9nard wrote:
>> these are images integrating qt4-x11-free librarie and its demo
>> applications running using Xorg.
>>
>> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
>
> Looks good enough to me:
>
> Acked-by: Koen Kooi <k-kooi@ti.com>

Ditto.

Acked-by: Khem Raj <raj.khem@gmail.com>
>
>> ---
>> =C2=A0recipes/images/qt4-x11-base-image.bb | =C2=A0 30 +++++++++++++++++=
+++++
>> =C2=A0recipes/images/qt4-x11-demo-image.bb | =C2=A0 =C2=A07 +++++
>> =C2=A0recipes/tasks/task-qt4-x11.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
46 ++++++++++++++++++++++++++++++++++
>> =C2=A03 files changed, 83 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644 recipes/images/qt4-x11-base-image.bb
>> =C2=A0create mode 100644 recipes/images/qt4-x11-demo-image.bb
>> =C2=A0create mode 100644 recipes/tasks/task-qt4-x11.bb
>>
>> diff --git a/recipes/images/qt4-x11-base-image.bb b/recipes/images/qt4-x=
11-base-image.bb
>> new file mode 100644
>> index 0000000..83a1d34
>> --- /dev/null
>> +++ b/recipes/images/qt4-x11-base-image.bb
>> @@ -0,0 +1,30 @@
>> +require micro-base-image.bb
>> +
>> +TOUCH =3D ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib =
tslib-calibrate tslib-tests", "",d)}'
>> +
>> +XSERVER ?=3D "xserver-xorg \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-evdev \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-tslib \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-video-fbdev "
>> +
>> +DEPENDS +=3D "task-qt4-x11"
>> +
>> +RDEPENDS_${PN} +=3D " \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0task-qt4-x11-base \
>> + =C2=A0 =C2=A0 task-qt4-x11-qwt \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>> +
>> +IMAGE_INSTALL +=3D "\
>> + =C2=A0 =C2=A0 initscripts \
>> + =C2=A0 =C2=A0 kernel-modules \
>> + =C2=A0 =C2=A0 gdbserver \
>> + =C2=A0 =C2=A0 strace \
>> + =C2=A0 =C2=A0 module-init-tools \
>> + =C2=A0 =C2=A0 task-qt4-x11-base \
>> + =C2=A0 =C2=A0 task-qt4-x11-qwt \
>> + =C2=A0 =C2=A0 ${TOUCH} \
>> + =C2=A0 =C2=A0 pointercal \
>> + =C2=A0 =C2=A0 ${XSERVER} \
>> + =C2=A0 =C2=A0 ttf-liberation-sans ttf-liberation-serif ttf-liberation-=
mono \
>> + =C2=A0 =C2=A0 xauth xhost xset xrandr \
>> +"
>> diff --git a/recipes/images/qt4-x11-demo-image.bb b/recipes/images/qt4-x=
11-demo-image.bb
>> new file mode 100644
>> index 0000000..8d14dc1
>> --- /dev/null
>> +++ b/recipes/images/qt4-x11-demo-image.bb
>> @@ -0,0 +1,7 @@
>> +require qt4-x11-base-image.bb
>> +
>> +IMAGE_INSTALL +=3D "\
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qt4-demos qt4-examples qt-demo-init \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qt4-assistant \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qwt-examples \
>> +"
>> diff --git a/recipes/tasks/task-qt4-x11.bb b/recipes/tasks/task-qt4-x11.=
bb
>> new file mode 100644
>> index 0000000..e2e1fe2
>> --- /dev/null
>> +++ b/recipes/tasks/task-qt4-x11.bb
>> @@ -0,0 +1,46 @@
>> +DESCRIPTION =3D "QT4-X11 base Image Feed"
>> +PR =3D "r0"
>> +LICENSE =3D "MIT"
>> +
>> +inherit task
>> +
>> +PACKAGES +=3D " \
>> + =C2=A0 =C2=A0 ${PN}-base \
>> + =C2=A0 =C2=A0 ${PN}-qwt \
>> +"
>> +
>> +RDEPENDS_${PN}-base =3D " \
>> + =C2=A0 =C2=A0 qt4-x11-free \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0libqt3support4 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0libqtclucene4 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0libqtcore4 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0libqtdbus4 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0libqtgui4 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0libqthelp4 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0libqtmultimedia4 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0libqtnetwork4 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0libqtscript4 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0libqtscripttools4 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0libqtsql4 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0libqtsvg4 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0libqttest4 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0libqtwebkit4 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0libqtxml4 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0libqtxmlpatterns4 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qt4-fonts \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qt4-plugin-iconengine-svgicon \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qt4-plugin-imageformat-gif \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qt4-plugin-imageformat-ico \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qt4-plugin-imageformat-jpeg \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qt4-plugin-imageformat-mng \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qt4-plugin-imageformat-svg \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qt4-plugin-imageformat-tiff \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qt4-plugin-phonon-backend-gstreamer \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qt4-plugin-script-dbus \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qt4-plugin-sqldriver-sqlite2 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qt4-plugin-sqldriver-sqlite \
>> +"
>> +
>> +RDEPENDS_${PN}-qwt =3D "\
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qwt \
>> +"
>> \ No newline at end of file
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFM83niMkyGM64RGpERAiqVAJ9R8Dp0IXMR2TTKtm0VNTL9hSBEuACfeqoU
> tXLGZiFGQrGlGyqcUodOWrU=3D
> =3DnbCV
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


