Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 218896E681
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 03:32:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4D3WaBx022392
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2016 20:32:36 -0700 (PDT)
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 12 May 2016 20:32:35 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1463108189-37514-1-git-send-email-liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57354AD2.4020901@windriver.com>
Date: Fri, 13 May 2016 11:32:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1463108189-37514-1-git-send-email-liezhi.yang@windriver.com>
Subject: Re: [meta-oe] [PATCH] rrdtool: only unset PERLHOSTLIB in do_configure
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
X-List-Received-Date: Fri, 13 May 2016 03:32:38 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/13/2016 10:56 AM, Robert Yang wrote:
> The do_compile requires it, otherwise it can't find the native module
> correctly when perl-native is mirrored from another build.
>
> Fixed:
> | Compilation failed in require.
> | BEGIN failed--compilation aborted.
> | Can't locate loadable object for module File::Glob in @INC
>
> (LOCAL REV: NOT UPSTREAM -- sent to oe on 20160512)

Sorry, this line should be removed, I will send a V2.

// Robert

>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
> index 216aafc..73a5d0e 100644
> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
> @@ -58,9 +58,9 @@ export STAGING_INCDIR
>   # emulate cpan_do_configure
>   EXTRA_OEMAKE = ' PERL5LIB="${PERL_ARCHLIB}" '
>   # Avoid do_configure error on some hosts
> -export PERLHOSTLIB = ""
>
>   do_configure() {
> +    unset PERLHOSTLIB
>       #fix the pkglib problem with newer automake
>       #perl
>       sed -i -e "s|-Wl,--rpath -Wl,\$rp||g" \
>

