Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K3BhC-0006uY-S4
	for openembedded-devel@openembedded.org; Mon, 02 Jun 2008 17:11:38 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K3Bd0-00063d-8b
	for openembedded-devel@openembedded.org; Mon, 02 Jun 2008 15:07:18 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 02 Jun 2008 15:07:18 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 02 Jun 2008 15:07:18 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 02 Jun 2008 17:07:10 +0200
Message-ID: <g212at$qtm$1@ger.gmane.org>
References: <20080531171735.3C118189300@amethyst.openembedded.net>
	<200806021649.15159.mickey@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008052003)
In-Reply-To: <200806021649.15159.mickey@vanille-media.de>
Sender: news <news@ger.gmane.org>
Subject: Re: org.oe.dev dbus 1.2.1: fix pidfile location
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 02 Jun 2008 15:11:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
> On Saturday 31 May 2008 19:17:35 koen commit wrote:
>> dbus 1.2.1: fix pidfile location
>
> I'm afraid this patch breaks restartability which I fixed a couple of weeks
> ago. Can you double check whether you can use the init script and restart
> dbus still works?

Heh :) The fix makes this work for me:

/etc/init.d/dbus-1 stop ; /etc/init.d/dbus-1 start

Is that what you meant?

regards,

Koen





