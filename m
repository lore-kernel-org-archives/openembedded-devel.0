Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIV8a-0003wW-Qx
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 00:40:33 +0100
Received: by gyf3 with SMTP id 3so836818gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 15:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=vbtlk+eNwiahwrYNjLR9YNnh04r144H9Pzp9ngcQAkg=;
	b=J6/d1BtEyuSIIuhKdoZlJw/U1DFMe/NqQcF9+OIv/vAlPUOthqV/nc0+orBLXKLEcI
	34/2Il5FhgOGEr3pkeyFdQ2L8HWB3uVRJLHCsoHsrMOtB73cheowI1jUYHFcE2xTKgyS
	rlAw3FiawN5Zz+HZXKScllgb1YaBvgCkCho3Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=CryihmPWFGpMnNc5B0X9d/K1o+sYPbQVhSKjzjSozbSc0+mu208drpdP+kXaVN/Xbo
	Kl6xEkN5B4kdXsX7P2aXjC4EwDyEery+U6wGlad7cRoCjjiU1xApMmT2B1FSaZam42Th
	NrvZ85fZNHIVS3QMtW7aEL2YZRj2Gy/CCrpCg=
Received: by 10.91.121.3 with SMTP id y3mr4362646agm.156.1289950765802; Tue,
	16 Nov 2010 15:39:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 15:39:05 -0800 (PST)
In-Reply-To: <1289419592-23604-1-git-send-email-msmith@cbnco.com>
References: <1289419592-23604-1-git-send-email-msmith@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 15:39:05 -0800
Message-ID: <AANLkTi=fO2ZE1CWusMz=ko7C5Bxq_6US4A5rcrerPFN8@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] xf86-input-mutouch: add latest git release
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
X-List-Received-Date: Tue, 16 Nov 2010 23:40:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 10, 2010 at 12:06 PM, Michael Smith <msmith@cbnco.com> wrote:
> Fixes build with XINPUT ABI 7.
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/xorg-driver/xf86-input-mutouch_git.bb | =C2=A0 10 +++++++++=
+
> =C2=A01 files changed, 10 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/xorg-driver/xf86-input-mutouch_git.bb
>
> diff --git a/recipes/xorg-driver/xf86-input-mutouch_git.bb b/recipes/xorg=
-driver/xf86-input-mutouch_git.bb
> new file mode 100644
> index 0000000..f72b03c
> --- /dev/null
> +++ b/recipes/xorg-driver/xf86-input-mutouch_git.bb
> @@ -0,0 +1,10 @@
> +require xorg-driver-input.inc
> +DESCRIPTION =3D "X.Org X server -- muTouch input driver"
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +SRCREV =3D "db04a5333b545a0442b995bae47d2c5527a7459e"
> +PV =3D "1.2.1+gitr${SRCREV}"
> +
> +SRC_URI =3D "git://anongit.freedesktop.org/xorg/driver/xf86-input-mutouc=
h;protocol=3Dgit"
> +
> +S =3D "${WORKDIR}/git"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


