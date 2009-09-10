Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MlctS-0003A2-N0
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Sep 2009 08:12:33 +0200
Received: from tamarin.localnet (123-192-182-244.dynamic.kbronet.com.tw
	[123.192.182.244])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id F04FE1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2009 06:17:42 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Sep 2009 08:11:54 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.1; i686; ; )
References: <1252350704-9530-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1252350704-9530-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Message-Id: <200909100811.54646.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] tar_1.22.bb: Add recipe for 1.22 release.
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
X-List-Received-Date: Thu, 10 Sep 2009 06:12:33 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 07 September 2009 21:11:43 Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Holger Hans Peter Freyther <zecke@selfish.org>


> ---
>  conf/checksums.ini      |    4 ++++
>  recipes/tar/tar_1.22.bb |    1 +
>  2 files changed, 5 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/tar/tar_1.22.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 053a2ad..e720a28 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -23734,6 +23734,10 @@
> sha256=44944ee0427c8e0d8dbaa0b8f900073a7456819610cc521c53630c3eb117cf5e
> md5=1a7e17f27abf583b3b0bc059a827e68b
>  sha256=be8bf33afb5adc2377e45d94693ffd46b75f267f9b808df0c7006e51211f9deb
>
> +[ftp://ftp.gnu.org/gnu/tar/tar-1.22.tar.bz2]
> +md5=07fa517027f426bb80f5f5ff91b63585
> +sha256=3cefb67f197a3f8f5235999fe749ced0889466a71ddcbc96fddca84e5d53aa4d
> +
>  [http://downloads.sourceforge.net/subapplet/tasklist-105.tar.gz]
>  md5=dc62a061d83cf72d1eca7e8ae2c8e1a6
>  sha256=4078c44beebfd298995983b9e2ea189167a1ab081d96a7c485a67b65a974e878
> diff --git a/recipes/tar/tar_1.22.bb b/recipes/tar/tar_1.22.bb
> new file mode 100644
> index 0000000..25163ac
> --- /dev/null
> +++ b/recipes/tar/tar_1.22.bb
> @@ -0,0 +1 @@
> +require tar.inc


