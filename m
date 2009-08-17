Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Md2C4-0005bw-BW
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 15:24:13 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 6AE271B10C07
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 13:10:55 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2009 15:06:38 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1250503985-9277-1-git-send-email-khimov@altell.ru>
In-Reply-To: <1250503985-9277-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <200908171506.38214.holger+oe@freyther.de>
Subject: Re: [PATCH] site/ix86-common: fix grave bug in ac_cv_sizeof_unsigned_char
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
X-List-Received-Date: Mon, 17 Aug 2009 13:24:22 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 17 August 2009 12:13:05 Roman I Khimov wrote:
> ac_cv_sizeof_unsigned_char definition accidentally redefines
> ac_cv_sizeof_unsigned_int to 1. Luckily, not many packages are using that
> but for example it completely breakes gnutls.

Acked-by: Holger Freyther <zecke@selfish.org>


>
> Fix that.
> ---
>  site/ix86-common |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/site/ix86-common b/site/ix86-common
> index a5c4b60..281ab91 100644
> --- a/site/ix86-common
> +++ b/site/ix86-common
> @@ -1,5 +1,5 @@
>  ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
> -ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_int=1}
> +ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}
>  ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=4}
>  ac_cv_sizeof_unsigned_char_p=${ac_cv_sizeof_unsigned_char_p=4}
>  ac_cv_sizeof_int=${ac_cv_sizeof_int=4}


