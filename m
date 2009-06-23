Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MJ2tC-0007st-6f
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 12:06:06 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MJ2iU-0001iM-H2
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 09:55:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 09:55:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 09:55:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Jun 2009 11:14:39 +0200
Message-ID: <h1q6dv$a5v$12@ger.gmane.org>
References: <200906230941.30107.marcin@juszkiewicz.com.pl>
	<1245747394-31806-3-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245747394-31806-3-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 023/125] seppuku: add support for working behind the proxy
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
X-List-Received-Date: Tue, 23 Jun 2009 10:06:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-06-09 10:56, Marcin Juszkiewicz wrote:
> From: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
>
> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   classes/seppuku.bbclass |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/classes/seppuku.bbclass b/classes/seppuku.bbclass
> index ab8096e..546738d 100644
> --- a/classes/seppuku.bbclass
> +++ b/classes/seppuku.bbclass
> @@ -319,6 +319,12 @@ python seppuku_eventhandler() {
>           passw   = bb.data.getVar("SEPPUKU_PASS",  data, True)
>           product = bb.data.getVar("SEPPUKU_PRODUCT", data, True)
>           component = bb.data.getVar("SEPPUKU_COMPONENT", data, True)
> +	proxy	= bb.data.getVar('HTTP_PROXY', data, True )
> +	if (proxy):
> +		phl = urllib2.ProxyHandler({'http' : proxy})
> +		poster.add_handler(phl)
> +		opener.add_handler(phl)
> +
>           # evil hack to figure out what is going on
>           debug_file = open(os.path.join(bb.data.getVar("TMPDIR", data, True),"..","seppuku-log"),"a")
>




