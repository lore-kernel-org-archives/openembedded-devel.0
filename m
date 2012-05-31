Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1Sa5vY-00045J-9w
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 16:00:38 +0200
Received: by lbol5 with SMTP id l5so869431lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 06:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=nBrm/wmf+BIEoGn9NMu5moOlXTyz2kTbEgbm1DmA19k=;
	b=oPcozNinAAALpdP7PfygXbEne0Pe9rWaXq8FH1ELchvXhqEjdwxCIsxLgAHNIgZjEh
	hWetdWMQ3FjxaeRMaFhQLeOAArV7CMSXdy0FiZ9LEuiTQdxLD0sM6O/lVzHOE6FCy6bN
	O+qsh6Otgbr4947aWW2gxy38fGDpSQNERoEmbl+LfdVnbZMUAjT6JVEPtJd08GktgedA
	dnvFeb4F1CFlhpIgoTa70TRnvWXerONboaq2koCcy0zxrFN2/SjhH4S/pWsPTVFqtI6s
	XVEt9KEy5Bs55ofx3E5aqDrdMJw4AuyiboOE3PdqmFzI4ySSGbFHcuuRt91GZp36eKvm
	UQxw==
MIME-Version: 1.0
Received: by 10.152.103.109 with SMTP id fv13mr2445939lab.33.1338472215082;
	Thu, 31 May 2012 06:50:15 -0700 (PDT)
Received: by 10.112.38.202 with HTTP; Thu, 31 May 2012 06:50:15 -0700 (PDT)
In-Reply-To: <1338010968-11334-1-git-send-email-raj.khem@gmail.com>
References: <1338010968-11334-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 31 May 2012 06:50:15 -0700
Message-ID: <CA+M6bXncod0LwDyADvmv_cffDOLna5jCkUkUoe_+9JZkwFkEgQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance][PATCH] classes/mirrors.bbclass: update debian snapshot mirror url
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
X-List-Received-Date: Thu, 31 May 2012 14:00:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 25, 2012 at 10:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0classes/mirrors.bbclass | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/classes/mirrors.bbclass b/classes/mirrors.bbclass
> index 71ee5f6..bb4f1ec 100644
> --- a/classes/mirrors.bbclass
> +++ b/classes/mirrors.bbclass
> @@ -1,6 +1,6 @@
> =A0MIRRORS[func] =3D "0"
> =A0MIRRORS () {
> -${DEBIAN_MIRROR}/main =A0http://snapshot.debian.net/archive/pool
> +${DEBIAN_MIRROR}/main =A0 http://snapshot.debian.org/archive/debian-arch=
ive/20120328T092752Z/debian/pool
> =A0${DEBIAN_MIRROR} =A0 =A0 =A0 ftp://ftp.de.debian.org/debian/pool
> =A0${DEBIAN_MIRROR} =A0 =A0 =A0 ftp://ftp.au.debian.org/debian/pool
> =A0${DEBIAN_MIRROR} =A0 =A0 =A0 ftp://ftp.cl.debian.org/debian/pool

Sorry I missed this for a while.  This I believe is backwards.  We
don't want to tie the default mirror to today we want to tie it back
to the 20110331 or so snapshot we use in a few other cases.

--=20
Tom


