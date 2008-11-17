Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L26MZ-0003Gu-DR
	for openembedded-devel@openembedded.org; Mon, 17 Nov 2008 16:50:08 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L26KH-0002WK-9d
	for openembedded-devel@openembedded.org; Mon, 17 Nov 2008 15:47:45 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 17 Nov 2008 15:47:45 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 17 Nov 2008 15:47:45 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 17 Nov 2008 16:47:36 +0100
Message-ID: <gfs3mo$qef$1@ger.gmane.org>
References: <20081117151909.GG11401@datenfreihafen.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081114 Shredder/3.0b1pre
In-Reply-To: <20081117151909.GG11401@datenfreihafen.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Moving fontconfig cache out of tmpfs
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
X-List-Received-Date: Mon, 17 Nov 2008 15:50:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-11-08 16:19, Stefan Schmidt wrote:
> Hello.
>
> Raster found out a pretty interestesting optimization option.
>
> At the moment we refer to the fontconfig cahc elike this in
> /etc/fonts/fonts.conf:
>
> <cachedir>/var/cache/fontconfig</cachedir>
>
> /var/cache is a symlink to var/volatile/cache which is mounted as tmpfs.
>
> This means that the cache has to regenerated on every boot. This can cost up to
> 20s.
>
> What do people think about pointing this to something not mounted as tmpfs? Any
> problems I'm not aware of?

+1 for pointing it to /var/lib/fontconfig

regards,

Koen



