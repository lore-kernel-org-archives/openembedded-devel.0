Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P7tbY-0004ej-Ce
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 19:34:37 +0200
Received: by ywl5 with SMTP id 5so616631ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 10:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=fZfjPeWRpfjalcBQnSPAt7ClShNupQEfCYa1YRBxk0A=;
	b=APW51j/4juiorWoX0ktt25L4qB03XmplIcZ4PU01aX047C7sBcApX2zonRmCrA/Uta
	UOm3nQIQJDffJQeB0ZoeSOjCjOHHWc7zOPn9Ywjf67cmPtKEQXRLIMo97jZt1CamIRjJ
	pSRARJz41NF6HNoIqgXLnI1zVJHMEx+sAuWQs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=TELNMNCD5ys/8GPthYHPE7gGcHMGKM+Nd+ZuFOR3cI6Zv0yKY7t0lo70ykNRmERfiq
	quGmlIypCdAdHZ9ctez8g8NtiuuZkrECTxgZENotzqYpYEO0BId3OLYjGf+oiCRH+Pc7
	RAnyI0ZVeTa6a8zuhCahT8rrXaE3IeOmCAiPU=
Received: by 10.90.72.20 with SMTP id u20mr2068206aga.148.1287423237417; Mon,
	18 Oct 2010 10:33:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Mon, 18 Oct 2010 10:33:37 -0700 (PDT)
In-Reply-To: <1287420263-28528-1-git-send-email-msmith@cbnco.com>
References: <1287420263-28528-1-git-send-email-msmith@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Oct 2010 10:33:37 -0700
Message-ID: <AANLkTinU=v796xChiQWRvPEw-BfKwbsOuAVfiosDyazE@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Mon, 18 Oct 2010 17:34:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 18, 2010 at 9:44 AM, Michael Smith <msmith@cbnco.com> wrote:
> The previous system("cp %s/* ...") missed dotfiles/dirs at the
> top-level.
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> Cc: Graham Gower <graham.gower@gmail.com>
> Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =C2=A0classes/package.bbclass | =C2=A0 10 +++++-----
> =C2=A01 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/classes/package.bbclass b/classes/package.bbclass
> index e2a61bf..2769595 100644
> --- a/classes/package.bbclass
> +++ b/classes/package.bbclass
> @@ -356,15 +356,15 @@ python package_do_split_locales() {
> =C2=A0}
>
> =C2=A0python perform_packagecopy () {
> - =C2=A0 =C2=A0 =C2=A0 dest =3D bb.data.getVar('D', d, True)
> - =C2=A0 =C2=A0 =C2=A0 dvar =3D bb.data.getVar('PKGD', d, True)
> + =C2=A0 =C2=A0 =C2=A0 installdest =3D bb.data.getVar('D', d, True)
> + =C2=A0 =C2=A0 =C2=A0 pkgcopy =3D bb.data.getVar('PKGD', d, True)
>
> - =C2=A0 =C2=A0 =C2=A0 bb.mkdirhier(dvar)
> + =C2=A0 =C2=A0 =C2=A0 bb.mkdirhier(pkgcopy)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# Start by package population by taking a copy=
 of the installed
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# files to operate on
> - =C2=A0 =C2=A0 =C2=A0 os.system('rm -rf %s/*' % (dvar))
> - =C2=A0 =C2=A0 =C2=A0 os.system('cp -pPR %s/* %s/' % (dest, dvar))
> + =C2=A0 =C2=A0 =C2=A0 os.system('rm -rf %s/*' % (pkgcopy))
> + =C2=A0 =C2=A0 =C2=A0 os.system('cp -pPR %s/. %s/' % (installdest, pkgco=
py))
> =C2=A0}

will it also try to copy . and .. ?

>
> =C2=A0python populate_packages () {
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


