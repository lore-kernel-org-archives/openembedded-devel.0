Received: from [212.27.42.30] (helo=smtp4-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1KiBaH-0007NA-47
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Sep 2008 19:21:57 +0200
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id CC3033EA12A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2008 19:18:23 +0200 (CEST)
Received: from sharky.jerryweb.org (vau75-7-82-234-248-119.fbx.proxad.net
	[82.234.248.119])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 580663EA170
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2008 19:18:23 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 7B1EF184050
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2008 19:18:23 +0200 (CEST)
Message-ID: <48D924DF.5080804@bolloretelecom.eu>
Date: Tue, 23 Sep 2008 19:18:23 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.16) Gecko/20080724 Lightning/0.8 Thunderbird/2.0.0.16
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <d1b08f940809230158s78f04a4bq866bf586dce5cafe@mail.gmail.com>	<gbaj23$rup$1@ger.gmane.org>
	<d1b08f940809230842j78a43e64r6f2e43fcecd1f656@mail.gmail.com>
In-Reply-To: <d1b08f940809230842j78a43e64r6f2e43fcecd1f656@mail.gmail.com>
Subject: Re: QA Logs now on tinderbox
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
X-List-Received-Date: Tue, 23 Sep 2008 17:21:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> But...why not fix these two immediately?

I have fixed python-pycairo, the problem here was that setup.py was
re-generating pycairo.pc every single time it was run, so patching the
file with sed did no good.

Instead we now generate pycairo.pc from pycairo.pc.in ourselves using sed.

Will look into Orbit-2.0.pc if I have a moment.

Cheers,
Jeremy


