Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P72bL-0001Ar-Vr
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 10:58:52 +0200
Received: by iwn2 with SMTP id 2so1823824iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 01:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mAezUEVZOxtNVf04h55pHKRrDeEv1UEaClrbkHyup/U=;
	b=YSXp7YYMfZmW19L1LlmntscgxDoZgLlMJ/imoB/Ug18PiLkZQtlLlvHuY/3QBN/IjK
	VD1hgMW5xHBzZP6cSXM3+Hm1p5ckCkeMRTcod4l+LJnUKdfeC7mTta32Afck13Pfv4VU
	x/LZm2cf3+BF/AoOJca2KwpTnYPiCKWy21/oQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xexRI6EigPMxrm7kflAYWGYpmldP1rBHRg5mkJTYX/HF+XI2YQSoN1WuspKyS51Hsf
	QeIcM8ft/gRJXwCY+GJkztUaGqmx5PjCtNzVA738KTK/JH3Q9i4swY+8ZwIdDTVTpIsN
	x0tU6XeHCkr14VvQAzwOwJH+jXYbaUNMpslbo=
MIME-Version: 1.0
Received: by 10.42.191.132 with SMTP id dm4mr1165595icb.329.1287219499571;
	Sat, 16 Oct 2010 01:58:19 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 16 Oct 2010 01:58:19 -0700 (PDT)
In-Reply-To: <1287218988-3946-1-git-send-email-ynezz@true.cz>
References: <1287218988-3946-1-git-send-email-ynezz@true.cz>
Date: Sat, 16 Oct 2010 10:58:19 +0200
Message-ID: <AANLkTi=_3DKvm3bbHuvdvQYOS9M3WDKaBjg2aON=kYWS@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] oestats-client.bbclass: send USERDISTRO value
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
X-List-Received-Date: Sat, 16 Oct 2010 08:58:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/10/16 Petr =C5=A0tetiar <ynezz@true.cz>:
> With this patch it's now possible to see the correct Angstrom distro vers=
ion
> in the Tinderbox. Now the distribution value is always 'angstrom', with t=
his
> patch it would be more detailed version 'angstrom-2008.1' for example.
>
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
> ---
> =C2=A0classes/oestats-client.bbclass | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/classes/oestats-client.bbclass b/classes/oestats-client.bbcl=
ass
> index 4415461..a98c9d1 100644
> --- a/classes/oestats-client.bbclass
> +++ b/classes/oestats-client.bbclass
> @@ -77,7 +77,7 @@ def oestats_start(server, builder, d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0'metadata_branch': bb.data.getVar('METADATA_BRANCH', d, True),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0'metadata_revision': bb.data.getVar('METADATA_REVISION', d, True)=
,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0'machine': bb.data.getVar('MACHINE', d, True),
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 'distro': bb.data.getVar('DISTRO', d, True),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 'distro': bb.data.getVar('USERDISTRO', d, True),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0})
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if re.match("^\d+$=
", data): id=3Ddata
> =C2=A0 =C2=A0 =C2=A0 =C2=A0except:
> --
> 1.7.0.4
>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


