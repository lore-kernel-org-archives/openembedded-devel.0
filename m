Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MBVH3-0004MJ-NF
	for openembedded-devel@openembedded.org; Tue, 02 Jun 2009 16:47:33 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MBV8Q-00077t-Te
	for openembedded-devel@openembedded.org; Tue, 02 Jun 2009 14:38:39 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 02 Jun 2009 14:38:38 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 02 Jun 2009 14:38:38 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 02 Jun 2009 16:38:28 +0200
Message-ID: <h03dh4$c4q$1@ger.gmane.org>
References: <5e088bd90906020626m6f180330w61f7ab77391737da@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090526 Shredder/3.0b3pre
In-Reply-To: <5e088bd90906020626m6f180330w61f7ab77391737da@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: guile-native (as well as a few others) failing after pull last night
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
X-List-Received-Date: Tue, 02 Jun 2009 14:47:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-06-09 15:26, Steve Sakoman wrote:
> The failures are all in do_configure and seem quite similar (see log below).
>
> I tried wiping tmp, same failure.
>
> I'm an autotools idiot :-(  Any suggestions?

 > | configure.in:795: error: possibly undefined macro: AM_GNU_GETTEXT

That implies that gettext-native hasn't been staged yet.

regards,

Koen



