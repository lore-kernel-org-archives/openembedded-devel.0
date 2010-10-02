Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P28oU-0001dv-89
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 22:36:11 +0200
Received: by iwn2 with SMTP id 2so5255295iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Oct 2010 13:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=3Wo/MDHoMqdXU86KUO8m2gAM7UASSe2TpCHvFnO+oFg=;
	b=hxV86WrR3a92Ve+WG9fYpzZV0yQRKXMMeW/Rk3JXY4IfPQc6yBZu5bz+Rx2pBf/alu
	LIcWEToPS2yaysUAmsPnt9EEVsXxMLiyK6HxQk4I9pgWQLz+hB8Xy7RQTCbP1qrMqSdH
	srUR3SU5gGelYibXbdXwlty9nMIZHLlzcPtVc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Of/g7PGHhBijLYd57ezet0/Lq6Q9aImr6y2rtTZlhITR9aJjq/pqF/zuJKY41GhyVp
	6j1ZWf9ztVPzYQQGemRsLozclCMZotTypip5RuF0w1G3wXuF8Kr17AothDw2+TLAKnQH
	v7lvLCz6S/IA7pC+Yz4YGGwmzgnRsVtSlzB4Y=
Received: by 10.231.160.77 with SMTP id m13mr7750235ibx.22.1286051753079; Sat,
	02 Oct 2010 13:35:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Sat, 2 Oct 2010 13:35:32 -0700 (PDT)
In-Reply-To: <1285969779-7932-2-git-send-email-tom_rini@mentor.com>
References: <1285969779-7932-1-git-send-email-tom_rini@mentor.com>
	<1285969779-7932-2-git-send-email-tom_rini@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Oct 2010 13:35:32 -0700
Message-ID: <AANLkTikyq-oOwPD7C1d=fHizvEB4cfVAkj8ejuPcfrt5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] insane.bbclass: Skip '.pc' in qa_configure
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
X-List-Received-Date: Sat, 02 Oct 2010 20:36:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 1, 2010 at 2:49 PM, Tom Rini <tom_rini@mentor.com> wrote:
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0classes/insane.bbclass | =C2=A0 =C2=A02 ++
> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/classes/insane.bbclass b/classes/insane.bbclass
> index 5afa63c..9087efd 100644
> --- a/classes/insane.bbclass
> +++ b/classes/insane.bbclass
> @@ -466,6 +466,8 @@ python do_qa_configure() {
> =C2=A0 =C2=A0 configs =3D []
> =C2=A0 =C2=A0 bb.debug(1, "Checking sanity of the config.log file")
> =C2=A0 =C2=A0 for root, dirs, files in os.walk(bb.data.getVar('WORKDIR', =
d, True)):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if ".pc" in root:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 statement =3D "grep 'CROSS COMPILE Badness:' =
%s > /dev/null" % \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.=
path.join(root,"config.log")
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if "config.log" in files:
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


