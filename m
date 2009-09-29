Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MsXCX-00067U-VI
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Sep 2009 09:32:49 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id A74F61B10C04;
	Tue, 29 Sep 2009 07:39:15 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Sep 2009 09:31:35 +0200
User-Agent: KMail/1.12.1 (Linux/2.6.31; KDE/4.3.1; i686; ; )
References: <1254208873-16548-1-git-send-email-petri.lehtinen+openembedded-devel@inoi.fi>
In-Reply-To: <1254208873-16548-1-git-send-email-petri.lehtinen+openembedded-devel@inoi.fi>
MIME-Version: 1.0
Message-Id: <200909290931.35871.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] python-django: Update to work with Python 2.6
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
X-List-Received-Date: Tue, 29 Sep 2009 07:32:49 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 29 September 2009 09:21:13 Petri Lehtinen wrote:
> From: Petri Lehtinen <petri.lehtinen@inoi.fi>
> 
> 
> Signed-off-by: Petri Lehtinen <petri.lehtinen@inoi.fi>

Signed-of-by: Holger Hans Peter Freyther <zecke@selfish.org>

> ---
>  recipes/python/python-django_1.0.2.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/python/python-django_1.0.2.bb
>  b/recipes/python/python-django_1.0.2.bb index 0c572ee..572e190 100644
> --- a/recipes/python/python-django_1.0.2.bb
> +++ b/recipes/python/python-django_1.0.2.bb
> @@ -16,11 +16,12 @@ DISTUTILS_INSTALL_ARGS = "--root=${D}
>  --prefix=${prefix}"
> 
>  RDEPENDS_${PN} = "\
>    python-email \
> +  python-html \
>    python-netserver \
>    python-pickle \
>    python-pprint \
>    python-shell \
> -  python-sqlite \
> +  python-sqlite3 \
>    python-textutils \
>    python-threading \
>    python-unixadmin \
> 


