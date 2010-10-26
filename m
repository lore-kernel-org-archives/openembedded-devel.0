Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PAdBk-00044K-Ia
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 08:39:17 +0200
Received: by iwn42 with SMTP id 42so578499iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 23:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CmGsIRMPGsN0PrqrTu5mfT+5/a9eszYPCayP7XmWUBs=;
	b=gsmVhGUB/2bqFKDr1Hvx0oUTZne3HGkRSS/ayk3WG5Gm4OQSNkxfCI7Waa/Bz+xnL/
	S/cEO80grdBIryVqPCmATjG/eWzTHyRybDS7mpTtiDg2amTpTacwwRsnPv1itxO4c4Tq
	ypokCLyxjlaLDSyBqueRof2UQOkVnAXoQfzig=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DCCKWKtcGEqhHgTRXdTsu+XHKVYDU4y8MggqThBboaaukBcKVWiNuon1gTDs+sau5g
	HvW+VxSUwU17PVB9846p7EFaKKOJjivePxwM5FDVJ1FTebjYP88Xq2mps7g988CU7ZZL
	kYH/L5daLlqsJE5HojqHcMmkhwzBIlNZGz4p0=
MIME-Version: 1.0
Received: by 10.42.204.66 with SMTP id fl2mr1765642icb.280.1288075112303; Mon,
	25 Oct 2010 23:38:32 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 25 Oct 2010 23:38:32 -0700 (PDT)
In-Reply-To: <1288063685-10500-1-git-send-email-dbatzle@dcbcyber.com>
References: <1288063685-10500-1-git-send-email-dbatzle@dcbcyber.com>
Date: Tue, 26 Oct 2010 08:38:32 +0200
Message-ID: <AANLkTimnXA+8fC0s213A1KdS9k-CLjwOd_bkz_Ba9ajw@mail.gmail.com>
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
Subject: Re: [PATCH] New recipe for Bullet Physics library
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
X-List-Received-Date: Tue, 26 Oct 2010 06:39:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/26 dbatzle <dbatzle@dcbcyber.com>:
> Signed-off-by: dbatzle <dbatzle@dcbcyber.com>
> ---
> =A0recipes/bullet/bullet.bb | =A0 18 ++++++++++++++++++
> =A01 files changed, 18 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/bullet/bullet.bb
>
> diff --git a/recipes/bullet/bullet.bb b/recipes/bullet/bullet.bb
> new file mode 100644
> index 0000000..d28734f
> --- /dev/null
> +++ b/recipes/bullet/bullet.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "Bullet Physics Library"
> +LICENSE =3D "Zlib"
> +
> +PR =3D "r1"

A recipe should start at r0.
Can you also add HOMEPAGE (and maybe some more of the header fields)

> +SRCREV=3D"2218"
> +PV=3D"2.77+svnr${SRCPV}"
> +
> +#SRC_URI =3D "file:///home/David/gamestuff/bullet-2.75"

suggest to remove the line above

> +SRC_URI =3D "svn://bullet.googlecode.com/svn;module=3Dtrunk;proto=3Dhttp=
"
> +
> +#If you want to build the demos you will have to have xlib and glut inst=
alled.
> +#Then set BUILD_DEMOS, BUILD_EXTRAS, and USE_GLUT to ON
> +
> +EXTRA_OECMAKE=3D"-DBUILD_DEMOS:BOOL=3DOFF -DBUILD_EXTRAS:BOOL=3DOFF -DUS=
E_GLUT:BOOL=3DOFF -DBUILD_SHARED_LIBS:BOOL=3DON"
> +
> +inherit cmake
> +
> +S =3D "${WORKDIR}/trunk"
> --
> 1.6.0.6
>

Best regards, Frans


