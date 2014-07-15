Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id E9C14704FA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 18:06:04 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 75259F811E7; Tue, 15 Jul 2014 12:06:05 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id B0AD4F811E1;
	Tue, 15 Jul 2014 12:06:03 -0600 (MDT)
Message-ID: <53C56D8D.8040704@mlbassoc.com>
Date: Tue, 15 Jul 2014 12:06:05 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1405447315-798-1-git-send-email-stephanoc@gmail.com>
In-Reply-To: <1405447315-798-1-git-send-email-stephanoc@gmail.com>
Subject: Re: [meta-oe][PATCH] stop trying to remove folders that do not exist
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
X-List-Received-Date: Tue, 15 Jul 2014 18:06:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-07-15 12:01, Stephano Cetola wrote:
> From: Stephano Cetola <scetola@reachtech.com>
>
> The directory ${D}/${TMPDIR} does not exist. This patch removes code
> that was calling rm and rmdir on that location.
>
> Signed-off-by: Stephano Cetola <scetola@reachtech.com>
> ---
>   meta-oe/recipes-devtools/php/php.inc |    6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index b1bf79c..000316b 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -90,6 +90,12 @@ do_install_append_pn-php() {
>       sed -i 's:=/var:=${localstatedir}:g' ${B}/sapi/fpm/init.d.php-fpm
>       install -m 0755 ${B}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.d/php-fpm
>       TMP=`dirname ${D}/${TMPDIR}`
> +    bbwarn "D"
> +    bbwarn ${D}
> +    bbwarn "TMPDIR"
> +    bbwarn ${TMPDIR}
> +    bbwarn "TMP"
> +    bbwarn ${TMP}
>       while test ${TMP} != ${D}; do
>           rmdir ${TMP}
>           TMP=`dirname ${TMP}`;
>

The actual patch does not do what the summary claims.  Are you
sure this is what you wanted to send/commit?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

