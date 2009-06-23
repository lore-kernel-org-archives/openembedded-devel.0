Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MJ2Q8-0006l5-IL
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:36:04 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MJ2FS-0000ZL-CN
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 09:25:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 09:25:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 09:25:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Jun 2009 11:14:32 +0200
Message-ID: <h1q6do$a5v$11@ger.gmane.org>
References: <200906230941.30107.marcin@juszkiewicz.com.pl>
	<1245747394-31806-2-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245747394-31806-2-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 022/125] oestats-client: support working behind proxy
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
X-List-Received-Date: Tue, 23 Jun 2009 09:36:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-06-09 10:56, Marcin Juszkiewicz wrote:
> From: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
>
> Detect if we are behind proxy by checking for HTTP_PROXY variable
> and use specified proxy for http traffic.
>
> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   classes/oestats-client.bbclass |   20 +++++++++++++++-----
>   1 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/classes/oestats-client.bbclass b/classes/oestats-client.bbclass
> index 6d348d3..8922496 100644
> --- a/classes/oestats-client.bbclass
> +++ b/classes/oestats-client.bbclass
> @@ -18,8 +18,9 @@ def oestats_getid(d):
>   	f = file(bb.data.getVar('TMPDIR', d, True) + '/oestats.id', 'r')
>   	return f.read()
>   	
> -def oestats_send(server, action, vars = {}, files = {}):
> +def oestats_send(d, server, action, vars = {}, files = {}):
>   	import httplib
> +	import bb
>
>   	# build body
>   	output = []
> @@ -49,7 +50,16 @@ def oestats_send(server, action, vars = {}, files = {}):
>   		"Content-length": str(len(body))}
>
>   	# send request
> -	conn = httplib.HTTPConnection(server)
> +	proxy = bb.data.getVar('HTTP_PROXY', d, True )
> +	if (proxy):
> +		if (proxy.endswith('/')):
> +			proxy = proxy[:-1]
> +		if (proxy.startswith('http://')):
> +			proxy = proxy[7:]
> +		conn = httplib.HTTPConnection(proxy)
> +		action = "http://%s%s" %(server, action)
> +	else:
> +		conn = httplib.HTTPConnection(server)
>   	conn.request("POST", action, body, headers)
>   	response = conn.getresponse()
>   	data = response.read()
> @@ -64,7 +74,7 @@ def oestats_start(server, builder, d):
>   	# send report
>   	id = ""
>   	try:
> -		data = oestats_send(server, "/builds/", {
> +		data = oestats_send(d, server, "/builds/", {
>   			'builder': builder,
>   			'build_arch': bb.data.getVar('BUILD_ARCH', d, True),
>   			'metadata_branch': bb.data.getVar('METADATA_BRANCH', d, True),
> @@ -97,7 +107,7 @@ def oestats_stop(server, d, failures):
>   		status = "Succeeded"		
>
>   	try:
> -		response = oestats_send(server, "/builds/%s/" % id, {
> +		response = oestats_send(d, server, "/builds/%s/" % id, {
>   			'status': status,
>   		})
>   		if status == 'Failed':
> @@ -157,7 +167,7 @@ def oestats_task(server, d, task, status):
>
>   	# send report
>   	try:
> -		response = oestats_send(server, "/tasks/", vars, files)
> +		response = oestats_send(d, server, "/tasks/", vars, files)
>   		if status == 'Failed':
>   			bb.note("oestats: task failed, see http://%s%s" % (server, response))
>   	except:




