Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1QINV5-0005hy-RW
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 18:03:32 +0200
Received: (qmail 14283 invoked by uid 1003); 6 May 2011 16:00:40 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@96.240.165.110)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	6 May 2011 16:00:40 -0000
Message-ID: <4DC41B23.2090100@balister.org>
Date: Fri, 06 May 2011 12:00:35 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1304694796-9130-1-git-send-email-koen@openembedded.org>
In-Reply-To: <1304694796-9130-1-git-send-email-koen@openembedded.org>
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
X-List-Received-Date: Fri, 06 May 2011 16:03:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

On 05/06/2011 11:13 AM, Koen Kooi wrote:
> Signed-off-by: Koen Kooi<koen@openembedded.org>
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


