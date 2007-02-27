Received: from [64.233.182.190] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HMATP-00021J-WA
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Feb 2007 23:07:04 +0100
Received: by nf-out-0910.google.com with SMTP id l24so322408nfc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2007 14:07:03 -0800 (PST)
Received: by 10.49.13.3 with SMTP id q3mr1467965nfi.1172614022731;
	Tue, 27 Feb 2007 14:07:02 -0800 (PST)
Received: from CUBE ( [82.193.98.4])
	by mx.google.com with ESMTP id p43sm3395205nfa.2007.02.27.14.07.01;
	Tue, 27 Feb 2007 14:07:02 -0800 (PST)
Date: Wed, 28 Feb 2007 00:07:12 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1472918034.20070228000712@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <45E4A553.2060004@dominion.kabel.utwente.nl>
References: <407130732.20070227223500@gmail.com>
	<1172609341.28406.169.camel@localhost.localdomain>
	<1828813817.20070227233137@gmail.com>
	<45E4A553.2060004@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: [RFC] base_less_or_equal() for numerical value testing in OE
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
X-List-Received-Date: Tue, 27 Feb 2007 22:07:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Tuesday, February 27, 2007, 11:40:35 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Paul Sokolovsky schreef:

>>   Well, that's good explanation from the point of view of birbake's
>> limitation we (still) have, but I'd like to approach from another side -
>> of what usecases we face. So, there was one case when
>> base_conditional() was used for checking ROM size too,

> Checking for ROM size is bogus, since you can't write to it anyway, and should be removed.
> I suspect you mean 'flash size'.

  Sure. ROOT_FLASH_SIZE is the parameter being checked. And I hope
layman's using of "ROM" and "Flash" as synonyms won't confuse real pro's.
In particular, I hope that if a vendor with mask-ROM based design will
review OE as their software integration solution, the fact that the
parameter is called "ROOT_FLASH_SIZE", won't make them think they
can't be served by OE ;-).


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



