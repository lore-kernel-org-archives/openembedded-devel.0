Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <k.kooi@student.utwente.nl>) id 1HbIch-0003Xb-Oa
	for openembedded-devel@openembedded.org; Tue, 10 Apr 2007 17:51:11 +0200
Received: from dominion.dominion.void (dominion.kabel.utwente.nl
	[130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3AFp6ox002408; Tue, 10 Apr 2007 17:51:06 +0200
Received: from www-data by dominion.dominion.void with local (Exim 4.60)
	(envelope-from <k.kooi@student.utwente.nl>)
	id 1HbIcd-0004aX-D2; Tue, 10 Apr 2007 17:51:07 +0200
Received: from 212.41.157.237 ([212.41.157.237]) 
	by dominion.kabel.utwente.nl (IMP) with HTTP 
	for <koen@localhost>; Tue, 10 Apr 2007 17:51:07 +0200
Message-ID: <1176220267.461bb26b4be0d@dominion.kabel.utwente.nl>
Date: Tue, 10 Apr 2007 17:51:07 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@openembedded.org,
	Florian Boor <florian.boor@kernelconcepts.de>
References: <E1HZn60-0007Lc-L6@linuxtogo.org>
	<461BA7BA.6020403@kernelconcepts.de>
In-Reply-To: <461BA7BA.6020403@kernelconcepts.de>
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
X-List-Received-Date: Tue, 10 Apr 2007 15:51:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Quoting Florian Boor <florian.boor@kernelconcepts.de>:

> Hi,
>
> koen commit schrieb:
> > task-sdk-sbox, task-sdk: clean out base sdk packages, they should only
> contain a toolchain
>
> I disagree about this as well - if you want a single toolchain please create
> a
> toolchain package. These ones are intended to provide a full SDK.
> I see the need for what you intended to do but don't do it in this way.
> What we should do is to have a set of SDKs that provide both toolchain and
> libraries and packages with only a basic toolchain.

Right, and my changes allow that, you just add tasks *outside* of
task-{sdk,sbox}.bb and you get what you want. With your changes peope have to
*needlessly* *duplicate* task-{sdk,sbox} if they just want a simple toolchain
(without building 3/4 of OE).
So please keep task-{sbox,sdk} clean and generic, otherwise we have multiple
copies of sdk and sed magic no-one understands enough to maintain.
Does my plan sound ok to you?

regards,

Koen

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.


