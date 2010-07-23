Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OcDfE-00064J-HE
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 10:31:32 +0200
Received: by bwz10 with SMTP id 10so1500839bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 01:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=5unAHu308n5yYfY2e2zkrUaGCznyj/lo/sXTlHgkjHA=;
	b=GIgh2usZyVkK0rczUPGLZ4QVvEpL258qEr10rgx+7lRxyz3mvNFy3cjMwF5JLgUSfG
	FudYFRB82Wa6ROmDyOk9LVkoHS9JzKvdoTyVj9yIhzEXVn1y3WNHZEHNotybmhZc6134
	p+GDo+Z3gA+gwB9DCbFBme0js80d40zqTx8Rc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=QofkWOO5J/HW4UgQMsgFev5mC2mxDClyCZk1b/1KvW9lHEAf+mTCYH9bNLuXDcrNTT
	LMqlXa96+ZS/aNPwdSYFxFQWpBsTpHlZksek7fwh1Jz7EuukYV2GrJYLRbk3ze0Y/N+O
	j4gU8euLAMnPV4IT+Eg1EFhw7qHhylfCpjRsE=
MIME-Version: 1.0
Received: by 10.204.178.211 with SMTP id bn19mr2481286bkb.15.1279873865525; 
	Fri, 23 Jul 2010 01:31:05 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Fri, 23 Jul 2010 01:31:05 -0700 (PDT)
In-Reply-To: <201007230134.59343.david.lanzendoerfer@o2s.ch>
References: <201007230134.59343.david.lanzendoerfer@o2s.ch>
Date: Fri, 23 Jul 2010 10:31:05 +0200
Message-ID: <AANLkTimTyS-wieT02dJVfBoP2+yGApyLD0UE0jd=CDvd@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Adding maxima recipe (tool for algebraic calculation)
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
X-List-Received-Date: Fri, 23 Jul 2010 08:31:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/7/23 David Lanzend=F6rfer <david.lanzendoerfer@o2s.ch>

> <JaMa> leviathan: and send PATCHv2 to ML if it builds for you correct .ip=
k
> I'll push it imediately
>
> leviathan@dizzy-6 /mnt/sdb/build_gta02 $ ls tmp/deploy/ipk/armv4t/maxima*
> tmp/deploy/ipk/armv4t/maxima_5.21.1-r0.5_armv4t.ipk
>  tmp/deploy/ipk/armv4t/maxima-dbg_5.21.1-r0.5_armv4t.ipk
>  tmp/deploy/ipk/armv4t/maxima-dev_5.21.1-r0.5_armv4t.ipk
>  tmp/deploy/ipk/armv4t/maxima-doc_5.21.1-r0.5_armv4t.ipk
>
> @JaMa:
> The content of the ipkgs is ok.
> ready to push?
>
> best regards
>        leviathan
> ---
>  recipes/maxima/maxima_5.21.1.bb |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/maxima/maxima_5.21.1.bb
>
> diff --git a/recipes/maxima/maxima_5.21.1.bb b/recipes/maxima/
> maxima_5.21.1.bb
> new file mode 100644
> index 0000000..ae89bea
> --- /dev/null
> +++ b/recipes/maxima/maxima_5.21.1.bb
> @@ -0,0 +1,9 @@
> +DESCRIPTION=3D"Free computer algebra environment based on Macsyma"
> +HOMEPAGE=3D"http://maxima.sourceforge.net/"
> +SRC_URI=3D"http://www.sfr-fresh.com/unix/misc/${P}.tar.gz<http://www.sfr=
-fresh.com/unix/misc/$%7BP%7D.tar.gz>
> "
> +LICENSE=3D"GPLv2"
> +
> +inherit autotools
> +
> +SRC_URI[md5sum] =3D "e08ed533f3059cec52788ef35198bdcc"
> +SRC_URI[sha256sum] =3D
> "1dae887e1787871437d699a6b1acc1c1f7428729487492a07c6a31e26bf53a1b"
> --
> 1.6.4.4
>
> Can't test right now, but the recipe looks fine to me.
Thanks for your contribution.

Frans

