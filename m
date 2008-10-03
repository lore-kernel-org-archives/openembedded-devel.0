Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Klf1P-0006sx-4z
	for openembedded-devel@openembedded.org; Fri, 03 Oct 2008 09:24:19 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1KlexH-0007Kz-3d
	for openembedded-devel@openembedded.org; Fri, 03 Oct 2008 07:20:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 03 Oct 2008 07:20:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 03 Oct 2008 07:20:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 03 Oct 2008 09:15:07 +0200
Message-ID: <gc4gpr$8ho$2@ger.gmane.org>
References: <87myhocttc.fsf@neumann.lab.ossystems.com.br>	<gc2vid$bro$1@ger.gmane.org>
	<87k5cqwr4r.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <87k5cqwr4r.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: firefox 3.0.1 issues
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
X-List-Received-Date: Fri, 03 Oct 2008 07:24:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03-10-2008 00:48, Otavio Salvador wrote:
> Koen Kooi<k.kooi@student.utwente.nl>  writes:
>
>> On 01-10-2008 15:45, Otavio Salvador wrote:
>>> Hello,
>>>
>>> I've found few issues with Firefox 3.0.1. Those are:
>>>
>>>    - lack of theme icons (arrows and like)
>> Actually, what I assumed to be some new-fangled GUI is a case of
>> missing icons[1]. So, yes, every OE built FF3 is missing those icons.
>
> Exactly. Talking to Kalev Lember at #oe he suggested few changes to
> mozconfig he has using and those did fix this problem here. Dunno
> which one is the real fix...

The image decoders bit already went in yesterday

regards,

Koen

>
> diff --git a/packages/mozilla/firefox-3.0.1/mozconfig b/packages/mozilla/firefox-3.0.1/mozconfig
> index cd09716..06295ad 100644
> --- a/packages/mozilla/firefox-3.0.1/mozconfig
> +++ b/packages/mozilla/firefox-3.0.1/mozconfig
> @@ -23,6 +23,7 @@ ac_add_options --disable-ldap
>   ac_add_options --disable-mathml
>   ac_add_options --disable-jsd
>   ac_add_options --disable-installer
> +ac_add_options --disable-updater
>   ac_add_options --disable-xprint
>   ac_add_options --disable-necko-disk-cache
>
> @@ -32,12 +33,14 @@ ac_add_options --enable-necko-small-buffers
>   # disable debug logging and tests
>   #ac_add_options --disable-dtd-debug
>   ac_add_options --disable-logging
> +ac_add_options --disable-debug
>   ac_add_options --disable-gtktest
>   ac_add_options --disable-tests
> -ac_add_options --disable-printing
> +#ac_add_options --disable-printing
>   ac_add_options --disable-gnomevfs
>   ac_add_options --disable-gnomeui
> -ac_add_options --enable-debugger-info-modules
> +#ac_add_options --enable-debugger-info-modules
> +ac_add_options --disable-crashreporter
>
>   # build crypto module (PSM + NSS)
>   ac_add_options --enable-crypto
> @@ -46,7 +49,7 @@ ac_add_options --enable-crypto
>   ac_add_options --enable-necko-protocols=http,file,res,ftp,about,viewsource
>
>   # build minimal set of image decoders
> -ac_add_options --enable-image-decoders=png,gif,jpeg
> +#ac_add_options --enable-image-decoders=png,gif,jpeg
>
>   #ac_add_options --enable-reorder
>   #ac_add_options --enable-elf-dynstr-gc
> @@ -54,7 +57,7 @@ ac_add_options --enable-image-decoders=png,gif,jpeg
>   # enable static build
>   #ac_add_options --disable-shared
>   #ac_add_options --enable-static
> -ac_add_options --enable-optimize=-O2
> +#ac_add_options --enable-optimize=-O2
>
>   # Use cairo from system
>   ac_add_options --enable-system-cairo
>
>




