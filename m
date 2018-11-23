Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 61A936C5E8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 09:17:17 +0000 (UTC)
Received: from [10.0.0.10] (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id DBC521C1B29;
	Fri, 23 Nov 2018 10:17:17 +0100 (CET)
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1542560899-8877-1-git-send-email-akuster808@gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <f5a22ef9-2b91-3dab-38b0-a29ad7451c70@geanix.com>
Date: Fri, 23 Nov 2018 10:16:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <1542560899-8877-1-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-oe][PATCH] ndctl: fix compile issue
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
X-List-Received-Date: Fri, 23 Nov 2018 09:17:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit

Hi Armin,

On 18/11/2018 18.08, Armin Kuster wrote:
> | No package 'systemd' found
> | configure: error: systemd support requested but pkg-config unable to query systemd package
> 
> add PACKCONFIG to disable systemd
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   meta-oe/recipes-core/ndctl/ndctl_git.bb | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/meta-oe/recipes-core/ndctl/ndctl_git.bb b/meta-oe/recipes-core/ndctl/ndctl_git.bb
> index b20915f..048f166 100644
> --- a/meta-oe/recipes-core/ndctl/ndctl_git.bb
> +++ b/meta-oe/recipes-core/ndctl/ndctl_git.bb
> @@ -21,6 +21,9 @@ S = "${WORKDIR}/git"
>   
>   EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
>   
> +PACKAGECONFIG ??= ""

Can you make the default PACKAGECONFIG include systemd if it is in 
distrofeatures?

PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"

// Martin

> +PACKAGECONFIG[systemd] = "--with-systemd-unit-dir=${systemd_system_unitdir}, --without-systemd-unit-dir,"
> +
>   do_configure_prepend() {
>       ${S}/autogen.sh
>   }
> 

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix IVS
https://geanix.com
DK39600706

