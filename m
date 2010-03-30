Received: from mail-iw0-f178.google.com ([209.85.223.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nwg5C-0000Pk-6r
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 20:22:35 +0200
Received: by iwn8 with SMTP id 8so327966iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 11:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=yvFI8HdTDxLluSuBNqoagOTpnaZQeORqwhGcf8xlFWw=;
	b=hDnecQXcC3Dx40zqnOSG3BE0n6dnGPQSVYyzs81EJ1hoxzTmZadmc3NCEB7gOd2mvc
	lNV+8MkfVaRnJ0/b9tPjOJ/4jQFQlkQgsvODjHpcnouIm32umaQUbJXmZKOSfMXbEWvW
	3RBmoXvnzWHcyxDlXdklc6H8zaxDZdpO66tsM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xkgqwBj5fWlBZ2kHFNn35OtsyszZbivFwwFrFiK1VpoiwT8+9u2j1PQXOWoYUflwQs
	Zhfgl4bskJ12dfLs9OZrxjNwLtnkE7bphSXvfKyp/qKKKlwgU+R0PaziVaEGmvu9UPq3
	UCXEk+P+zVTb/ViNbYX1BWrnhri/krNfYljiw=
MIME-Version: 1.0
Received: by 10.231.32.66 with HTTP; Tue, 30 Mar 2010 11:19:18 -0700 (PDT)
In-Reply-To: <1269971938-6900-1-git-send-email-khimov@altell.ru>
References: <1269971938-6900-1-git-send-email-khimov@altell.ru>
Date: Tue, 30 Mar 2010 11:19:18 -0700
Received: by 10.231.147.146 with SMTP id l18mr1156464ibv.74.1269973158498; 
	Tue, 30 Mar 2010 11:19:18 -0700 (PDT)
Message-ID: <19c1b8a91003301119l4f3acf17kf5b81be2bc4468e1@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] removal.txt: proposal to remove ClamAV versions < 0.95 in April
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
X-List-Received-Date: Tue, 30 Mar 2010 18:22:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2010 at 10:58 AM, Roman I Khimov <khimov@altell.ru> wrote:
> http://www.clamav.net/lang/en/2009/10/05/eol-clamav-094/
>
> Without database updates AV is almost completely useless, and
> starting on April 15 2010 ClamAV < 0.95 will get no db updates,
> so there is no reason to support that versions.
>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>
> ---
> =A0removal.txt | =A0 =A06 ++++++
> =A01 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/removal.txt b/removal.txt
> index 7c9dc25..f7bad84 100644
> --- a/removal.txt
> +++ b/removal.txt
> @@ -25,3 +25,9 @@ Maintainer: =A0 =A0 None
> =A0Reason: =A0 =A0 =A0 =A0 Obsoleted by task-base
> =A0Proposed by: =A0 =A0Koen Kooi
> =A0Note: =A0 =A0 =A0 =A0 =A0Moved to packages/obsolete/tasks on 2006-12-2=
2
> +
> +Package Name: =A0ClamAV, versions < 0.95
> +Removal Date: =A02009-04-15
> +Maintainer: =A0 =A0Jamie Lenehan
> +Reason: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0http://www.clamav.net/lang/en/200=
9/10/05/eol-clamav-094/
> +Proposed by: =A0 Roman I Khimov <khimov@altell.ru>
> --

Acked-by:  Khem Raj <raj.khem@gmail.com>

> 1.6.4.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


