Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1OKdxB-0005H6-Uw
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 22:57:22 +0200
Received: by wyb32 with SMTP id 32so1248441wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 13:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=amJDtvrGuFGcwWU811j3MOW0e2SCneJaHupVIl3eV/g=;
	b=DM9YOiNMq0ZAdIKbB5fKtUarVboB+N8qpI8u8OiusIC+csVOXBk0l5matQnRdAqt/7
	Q6eixQE4Bjp0jM3/177X9+Cr7DinfdaHlaJUdLgCcPBXD/oWjcD1jm2YEaDyb5B097OR
	T2mEPXz81h70jaeCmRiW7BK5ZhPpToQaTSKHw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dR0xKeUmerIODKAiyzHbrPzUgzhCUIwFPpy/ZwsE9hwojjQzsjMwLTFXg1mxLVWyyU
	RYYr+HGYe+70rnscXT7E5Kk1glWmTVDm44p+HsQ+IlR8YevEzMAzJ27lLzzI/GPXOkU0
	kcsn2cPQT3133y7xuIyglkYgc99dikjZ1wKLs=
MIME-Version: 1.0
Received: by 10.216.85.10 with SMTP id t10mr106835wee.12.1275684784696; Fri, 
	04 Jun 2010 13:53:04 -0700 (PDT)
Received: by 10.216.21.134 with HTTP; Fri, 4 Jun 2010 13:53:04 -0700 (PDT)
In-Reply-To: <1275682411-2638-1-git-send-email-denis@denix.org>
References: <1275682411-2638-1-git-send-email-denis@denix.org>
Date: Fri, 4 Jun 2010 22:53:04 +0200
Message-ID: <AANLkTimVWQ9YyaTCJLZOLFpCwL3H9eCNfnBMQpEAm8WQ@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] amend.bbclass: don't parse same amend.inc if FILESPATH references it multiple times
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
X-List-Received-Date: Fri, 04 Jun 2010 20:57:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jun 4, 2010 at 10:13 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
> =A0classes/amend.bbclass | =A0 =A08 +++++++-
> =A01 files changed, 7 insertions(+), 1 deletions(-)
>
> diff --git a/classes/amend.bbclass b/classes/amend.bbclass
> index cddd28c..fb67b4e 100644
> --- a/classes/amend.bbclass
> +++ b/classes/amend.bbclass
> @@ -21,7 +21,13 @@ python () {
> =A0 =A0 depends =3D d.getVar("__depends", 0) or []
> =A0 =A0 d.setVar("__depends", depends + [(file, 0) for file in amendfiles=
 if not os.path.exists(file)])
>
> + =A0 =A0# Make sure we don't parse the same amend.inc file more than onc=
e, if
> + =A0 =A0# there are duplicates in FILESPATH
> + =A0 =A0seen =3D set()
> +
> =A0 =A0 for file in amendfiles:
> =A0 =A0 =A0 =A0 if os.path.exists(file):
> - =A0 =A0 =A0 =A0 =A0 =A0bb.parse.handle(file, d, 1)
> + =A0 =A0 =A0 =A0 =A0 =A0if file not in seen:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bb.parse.handle(file, d, 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0seen.add(file)
> =A0}
> --
> 1.6.3.3
>
Acked-by: Leon Woestenberg <leon@sidebranch.com>


--=20
Leon


