Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MCEZ0-0007Ns-B1
	for openembedded-devel@openembedded.org; Thu, 04 Jun 2009 17:09:06 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MCEQE-0002Dc-KB
	for openembedded-devel@openembedded.org; Thu, 04 Jun 2009 15:00:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 04 Jun 2009 15:00:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 04 Jun 2009 15:00:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 04 Jun 2009 16:58:30 +0200
Message-ID: <h08nem$9d$2@ger.gmane.org>
References: <1244124820-13930-1-git-send-email-ihar.hrachyshka@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090531 Shredder/3.0b3pre
In-Reply-To: <1244124820-13930-1-git-send-email-ihar.hrachyshka@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] guile-native: added missing gettext-native dependency
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
X-List-Received-Date: Thu, 04 Jun 2009 15:09:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-06-09 16:13, Ihar Hrachyshka wrote:
> Signed-off-by: Ihar Hrachyshka<ihar.hrachyshka@gmail.com>
> ---
>   recipes/guile/guile-native_1.8.5.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/guile/guile-native_1.8.5.bb b/recipes/guile/guile-native_1.8.5.bb
> index e73616e..bf21c6a 100644
> --- a/recipes/guile/guile-native_1.8.5.bb
> +++ b/recipes/guile/guile-native_1.8.5.bb
> @@ -1,6 +1,6 @@
>   SECTION = "unknown"
>   LICENSE = "GPL"
> -DEPENDS = "gmp-native"
> +DEPENDS = "gmp-native gettext-native"
>   SRC_URI = "http://ftp.gnu.org/pub/gnu/guile/guile-${PV}.tar.gz \
>              file://configure-fix.patch;patch=1 \
>   "

I already have that fix queued up: 
http://dominion.thruhere.net/git/cgit.cgi/openembedded/commit/?id=c1643b0dba7286af8c7a9e26e6aa96c0315df14f

regards,

Koen



