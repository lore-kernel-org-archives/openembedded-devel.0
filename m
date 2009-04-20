Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LvwgL-0007Qn-U7
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 18:49:22 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LvwcB-0005BY-5e
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 16:45:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 16:45:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 16:45:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 20 Apr 2009 18:33:38 +0200
Message-ID: <gsi852$ec5$5@ger.gmane.org>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-6-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1240241104-21935-6-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 1/1] e2fsprogs 1.41.4: depends on gettext-native, due to the removal of do_configure
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
X-List-Received-Date: Mon, 20 Apr 2009 16:49:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Koen Kooi <koen@openembedded.org>


On 20-04-09 17:24, Marcin Juszkiewicz wrote:
> From: Denys Dmytriyenko<denis@denix.org>
>
> ---
>   recipes/e2fsprogs/e2fsprogs_1.41.4.bb |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.4.bb b/recipes/e2fsprogs/e2fsprogs_1.41.4.bb
> index 177d9af..c2b9232 100644
> --- a/recipes/e2fsprogs/e2fsprogs_1.41.4.bb
> +++ b/recipes/e2fsprogs/e2fsprogs_1.41.4.bb
> @@ -2,7 +2,9 @@ require e2fsprogs.inc
>
>   SRC_URI += "file://mkinstalldirs.patch;patch=1"
>
> -PR = "r2"
> +DEPENDS += "gettext-native"
> +
> +PR = "r3"
>
>   do_compile_prepend () {
>   	find ./ -print|xargs chmod u=rwX




