Received: from [64.233.182.189] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H42ar-0002q2-MY
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jan 2007 23:03:49 +0100
Received: by nf-out-0910.google.com with SMTP id l24so8807820nfc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jan 2007 14:02:04 -0800 (PST)
Received: by 10.49.36.6 with SMTP id o6mr22048308nfj.1168293724528;
	Mon, 08 Jan 2007 14:02:04 -0800 (PST)
Received: from CUBE ( [82.193.96.238])
	by mx.google.com with ESMTP id r33sm108747627nfc.2007.01.08.14.02.03;
	Mon, 08 Jan 2007 14:02:03 -0800 (PST)
Date: Tue, 9 Jan 2007 00:02:15 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1809961602.20070109000215@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45A2BBB0.4070607@dominion.kabel.utwente.nl>
References: <200701082227.08898.openembedded@hrw.one.pl>
	<45A2BBB0.4070607@dominion.kabel.utwente.nl>
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 08 Jan 2007 22:03:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,


> Marcin Juszkiewicz schreef:
>> I see more and more reports where people has problems with building SDL 
>> stuff just because they have 'virtual/libsdl == libsdl-qpe' in build 

[]

> move libsql-qpe to packages/obsolete/libsdl/, that way people that want it can still build
> it and innocent bystanders don't get hit by the issues you mentioned.

  Isn't that too much of action for the original problem of people
selecting it to build SDL apps and having problems due to this?
There's nothing wrong with libsdl-qpe per se (patching matter is
highly subjective), it's just the SDL implementation for OPIE/QTopia.

  So if it's considered harmful to build against it, let's kill any
virtual/libsdl source-package overrides using it. But both libsdl-x11
and libsdl-qpe should RPROVIDE same virtual package to the package
manager.


> regards,

> Koen


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



