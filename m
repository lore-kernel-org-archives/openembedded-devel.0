Received: from p3plsmtpa01-04.prod.phx3.secureserver.net ([72.167.82.84])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PgSNz-0000Ub-KZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 02:35:28 +0100
Received: (qmail 13236 invoked from network); 22 Jan 2011 01:28:04 -0000
Received: from unknown (209.242.7.132)
	by p3plsmtpa01-04.prod.phx3.secureserver.net (72.167.82.84) with ESMTP;
	22 Jan 2011 01:28:04 -0000
Message-ID: <4D3A329A.7080905@mwester.net>
Date: Fri, 21 Jan 2011 19:27:54 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295598456-12847-1-git-send-email-raj.khem@gmail.com>
	<1295598456-12847-2-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1295598456-12847-2-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH 2/2] util-linux-ng.inc: Remove udev from DEPENDS
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
X-List-Received-Date: Sat, 22 Jan 2011 01:35:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 1/21/2011 2:27 AM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Mike Westerhof <mike@mwester.net>

> ---
>  recipes/util-linux-ng/util-linux-ng.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
> index 29e534c..579c8dc 100644
> --- a/recipes/util-linux-ng/util-linux-ng.inc
> +++ b/recipes/util-linux-ng/util-linux-ng.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Util-linux-ng is a suite of essential utilities for any Linux system."
>  SECTION = "base"
>  LICENSE = "GPL"
> -DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} udev  zlib ncurses virtual/libintl"
> +DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} zlib ncurses virtual/libintl"
>  DEPENDS_virtclass-native = "zlib-native lzo-native gettext-native"
>  
>  inherit autotools gettext



