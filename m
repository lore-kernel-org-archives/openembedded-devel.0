Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OshGF-00041R-63
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 21:22:02 +0200
Received: by iwn2 with SMTP id 2so4426205iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 12:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6aCcN9fOvk9KJvBQYZdbgpVGAPngMhqL4JbGM5PHNWU=;
	b=m7W6kmspa5O1nz4Km4ePJ7HG/l1hcW9PTFmQ9f1hsawCu1rWl2V6K+MEPAiY2CrJFO
	sLxyOu7tnEykz7Rac2oXuCgHjND6VthG1uu87CZXnlj9rh5HU4Pe+tnhWeOWAZInlsnL
	lZuzh7dmIaFQMv7qSTCF55ckVWljs8EZ9Osqw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nrSnRgQ9DMRX1Egs8iLC8tw9Yt74LSFEeDLRMFNbfJY6gEVdvTxDP6RahI42VvsWkY
	+uGYmdtSvThJJ31BQoV4vH1H6NijD4LdZE8xDSQkYdoasKICEIQ9LQ3kdUsb5G9lE/jw
	mymVhMBCNKylrRdXg1BzPnixWH2AfnaYL7nyM=
MIME-Version: 1.0
Received: by 10.231.85.206 with SMTP id p14mr1473777ibl.89.1283800848204; Mon,
	06 Sep 2010 12:20:48 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 6 Sep 2010 12:20:48 -0700 (PDT)
In-Reply-To: <1283799112-7092-1-git-send-email-eric@eukrea.com>
References: <1283799112-7092-1-git-send-email-eric@eukrea.com>
Date: Mon, 6 Sep 2010 21:20:48 +0200
Message-ID: <AANLkTi=deo+Lhpy1UCwkzi15dPuUE=6K7cx+qKaPE4t4@mail.gmail.com>
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
Subject: Re: [PATCH] bitbake: lib/bb/fetch/hg: fix fetching from a mercurial repository
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
X-List-Received-Date: Mon, 06 Sep 2010 19:22:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/6 Eric B=E9nard <eric@eukrea.com>:
> * without this fix, we get :
> updating working directory
> 74 files updated, 0 files merged, 0 files removed, 0 files unresolved
> abort: There is no Mercurial repository here (.hg not found)!
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> Tested-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0lib/bb/fetch/hg.py | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/lib/bb/fetch/hg.py b/lib/bb/fetch/hg.py
> index d075638..bb156ed 100644
> --- a/lib/bb/fetch/hg.py
> +++ b/lib/bb/fetch/hg.py
> @@ -138,6 +138,7 @@ class Hg(Fetch):
> =A0 =A0 =A0 =A0# Even when we clone (fetch), we still need to update as h=
g's clone
> =A0 =A0 =A0 =A0# won't checkout the specified revision if its on a branch
> =A0 =A0 =A0 =A0 updatecmd =3D self._buildhgcommand(ud, d, "update")
> + =A0 =A0 =A0 =A0os.chdir(ud.moddir)
> =A0 =A0 =A0 =A0 bb.msg.debug(1, bb.msg.domain.Fetcher, "Running %s" % upd=
atecmd)
> =A0 =A0 =A0 =A0 runfetchcmd(updatecmd, d)
>
> --
> 1.6.3.3

I understood from Eric that even with this patch one needs mercurial
installed on the host.
I did install it before, and have not tested without it, but with
mercurial installed and this patch hg recipes (like ushare) work.

Enjoy, Frans


