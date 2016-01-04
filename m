Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CACEF6FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 08:53:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u048rfKb004944
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Jan 2016 00:53:41 -0800 (PST)
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 4 Jan 2016 00:53:40 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <1451870041-5001-1-git-send-email-rongqing.li@windriver.com>
From: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <568A3313.7050802@windriver.com>
Date: Mon, 4 Jan 2016 16:53:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1451870041-5001-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH][meta-networking] mime-construct: Perform more mangling for perl path
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
X-List-Received-Date: Mon, 04 Jan 2016 08:53:42 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

sorry, please drop this patch

-Roy

On 2016年01月04日 09:14, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> native perl is in /usr/bin/mime-construct, introduce the below
> QA warning, it should be replaced:
>
> WARNING: QA Issue: /usr/bin/mime-construct_mime-construct contained in package mime-construct requires
> tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl, but no providers found in its RDEPENDS [file-rdeps]
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   .../recipes-extended/mime-construct/mime-construct_1.11.bb          | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb b/meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb
> index 6db4fdf..61bcd13 100644
> --- a/meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb
> +++ b/meta-networking/recipes-extended/mime-construct/mime-construct_1.11.bb
> @@ -20,3 +20,9 @@ inherit cpan
>   RDEPENDS_${PN} = "msmtp perl perl-module-mime-base64 perl-module-mime-quotedprint \
>       libproc-waitstat-perl libmime-types-perl perl-module-filehandle perl-module-posix \
>   "
> +
> +do_install_append() {
> +   #change the interpreter in file
> +   sed -i -e "s|${STAGING_BINDIR_NATIVE}/perl-native/perl -w|${bindir}/env perl|g" \
> +      ${D}/${bindir}/mime-construct
> +}
>

-- 
Best Reagrds,
Roy | RongQing Li

