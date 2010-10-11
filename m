Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5PMu-0003IB-52
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 22:53:13 +0200
Received: by gwb17 with SMTP id 17so957513gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 13:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=cBcNBiNK8Nw1zP+czW1y6neElDSn1hrk4csFo35WQSk=;
	b=rk+ueGTVFOkLdHQ6NtNTUMuwGNIRsoZuIbB5VTrqPTQk4hz6V6b6QehtUrFhjGaciO
	HM0oyRkEYOI/cXK6Iptvff821Wv+FAzKwqHPSism2425TE9BJ/aaWhr7hU3kcv25VUId
	CmUemCpKN6x8kg+zWrkhEMnR6Q03JL5/WrtZI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MhwIDfQZwLq/AYB+HZdKcbHSPglVMuRAYGk0ZZRwEeA6jn1zA6DUkFo5P0GMPNuH6l
	1IUJ0UQksmBU/O9jFnW/RklBGL1If2GG78+iP4ZyjnpC20kaOd0YOISCrK0P7Pk0vMIf
	nVuv0SzDKNYud+ZWq5zM8PPHKlyXQhw5crRIg=
MIME-Version: 1.0
Received: by 10.42.169.70 with SMTP id a6mr1594644icz.231.1286830364862; Mon,
	11 Oct 2010 13:52:44 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 11 Oct 2010 13:52:44 -0700 (PDT)
In-Reply-To: <1286827318-30576-1-git-send-email-schnitzeltony@gmx.de>
References: <1286827318-30576-1-git-send-email-schnitzeltony@gmx.de>
Date: Mon, 11 Oct 2010 22:52:44 +0200
Message-ID: <AANLkTikxb7jqcQMg3c+Qwff5RTCPCOvsMWOO3zPQcvyR@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gedit: add dependencies enchant & gnome-doc-utils-native
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
X-List-Received-Date: Mon, 11 Oct 2010 20:53:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/11 Andreas Mueller <schnitzeltony@gmx.de>:
> * 'bitbake gedit' on clean system failed during
> * configure: missing enchant
> * compile: gedit.xml unknown "element article"
>
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
> =A0recipes/gnome/gedit_2.30.0.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/gnome/gedit_2.30.0.bb b/recipes/gnome/gedit_2.30.0.b=
b
> index 83dffcf..4ab204c 100644
> --- a/recipes/gnome/gedit_2.30.0.bb
> +++ b/recipes/gnome/gedit_2.30.0.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "GNOME editor"
> =A0SECTION =3D "x11/gnome"
> =A0LICENSE =3D "GPL"
>
> -DEPENDS =3D "iso-codes gnome-common glib-2.0 gtk+ gconf gtksourceview2"
> +DEPENDS =3D "iso-codes gnome-common glib-2.0 gtk+ gconf gtksourceview2 e=
nchant gnome-doc-utils-native"
> =A0RDEPENDS_${PN} +=3D " gtksourceview2"
> =A0PR =3D "r2"
>
>
I can understand from your commit message why you add enchant to
DEPENDS, however it is not really clear why gnome-doc-utils-native is
added. Is this because of the gedit.xml unknown?
Can you clarify this in the commit message?

Thanks alot! Frans


