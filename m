Received: from 1.26.mail-out.ovh.net ([46.105.43.121] helo=26.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QINlc-00062A-Rs
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 18:20:36 +0200
Received: (qmail 6424 invoked by uid 503); 6 May 2011 15:37:51 -0000
Received: from b9.ovh.net (HELO mail611.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 6 May 2011 15:37:51 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 6 May 2011 18:11:18 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 6 May 2011 18:11:17 +0200
Message-ID: <4DC41DA5.4080604@eukrea.com>
Date: Fri, 06 May 2011 18:11:17 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1304694796-9130-1-git-send-email-koen@openembedded.org>
In-Reply-To: <1304694796-9130-1-git-send-email-koen@openembedded.org>
X-Ovh-Tracer-Id: 2136113600363212105
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH] package.bbclass: convert unpackaged file message from	'info' to 'warn' so that it shows up on the console
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
X-List-Received-Date: Fri, 06 May 2011 16:20:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 06/05/2011 17:13, Koen Kooi wrote:
> Signed-off-by: Koen Kooi<koen@openembedded.org>
Acked-by: Eric Bénard <eric@eukrea.com>
> ---
>   classes/package.bbclass |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/classes/package.bbclass b/classes/package.bbclass
> index 901ad9d..2b98049 100644
> --- a/classes/package.bbclass
> +++ b/classes/package.bbclass
> @@ -464,9 +464,9 @@ python populate_packages () {
>   				unshipped.append(path)
>
>   	if unshipped != []:
> -		bb.note("the following files were installed but not shipped in any package:")
> +		bb.warn("the following files were installed but not shipped in any package:")
>   		for f in unshipped:
> -			bb.note("  " + f)
> +			bb.warn("  " + f)
>
>   	bb.build.exec_func("package_name_hook", d)
>



