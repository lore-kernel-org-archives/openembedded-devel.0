Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mfq43-0007xy-Ns
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 09:03:32 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 05B921B10C09
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 06:50:01 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2009 08:45:32 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A9375A5.2080306@4d-electronics.co.nz>
In-Reply-To: <4A9375A5.2080306@4d-electronics.co.nz>
MIME-Version: 1.0
Message-Id: <200908250845.33035.holger+oe@freyther.de>
Subject: Re: [PATCH] add lupdate, lrelease to qmake2 bbclass
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
X-List-Received-Date: Tue, 25 Aug 2009 07:03:33 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 25 August 2009 07:24:53 Matthew Dombroski wrote:
> add lrelease4, lupdate4 to the environment.


Acked-by: Holger Freyther <zecke@selfish.org>

> ---
>   classes/qmake2.bbclass |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/classes/qmake2.bbclass b/classes/qmake2.bbclass
> index 26e813a..3772189 100644
> --- a/classes/qmake2.bbclass
> +++ b/classes/qmake2.bbclass
> @@ -19,3 +19,5 @@ export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/qt4"
>   export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
>   export OE_QMAKE_LIBS_QT = "qt"
>   export OE_QMAKE_LIBS_X11 = "-lXext -lX11 -lm"
> +export OE_QMAKE_LRELEASE = "${STAGING_BINDIR_NATIVE}/lrelease4"
> +export OE_QMAKE_LUPDATE = "${STAGING_BINDIR_NATIVE}/lupdate4"
> --
> 1.6.3.3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


