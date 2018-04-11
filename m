Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 787276067D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2018 08:06:22 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1f6Ajj-0001WQ-LL for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2018 10:04:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 11 Apr 2018 10:06:15 +0200
Message-ID: <pakfhl$siq$1@blaine.gmane.org>
References: <1523374768-657-1-git-send-email-christophe.priouzeau@st.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
In-Reply-To: <1523374768-657-1-git-send-email-christophe.priouzeau@st.com>
Subject: Re: [meta-oe][PATCH v2] minicoredumper: relocate admin-binaries to sbin
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
X-List-Received-Date: Wed, 11 Apr 2018 08:06:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: nl

Op 10-04-18 om 17:39 schreef Christophe PRIOUZEAU:
> Change path of minicoredumper on init/service script to /usr/sbin.
> 
> Since the commit "relocate admin-binaries to sbin" on minicoredumper,
> minicoredumper binaries are installed on /usr/sbin directory instead
> of /usr/bin.
> src/minicoredumper/Makefile.am: sbin_PROGRAMS = minicoredumper
> 
> Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
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
>  
>  [Install]


You're trading one hardcoded entry for another, a bettter way would be to do something like

do_install_append() {
	sed -i -e s:/usr/bin/minicoredumper:${sbindir}/minicoredumper:g <files>
}

That would fix the situation for DISTROs where $prefix = "".


