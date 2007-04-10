Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <k.kooi@student.utwente.nl>) id 1HbOVs-00069V-U4
	for openembedded-devel@openembedded.org; Wed, 11 Apr 2007 00:08:33 +0200
Received: from dominion.dominion.void (dominion.kabel.utwente.nl
	[130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3AM8SLr028032 for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2007 00:08:29 +0200
Received: from www-data by dominion.dominion.void with local (Exim 4.60)
	(envelope-from <k.kooi@student.utwente.nl>) id 1HbOVr-0005xT-GG
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2007 00:08:31 +0200
Received: from 212.41.157.237 ([212.41.157.237]) 
	by dominion.kabel.utwente.nl (IMP) with HTTP 
	for <koen@localhost>; Wed, 11 Apr 2007 00:08:31 +0200
Message-ID: <1176242911.461c0adf69497@dominion.kabel.utwente.nl>
Date: Wed, 11 Apr 2007 00:08:31 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@openembedded.org
References: <E1HZn60-0007Lc-L6@linuxtogo.org>
	<461BA7BA.6020403@kernelconcepts.de>
	<1176220267.461bb26b4be0d@dominion.kabel.utwente.nl>
	<461BB953.7020302@kernelconcepts.de>
In-Reply-To: <461BB953.7020302@kernelconcepts.de>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.6
X-Originating-IP: 212.41.157.237
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev task-sdk-sbox, task-sdk: clean out base sdk packages, they should only contain a toolchain
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2007 22:08:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Quoting Florian Boor <florian.boor@kernelconcepts.de>:

> Hi,
>
> Koen Kooi schrieb:
> > Quoting Florian Boor <florian.boor@kernelconcepts.de>:
>
> > Right, and my changes allow that, you just add tasks *outside* of
> > task-{sdk,sbox}.bb and you get what you want. With your changes peope have
> to
> > *needlessly* *duplicate* task-{sdk,sbox} if they just want a simple
> toolchain
> > (without building 3/4 of OE).
> > So please keep task-{sbox,sdk} clean and generic, otherwise we have
> multiple
> > copies of sdk and sed magic no-one understands enough to maintain.
> > Does my plan sound ok to you?
>
> basically yes - but I would have discussed this before applying these
> changes.
> Our SDK packages always contained more than a basic toolchain and if this
> should
> change we should discuss it before acting and causing needless extra effort.
>
> I'll try to sort things in a way that we get separate SDK packages for each
> purpose and without removing things from existing SDK packages blindly. Maybe
> we
> can move all the magic to the SDK class anyway.

Thanks for looking at it!

regards,

Koen



----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.


