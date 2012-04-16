Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SJjeb-0002V9-Iq
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Apr 2012 12:59:29 +0200
Received: by wibhj13 with SMTP id hj13so4497944wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2012 03:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=GKOcTa7DzX8eqRcNvBcXtFYFl8DoG60QTYSBqOB6VMU=;
	b=Yhw/9v2fUjkDTyh03zDeAAyT7Fwy729uyxoMmef/cUPSbCqqF9aZxmsyDd1IpRvtda
	NIws1TWUQsYWrocRhvpdoNXODg5wxVlT1NKdrfOq6PHHEtorTkHXeeTfiIuOO/RC3/v/
	tFIioKq372C3QuzHf89gkGcs3HfEfggKtfiEqHXOplqLkdb8OVczs5qxCl64Wq/5G3Pq
	KzRrZiFGYxSFkLunPML77/66uA9zSlWkcZIXXHyd3/h11dECq+fTEMhsyCrBpouZZHyW
	QfVtOs4uGcgNdW9eA5gw+vJXuohS2RIfqk/jjWDzLwih9t5dKS5tYFvqNZTeixIsnpaQ
	RR+Q==
MIME-Version: 1.0
Received: by 10.180.95.129 with SMTP id dk1mr20152256wib.3.1334573404841; Mon,
	16 Apr 2012 03:50:04 -0700 (PDT)
Received: by 10.223.14.149 with HTTP; Mon, 16 Apr 2012 03:50:04 -0700 (PDT)
In-Reply-To: <1334542833-27552-2-git-send-email-kai.kang@windriver.com>
References: <1334542833-27552-1-git-send-email-kai.kang@windriver.com>
	<1334542833-27552-2-git-send-email-kai.kang@windriver.com>
Date: Mon, 16 Apr 2012 12:50:04 +0200
Message-ID: <CAGiJk9crD24MvT0sKm2SgVpA4FZumr_ob0LDfhx11X=ac0eYPg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/3] qt4-native: enable features to build kdelib4-native
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
X-List-Received-Date: Mon, 16 Apr 2012 10:59:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/4/16 Kang Kai <kai.kang@windriver.com>:
> add a bbappend file to enable qt4-native 4.7.4 to enable openssl and
> phonon support. Add flags '-no-pch -no-sm' to make qt4-native itself
> compiled successfully.
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
> =C2=A0recipes-misc-support/qt4-native_4.7.4.bbappend | =C2=A0 =C2=A04 +++=
+
> =C2=A01 files changed, 4 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes-misc-support/qt4-native_4.7.4.bbappend
>
> diff --git a/recipes-misc-support/qt4-native_4.7.4.bbappend b/recipes-mis=
c-support/qt4-native_4.7.4.bbappend
> new file mode 100644
> index 0000000..a11a23f
> --- /dev/null
> +++ b/recipes-misc-support/qt4-native_4.7.4.bbappend
> @@ -0,0 +1,4 @@
> +# Needed by kdelibs4-native
> +EXTRA_OECONF +=3D "-no-pch -no-sm -openssl"
> +
> +TOBUILD +=3D "src/phonon"
> --
> 1.7.5.4
>

Hi,
this patch works although it is recommended to use Qt 4.8.0 for KDE 4.8.0.
I renamed the patch to let it append to qt4-native_4.8.0.bb.


--=20
Regards
Samuel


