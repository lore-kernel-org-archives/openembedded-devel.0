Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwNSC-00047c-51
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 23:24:32 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LwNNq-0002z5-GN
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 21:20:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 21:20:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 21:20:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Apr 2009 22:33:30 +0200
Message-ID: <gslair$mfs$2@ger.gmane.org>
References: <1238580928-1072-1-git-send-email-khimov@altell.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1238580928-1072-1-git-send-email-khimov@altell.ru>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] package.bbclass: fix globbing for mask-like files
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
X-List-Received-Date: Tue, 21 Apr 2009 21:24:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-04-09 12:15, Roman I Khimov wrote:
> When a package contains two files like "name*" and "name*smth" OE can't
> properly package those, looping infinetely trying to build file list. The
> reason is that first file name globs to two files and OE adds them both
> into the list, then globs the first one again and gets two same files, etc.

Acked-by: Koen Kooi <koen@openembedded.org>


>
> Fix that.
> ---
>   classes/package.bbclass |    8 ++++++--
>   1 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/classes/package.bbclass b/classes/package.bbclass
> index 7a61c5a..8a77369 100644
> --- a/classes/package.bbclass
> +++ b/classes/package.bbclass
> @@ -384,8 +384,12 @@ python populate_packages () {
>   			globbed = glob.glob(file)
>   			if globbed:
>   				if [ file ] != globbed:
> -					files += globbed
> -					continue
> +					if not file in globbed:
> +						files += globbed
> +						continue
> +					else:
> +						globbed.remove(file)
> +						files += globbed
>   			if (not os.path.islink(file)) and (not os.path.exists(file)):
>   				continue
>   			if file in seen:




