Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 55E807700A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 03:59:38 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 1B0B868A01C; Sun, 28 Feb 2016 03:59:38 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 887F068A019;
	Sun, 28 Feb 2016 03:59:37 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 17972674001A;
	Sun, 28 Feb 2016 04:59:37 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <1456608134-4063-1-git-send-email-schnitzeltony@googlemail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56D270A8.8020801@mlbassoc.com>
Date: Sun, 28 Feb 2016 04:59:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1456608134-4063-1-git-send-email-schnitzeltony@googlemail.com>
Subject: Re: [PATCH] ne10: fix parsing
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
X-List-Received-Date: Sun, 28 Feb 2016 03:59:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/27/2016 10:22 PM, Andreas Müller wrote:
> ERROR: ParseError at /home/superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-support/ne10/ne10_1.2.1.bb:41: unparsed line: 'in .text [textrel]'      | ETA:  00:00:13
>
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>   meta-oe/recipes-support/ne10/ne10_1.2.1.bb | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> index 5bfe80a..4d753a0 100644
> --- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> +++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> @@ -37,8 +37,6 @@ do_install() {
>       cp -a ${B}/modules/libNE10.so ${D}${libdir}/
>   }
>
> -# ERROR: QA Issue: ELF binary 'ne10/1.2.1-r0/packages-split/ne10/usr/lib/libNE10.so.10' has relocations
> -in .text [textrel]
> -# ERROR: QA Issue: ELF binary 'ne10/1.2.1-r0/packages-split/ne10/usr/lib/libNE10.so.10' has relocations
> -in .text [textrel]
> +# ERROR: QA Issue: ELF binary 'ne10/1.2.1-r0/packages-split/ne10/usr/lib/libNE10.so.10' has relocations in .text [textrel]
> +# ERROR: QA Issue: ELF binary 'ne10/1.2.1-r0/packages-split/ne10/usr/lib/libNE10.so.10' has relocations in .text [textrel]

Is there some reason for repeating this line twice?  They appear to be identical.

>   INSANE_SKIP_${PN} += "textrel"
>


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

