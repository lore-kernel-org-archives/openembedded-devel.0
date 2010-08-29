Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Opbot-0000XS-Ne
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 08:56:48 +0200
Received: by mail-iw0-f175.google.com with SMTP id 2so3819215iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 23:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9F67KvAUBC5GjpfvIVr13L3wl6J3+30lXBqXLQe5jYI=;
	b=MgZK1TwB/hOwkTJxibd1fzcQM7Ofue9qlO9ihp6YkEvueYAEr3pMkJQSbK9q5aNh60
	uLBClO1SqIVwAoSOY3lc01RftlSIGJS5tUfwb9asI7yPh7Bw7OhFECtSabBrKETTOV5e
	G7PuZzbXHuM4KD1cOszipgJMDfBOTJg2m0FO0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Fk2+UTPLMGncjovzb/rYqecHP/Cn0259JWAh6gNbIIacLqFRCQR1rOS5n6L111jUoA
	7guOmLwyX4uFdwjsfUdmXfD4qgqX9tJgDEUQb8NQXe/myWLrFGpj4Fa32la4dRXTUJTa
	kapnlxDU51N7qygIWVeN9KLH9kWinagG9rOk8=
MIME-Version: 1.0
Received: by 10.231.151.135 with SMTP id c7mr2725366ibw.184.1283064979175;
	Sat, 28 Aug 2010 23:56:19 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sat, 28 Aug 2010 23:56:19 -0700 (PDT)
In-Reply-To: <1283027073-12308-21-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-21-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 08:56:19 +0200
Message-ID: <AANLkTin==gt3uiZOvLQN7mC92PYvVz4Sj0iWufOdqTUv@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 20/23] openmoko-session_svn.bb: Replace openmoko-today with openmoko-today2
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
X-List-Received-Date: Sun, 29 Aug 2010 06:56:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.co

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/openmoko-base/openmoko-session_svn.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/openmoko-base/openmoko-session_svn.bb b/recipes/open=
moko-base/openmoko-session_svn.bb
> index 19f1ce4..05625a1 100644
> --- a/recipes/openmoko-base/openmoko-session_svn.bb
> +++ b/recipes/openmoko-base/openmoko-session_svn.bb
> @@ -1,6 +1,6 @@
> =A0DESCRIPTION =3D "Matchbox session files for Openmoko"
> =A0SECTION =3D "openmoko/base"
> -RDEPENDS_${PN} =3D "matchbox-panel-2 matchbox-wm openmoko-today gconf"
> +RDEPENDS_${PN} =3D "matchbox-panel-2 matchbox-wm openmoko-today2 gconf"
> =A0PV =3D "0.1+svnr${SRCPV}"
> =A0PR =3D "r1"
>
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


