Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUDRT-0000R7-Al
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 08:40:17 +0200
Received: by iwn34 with SMTP id 34so1735402iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 23:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=olER7cPPL05cr6Bu/0Eo/VKDaly/Duoe08+hQmgRgPw=;
	b=NnBsylOzkf9sWvEPP/KiIQihcqGHHFtM5dcaMzkIlQ+rbw7nQnJ/XKkC7Iy1qyni5C
	AJ9lf9kV2wr8xDniLCLbiaztuad2snsA8Po8yzmjhFN9I0W110MUbM2HYP0f1QQOUVsM
	Gc5MmN/yxUaw3KJmYsvV1mgjeTKjsp074loP4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=XWMOcjE7wenRYGhAiJFbg+oBQ7aqyuNDDwEsJ5SE64iFfGCGoS/BILA9B0bSITCTOg
	GKuVKZ6hON5Z1OsXMyMWff9M9DTN2z8ghoanOl7gk0+HA7fNlsbyS697hoOWbKHz2PkT
	FHAKyq5V0zvvAmAXMpELFQQg4SRYexPoOH7RQ=
Received: by 10.231.82.145 with SMTP id b17mr9862367ibl.187.1277966118231; 
	Wed, 30 Jun 2010 23:35:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Wed, 30 Jun 2010 23:34:58 -0700 (PDT)
In-Reply-To: <1277743053-7488-1-git-send-email-stefan@datenfreihafen.org>
References: <1277743053-7488-1-git-send-email-stefan@datenfreihafen.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jun 2010 23:34:58 -0700
Message-ID: <AANLkTilQfm7FxaeKPPhs6h0RBU7rDq8LG9qM3x121U6p@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: Re: [PATCH][STABLE] libecj-bootstrap_3.4.bb: Fix SRC_URI for new location
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
X-List-Received-Date: Thu, 01 Jul 2010 06:40:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 28, 2010 at 9:37 AM, Stefan Schmidt
<stefan@datenfreihafen.org> wrote:
> From: Stefan Schmidt <stefan@buglabs.net>
>
>
> Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
> ---

Acked-by: Khem Raj <raj.khem@gmail.com>

>
> This reminds me that the checksum per file patch for stable from Vitus ne=
eds
> some acks make such changes easier.
>
> =A0conf/checksums.ini =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A04 ++++
> =A0recipes/ecj/libecj-bootstrap_3.4.bb | =A0 =A02 +-
> =A02 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index ed06efc..909ade7 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -5562,6 +5562,10 @@ sha256=3Ddfe24798ca067c75c84f01bf4ee3734fde3e32e4f=
270f7222025218d3baffbbb
> =A0md5=3D4c9fe7b0c4e760e13fa887b85f8db295
> =A0sha256=3Db5725fa7f8b1f7dc28776e60591e9ef0c171629fe567ef49ab9be28516ff2=
cd6
>
> +[http://archive.eclipse.org/eclipse/downloads/drops/R-3.4-200806172000/e=
cjsrc-3.4.zip]
> +md5=3Df7b84d912e61dfdd77b7173065845250
> +sha256=3Da6ce5f0682462e85e5e47229e5b16555f74c60188fa0bb17536beb1138c537b=
4
> +
> =A0[http://mirrors.ibiblio.org/pub/mirrors/eclipse/eclipse/downloads/drop=
s/R-3.4-200806172000/ecjsrc-3.4.zip]
> =A0md5=3Df7b84d912e61dfdd77b7173065845250
> =A0sha256=3Da6ce5f0682462e85e5e47229e5b16555f74c60188fa0bb17536beb1138c53=
7b4
> diff --git a/recipes/ecj/libecj-bootstrap_3.4.bb b/recipes/ecj/libecj-boo=
tstrap_3.4.bb
> index 381f424..57b0ab8 100644
> --- a/recipes/ecj/libecj-bootstrap_3.4.bb
> +++ b/recipes/ecj/libecj-bootstrap_3.4.bb
> @@ -3,6 +3,6 @@ require libecj-bootstrap.inc
> =A0PR =3D "r1"
>
> =A0SRC_URI =3D "\
> - =A0 =A0 =A0 http://mirrors.ibiblio.org/pub/mirrors/eclipse/eclipse/down=
loads/drops/R-3.4-200806172000/ecjsrc-3.4.zip \
> + =A0 =A0 =A0 http://archive.eclipse.org/eclipse/downloads/drops/R-3.4-20=
0806172000/ecjsrc-3.4.zip \
> =A0 "
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


