Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MIhoe-000621-Oc
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 13:36:00 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MIhe2-0002WR-VI
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 11:25:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 22 Jun 2009 11:25:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Jun 2009 11:25:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Jun 2009 13:04:37 +0200
Message-ID: <h1nog5$af4$4@ger.gmane.org>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
	<1245664435-30183-9-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245664435-30183-9-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 032/125] samba: 3.2.8 and newer is GPLv3
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
X-List-Received-Date: Mon, 22 Jun 2009 11:36:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-06-09 11:53, Marcin Juszkiewicz wrote:
> From: Tom Rini<trini@embeddedalley.com>
>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   recipes/samba/samba-ads_3.2.8.bb |    1 +
>   recipes/samba/samba-ads_3.3.0.bb |    1 +
>   recipes/samba/samba_3.2.8.bb     |    1 +
>   recipes/samba/samba_3.3.0.bb     |    1 +
>   4 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/samba/samba-ads_3.2.8.bb b/recipes/samba/samba-ads_3.2.8.bb
> index 95f09c1..e643292 100644
> --- a/recipes/samba/samba-ads_3.2.8.bb
> +++ b/recipes/samba/samba-ads_3.2.8.bb
> @@ -1,5 +1,6 @@
>   require samba.inc
>   require samba-ads.inc
> +LICENSE = "GPLv3"
>
>   PR = "r2"
>   SRC_URI += "file://config-lfs.patch;patch=1 \
> diff --git a/recipes/samba/samba-ads_3.3.0.bb b/recipes/samba/samba-ads_3.3.0.bb
> index 9fd4303..e5184cf 100644
> --- a/recipes/samba/samba-ads_3.3.0.bb
> +++ b/recipes/samba/samba-ads_3.3.0.bb
> @@ -1,5 +1,6 @@
>   require samba.inc
>   require samba-ads.inc
> +LICENSE = "GPLv3"
>
>   PR = "r3"
>   SRC_URI += "file://config-lfs.patch;patch=1 \
> diff --git a/recipes/samba/samba_3.2.8.bb b/recipes/samba/samba_3.2.8.bb
> index 2e2cb95..16dcd31 100644
> --- a/recipes/samba/samba_3.2.8.bb
> +++ b/recipes/samba/samba_3.2.8.bb
> @@ -1,5 +1,6 @@
>   require samba.inc
>   require samba-basic.inc
> +LICENSE = "GPLv3"
>
>   SRC_URI += "file://configure-3.2.8.patch;patch=1 \
>               file://config-h.patch;patch=1 \
> diff --git a/recipes/samba/samba_3.3.0.bb b/recipes/samba/samba_3.3.0.bb
> index 6270c8c..c561d95 100644
> --- a/recipes/samba/samba_3.3.0.bb
> +++ b/recipes/samba/samba_3.3.0.bb
> @@ -1,5 +1,6 @@
>   require samba.inc
>   require samba-basic.inc
> +LICENSE = "GPLv3"
>
>   # 3.3.0 and newer will upgrade your tdb database to a
>   # new version that you can not downgrade to use with older




