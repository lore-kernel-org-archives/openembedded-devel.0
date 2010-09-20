Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oxmv2-00014n-4B
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 22:24:56 +0200
Received: by fxm17 with SMTP id 17so1087407fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 13:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=AiasIOIwnweMaVZEsCMxjUhiov8cxPei3DN468mjmHw=;
	b=oQvRYIrIhU60g4BfzRCahg3qfaQ/OHGNySCQ3jIwMOeIt1iReW0yiEhJuBprL5BNM5
	MNfs7fnhEkOV9NFUR3nWfns491SgeJxpZ9e1tu+vGayd9Y7FcyMdSZxkC3SSBSyWhZYG
	dGvcqSMRbrHC1VVqIShSJogwhosJ7ThfM7iIw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=o8IhoNzpVxL4OOwoC/lcd89KeK8Ki5yN7NHVfhNQBon4In8BHJwDNHOWuz6a2eKQRv
	nIjYX2BIVntoKQEdTy4FijKyNyID89PYAcIqTjSj57FL75obx5cRKs87n6WyyuqNcb0T
	IoXM/6Pb/ghJihBMtNIvYJVCXHpkAaBeiNoe8=
Received: by 10.103.214.16 with SMTP id r16mr502351muq.129.1285014293089; Mon,
	20 Sep 2010 13:24:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.107.20 with HTTP; Mon, 20 Sep 2010 13:24:33 -0700 (PDT)
In-Reply-To: <4C97AC2B.1040205@cbnco.com>
References: <4C97AC2B.1040205@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Sep 2010 13:24:33 -0700
Message-ID: <AANLkTikd-8b1oMbyVus7372HT7u9KON0rx_nZM9fn-8A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] base.bbclass: add make-native to default dependencies
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
X-List-Received-Date: Mon, 20 Sep 2010 20:24:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2010 at 11:47 AM, Michael Smith <msmith@cbnco.com> wrote:
> In case the build system is running some ancient make, we can just as eas=
ily
> build our own make (3.82) to get predictable behaviour. Does something li=
ke
> this make sense?

although it does but make 3.82 is not usable out of box yet.
so people might find surprises. 3.81 would be ok.

>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index b19eb32..5c6d41d 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -71,7 +71,7 @@ def base_deps(d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if not bb.data.getVar('INHIBIT_DEFAULT_DEPS', =
d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bb.data.getVar=
('HOST_SYS', d, 1) !=3D
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.d=
ata.getVar('BUILD_SYS', d, 1)):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 deps +=3D " virtual/${TARGET_PREFIX}gcc virtual/libc "
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 deps +=3D " make-native virtual/${TARGET_PREFIX}gcc
> virtual/libc "
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif bb.data.inher=
its_class('native', d) and \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.getVar('PN', d, True) not in =
\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0("linux-libc-headers-native", "quilt-=
native",
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


