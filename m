Received: from [206.46.173.17] (helo=vms173017pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N48oA-0004Fw-G7
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Oct 2009 08:55:37 +0100
Received: from gandalf.denix.org ([71.251.63.147]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSD00DBCCM44S4H@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	31 Oct 2009 02:54:10 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4AE1F14AF60; Sat,
	31 Oct 2009 03:54:04 -0400 (EDT)
Date: Sat, 31 Oct 2009 03:54:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091031075404.GH16188@denix.org>
References: <1256726758-22996-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1256726758-22996-3-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1256726758-22996-3-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH 2/6] coreutils-native: remove autotools	and quilt dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Oct 2009 07:55:37 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 28, 2009 at 11:45:54AM +0100, Marcin Juszkiewicz wrote:
> From: Roman I Khimov <khimov@altell.ru>
> 
> Allows to build coreutils-native at very early stage in build process.
> 
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/coreutils/coreutils-native.inc    |    8 ++++++++
>  recipes/coreutils/coreutils-native_6.0.bb |    2 +-
>  recipes/coreutils/coreutils-native_7.1.bb |    2 +-
>  recipes/coreutils/coreutils-native_7.2.bb |    2 +-
>  4 files changed, 11 insertions(+), 3 deletions(-)
>  create mode 100644 recipes/coreutils/coreutils-native.inc
> 
> diff --git a/recipes/coreutils/coreutils-native.inc b/recipes/coreutils/coreutils-native.inc
> new file mode 100644
> index 0000000..c4dda17
> --- /dev/null
> +++ b/recipes/coreutils/coreutils-native.inc
> @@ -0,0 +1,8 @@
> +inherit native
> +
> +INHIBIT_AUTOTOOLS_DEPS = "1"
> +PATCHTOOL = "patch"
> +
> +do_configure() {
> +	oe_runconf
> +}
> diff --git a/recipes/coreutils/coreutils-native_6.0.bb b/recipes/coreutils/coreutils-native_6.0.bb
> index 057dfa6..a3754df 100644
> --- a/recipes/coreutils/coreutils-native_6.0.bb
> +++ b/recipes/coreutils/coreutils-native_6.0.bb
> @@ -2,4 +2,4 @@ FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/coreutils-${PV}"
>  S = "${WORKDIR}/coreutils-${PV}"
>  
>  require coreutils_${PV}.bb
> -inherit native
> +require coreutils-native.inc
> diff --git a/recipes/coreutils/coreutils-native_7.1.bb b/recipes/coreutils/coreutils-native_7.1.bb
> index 057dfa6..a3754df 100644
> --- a/recipes/coreutils/coreutils-native_7.1.bb
> +++ b/recipes/coreutils/coreutils-native_7.1.bb
> @@ -2,4 +2,4 @@ FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/coreutils-${PV}"
>  S = "${WORKDIR}/coreutils-${PV}"
>  
>  require coreutils_${PV}.bb
> -inherit native
> +require coreutils-native.inc
> diff --git a/recipes/coreutils/coreutils-native_7.2.bb b/recipes/coreutils/coreutils-native_7.2.bb
> index 057dfa6..a3754df 100644
> --- a/recipes/coreutils/coreutils-native_7.2.bb
> +++ b/recipes/coreutils/coreutils-native_7.2.bb
> @@ -2,4 +2,4 @@ FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/coreutils-${PV}"
>  S = "${WORKDIR}/coreutils-${PV}"
>  
>  require coreutils_${PV}.bb
> -inherit native
> +require coreutils-native.inc
> -- 
> 1.6.5
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


