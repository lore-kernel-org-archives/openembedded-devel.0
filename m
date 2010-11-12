Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PH2Jt-0002dZ-Jk
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 23:42:28 +0100
Received: by gwaa11 with SMTP id a11so2245064gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 14:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=BeE9g7Kt6MNBWjB0oanEUKncPVgupLLE1Dke430T3Ss=;
	b=Xw2+sRI/uyn8xkpboVVEe+cQMFuzVoz3/xL0JiuzamAn7jqFtJCDpFX9z65ZKKu2SP
	BNoi0c9FRL55wtRT2S8kdId2/WTj3eGcT6tKSGhjvwoDxAKH4pZ0/ToVGFsYJ6Er30qH
	7Fa2ng573tWEBGpM74PmZ/mq/M5DQQEEcp+hw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=XYk0wKYtymWHiN3Ke9ZKlVZ+kOKBiT6FA/weyuH+6QGqbs/xA7mEwr2rNuT3NYbsTD
	552r+TP2oUyULDZ984Hubl52bVBYXmt414SLVlNqJUOieJbZjWFxr2q8NO4Nx9D4wr2F
	YvzxX4E0k2mSr94/zf+paR0/qKnwKiMOVrxFw=
Received: by 10.91.51.19 with SMTP id d19mr3904268agk.183.1289601644799; Fri,
	12 Nov 2010 14:40:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Fri, 12 Nov 2010 14:40:24 -0800 (PST)
In-Reply-To: <1289595809-8087-1-git-send-email-harvey.tim@gmail.com>
References: <1289595809-8087-1-git-send-email-harvey.tim@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Nov 2010 14:40:24 -0800
Message-ID: <AANLkTinZ866h0Wbh05Uz2Z=zaspYsi0hkQGrntn0VTW6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] iftop: new recipe
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
X-List-Received-Date: Fri, 12 Nov 2010 22:42:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 12, 2010 at 1:03 PM, Tim Harvey <harvey.tim@gmail.com> wrote:
> Signed-off-by: Tim Harvey <harvey.tim@gmail.com>
> ---
> =C2=A0recipes/iftop/iftop_0.17.bb | =C2=A0 11 +++++++++++
> =C2=A01 files changed, 11 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/iftop/iftop_0.17.bb
>
> diff --git a/recipes/iftop/iftop_0.17.bb b/recipes/iftop/iftop_0.17.bb
> new file mode 100644
> index 0000000..2cfa441
> --- /dev/null
> +++ b/recipes/iftop/iftop_0.17.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION =3D "Network usage monitor"
> +HOMEPAGE =3D "http://www.ex-parrot.com/pdw/iftop/"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPLV2"

this should be GPLv2 if its only GPL 2.0 but if it say GPL v 2.0 or
any later version then better make it GPLv2+


> +DEPENDS =3D "libpcap ncurses"
> +
> +SRC_URI =3D "http://www.ex-parrot.com/pdw/iftop/download/iftop-${PV}.tar=
.gz"
> +SRC_URI[md5sum] =3D "062bc8fb3856580319857326e0b8752d"
> +SRC_URI[sha256sum] =3D "d032547c708307159ff5fd0df23ebd3cfa7799c31536fa0a=
ea1820318a8e0eac"
> +
> +inherit autotools
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


