Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NBUaB-0005kj-L8 for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 15:35:34 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NBUYq-0005Lb-7j
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 15:34:08 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 15:34:08 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 15:34:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 20 Nov 2009 15:33:44 +0100
Message-ID: <he69c8$h0c$1@ger.gmane.org>
References: <he689r$c57$1@ger.gmane.org> <4B06A6A7.1080204@SSpaeth.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <4B06A6A7.1080204@SSpaeth.de>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: MACHINE_FEATURE changes
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
X-List-Received-Date: Fri, 20 Nov 2009 14:35:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20-11-09 15:24, Sebastian Spaeth wrote:
> Koen Kooi wrote:
>> Can someone please explain to me what
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=1bfa409a3a28cee60c4800d3caf33ce3f100d4ca
>> is trying to accomplish? It looks like this makes task-base unusable on
>> om-gta0X, am I right?
>
> FSO/SHR based distros use fso-apm rather than "apm".
> Using PROVIDES in fso-apm however means that it's pulled into other
> distros too.

Which we do not want.

> We could do this with a virtual/apm but that would mean we need to set a
> preferred provider for all other distros too.

So instead you just broke all other distros.

> So the least intrusive change seemed to remove apm from om-gtaX.

Except that you just broke all other distros.

> Mickey (informally) agreed with me, and as this change is very limited
> in scope, it went in. It is more distro than machine-specific I have to
> admit.
>
> Better suggestions on how to achieve this are welcome.

Change task-base and task-boot to use APM =? "apm" and set APM = 
"fso-apm" in your distro.

Please revert the cset since it breaks every distro except SHR[1].

annoyed,

Koen



