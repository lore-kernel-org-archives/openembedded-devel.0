Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kt1vH-00023m-FG
	for openembedded-devel@openembedded.org; Thu, 23 Oct 2008 17:16:27 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kt1ul-0007c4-OK
	for openembedded-devel@openembedded.org; Thu, 23 Oct 2008 15:15:55 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 23 Oct 2008 15:15:55 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Oct 2008 15:15:55 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 23 Oct 2008 17:15:46 +0200
Message-ID: <gdq4f3$sff$1@ger.gmane.org>
References: <20081023124116.GA15082@datenfreihafen.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081022 Shredder/3.0b1pre
In-Reply-To: <20081023124116.GA15082@datenfreihafen.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Pidgin needs to RDEPENDS on pidgin-data?
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
X-List-Received-Date: Thu, 23 Oct 2008 15:16:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-10-2008 14:41, Stefan Schmidt wrote:
> Hello.
>
> I have a user bug report here that pidgin segfaults without pidgin-data
> installed:
> http://trac.freesmartphone.org/ticket/170
>
> In pidgin.inc it only RRECOMMANDS pidgin-data, but not RDEPENDS on it.
> Patch below is what I would push if nobody objects.

Actually...


> regards
> Stefan Schmidt
>
> diff --git a/packages/pidgin/pidgin.inc b/packages/pidgin/pidgin.inc
> index db66d13..e3c35a7 100644
> --- a/packages/pidgin/pidgin.inc
> +++ b/packages/pidgin/pidgin.inc
> @@ -44,7 +44,7 @@ FILES_finch-dbg     = "${bindir}/.debug/finch \
>
>   FILES_${PN} = "${bindir} ${datadir}/${PN} ${libdir}/${PN}/*.so \
>   	       ${datadir}/applications"
> -RRECOMMENDS_${PN{ += "${PN}-data "

Typo alert! it's ${PN} (note the closing bracket)

> +RDEPENDS_${PN{ += "${PN}-data "

Another typo alert!

>   FILES_${PN}-data = "${datadir}/pixmaps ${datadir}/sounds ${datadir}/icons"
>   FILES_${PN}-dev += "${libdir}/${PN}/*.la"




