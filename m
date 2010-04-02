Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NxlXz-00025t-2V
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 20:24:47 +0200
Received: by pwj5 with SMTP id 5so1739957pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Apr 2010 11:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=BjfHk4euRm+k+KPumesgZU5nuJznj26cXVCZtL1aAOs=;
	b=TtBiMuUkBo9lcd0iXBDrNaXd4e7PUtWpImN2W0q+uwBw5FS8+mqNctUdHJvaEPWf73
	mJnHfoo3qq+7Bpic507cczGxPwlYl7NRIzjWJqrp9HAfDi7xRJOhN7JmVb+ssJWy6Mmz
	gyFSuK01mLv5jwQpIK6Xf4CJ11e2PJEl/YJeQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FPtsPBw//0A0UniYTp5T1Kzkg564hmTUX7Ru8sZuRxGUgYnUVKW05uUzzHVoIgb/TD
	DyKVt/sR770n+dGINnNcMe+BA6TWk3N205oxSju23ddc3oPvwshnoR7DhsDh5tlwRuWG
	7kSzSoC5BCyyXFQADZGKiN8f6L/dHJ6gPgy5Y=
MIME-Version: 1.0
Received: by 10.231.16.77 with HTTP; Fri, 2 Apr 2010 11:21:28 -0700 (PDT)
In-Reply-To: <1270222917.3873.18.camel@mattotaupa>
References: <1270222917.3873.18.camel@mattotaupa>
Date: Fri, 2 Apr 2010 11:21:28 -0700
Received: by 10.142.210.16 with SMTP id i16mr524960wfg.166.1270232488498; Fri, 
	02 Apr 2010 11:21:28 -0700 (PDT)
Message-ID: <i2w19c1b8a91004021121m88e9626ci4259ac285f399bb3@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libplayer: Use `${PN}` instead of `libplayer`.
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
X-List-Received-Date: Fri, 02 Apr 2010 18:24:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 2, 2010 at 8:41 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> =A0recipes/libplayer/libplayer.inc | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/libplayer/libplayer.inc b/recipes/libplayer/libplaye=
r.inc
> index 823e4b5..ea74aee 100644
> --- a/recipes/libplayer/libplayer.inc
> +++ b/recipes/libplayer/libplayer.inc
> @@ -6,7 +6,7 @@ DEPENDS =3D "virtual/libx11 libxcb mplayer gstreamer"
>
> =A0INC_PR =3D "r1"
>
> -SRC_URI =3D "http://libplayer.geexbox.org/releases/${P}.tar.bz2;name=3D$=
{PN}"
> +SRC_URI =3D "http://${PN}.geexbox.org/releases/${P}.tar.bz2;name=3D${PN}=
"

is there any advantage of using PN here ?

>
> =A0inherit autotools pkgconfig
>
> --
> 1.7.0.3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


