Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1QC9C1-0004gp-Rg
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 13:34:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id A2B7E315044D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 13:31:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 5EumKmQv+xIv
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 13:31:38 +0200 (CEST)
Received: from [172.22.22.61] (drms-590cf9dc.pool.mediaWays.net
	[89.12.249.220])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id D25AE315044B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 13:31:37 +0200 (CEST)
Message-ID: <4DAD7297.2030606@opendreambox.org>
Date: Tue, 19 Apr 2011 13:31:35 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110411 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1303134465.3910.63.camel@mattotaupa>
	<1303134640.3910.67.camel@mattotaupa>
In-Reply-To: <1303134640.3910.67.camel@mattotaupa>
Subject: Re: [RFC] [PATCH 2/2] pkgconfig: add git version
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
X-List-Received-Date: Tue, 19 Apr 2011 11:34:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/18/2011 03:50 PM, Paul Menzel wrote:
> Date: Sun, 17 Apr 2011 19:19:58 +0200
> 
> 1. The revision is close to the upcoming release of pkg-config 0.26. [1]
> 2. The patch `sysrootfix.patch` has been merged upstream [2].
> 3. No embedded GLib is shipped anymore [3]. Therefore drop patches `autofoo.patch` and `glibconfig-sysdefs.h`.
> 
> The patch is tested using the following configuration
> 
> 	Build Configuration:
> 	BB_VERSION        = "1.12.0"
> 	METADATA_BRANCH   = "pkg-config"
> 	METADATA_REVISION = "d4ae0c5"
> 	TARGET_ARCH       = "arm"
> 	TARGET_OS         = "linux-uclibceabi"
> 	MACHINE           = "beagleboard"
> 	DISTRO            = "minimal-uclibc"
> 	DISTRO_VERSION    = "dev-snapshot-20110417"
> 	TARGET_FPU        = "hard"
> 
> and `angstrom-2010.x` and `minimal` too.
> 
> [1] http://lists.freedesktop.org/archives/pkg-config/2011-April/000720.html
> [2] http://cgit.freedesktop.org/pkg-config/commit/?id=66d49f1375fec838bcd301bb4ca2ef76cee0e47c
> [3] http://cgit.freedesktop.org/pkg-config/commit/?id=99964eddb5935173fcedfc793e762d7dc7d01bba
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> 1. How can this recipe used also for the native recipe?
> 2. What is `pkg-config-sdk` used for?
> ---
>  recipes/pkgconfig/pkgconfig_git.bb |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/pkgconfig/pkgconfig_git.bb
> 
> diff --git a/recipes/pkgconfig/pkgconfig_git.bb b/recipes/pkgconfig/pkgconfig_git.bb
> new file mode 100644
> index 0000000..9c6d7d1
> --- /dev/null
> +++ b/recipes/pkgconfig/pkgconfig_git.bb
> @@ -0,0 +1,12 @@
> +require ${PN}.inc
> +
> +PR = "${INC_PR}.0"
> +
> +SRCREV = "7850aeb03a54a15d07b6c243b61033cd379c39d7"
> +SRC_URI = "git://anongit.freedesktop.org/pkg-config;protocol=git"
> +
> +PV = "0.26"
> +PR = "${INC_PR}.0"
> +PR_append = "+gitr${SRCPV}"

Usually, SRCPV is used in PV, not PR. Also, I'd prefer not using 0.26
for a pre-release snapshot, to make a future update to the released
version work. How about using one of

PV = "0.25+gitr${SRCPV}"

or

PV = "0.25.999+gitr${SRCPV}"

instead, and removing the PR_append line?

Regards,
Andreas


