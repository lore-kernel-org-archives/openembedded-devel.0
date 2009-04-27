Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LySus-0001il-FL
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 17:38:47 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LySpz-0007Ke-Vp
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 15:33:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 27 Apr 2009 15:33:43 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 27 Apr 2009 15:33:43 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 27 Apr 2009 17:33:31 +0200
Message-ID: <gt4j8d$u5m$1@ger.gmane.org>
References: <20090427141943.GG18788@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090421 Shredder/3.0b3pre
In-Reply-To: <20090427141943.GG18788@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Mon, 27 Apr 2009 15:38:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-04-09 16:19, Tom Rini wrote:
> Hey all.  I've created a new branch, trini/add-libc-overrides which does
> the following:
> - Make every distro declare PREFERRED_LIBC, either outright or
>    overridable.

ACK on the idea, NACK on the implementation.

ANGSTROMLIBC is called ANGSTROMLIBC and not ANGSTROM_LIBC for a reason, 
since you can't pass env vars with underscores throught bitbake: 
http://lists.linuxtogo.org/pipermail/openembedded-devel/2008-December/007258.html

I've shown the PREFERRED_LIBC thing in the past to other OE core 
developers as an example of the mindless copy/paste/rename process in 
angstrom clones. Don't clone if you don't know what you are doing.

So please keep things you want to override in buildscripts (e.g. 
machine, libc, distro) underscore free :)

regards,

Koen



