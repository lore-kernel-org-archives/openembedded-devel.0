Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LEjlL-0000im-SQ
	for openembedded-devel@openembedded.org; Mon, 22 Dec 2008 13:19:55 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LEjgd-000879-2L
	for openembedded-devel@openembedded.org; Mon, 22 Dec 2008 12:15:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 22 Dec 2008 12:15:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Dec 2008 12:15:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Dec 2008 13:11:05 +0100
Message-ID: <gio04p$i9p$1@ger.gmane.org>
References: <20081222100950.GA2135@buddha.tw.openmoko.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081217 Shredder/3.0b2pre
In-Reply-To: <20081222100950.GA2135@buddha.tw.openmoko.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Please review john_lee/openmoko-merges again
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
X-List-Received-Date: Mon, 22 Dec 2008 12:19:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-12-08 11:09, John Lee wrote:
> Hi,
>
> I have reduced this to just 5 commits.  Most of them should be okay
> except I'm not sure about this one:
>
> commit 4d6693ebd979092a747a66cb1828b8b4af452b28
> Author: Erin Yueh<erin_yueh@openmoko.com>
> Date:   Tue Dec 2 13:57:18 2008 +0800
>
>      obexpush_1.0.0.bb: add opd_args file to append arguments for starting
>      opd
>
> Please review and comment, thank you!

I don't think pointing a daemon to a user homedir is acceptable 
behaviour, much less pointing it /home/root.

Would /var/tmp/obexpush be an acceptable path?

regards,

Koen



