Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpcKl-0005eY-Nx
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:29:45 +0200
Received: by mail-iw0-f175.google.com with SMTP id 2so3832023iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TUADIEGZt586U58zRoLgHzTEcELIxkerRK1yC87h0FY=;
	b=Q49zdVfRezEkn9FNSO8/M/xGbHRK6eRIIG+n7O0ztrwXdfBsJlapuwmzFqsONpvdOx
	sdZ4R5DwrN/cyIglzaNABgXctldlvtvexb+/yXwsfyVBrfMc/RtrmgP5A4eQwwklYOTk
	gS0lTwmECRUO774dS1uP0xvjYy5n7rYf/Ph8w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=X9+H6FukRcydC0Iu2WfTEUbleInmZbnk++mjJe3e0JrP9KQYysadO90mNoQQ6wiRGn
	gwfRJg0YNNzntEkeEJlyXyEPrKQ6B4YE/fMi45lE2B/DOtJ8UNyFjV+LdmoiWZ+4KXwI
	bMJeTvWgvKXaors09r6+NX8k+JABtuojj0VF4=
MIME-Version: 1.0
Received: by 10.231.30.76 with SMTP id t12mr606225ibc.161.1283066955227; Sun,
	29 Aug 2010 00:29:15 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:29:15 -0700 (PDT)
In-Reply-To: <1283027073-12308-5-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-5-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:29:15 +0200
Message-ID: <AANLkTimF2LwwGJYstEX-NrtDbTmA6ZSATFSAM1oxuzaH@mail.gmail.com>
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
Subject: Re: [PATCH 04/23] esc-node-demo_git.bb: Do not RDEPEND on a recipe yet which is under review
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
X-List-Received-Date: Sun, 29 Aug 2010 07:29:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/esc/esc-node-demo_git.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/esc/esc-node-demo_git.bb b/recipes/esc/esc-node-demo=
_git.bb
> index 814771b..f29b7ba 100644
> --- a/recipes/esc/esc-node-demo_git.bb
> +++ b/recipes/esc/esc-node-demo_git.bb
> @@ -23,7 +23,7 @@ do_install() {
> =A0 =A0 =A0 =A0 install -m 0755 ${S}/${i} ${D}${datadir}/esc-training
> =A0 =A0 done
> =A0}
> -
> -RDEPENDS_${PN} =3D "nodejs"
> +# disable for now until nodejs recipe is committed
> +#RDEPENDS_${PN} =3D "nodejs"
> =A0FILES_${PN} +=3D "${datadir}/esc-training"
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


