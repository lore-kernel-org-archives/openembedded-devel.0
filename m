Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NWdO3-0000kr-PP
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 23:14:26 +0100
Received: by ywh8 with SMTP id 8so1922564ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 14:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MJmMIR76z/ygoOnUhMsauypU8t50yCvECjDqfdIxxVU=;
	b=tYI7X22gvw4GNTi9e2h30FJ0wkaesbDHd0BLXWzdC8cQKlntkeudkpn1hrzAU5IP3H
	Rh0fuqjR19e9wToIAKOH7NWgQxOsNgn5/QxCVgjsrdpZRhKYlbrrQx0Ot2lrKse86PdR
	gcZOVM5TVLIkqXNf6vx59lmtJLynA6gBnUD7k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=feYcRWgR8xsCh51/IvQZQHzQ22IMAvkCODm3AYHvwWjIv8q0EKdgwI1ONdzbyzyYt4
	+/wKHxFyiXLhKOVgwNnhAEgCgoEkqhbPneHTUydObeWrRohD7z6D5SK5DyGB3N0b/zjD
	mwOjeJRn/n6teq0tkskULYfusufJFXWH8kq7E=
MIME-Version: 1.0
Received: by 10.101.132.37 with SMTP id j37mr8382323ann.101.1263766319267; 
	Sun, 17 Jan 2010 14:11:59 -0800 (PST)
In-Reply-To: <1263765017-12302-1-git-send-email-eric@eukrea.com>
References: <1263763723.5353.16.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263765017-12302-1-git-send-email-eric@eukrea.com>
Date: Sun, 17 Jan 2010 23:11:59 +0100
Message-ID: <ac9c93b11001171411k3183ee3fkac5144f77679658e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] usermanual : update note about PR
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
X-List-Received-Date: Sun, 17 Jan 2010 22:14:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/17 Eric Benard <eric@eukrea.com>:
> quoting Koen Kooi : Please don't set variables to the current default
> value, but leave them out. We had tons of problems with vars getting
> copy/paste where the default changed and we had to manually fix those
> (e.g. efl.bbclass still pokes needlessly at PACKAGES).
>
> Signed-off-by: Eric Benard <eric@eukrea.com>
> ---
> =A0docs/usermanual/chapters/recipes.xml | =A0 =A06 +++---
> =A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/docs/usermanual/chapters/recipes.xml b/docs/usermanual/chapt=
ers/recipes.xml
> index cad1d80..30364c0 100644
> --- a/docs/usermanual/chapters/recipes.xml
> +++ b/docs/usermanual/chapters/recipes.xml
> @@ -323,9 +323,9 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
> =A0 =A0 then the default value of "r0" is used.</para>
>
> =A0 =A0 <para><note>
> - =A0 =A0 =A0 =A0<para>It is good practice to always define PR in your re=
cipes, even
> - =A0 =A0 =A0 =A0for the <emphasis>"r0"</emphasis> release, so that when =
editing the
> - =A0 =A0 =A0 =A0recipe it is clear that the PR number needs to be update=
d.</para>
> + =A0 =A0 =A0 =A0<para>As PR is set to "r0" as a default, it must not be =
defined at the
> + =A0 =A0 =A0 =A0creation of the recipe. When editing the recipe for the =
first time, the
> + =A0 =A0 =A0 =A0PR variable must be defined to "r1".</para>
>
> =A0 =A0 =A0 =A0 <para>You should always increment PR when modifying a rec=
ipe.
> =A0 =A0 =A0 =A0 Sometimes this can be avoided if the change will have no =
effect on the
> --
> 1.6.3.3

Personally (having forgotten to bump PR once or twice), I'm in favour
of keeping the recommendation of setting PR =3D "r0" as good practice in
a recipe.
Apart from the good practice, it also might help a little bit to give
PR a standard location.

Frans.


