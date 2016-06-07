Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id D2259731A3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jun 2016 11:40:34 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id AD17868A01D; Tue,  7 Jun 2016 12:40:33 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=ALL_TRUSTED,BAYES_05,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 2B4E368A019;
	Tue,  7 Jun 2016 12:40:33 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id D6ABA67403FF;
	Tue,  7 Jun 2016 13:40:32 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <1465288732-2288-1-git-send-email-koen.kooi@linaro.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <5756B2B0.4020804@mlbassoc.com>
Date: Tue, 7 Jun 2016 13:40:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1465288732-2288-1-git-send-email-koen.kooi@linaro.org>
Subject: Re: [meta-gnome][PATCH 1/2] gnome-vfs 2.24.4: drop useless print
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jun 2016 11:40:35 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-06-07 10:38, Koen Kooi wrote:
> This fixes the python3 traceback.

RP already sent patches for this and the other python3 related issue.

>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>   meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
> index f9b02b1..1c78474 100644
> --- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
> +++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
> @@ -53,8 +53,6 @@ FILES_${PN}-doc += "${datadir}/gtk-doc"
>   PACKAGES_DYNAMIC += "^gnome-vfs-plugin-.*"
>
>   python populate_packages_prepend () {
> -    print d.getVar('FILES_gnome-vfs', 1)
> -
>       plugindir = d.expand('${libdir}/gnome-vfs-2.0/modules/')
>       do_split_packages(d, plugindir, '^lib(.*)\.so$', 'gnome-vfs-plugin-%s', 'GNOME VFS plugin for %s')
>   }
>


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

