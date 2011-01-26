Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PiB6j-0005zN-85
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 20:32:45 +0100
Received: (qmail 29961 invoked by uid 503); 26 Jan 2011 19:35:24 -0000
Received: from b9.ovh.net (HELO mail620.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 26 Jan 2011 19:35:24 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 26 Jan 2011 21:32:29 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 26 Jan 2011 21:32:29 +0200
Message-ID: <4D4076AC.8090402@eukrea.com>
Date: Wed, 26 Jan 2011 20:31:56 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295363929-13246-1-git-send-email-kergoth@gmail.com>
	<1295363929-13246-4-git-send-email-kergoth@gmail.com>
In-Reply-To: <1295363929-13246-4-git-send-email-kergoth@gmail.com>
X-Ovh-Tracer-Id: 8560498467262016841
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH 4/4] bin/install: implement -D internally
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
X-List-Received-Date: Wed, 26 Jan 2011 19:32:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 18/01/2011 16:18, Chris Larson wrote:
> From: Chris Larson<chris_larson@mentor.com>
>
> Signed-off-by: Chris Larson<chris_larson@mentor.com>
Acked-by: Eric Bénard <eric@eukrea.com>
> ---
>   bin/install |   13 ++++++++++++-
>   1 files changed, 12 insertions(+), 1 deletions(-)
>
> diff --git a/bin/install b/bin/install
> index 4ad8172..1c938755 100755
> --- a/bin/install
> +++ b/bin/install
> @@ -1,9 +1,13 @@
>   #!/bin/sh
> +#
> +# Portability notes:
> +# - We allow what SuSv3 defines
> +# - We implement -D internally
>
>   source $(dirname $0)/wrapper.sh
>
>   saved=""
> -while getopts dbCcMpSsvB:f:g:m:o: opt; do
> +while getopts dbCcMpSsvB:f:g:m:o:D opt; do
>       case "$opt" in
>           s)
>               # Ignore strip argument
> @@ -12,6 +16,9 @@ while getopts dbCcMpSsvB:f:g:m:o: opt; do
>               save "-$opt"
>               save "$OPTARG"
>               ;;
> +        D)
> +            createleading="1"
> +            ;;
>           \?)
>               exit 1
>               ;;
> @@ -25,4 +32,8 @@ for arg; do
>       save "$arg"
>   done
>
> +if [ $# == 2 -a -n "$createleading" ]; then
> +    install -d $(dirname $2)
> +fi
> +
>   exec_real



