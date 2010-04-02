Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NxlWN-0001zt-B7
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 20:23:08 +0200
Received: by pzk30 with SMTP id 30so1863433pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Apr 2010 11:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mZ1pFNgr8HorM+UA8DKUiM1WJbh2eM4NbMjLVkBozZM=;
	b=kSn85seBF7JV3/oOe9H1aA+UxcTsTHHmly6G6J6oXxkLx0SDgavFeTHy2TPqFUJPAI
	DKYB/qdlwrf+gyU2Xf68ujETQYwogNdt0rQxy4rjF2kENUBuTMLrDfa3j2fUbn9L7vB4
	4saC59kCwkBySSJDdZEAOatSCpIvfXfdj/pOo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CTvYq8k9wc6GXvfAcIOjS4zse3ewau4QoMYY4k+HnPuS+P276t3Mgjwe5EgKjMrDKb
	e1AV94wwInzD2khty0cTrYUGGTMrCmyJIbIzZlOFcM5owSwYUIILlbpRi9NzPfwP0Jy9
	49n2gy6O71NvGqODWctfgHGB/HUeNGMAIftTk=
MIME-Version: 1.0
Received: by 10.231.16.77 with HTTP; Fri, 2 Apr 2010 11:19:48 -0700 (PDT)
In-Reply-To: <1270222876.3873.17.camel@mattotaupa>
References: <1270222876.3873.17.camel@mattotaupa>
Date: Fri, 2 Apr 2010 11:19:48 -0700
Received: by 10.140.251.20 with SMTP id y20mr1770474rvh.206.1270232388478; 
	Fri, 02 Apr 2010 11:19:48 -0700 (PDT)
Message-ID: <l2y19c1b8a91004021119nf652910el438d98197a40c1db@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libplayer: Add `virtual/libx11` and `libxcb` to `DEPENDS`.
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
X-List-Received-Date: Fri, 02 Apr 2010 18:23:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 2, 2010 at 8:41 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Without those dependencies libplayer would not work with MPlayer and comp=
lain.
>
> =A0 =A0=BBlibplayer is not compiled with X11 support=AB [1]
>
> [1] http://hg.geexbox.org/libplayer/file/4fb30e64db79/src/wrapper_mplayer=
.c#l2669
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> =A0recipes/libplayer/libplayer.inc | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/libplayer/libplayer.inc b/recipes/libplayer/libplaye=
r.inc
> index a986a21..823e4b5 100644
> --- a/recipes/libplayer/libplayer.inc
> +++ b/recipes/libplayer/libplayer.inc
> @@ -2,9 +2,9 @@ DESCRIPTION =3D "libplayer is a multimedia A/V abstractio=
n layer API. Its goal is
> =A0HOMEPAGE =3D "http://libplayer.geexbox.org/"
> =A0SECTION =3D "libs/multimedia"
> =A0LICENSE =3D "LGPLv2.1+"
> -DEPENDS =3D "mplayer gstreamer"
> +DEPENDS =3D "virtual/libx11 libxcb mplayer gstreamer"

how about libxine

>
> -INC_PR =3D "r0"
> +INC_PR =3D "r1"
>
> =A0SRC_URI =3D "http://libplayer.geexbox.org/releases/${P}.tar.bz2;name=
=3D${PN}"
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


