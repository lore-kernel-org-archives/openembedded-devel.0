Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 09BEC74C83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 22:53:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2018 15:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,404,1520924400"; d="scan'208";a="51144474"
Received: from csoh-mobl1.gar.corp.intel.com (HELO [10.255.140.247])
	([10.255.140.247])
	by orsmga003.jf.intel.com with ESMTP; 15 May 2018 15:53:46 -0700
To: Pierre-Jean TEXIER <texier.pj2@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1526407511-29723-1-git-send-email-texier.pj2@gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <1cb75da3-dd0b-ad66-69fe-9f4b521a4c9d@intel.com>
Date: Wed, 16 May 2018 06:53:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1526407511-29723-1-git-send-email-texier.pj2@gmail.com>
Subject: Re: [meta-oe][PATCH] minicoredumper: fixes for sysvinit and systemd
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
X-List-Received-Date: Tue, 15 May 2018 22:53:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/16/2018 02:05 AM, Pierre-Jean TEXIER wrote:
> The sysv initscript and systemd service assumes minicoredumper is
> installed in /usr/bin/. In our case minicoredumper is installed in
> /usr/sbin/ by default. Therefore, fix this path.
> 
> Signed-off-by: Pierre-Jean TEXIER <texier.pj2@gmail.com>
> ---
>  meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init    | 2 +-
>  meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
> index 90ef7fa..9c96e31 100644
> --- a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
> +++ b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
> @@ -22,7 +22,7 @@
>  
>  case "$1" in
>      start)
> -        echo "|/usr/bin/minicoredumper %p %u %g %s %t %h %e" > /proc/sys/kernel/core_pattern
> +        echo "|/usr/sbin/minicoredumper %p %u %g %s %t %h %e" > /proc/sys/kernel/core_pattern
>          ;;
>      stop)
>          echo "core" > /proc/sys/kernel/core_pattern
> diff --git a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
> index 851b54c..45d098f 100644
> --- a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
> +++ b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
> @@ -4,7 +4,7 @@ Description=Enable minicoredumper.
>  [Service]
>  Type=oneshot
>  RemainAfterExit=yes
> -ExecStart=/bin/sh -c '/bin/echo "|/usr/bin/minicoredumper %%p %%u %%g %%s %%t %%h %%e" > /proc/sys/kernel/core_pattern'
> +ExecStart=/bin/sh -c '/bin/echo "|/usr/sbin/minicoredumper %%p %%u %%g %%s %%t %%h %%e" > /proc/sys/kernel/core_pattern'
>  ExecStop=/bin/sh -c '/bin/echo "core" > /proc/sys/kernel/core_pattern'

There was a comment that /usr/sbin shouldn't be used on an exact same
patch submitted last month. Please take a look at that suggestion.

https://patchwork.openembedded.org/patch/150063/

Thanks,
Anuj

