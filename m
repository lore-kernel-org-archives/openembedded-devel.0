Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P0IVL-0008KC-Jg
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 20:32:48 +0200
Received: by iwn2 with SMTP id 2so3111176iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 11:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=9cLXo4N/OY9SO+h76l70hFmCKNmFsKChDgOYJveYpj4=;
	b=HW5JL1ZX3/xOZ2sdSQFYobR56v/O0lA/Qe9XIa5Em5BRoCyBJxo0zBP0p5fYoDRCEM
	ujriso+i1JPTv971wumFjuIRBHQDjFQvBTIZPLF3/tF2uDn9VyDL1s6vL+CG6ZZmnJOl
	tzTZH0Y4hLeQk3g9Mkstd9SX/nPKmcup5P7Hk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=so4IPMuZtQavrNxbRLq6B8lSrgaVcfzssurc4YaxJps3Q6KDJI1h5CuwhHQyQzRBcM
	FXe6pqR+0RCj5fxxFGnk6aogEXf5/abhdM0gyy5GyztU4/UOvbSwkjHQ6mvLbCMPB5aN
	QqWh/a4hL3bpyKkUb/TD3GMJ1kWXfTrF5fyyg=
Received: by 10.231.148.83 with SMTP id o19mr9579044ibv.112.1285612358299;
	Mon, 27 Sep 2010 11:32:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Mon, 27 Sep 2010 11:32:16 -0700 (PDT)
In-Reply-To: <1285611664-30291-1-git-send-email-denis@denix.org>
References: <1285611664-30291-1-git-send-email-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Sep 2010 11:32:16 -0700
Message-ID: <AANLkTimTFM4nExCU7L2Pn+KPA1hRf1N=ThTe+5AqmLcy@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: not use bb.fetch.urldata in do_unpack() for traversing SRC_URIs
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
X-List-Received-Date: Mon, 27 Sep 2010 18:32:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2010 at 11:21 AM, Denys Dmytriyenko <denis@denix.org> wrote=
:
> bb.fetch.urldata contains cached SRC_URIs, but in case SRC_URI is altered=
 by
> amend.inc or machine override, the original SRC_URI is not removed from t=
he
> cache, leading to calling do_unpack() multiple times on original and modi=
fied
> versions of the file. Don't rely on bb.fetch.urldata and traverse SRC_URI=
s
> directly.
>
> Some background and details:
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/36703
>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>

looks good

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0classes/base.bbclass | =C2=A0 =C2=A08 ++++++--
> =C2=A01 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index b19eb32..964fe1c 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -202,10 +202,14 @@ do_unpack[dirs] =3D "${WORKDIR}"
> =C2=A0python base_do_unpack() {
> =C2=A0 =C2=A0 from glob import glob
>
> - =C2=A0 =C2=A0srcurldata =3D bb.fetch.init(d.getVar("SRC_URI", True).spl=
it(), d, True)
> + =C2=A0 =C2=A0src_uri =3D d.getVar("SRC_URI", True)
> + =C2=A0 =C2=A0if not src_uri:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return
> + =C2=A0 =C2=A0srcurldata =3D bb.fetch.init(src_uri.split(), d, True)
> =C2=A0 =C2=A0 filespath =3D d.getVar("FILESPATH", True).split(":")
>
> - =C2=A0 =C2=A0for url, urldata in srcurldata.iteritems():
> + =C2=A0 =C2=A0for url in src_uri.split():
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0urldata =3D srcurldata[url]
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if urldata.type =3D=3D "file" and "*" in urld=
ata.path:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # The fetch code doesn't know h=
ow to handle globs, so
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # we need to handle the local b=
its ourselves
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


