Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MJ2GV-0006DR-6O
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:26:07 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MJ25m-000087-Sn
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 09:15:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 09:15:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 09:15:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Jun 2009 11:14:46 +0200
Message-ID: <h1q6e6$a5v$13@ger.gmane.org>
References: <200906230941.30107.marcin@juszkiewicz.com.pl>
	<1245747394-31806-4-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245747394-31806-4-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 024/125] tinderclient: support sitting behind proxy
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
X-List-Received-Date: Tue, 23 Jun 2009 09:26:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-06-09 10:56, Marcin Juszkiewicz wrote:
> From: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
>
> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   classes/tinderclient.bbclass |   24 +++++++++++++++++-------
>   1 files changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/classes/tinderclient.bbclass b/classes/tinderclient.bbclass
> index 0b7fc1d..d2b2b33 100644
> --- a/classes/tinderclient.bbclass
> +++ b/classes/tinderclient.bbclass
> @@ -1,10 +1,20 @@
> -def tinder_http_post(server, selector, content_type, body):
> +def tinder_http_post(d, server, selector, content_type, body):
>       import httplib
> +    from bb import data
>       # now post it
>       for i in range(0,5):
>          try:
> -           h = httplib.HTTP(server)
> -           h.putrequest('POST', selector)
> +	   proxy = data.getVar('HTTP_PROXY', d, True )
> +	   if (proxy):
> +		   if (proxy.endswith('/')):
> +			   proxy = proxy[:-1]
> +		   if (proxy.startswith('http://')):
> +			   proxy = proxy[7:]
> +		   h = httplib.HTTP(proxy)
> +		   h.putrequest('POST', 'http://%s%s' % (server, selector))
> +	   else:
> +		   h = httplib.HTTP(server)
> +		   h.putrequest('POST', selector)
>              h.putheader('content-type', content_type)
>              h.putheader('content-length', str(len(body)))
>              h.endheaders()
> @@ -12,8 +22,8 @@ def tinder_http_post(server, selector, content_type, body):
>              errcode, errmsg, headers = h.getreply()
>              #print errcode, errmsg, headers
>              return (errcode,errmsg, headers, h.file)
> -       except:
> -           print "Error sending the report!"
> +       except Exception, e:
> +           print "Error sending the report! ", e
>              # try again
>              pass
>
> @@ -116,7 +126,7 @@ def tinder_build_start(d):
>       #print "selector %s and url %s" % (selector, url)
>
>       # now post it
> -    errcode, errmsg, headers, h_file = tinder_http_post(server,selector,content_type, body)
> +    errcode, errmsg, headers, h_file = tinder_http_post(d,server,selector,content_type, body)
>       #print errcode, errmsg, headers
>       report = h_file.read()
>
> @@ -151,7 +161,7 @@ def tinder_send_http(d, status, _log):
>       new_log = _log
>       while len(new_log)>  0:
>           content_type, body = tinder_format_http_post(d,status,new_log[0:18000])
> -        errcode, errmsg, headers, h_file = tinder_http_post(server,selector,content_type, body)
> +        errcode, errmsg, headers, h_file = tinder_http_post(d,server,selector,content_type, body)
>           #print errcode, errmsg, headers
>           #print h.file.read()
>           new_log = new_log[18000:]




