Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lp0jx-0000Yj-1d
	for openembedded-devel@openembedded.org; Wed, 01 Apr 2009 15:44:25 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lp0hi-0007yh-Fh
	for openembedded-devel@openembedded.org; Wed, 01 Apr 2009 13:42:06 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 01 Apr 2009 13:42:06 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 01 Apr 2009 13:42:06 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 01 Apr 2009 15:41:55 +0200
Message-ID: <gqvqv3$ng0$1@ger.gmane.org>
References: <1238452829.7128.4.camel@alap>
	<gqsel4$g9v$1@ger.gmane.org>	<1238511677.7128.86.camel@alap>
	<20090331221450.GA31451@denix.org> <1238591292.7128.137.camel@alap>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <1238591292.7128.137.camel@alap>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] add hotplug2 package
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
X-List-Received-Date: Wed, 01 Apr 2009 13:44:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-04-09 15:08, Angus Ainslie wrote:

> Weird, I was sure I'd tried it that way the first time. Here's the
> updated recipe.

+RPROVIDES_${PN} = "hotplug"
+RREPLACES_${PN} = "udev"

What happens if both hotplug2 and udev and in deploy and I want to 
install udev? I suspect it will silently select hotplug2, which is not 
what we want.

So: NAK

regards,

Koen



