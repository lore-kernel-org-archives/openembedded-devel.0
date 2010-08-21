Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Omryy-0004cc-LU
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 19:35:53 +0200
Received: by iwn2 with SMTP id 2so1520543iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Aug 2010 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=frxOAZ0jjwvgbdUszs85+yWNT2Jnu7o3NOgXr7m8is4=;
	b=myKVmUmhtLafKfBTJaaxN3qVCWNGixTEw1p9nn2k4L/dvBKL9dKbfexl7ePnstkG5h
	kt6O/gbvVKIWG6vyTS/Bd+oGulAUMCK+0+KM9nuOxlTmWyC+Iz9k4Bz5dbiZim+6xb6y
	GDN3y+2aflx1QKvL0ZgiI0goYhUpr3Zhdd6hs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=XZ9OGbdpkdB294HojjGneX9iChG7whs/h2yN2K7/z9vARtWfNbK8NVVGM5hBSK/JtP
	EF80FuPKoYUimuebEEoxf6p1Wc5qGwVQ4Ldst6BupVdH8otrEuUxYzsRSntCHkJdIiCh
	RqEjy+4PwQgjLlqX5zo97l33ljHXEVPNe9+CI=
Received: by 10.231.39.69 with SMTP id f5mr3763230ibe.53.1282412131255; Sat,
	21 Aug 2010 10:35:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.199 with HTTP; Sat, 21 Aug 2010 10:35:11 -0700 (PDT)
In-Reply-To: <1282373005-16453-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1282373005-16453-1-git-send-email-fransmeulenbroeks@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Aug 2010 10:35:11 -0700
Message-ID: <AANLkTi=c+4PCUa0gfJo+bcCx222WQ9YjtFHKP7k1Eq6s@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] make: BBCLASSEXTEND = "native"; remove native recipe
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
X-List-Received-Date: Sat, 21 Aug 2010 17:35:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 20, 2010 at 11:43 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> This also gets rid of the legacy staging in the native recipe
>
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>
> Despite the change being minimal:
> As this recipe is crucial for our build process I would like to
> have a review on this.
>
> =A0recipes/make/make-native_3.81.bb | =A0 14 --------------
> =A0recipes/make/make_3.81.bb =A0 =A0 =A0 =A0| =A0 =A04 +++-
> =A02 files changed, 3 insertions(+), 15 deletions(-)
> =A0delete mode 100644 recipes/make/make-native_3.81.bb
>
> diff --git a/recipes/make/make-native_3.81.bb b/recipes/make/make-native_=
3.81.bb
> deleted file mode 100644
> index 509558c..0000000
> --- a/recipes/make/make-native_3.81.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -PR =3D "r0"
> -
> -S =3D "${WORKDIR}/make-${PV}"
> -
> -inherit native
> -
> -do_stage() {
> - =A0 =A0 =A0 =A0install -d ${STAGING_BINDIR}
> - =A0 =A0 =A0 =A0install -m 755 make ${STAGING_BINDIR}
> -}
> -
> -FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/make-${PV}=
"
> -
> -require make_${PV}.bb
> diff --git a/recipes/make/make_3.81.bb b/recipes/make/make_3.81.bb
> index b399255..f0bd382 100644
> --- a/recipes/make/make_3.81.bb
> +++ b/recipes/make/make_3.81.bb
> @@ -1,6 +1,8 @@
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0require make.inc
>
> +BBCLASSEXTEND =3D "native"
> +
> =A0SRC_URI[md5sum] =3D "354853e0b2da90c527e35aabb8d6f1e6"
> =A0SRC_URI[sha256sum] =3D "f3e69023771e23908f5d5592954d8271d3d6af09693cec=
fd29cee6fde8550dc8"
> --
> 1.6.4.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


