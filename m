Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OkXFd-0005bE-0r
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Aug 2010 09:03:37 +0200
Received: by iwn38 with SMTP id 38so466761iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Aug 2010 00:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Dhb51ibao39DU9HDqyWp49RXrNLEKbAFdc1mn3meU7k=;
	b=Hwjbr0S4JnQqIqjWYt0FzchM8DIQ6ZwVDZ4HOCw1zlwesf2vFy0Ql5Hk9S66z+vPh5
	D4drF6NtNeZenMYRAbRwEjQ6QBJYevLd4vdXZ41CxoiM7PmkWHSj9LvRD8irWkfsjghq
	3xPmDn8Y2XhsB7U5YdLgSNGVnXdrL+NCJUKEs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=IPKKKW2mfDlQoYEnqRP/xDJdUVyksJr/Ytuyi1xgbiN48/lu59V6W1ZYa0XLyoXoZI
	APcMnXBMn56YCrgt9vP1/yY5C87AZhDmU9OZPew+Bzdna3lwo84Ve7KO7AscMJI8CNRi
	Ww1DCH//UzmqlEKYNzOypYPbdVpZitIKmduAw=
MIME-Version: 1.0
Received: by 10.231.39.69 with SMTP id f5mr4023970ibe.53.1281855790540; Sun,
	15 Aug 2010 00:03:10 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Sun, 15 Aug 2010 00:03:10 -0700 (PDT)
In-Reply-To: <1281845383-10378-1-git-send-email-jkridner@beagleboard.org>
References: <1281845383-10378-1-git-send-email-jkridner@beagleboard.org>
Date: Sun, 15 Aug 2010 09:03:10 +0200
Message-ID: <AANLkTikGjm0k=A3D7ySu5UjUC4BjDP6_90xq--25uBfs@mail.gmail.com>
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
Subject: Re: [PATCH] mplayer: bump PR for packages depending on jpeg which changed .so name with 6b -> 8b upgrade
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
X-List-Received-Date: Sun, 15 Aug 2010 07:03:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/15 Jason Kridner <jkridner@beagleboard.org>:
> Commit fca4a21b18063f16d5dff4adc914a2f131af3696 missed mplayer_svn.bb.
>
> Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
> ---
> =A0recipes/mplayer/mplayer_svn.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/mplayer/mplayer_svn.bb b/recipes/mplayer/mplayer_svn=
.bb
> index 4623357..13ffb89 100644
> --- a/recipes/mplayer/mplayer_svn.bb
> +++ b/recipes/mplayer/mplayer_svn.bb
> @@ -43,7 +43,7 @@ RCONFLICTS_${PN} =3D "mplayer-atty"
> =A0RREPLACES_${PN} =3D "mplayer-atty"
>
> =A0PV =3D "0.0+1.0rc3+svnr${SRCPV}"
> -PR =3D "r23"
> +PR =3D "r24"
> =A0DEFAULT_PREFERENCE =3D "-1"
> =A0DEFAULT_PREFERENCE_angstrom =3D "1"
> =A0DEFAULT_PREFERENCE_shr =3D "1"
> --

Applied, thank you

Frans


