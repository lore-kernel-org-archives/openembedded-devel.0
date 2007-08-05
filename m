Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IHZ7G-0005PF-Rk
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2007 07:57:26 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 7939B28C014; Sun,  5 Aug 2007 07:52:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180134222.adsl.alicedsl.de [85.180.134.222])
	by srv043.dedi23.de (Postfix) with ESMTP id AE7CF28C013
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Aug 2007 07:52:54 +0200 (CEST)
Date: Sun, 5 Aug 2007 07:55:08 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1974151763.20070805075508@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46B1E063.7010407@dominion.kabel.utwente.nl>
References: <46B1753D.1090507@dominion.kabel.utwente.nl>
	<46B1B6DB.6020603@klever.net>
	<1186053831.5972.222.camel@hammer.suse.cz>
	<46B1C71F.2090608@klever.net>
	<1186058282.5972.232.camel@hammer.suse.cz>
	<46B1D0DA.5030905@balister.org>
	<1186061255.5972.243.camel@hammer.suse.cz>
	<46B1E063.7010407@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: Gstreamer and rpath
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
X-List-Received-Date: Sun, 05 Aug 2007 05:57:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Stanislav Brabec schreef:
>> Philip Balister wrote:
>> 
>>> Is --sysroot present in all versions of gcc? If not, which version does 
>>> it first appear?
>> 
>> 3.3.3 has not it yet.
>> 
>> gcc/ChangeLog.2005:
>> 2005-07-25  Mark Mitchell  <mark@codesourcery.com>
>> 
>>       * gcc.c (option_map): Add --sysroot.
>> 
>> Michael Krelin wrote:
>> 
>>> I think starting with 3.4, another reason why this idea maybe not yet
>>> viable...
>> 
>> I see no problem here: For cross compilation OE compiles its own
>> compiler, which already supports --sysroot,

> No. We have a gcc-cross_3.3.3.bb and 3.3.4

I wouldn't mind deprecating these two.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



