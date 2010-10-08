Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P46VR-0005nH-G3
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 08:32:38 +0200
Received: by iwn5 with SMTP id 5so318473iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 23:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GUp+BDfHGhzKPiT5yzxqGSiNYep7++uR+EE8ahsuHkk=;
	b=PeFerZ2gKmGeRHODP0bFJtRHQy+TEbej/qZ1wITGCe+FO47f6CeFlNMXboAJmDrj4J
	KMHK4GBYTgKIhsfaqYbVu1IvzApwWce7iZ7aC7bRRVHgLDzXCss6FD3a9Ny1zOw1Zo+7
	9SFr4/kzh16pzxoYiew/IVSW/OAgsDP4BzczI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=e6ZXddyOS0Amet7gWIFfu+akQ1RDKzhyXmSuA6q7d3cQSYVp/e1olUWzgMz/fbZbw0
	Andx38X/a3oV6wV8NHfVTIARIn2Q6MrIdYM2VjH5Q6VvLu2mpw+WrN5PEg5dTsqxVK2U
	WxxLbYOPLqK2TJd7EZiQF8KenmA2TyAIj6Fk4=
MIME-Version: 1.0
Received: by 10.42.214.148 with SMTP id ha20mr174280icb.395.1286519537034;
	Thu, 07 Oct 2010 23:32:17 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 7 Oct 2010 23:32:16 -0700 (PDT)
In-Reply-To: <1286399340-15927-2-git-send-email-fransmeulenbroeks@gmail.com>
References: <1286399340-15927-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1286399340-15927-2-git-send-email-fransmeulenbroeks@gmail.com>
Date: Fri, 8 Oct 2010 08:32:16 +0200
Message-ID: <AANLkTimFfia8svvb8chNmiJ_TOo4ub7-fbaMTuvFL9rN@mail.gmail.com>
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
Subject: Re: [PATCH 1/4] RDEPENDS -> RDEPENDS_${PN}
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
X-List-Received-Date: Fri, 08 Oct 2010 06:32:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/6 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0classes/cpan-base.bbclass | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/classes/cpan-base.bbclass b/classes/cpan-base.bbclass
> index 379defa..a04f61c 100644
> --- a/classes/cpan-base.bbclass
> +++ b/classes/cpan-base.bbclass
> @@ -5,7 +5,7 @@
> =A0FILES_${PN} +=3D "${libdir}/perl5 ${datadir}/perl5"
>
> =A0DEPENDS =A0+=3D "${@["perl", "perl-native"][(bb.data.inherits_class('n=
ative', d))]}"
> -RDEPENDS =A0+=3D "${@["perl", ""][(bb.data.inherits_class('native', d))]=
}"
> +RDEPENDS_${PN} =A0+=3D "${@["perl", ""][(bb.data.inherits_class('native'=
, d))]}"
>
> =A0# Determine the staged version of perl from the perl configuration fil=
e
> =A0def get_perl_version(d):


Aargh. Accidently pushed this patch yesterday with another one.
Thought I'd removed it from my git, but apparently it wasn't.
Propose to keep it like that (and no revert). Let me know if a PR bump
of recipes inheriting this is needed.

Frans.


