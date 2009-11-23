Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NCakd-0005QK-Fg
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 16:22:54 +0100
Received: (qmail 9005 invoked by uid 1003); 23 Nov 2009 15:21:22 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Nov 2009 15:21:21 -0000
Message-ID: <4B0AA870.8060404@balister.org>
Date: Mon, 23 Nov 2009 10:21:20 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
Newsgroups: gmane.comp.handhelds.openembedded
To: openembedded-devel@lists.openembedded.org
References: <1257432076-12239-1-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1257432076-12239-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] java.bbclass: fixed oe_jarinstall for broken symlinks
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
X-List-Received-Date: Mon, 23 Nov 2009 15:22:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

On 11/05/2009 09:41 AM, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<marcin@buglabs.net>
>
> Code checked for existance of JAR file and if it was present then it had
> to be removed before symlinking to it. But it was not working sometimes
> so we forced symlinking.
>
> Proper fix is to check "does file exists or is a symlink" which we do
> now.
>
> Signed-off-by: Marcin Juszkiewicz<marcin@buglabs.net>
> ---
>   classes/java.bbclass |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/classes/java.bbclass b/classes/java.bbclass
> index cacd2ce..b68035c 100644
> --- a/classes/java.bbclass
> +++ b/classes/java.bbclass
> @@ -68,11 +68,11 @@ oe_jarinstall() {
>
>     # Creates symlinks out of the remaining arguments.
>     while [ "$#" -gt 0 ]; do
> -    if [ -e $dir/$1 ]; then
> +    if [ -e $dir/$1 -o -h $dir/$1 ]; then
>         oewarn "file was in the way. removing:" $dir/$1
>         rm $dir/$1
>       fi
> -    ln -sf $destname $dir/$1
> +    ln -s $destname $dir/$1
>       shift
>     done
>   }



