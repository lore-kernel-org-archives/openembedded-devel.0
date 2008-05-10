Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JuoD3-0002KZ-TK
	for openembedded-devel@openembedded.org; Sat, 10 May 2008 14:29:53 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JuoC4-0004qk-GS
	for openembedded-devel@openembedded.org; Sat, 10 May 2008 12:28:52 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 10 May 2008 12:28:52 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 10 May 2008 12:28:52 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 10 May 2008 14:28:39 +0200
Message-ID: <g044dn$kot$1@ger.gmane.org>
References: <200805080215.23729.zecke@selfish.org>	<200805081306.37230.zecke@selfish.org>	<1210246170.5006.34.camel@dax.rpnet.com>
	<200805101405.38789.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a1pre (Macintosh/2008042803)
In-Reply-To: <200805101405.38789.zecke@selfish.org>
Sender: news <news@ger.gmane.org>
Cc: bitbake-dev@lists.berlios.de
Subject: Re: Creating a pristine environment?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Sat, 10 May 2008 12:29:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Holger Freyther wrote:

> Okay. I added an option, I clean the environment after having parsed the
> configuration. This means everything used from conf/local.conf (TOPDIR,
> BBPATH, BBFILES, MACHINE...) will be inside the configuration data of bitbake
> but not be exported.

Implementation question: who will fix all the shell based functions in 
OE that rely on things like MACHINE being exported?

regards,

Koen



