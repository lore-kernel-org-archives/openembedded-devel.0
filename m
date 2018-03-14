Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 075A1784A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2018 09:47:12 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ew2y1-0007fT-0c for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2018 10:45:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 14 Mar 2018 10:47:05 +0100
Message-ID: <p8aquq$s6r$1@blaine.gmane.org>
References: <1520960607-22392-1-git-send-email-akuster808@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
In-Reply-To: <1520960607-22392-1-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-oe][PATCH] sysdig: don't build for aarch64
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
X-List-Received-Date: Wed, 14 Mar 2018 09:47:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: nl

Op 13-03-18 om 18:03 schreef Armin Kuster:
> this package depends on luajit which is not supported on aarch64

FWIW, luajit upstream supports it, it just isn't in an official release. Both fedora and debian are now using a snapshot to get luajit working on aarch64.

> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-extended/sysdig/sysdig_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
> index 67d06dc..4f58281 100644
> --- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
> +++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
> @@ -35,3 +35,7 @@ FILES_${PN} += " \
>      ${datadir}/zsh/* \
>      ${prefix}/src/*  \
>  "
> +
> +# luajit not supported on Aarch64
> +COMPATIBLE_HOST = "^(?!aarch64).*"
> +
> 



