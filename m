Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MhhWd-0007pi-5Z for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 12:20:43 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MhhEq-000566-Np
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 12:02:20 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2009 12:02:20 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2009 12:02:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 30 Aug 2009 12:01:56 +0200
Message-ID: <h7dimk$86n$1@ger.gmane.org>
References: <1251582336-3324-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1251582336-3324-1-git-send-email-raj.khem@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] base.bbclass: Pass in PATH to popen.
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
X-List-Received-Date: Sun, 30 Aug 2009 10:20:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29-08-09 23:45, Khem Raj wrote:
> On Mac OSX its not able to find md5sum if
> path is not passed to os.popen shell.
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>

This fixes a host of other bugs as well

Acked-by: Koen Kooi <koen@openembedded.org>



> ---
>   classes/base.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 97ccf5d..d29ba4b 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -84,7 +84,7 @@ def base_chk_file(parser, pn, pv, src_uri, localpath, data):
>
>       # call md5(sum) and shasum
>       try:
> -        md5pipe = os.popen('md5sum ' + localpath)
> +	md5pipe = os.popen('PATH=%s md5sum %s' % (bb.data.getVar('PATH', data, True), localpath))
>           md5data = (md5pipe.readline().split() or [ "" ])[0]
>           md5pipe.close()
>       except OSError:




