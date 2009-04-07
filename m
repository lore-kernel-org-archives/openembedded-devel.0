Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Lr7Zx-0008CH-P8
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 11:26:52 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Lr7X7-0005L8-U0
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 10:23:54 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1Lr7X7-0006Vj-LB
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 10:23:53 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90904061449s1cc1c4e6pb1c04f2c71cc6beb@mail.gmail.com>
References: <49DA2F2C.60008@bolloretelecom.eu>
	<19c1b8a90904061449s1cc1c4e6pb1c04f2c71cc6beb@mail.gmail.com>
Date: Tue, 07 Apr 2009 10:23:53 +0100
Message-Id: <1239096233.16991.525.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] make "LDFLAGS ignored" QA errors fatal
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
X-List-Received-Date: Tue, 07 Apr 2009 09:26:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-04-06 at 14:49 -0700, Khem Raj wrote:
> I think we should configure toolchain to pass this flags by gcc driver
> while linking instead of making it a part of LDFLAGS it should help in
> recipes which use gcc to link.

I'm not sure what that would really buy us.  Unless we're going to
abandon LDFLAGS altogether then all the packages that are broken today
would still be broken, it's just that you'd notice the breakage less
often.  Plus, it would presumably mean that any changes to the value of
this flag would require a gcc rebuild, which seems like it'd be
annoying.

p.




