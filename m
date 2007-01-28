Received: from [64.233.182.190] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HBII6-0004ko-ML
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Jan 2007 23:14:26 +0100
Received: by nf-out-0910.google.com with SMTP id l24so1697691nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jan 2007 14:14:25 -0800 (PST)
Received: by 10.49.41.18 with SMTP id t18mr8449952nfj.1170022464887;
	Sun, 28 Jan 2007 14:14:24 -0800 (PST)
Received: from CUBE ( [82.193.96.236])
	by mx.google.com with ESMTP id n22sm20602299nfc.2007.01.28.14.14.24;
	Sun, 28 Jan 2007 14:14:24 -0800 (PST)
Date: Mon, 29 Jan 2007 00:14:24 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <153772577.20070129001424@gmail.com>
To: Phil Blundell <pb@reciva.com>
In-Reply-To: <1170022193.4354.0.camel@mebius.reciva.com>
References: <E1HBHQ2-0002RA-CZ@linuxtogo.org>
	<492827442.20070128233041@gmail.com>
	<1170022193.4354.0.camel@mebius.reciva.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev package.bbclass: remove directories named in FILES from image after file
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
X-List-Received-Date: Sun, 28 Jan 2007 22:14:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Phil,

Monday, January 29, 2007, 12:09:52 AM, you wrote:

> There shouldn't be any non-empty dirs.  If you're encountering some,
> that must be a bug.  Do you have a testcase?

  Sure: I create a new .bb and just debug packaging. I'd prefer it
didn't throw Python exception in my face ;-). Or: I'm sure there're
few .bb which don't package all the stuff which is installed by
"make install". One such example is busybox, which creates hoards of
symlinks, but we don't packages (all of) them, instead relying on
update-alternatives.

> p.

> On Sun, 2007-01-28 at 23:30 +0200, Paul Sokolovsky wrote:
>> Hello Phil,
>> 
>>       What's the idea behind this change? How would if handle non-empty
>> dirs?
>> 
>> 
>> This is a forwarded message
>> From: pb commit <openembedded-commits@lists.openembedded.org>
>> To: openembedded-commits@lists.openembedded.org
>> Date: Sunday, January 28, 2007, 11:18:34 PM
>> Subject: [oe-commits] org.oe.dev package.bbclass: remove directories named in FILES from image after file
>> 
>> ===8<==============Original message text===============
>> package.bbclass: remove directories named in FILES from image after file 
>> migration
>>
 
[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



