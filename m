Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pluiu-0002bP-Th
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 03:51:37 +0100
Received: by yxd5 with SMTP id 5so1400881yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Feb 2011 18:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=qf29hh2MlZWIptCXGEJS6Fr3rUO73LIe2YGiVNB7TAA=;
	b=a3V181hnVTGO3F/mTBhwdifQAVLkOvUnWnZnFK1oosWLKDHomU/B5jqj+lVGB0qArb
	IuuDL5tpSIM5WlzReCwv8cMrB947zIsPRxxvJKIgOrde+xT0Qh8QB03daFE0pF0s0Y9Q
	KZlIqufKkmVeMcwJjOsX2XgjJmVsZhbDS0bpc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=rpufqQWyPcw73dh1YmPSCL9SkWsmnMH8wif5FeWuuVlxrMt2XWu5vzh3hgcBtBxLjB
	IX/m5BTtSeFzBeceyG15jQm9Nn9Dlkg2zXrao88Zw2zDdn/XdZB7P0tAJ/y1MF9333cN
	As8IpS0hpX/VN0gE5PK1RdhWLS2HIsEYnZVwE=
Received: by 10.91.160.30 with SMTP id m30mr17424202ago.61.1296960636815; Sat,
	05 Feb 2011 18:50:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Sat, 5 Feb 2011 18:50:16 -0800 (PST)
In-Reply-To: <1296926769-2006-1-git-send-email-filip.zyzniewski@gmail.com>
References: <1296926769-2006-1-git-send-email-filip.zyzniewski@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 Feb 2011 18:50:16 -0800
Message-ID: <AANLkTimkAp+rAiDiiZsyhWYCbjzEaPw7sGc-zo0A3uro@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gnu-config: removed absolute perl binary paths from gnu-configize.
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
X-List-Received-Date: Sun, 06 Feb 2011 02:51:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 5, 2011 at 9:26 AM, Filip Zyzniewski
<filip.zyzniewski@gmail.com> wrote:
> Related bugzilla entry: http://bugs.openembedded.org/show_bug.cgi?id=3D55=
10
> ---
> =C2=A0recipes/gnu-config/files/gnu-configize.in | =C2=A0 =C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/gnu-config/files/gnu-configize.in b/recipes/gnu-conf=
ig/files/gnu-configize.in
> index be8580c..adf9c0e 100755
> --- a/recipes/gnu-config/files/gnu-configize.in
> +++ b/recipes/gnu-config/files/gnu-configize.in
> @@ -1,7 +1,7 @@
> -#! /usr/bin/perl -w
> +#! /usr/bin/env perl
> =C2=A0# -*- perl -*-
>
> -eval 'case $# in 0) exec /usr/bin/perl -S "$0";; *) exec /usr/bin/perl -=
S "$0" "$@";; esac'
> +eval 'case $# in 0) exec perl -S "$0";; *) exec perl -S "$0" "$@";; esac=
'
> =C2=A0 =C2=A0 if 0;
>
> =C2=A0# gnu-configize - install the GNU config.guess / config.sub in a di=
rectory tree
> --
> 1.7.1
>

Looks ok however signoff it properly and resend. See
http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


