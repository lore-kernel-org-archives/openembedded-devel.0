Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NIkLk-0006JA-BB
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2009 15:50:39 +0100
Received: from hiob.intern.dresearch.de (unknown [10.32.0.138])
	by mail.dresearch.de (Postfix) with ESMTP id 592F4491278
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2009 15:48:56 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 10 Dec 2009 15:50:09 +0100
Message-ID: <4B210A50.7060900@dresearch.de>
Date: Thu, 10 Dec 2009 15:48:48 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 10 Dec 2009 14:50:09.0756 (UTC)
	FILETIME=[120981C0:01CA79A8]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: more than one init script in one package?
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
X-List-Received-Date: Thu, 10 Dec 2009 14:50:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Just a short question. Is it possible to install more than one
initscript in one package? And what's the right way to define this in
a recipe.

I tried

  INITSCRIPT_PACKAGES = "myinit1 myinit2"
  INITSCRIPT_NAME_myinit1 = "myinit1"
  INITSCRIPT_NAME_myinit2 = "myinit2"
  INITSCRIPT_PARAMS_myinit1 = "start 02 5 2 . stop 20 0 1 6 ."
  INITSCRIPT_PARAMS_myinit2 = "start 02 5 2 . stop 20 0 1 6 ."

in mytry-1.2.3.bb but this does not create the wanted links. :(

Steffen




