Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PPxJO-0000Tg-0P
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 14:10:31 +0100
Received: by wyb40 with SMTP id 40so13493846wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 05:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MOZ6kK57venhmR5EKcP8fV9YNf1qBGMCAcjhG20Bxfk=;
	b=u2PbK/Mku4HEFitA3uJN9UyhwoS8I8JtZxAKQ6ZVlnVWI4My/6+C26uSD+ctNRXsvg
	3U7XlsR884TShydMcGW/p1KtgmtxNQ8KtISB4DRo0SaoHEucBA10xyHlypvF5+D4aPEg
	tKnsYDWAPWnQuaEIXzT/N3jITirSDewP8zbBQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Z/W7uIOcClRfnv73RcFTBDSbfjKeghEGOxyx/cJvMf1nTPXFNQpRvqG24xfQYXxn2n
	3dXP82mSXo8ICawG+zaMUmUnGZw4aaL4focKKQ7FuHsvJrWcAsO04AGcpgfpHnYviTZM
	Ey1miZ5RthK/OTr4vzuBZtTNVOAz9nyPr0j5A=
MIME-Version: 1.0
Received: by 10.227.11.69 with SMTP id s5mr7221354wbs.171.1291727341372; Tue,
	07 Dec 2010 05:09:01 -0800 (PST)
Received: by 10.227.154.13 with HTTP; Tue, 7 Dec 2010 05:09:01 -0800 (PST)
In-Reply-To: <1291681239-21167-1-git-send-email-raj.khem@gmail.com>
References: <1291681239-21167-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 7 Dec 2010 14:09:01 +0100
Message-ID: <AANLkTi=c_nA_1DixhgVA7XDS_yPSMCWjYZ=N6RzkAXuU@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc_svn.bb/eglibc_2.12.bb/eglibc_2.11.bb: Bump SRCREV
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
X-List-Received-Date: Tue, 07 Dec 2010 13:10:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 7, 2010 at 1:20 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/eglibc/eglibc_2.11.bb | =A0 =A02 +-
> =A0recipes/eglibc/eglibc_2.12.bb | =A0 =A02 +-
> =A0recipes/eglibc/eglibc_svn.bb =A0| =A0 =A02 +-
> =A03 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/eglibc/eglibc_2.12.bb b/recipes/eglibc/eglibc_2.12.b=
b
> index 0d871dc..8c019a1 100644
> --- a/recipes/eglibc/eglibc_2.12.bb
> +++ b/recipes/eglibc/eglibc_2.12.bb
> @@ -6,7 +6,7 @@ FILESPATHPKG =3D. "eglibc-svn:"
> =A0PV =3D "2.12"
> =A0PR =3D "${INC_PR}.7"
> =A0PR_append =3D "+svnr${SRCPV}"
> -SRCREV=3D"11982"
> +SRCREV=3D"12230"
> =A0EGLIBC_BRANCH=3D"eglibc-2_12"
> =A0SRC_URI =3D "svn://svn.eglibc.org/branches;module=3D${EGLIBC_BRANCH};p=
roto=3Dsvn \
> =A0 =A0 =A0 =A0 =A0 =A0file://eglibc-svn-arm-lowlevellock-include-tls.pat=
ch \

After this eglibc-make-382.patch does not apply, because it was
resolved upstream.
I've sent patch removing it from 2.12, but maybe it's also resolved in
2.11 branch and I don't have checkout of it to confirm.


Regards,


