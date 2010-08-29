Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpcGJ-0003sg-Kd
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:25:08 +0200
Received: by mail-iw0-f175.google.com with SMTP id 2so3830162iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=w1oRkk/3/4/25WLofY3VG7/oiysoBsv4ybvFeo8Mh9I=;
	b=V2utH/sQBJYQE66VHxnlYnhyhEI4pH0cpnWpTOEbPA6noR4asKh9FcSnwxz94bTA7M
	9gVKjgN0cx5KJ7rfRGjzTeZnj/dQxACw2rAp4N73air3o1G/FeD9lTj+om4Wa+YQZEOM
	dWdPGiDQckmyK/dOBLe6oBNjhWacTYIMTh7Pc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tjKhF3bKJUCoNu2R3BeGP/pILKGeqv78nXwE6mVd0OZPKs0zvoFS5gbHNKoxgbQreS
	O90qFVio3Nh8iuN0Jocby6ibsq2F9dQoLUVC8WjTzGAyuNKBkGMS1ySKXInN9eONFB4H
	jp0tdgbcmAoYadZaWZiWwkXlp9E8WeVFH43UA=
MIME-Version: 1.0
Received: by 10.231.191.74 with SMTP id dl10mr3467584ibb.157.1283066679077;
	Sun, 29 Aug 2010 00:24:39 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:24:39 -0700 (PDT)
In-Reply-To: <1283027073-12308-9-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-9-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:24:39 +0200
Message-ID: <AANLkTi=feqtmUop5YTCMYPBdZbOhurNWH-a=tQnXk-xX@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 08/23] task-demo-x11.bb: Replace non existing libgles-omap3-demos with libgles-omap3-x11demos
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
X-List-Received-Date: Sun, 29 Aug 2010 07:25:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

& fixed indenting :-)

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/tasks/task-demo-x11.bb | =A0 17 ++++++++---------
> =A01 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/recipes/tasks/task-demo-x11.bb b/recipes/tasks/task-demo-x11=
.bb
> index 39b68e7..e342658 100644
> --- a/recipes/tasks/task-demo-x11.bb
> +++ b/recipes/tasks/task-demo-x11.bb
> @@ -8,7 +8,7 @@ ECONFIG ?=3D "places e-wm-config-angstrom e-wm-config-ang=
strom-touchscreen e-wm-co
>
> =A0RDEPENDS_${PN} =3D "\
> =A0 =A0 task-base-extended \
> - =A0 =A0 =A0 task-gstreamer-ti \
> + =A0 =A0task-gstreamer-ti \
> =A0 =A0 angstrom-x11-base-depends \
> =A0 =A0 angstrom-gpe-task-base \
> =A0 =A0 angstrom-gpe-task-settings \
> @@ -20,16 +20,15 @@ RDEPENDS_${PN} =3D "\
> =A0 =A0 firefox midori \
> =A0 =A0 hicolor-icon-theme gnome-icon-theme \
> =A0 =A0 mplayer \
> - =A0 =A0 =A0 angstrom-gnome-icon-theme-enable \
> - =A0 =A0 =A0 picodlp-control \
> - =A0 =A0 =A0 connman-gnome \
> - =A0 =A0 =A0 gnome-bluetooth \
> - =A0 =A0 =A0 alsa-utils-aplay \
> - =A0 =A0 =A0 alsa-utils-alsamixer \
> + =A0 =A0angstrom-gnome-icon-theme-enable \
> + =A0 =A0picodlp-control \
> + =A0 =A0connman-gnome \
> + =A0 =A0gnome-bluetooth \
> + =A0 =A0alsa-utils-aplay \
> + =A0 =A0alsa-utils-alsamixer \
> =A0 =A0 libgles-omap3 \
> - =A0 =A0libgles-omap3-demos \
> + =A0 =A0libgles-omap3-x11demos \
> =A0 =A0 libgles-omap3-tests \
> - =A0 =A0bc-cat-omap3-module-tests \
> =A0"
>
> =A0# Install all kernel modules
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


