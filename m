Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mb7jk-00040Q-VS
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 08:55:04 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 3F3CB1B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 06:41:56 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Aug 2009 08:38:08 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <049101ca0459$7a27f580$6e77e080$@Willis@Distant-earth.com>
In-Reply-To: <049101ca0459$7a27f580$6e77e080$@Willis@Distant-earth.com>
MIME-Version: 1.0
Message-Id: <200908120838.08613.holger+oe@freyther.de>
Subject: Re: [PATCH] Fix build issue with rdesktop_1.6.0.bb
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
X-List-Received-Date: Wed, 12 Aug 2009 06:55:05 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 14 July 2009 10:02:46 John Willis wrote:
> Remove duplicate audio-2008.patch patch line from recipe (fixes build issue
> introduced with 013c006d11a59269b9d3adc6cbb6fb8091144965).
>
> Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>

Signed-off-by: Holger Freyther <zecke@selfish.org>



> ---
>  recipes/rdesktop/rdesktop_1.6.0.bb |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/rdesktop/rdesktop_1.6.0.bb
> b/recipes/rdesktop/rdesktop_1.6.0.bb
> index 1959200..93d46bd 100755
> --- a/recipes/rdesktop/rdesktop_1.6.0.bb
> +++ b/recipes/rdesktop/rdesktop_1.6.0.bb
> @@ -5,8 +5,6 @@ PR = "${INC_PR}.2"
>  SRC_URI += " file://audio-2008.patch;patch=1"
>  SRC_URI_append_ossystems = " file://rdesktop-addin.patch;patch=1"
>
> -SRC_URI += " file://audio-2008.patch;patch=1"
> -
>  inherit autotools
>
>  EXTRA_OECONF = "--with-openssl=${STAGING_EXECPREFIXDIR} "


