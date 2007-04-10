Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1HbJ5S-0004Km-61
	for openembedded-devel@openembedded.org; Tue, 10 Apr 2007 18:20:54 +0200
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50)
	id 1HbJOj-0002qe-PE; Tue, 10 Apr 2007 18:40:49 +0200
Message-ID: <461BB953.7020302@kernelconcepts.de>
Date: Tue, 10 Apr 2007 18:20:35 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
MIME-Version: 1.0
To: Koen Kooi <k.kooi@student.utwente.nl>
References: <E1HZn60-0007Lc-L6@linuxtogo.org>
	<461BA7BA.6020403@kernelconcepts.de>
	<1176220267.461bb26b4be0d@dominion.kabel.utwente.nl>
In-Reply-To: <1176220267.461bb26b4be0d@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.0.0
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Tue, 10 Apr 2007 16:20:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Koen Kooi schrieb:
> Quoting Florian Boor <florian.boor@kernelconcepts.de>:

> Right, and my changes allow that, you just add tasks *outside* of
> task-{sdk,sbox}.bb and you get what you want. With your changes peope have to
> *needlessly* *duplicate* task-{sdk,sbox} if they just want a simple toolchain
> (without building 3/4 of OE).
> So please keep task-{sbox,sdk} clean and generic, otherwise we have multiple
> copies of sdk and sed magic no-one understands enough to maintain.
> Does my plan sound ok to you?

basically yes - but I would have discussed this before applying these changes.
Our SDK packages always contained more than a basic toolchain and if this should
change we should discuss it before acting and causing needless extra effort.

I'll try to sort things in a way that we get separate SDK packages for each
purpose and without removing things from existing SDK packages blindly. Maybe we
can move all the magic to the SDK class anyway.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


