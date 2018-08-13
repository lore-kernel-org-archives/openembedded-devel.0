Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE9D78F63
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 15:53:20 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 309D92E62375;
	Mon, 13 Aug 2018 17:53:20 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A19E82E62374;
	Mon, 13 Aug 2018 17:53:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.itconsulting-heinold.de (unknown [178.19.210.209])
	by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Mon, 13 Aug 2018 17:53:19 +0200 (CEST)
Date: Mon, 13 Aug 2018 17:53:13 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <20180813155313.GA10693@mail.itconsulting-heinold.de>
References: <20180813152021.29931-1-richard.leitner@skidata.com>
MIME-Version: 1.0
In-Reply-To: <20180813152021.29931-1-richard.leitner@skidata.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH] openjdk-7: clarify a bitbake warning
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
X-List-Received-Date: Mon, 13 Aug 2018 15:53:20 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Aug 13, 2018 at 05:20:21PM +0200, Richard Leitner wrote:
> We get a bitbake warning during recipe building complaining about
> unsupported architectures unconditionally. That check is relevant
> only for shark builds, so it is quite confusing for non-shark
> builds.
> 
> Make the warning conditional on whether shark builds are enabled
> or not.
> 
> This is the same patch as the one for openjdk-8 by André Draszik
> (commit 86c729cb51f880fd5a1ec6485baddfa2bedaa998)
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  recipes-core/openjdk/openjdk-common.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-core/openjdk/openjdk-common.inc
> index 816b463..c92af40 100644
> --- a/recipes-core/openjdk/openjdk-common.inc
> +++ b/recipes-core/openjdk/openjdk-common.inc
> @@ -55,7 +55,8 @@ def get_llvm_configure_arch(d):
>      elif arch == "powerpc" or arch == "powerpc64":
>          arch = "powerpc"
>      else:
> -        bb.warn("%s does not support %s yet" % (d.getVar('PN', True), arch) );
> +        if 'shark' in d.getVar('PACKAGECONFIG').split():
> +            bb.warn("%s does not support %s in Shark builds yet" % (d.getVar('PN', True), arch) );
>  
>      return arch
>  
> -- 
> 2.11.0

Looks good to me.

Bye Henning

