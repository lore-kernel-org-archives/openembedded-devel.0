Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PiB6O-0005wg-Ou
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 20:32:24 +0100
Received: (qmail 29779 invoked by uid 503); 26 Jan 2011 19:35:06 -0000
Received: from b9.ovh.net (HELO mail620.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 26 Jan 2011 19:35:06 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 26 Jan 2011 21:32:11 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 26 Jan 2011 21:32:10 +0200
Message-ID: <4D40768A.8050304@eukrea.com>
Date: Wed, 26 Jan 2011 20:31:22 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295363929-13246-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1295363929-13246-1-git-send-email-kergoth@gmail.com>
X-Ovh-Tracer-Id: 8555150442688458057
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH 1/4] bitbake.conf: include bin dirs from BBPATH in PATH
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
X-List-Received-Date: Wed, 26 Jan 2011 19:32:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 18/01/2011 16:18, Chris Larson wrote:
> From: Chris Larson<chris_larson@mentor.com>
>
> Signed-off-by: Chris Larson<chris_larson@mentor.com>
Acked-by: Eric Bénard <eric@eukrea.com>
> ---
>   bin/{ =>  darwin}/cp                    |    0
>   bin/{ =>  darwin}/sed                   |    0
>   conf/bitbake.conf                      |    5 +++--
>   conf/build/Power Macintosh-darwin.conf |    2 +-
>   conf/build/i386-darwin.conf            |    2 +-
>   5 files changed, 5 insertions(+), 4 deletions(-)
>   rename bin/{ =>  darwin}/cp (100%)
>   rename bin/{ =>  darwin}/sed (100%)
>
> diff --git a/bin/cp b/bin/darwin/cp
> similarity index 100%
> rename from bin/cp
> rename to bin/darwin/cp
> diff --git a/bin/sed b/bin/darwin/sed
> similarity index 100%
> rename from bin/sed
> rename to bin/darwin/sed
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index f1dc0ff..d03d7e3 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -421,8 +421,9 @@ EXTRA_IMAGEDEPENDS = ""
>
>   LIBTOOL_HAS_SYSROOT ?= "no"
>
> -PATH_prepend = "${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}/${base_bindir_native}:"
> -export PATH
> +BBPATH_BIN = "${@':'.join('%s/bin' % path for path in '${BBPATH}'.split(':'))}"
> +PATH =. "${BBPATH_BIN}:${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}/${base_bindir_native}:"
> +PATH[export] = "1"
>
>   ##################################################################
>   # Build utility info.
> diff --git a/conf/build/Power Macintosh-darwin.conf b/conf/build/Power Macintosh-darwin.conf
> index effddbf..b42051b 100644
> --- a/conf/build/Power Macintosh-darwin.conf	
> +++ b/conf/build/Power Macintosh-darwin.conf	
> @@ -1,4 +1,4 @@
> -PATH =. "${@bb.which('${BBPATH}', 'bin')}:"
> +PATH =. "${@bb.which('${BBPATH}', 'bin')}/darwin:"
>   BUILD_ARCH = "powerpc"
>
>   require conf/build/darwin/utilities.inc
> diff --git a/conf/build/i386-darwin.conf b/conf/build/i386-darwin.conf
> index c9e81b9..bdcb075 100644
> --- a/conf/build/i386-darwin.conf
> +++ b/conf/build/i386-darwin.conf
> @@ -1,4 +1,4 @@
> -PATH =. "${@bb.which('${BBPATH}', 'bin')}:"
> +PATH =. "${@bb.which('${BBPATH}', 'bin')}/darwin:"
>   BUILD_CC_ARCH += "-m32"
>
>   require conf/build/darwin/utilities.inc



