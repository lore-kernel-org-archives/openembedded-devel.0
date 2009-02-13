Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXviO-0005sh-1c
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 11:56:12 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LXvgz-0000s2-DO
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 10:54:45 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 10:54:45 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 10:54:45 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 13 Feb 2009 11:54:36 +0100
Message-ID: <gn3jhc$j0o$1@ger.gmane.org>
References: <200902131326.19376.roman@khimov.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <200902131326.19376.roman@khimov.ru>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] glibc 2.7 fails to build
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
X-List-Received-Date: Fri, 13 Feb 2009 10:56:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-02-09 11:26, Roman I Khimov wrote:
> Hello.
>
> As I've mentioned some days ago, I'd submitted several bugs via bugzilla and
> as there is zero reaction on it and in general direction to completely stop
> using it, I'm reposting that patches here.

Your patch looks good to go in, but I have a general remark, which will 
save you a lot of trouble:

> /home/rik/work/altell/distro/oe/tmp/staging/i686-linux/usr/include/limits.h:125:26:

Set TARGET_VENDOR (or use angstrom, it does that for you) so the native 
system (i686-linux) and the target (i686-linux) don't share the same 
staging area.

regards,

Koen



