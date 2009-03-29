Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LntXc-0007J7-5z
	for openembedded-devel@openembedded.org; Sun, 29 Mar 2009 13:51:04 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LntVg-0003jC-Ab
	for openembedded-devel@openembedded.org; Sun, 29 Mar 2009 11:49:04 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 29 Mar 2009 11:49:04 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 29 Mar 2009 11:49:04 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 29 Mar 2009 13:48:50 +0200
Message-ID: <gqnn72$f5t$1@ger.gmane.org>
References: <1237150071-24115-1-git-send-email-mad_soft@inbox.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090322 Shredder/3.0b3pre
In-Reply-To: <1237150071-24115-1-git-send-email-mad_soft@inbox.ru>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH/RFC] base-files: add noatime to rootfs mount options
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
X-List-Received-Date: Sun, 29 Mar 2009 11:51:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-03-09 21:47, Dmitry Artamonow wrote:
> In most machines' fstabs rootfs mounted with 'defaults' option.
> This implies that atime logging is on - i.e. on every read from
> filesystem kernel writes atime stamp to files' metadata.
> Here in embedded world, where rootfs is usually stored on some
> kind of flash (internal NAND/NOR, or external SD/MMC/CF card)
> it is a real problem, because higher number of writes causes
> flash wearing, higher system load and higher chance of filesystem
> corruption.
>
> Fix it by adding noatime to rootfs mount options in fstab.

Isn't 'relatime' a better option?

regards,

Koen



