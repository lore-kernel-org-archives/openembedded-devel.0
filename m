Received: from [64.233.182.189] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H42G6-0002Ew-90
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jan 2007 22:42:22 +0100
Received: by nf-out-0910.google.com with SMTP id l24so8802859nfc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jan 2007 13:40:41 -0800 (PST)
Received: by 10.49.13.14 with SMTP id q14mr29563709nfi.1168292441603;
	Mon, 08 Jan 2007 13:40:41 -0800 (PST)
Received: from CUBE ( [82.193.96.238])
	by mx.google.com with ESMTP id x1sm108517797nfb.2007.01.08.13.40.40;
	Mon, 08 Jan 2007 13:40:41 -0800 (PST)
Date: Mon, 8 Jan 2007 23:40:54 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <837928192.20070108234054@gmail.com>
To: Marcin Juszkiewicz <openembedded@hrw.one.pl>
In-Reply-To: <200701082227.08898.openembedded@hrw.one.pl>
References: <200701082227.08898.openembedded@hrw.one.pl>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: get rid of virtual/libsdl
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
X-List-Received-Date: Mon, 08 Jan 2007 21:42:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Marcin,

Monday, January 8, 2007, 11:27:08 PM, you wrote:

> I see more and more reports where people has problems with building SDL
> stuff just because they have 'virtual/libsdl == libsdl-qpe' in build 
> config. We all know that libsdl-qpe is set of hacks applied to hacks 
> which evolved from other hacks and thats that all is in state which no
> one want to have something to do. No one ever sent parts of it upstream,
> no one tried to update it to more recent SDL version etc.

> I would like to have one small change in OE: removal of virtual/libsdl at
> all or some kind of other change which would mark libsdl-qpe as not 
> providing virtual/libsdl at all. 

> Most of SDL stuff in OE builds without problem with libsdl-x11 and most of
> them even works when user with libsdl-qpe tries to use it. But if someone
> tries to build SDL apps with libsdl-qpe then he is hit with linking 
> problems, with '-no-rtti/-rtti' problem etc. I'm tired of it.


  Well, that was one of questions I had in mind: why there're separate
builds of SDL apps for GPE and OPIE - it would be kinda natural to expect
SDL ABI to be the same on both.

  But of course it would be nice if this RFC would let for some time
to do such testing.


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



