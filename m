Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 52AD17869A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 11:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id EBA3F31C0623;
	Fri,  8 Dec 2017 12:43:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 99EvpV4qyQpC; Fri,  8 Dec 2017 12:43:57 +0100 (CET)
Received: from t460p (p57A61C94.dip0.t-ipconnect.de [87.166.28.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 6161231C0BA9;
	Fri,  8 Dec 2017 12:43:57 +0100 (CET)
Date: Fri, 8 Dec 2017 12:43:56 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Message-ID: <20171208124356.6c2c84ab@t460p>
In-Reply-To: <1512731970-16166-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1512731970-16166-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] samba: Add packagegroup
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
X-List-Received-Date: Fri, 08 Dec 2017 11:43:59 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 8 Dec 2017 19:19:30 +0800
zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:

> Add packagegroup for samba, for there are too many rpms in samba and it's hard to manage.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-connectivity/samba/samba_4.6.7.bb      | 30 +++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
> index 2b227c9..83846b1 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
> @@ -162,7 +162,7 @@ PACKAGES =+ "${PN}-python ${PN}-pidl \
>               ${PN}-dsdb-modules ${PN}-testsuite registry-tools \
>               winbind \
>               ${PN}-common ${PN}-base ${PN}-ctdb-tests \
> -             smbclient"
> +             smbclient ${PN}-client ${PN}-server ${PN}-test"
>  
>  python samba_populate_packages() {
>      def module_hook(file, pkg, pattern, format, basename):
> @@ -254,3 +254,31 @@ FILES_smbclient = "${bindir}/cifsdd \
>  
>  RDEPENDS_${PN}-pidl_append = " perl"
>  FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
> +
> +SUMMARY_${PN}-client = "samba client"
> +RDEPENDS_${PN}-client = "\
> +    smbclient \
> +    winbind \
> +    registry-tools \
> +    ${PN}-pidl \
> +    " 
> +
> +ALLOW_EMPTY_${PN}-client = "1"
> +
> +SUMMARY_${PN}-server = "samba server"
> +RDEPENDS_${PN}-server = "\
> +    ${PN} \
> +    winbind \
> +    registry-tools \
> +    ${PN}-pidl \
> +    " 

The list of packages for the server installation changed significantly since
your previous patch without further explanation.

Are you sure Perl is required to run the Samba server now? I'm asking, because
I've been using a minimal installation (samba-base) for years.

> +
> +ALLOW_EMPTY_${PN}-server = "1"
> +
> +SUMMARY_${PN}-test = "samba test"
> +RDEPENDS_${PN}-test = "\
> +    ${PN}-ctdb-tests \
> +    ${PN}-testsuite \
> +    "
> +
> +ALLOW_EMPTY_${PN}-test = "1"

Please remove the SUMMARY fields, or choose more descriptive texts.

Regards,
Andreas

