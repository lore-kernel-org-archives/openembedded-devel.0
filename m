Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1ODuGp-0004cv-E3
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 08:57:48 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 928AE491289
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 08:53:50 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 17 May 2010 08:55:25 +0200
Message-ID: <4BF0E7FE.4000306@dresearch.de>
Date: Mon, 17 May 2010 08:53:50 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 17 May 2010 06:55:25.0886 (UTC)
	FILETIME=[ED985DE0:01CAF58D]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: policy for application specific config files?
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
X-List-Received-Date: Mon, 17 May 2010 06:57:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Is there a policy to handle application specific config files?

Let's say we've this situation: A service (let's say rsyslog)
is started with a parameter telling it the config file to use.
The name of the config file can be set using a variable CONFFILE
in file /etc/default/rsyslog which can be overwritten for distros
or machines easy.

But i like to use specific config files for different applications
(represented by extra recipes/packages).

A solution could be to modify /etc/default/rsyslog in a way that
it looks for other files existing in e.g. /etc/rsyslog.d and
sourcing them all after it's own code. So the other packages can
install files into this dir allowing to redefine CONFFILE without
interfering with the files from rsyslog package.

Is this the way it goes?

Regards,
Steffen



