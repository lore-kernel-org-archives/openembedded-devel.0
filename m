Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-02.prod.phx3.secureserver.net
	(p3plsmtpa08-02.prod.phx3.secureserver.net [173.201.193.103])
	by mail.openembedded.org (Postfix) with ESMTP id 1598F62247
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Sep 2013 12:57:48 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa08-02.prod.phx3.secureserver.net with 
	id Ncxn1m00R1mTNtu01cxoUi; Sun, 08 Sep 2013 05:57:48 -0700
Message-ID: <522C744B.6000809@pabigot.com>
Date: Sun, 08 Sep 2013 07:57:47 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1378235089-5251-1-git-send-email-pab@pabigot.com>
In-Reply-To: <1378235089-5251-1-git-send-email-pab@pabigot.com>
Subject: Re: [meta-oe][PATCH] vim: workaround nawk dependency problem with RPM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Sep 2013 12:57:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ping?  I see this is marked as New, Archived in patchwork so it doesn't 
show up for merge, but can't tell how it got archived.  Is there 
something wrong with it?

On 09/03/2013 02:04 PM, Peter A. Bigot wrote:
> One of the examples has a #!/usr/bin/nawk which tells RPM to add that as a
> dep, which we don't want.
>
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>   meta-oe/recipes-support/vim/vim.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/vim/vim.inc b/meta-oe/recipes-support/vim/vim.inc
> index d7336c2..991ba74 100644
> --- a/meta-oe/recipes-support/vim/vim.inc
> +++ b/meta-oe/recipes-support/vim/vim.inc
> @@ -54,8 +54,9 @@ EXTRA_OECONF = " \
>   "
>   
>   do_install_append() {
> -    # Work around rpm picking up csh as a dep
> +    # Work around rpm picking up csh or awk as a dep
>       chmod -x ${D}${datadir}/${PN}/${VIMDIR}/tools/vim132
> +    chmod -x ${D}${datadir}/${PN}/${VIMDIR}/tools/mve.awk
>   
>       # Install example vimrc from runtime files
>       install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${PN}/vimrc


