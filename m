Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id E3ED360765
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 10:18:12 +0000 (UTC)
Received: (qmail 9273 invoked by uid 1003); 27 Oct 2017 10:18:13 -0000
Received: from unknown (HELO ?192.168.0.158?) (philip@opensdr.com@94.113.76.12)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	27 Oct 2017 10:18:13 -0000
To: Fan Xin <fan.xin@jp.fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <1509099270-1173-1-git-send-email-fan.xin@jp.fujitsu.com>
From: Philip Balister <philip@balister.org>
Message-ID: <a52d7476-864f-728c-e115-96967fdce450@balister.org>
Date: Fri, 27 Oct 2017 12:18:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1509099270-1173-1-git-send-email-fan.xin@jp.fujitsu.com>
Subject: Re: [meta-oe][PATCH] spi-tools: Add version info.
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
X-List-Received-Date: Fri, 27 Oct 2017 10:18:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit

On 10/27/2017 12:14 PM, Fan Xin wrote:
> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> ---
>  meta-oe/recipes-support/spitools/spitools_git.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
> index f808125..2eedf8c 100644
> --- a/meta-oe/recipes-support/spitools/spitools_git.bb
> +++ b/meta-oe/recipes-support/spitools/spitools_git.bb
> @@ -4,11 +4,16 @@ AUTHOR = "Christophe BLAESS"
>  LICENSE="GPLv2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
>  
> +PR = "r0"

Drop the PR.

Philip

> +
> +BPV = "0.8.1"
> +PV = "${BPV}"
> +SRCREV = "03405ab45884e4264dfa0371c032b2baaeeaaa98"
> +
>  S = "${WORKDIR}/git"
>  
>  SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=git"
>  
> -SRCREV = "03405ab45884e4264dfa0371c032b2baaeeaaa98"
>  
>  inherit autotools
>  
> 

