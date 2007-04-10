Received: from [66.249.82.225] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HbI2p-0007f2-Ld
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2007 17:14:09 +0200
Received: by wx-out-0506.google.com with SMTP id t14so1737005wxc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2007 08:14:06 -0700 (PDT)
Received: by 10.90.34.3 with SMTP id h3mr5403722agh.1176218046054;
	Tue, 10 Apr 2007 08:14:06 -0700 (PDT)
Received: from cube ( [82.193.98.4])
	by mx.google.com with ESMTP id e1sm11775467nzd.2007.04.10.08.14.01;
	Tue, 10 Apr 2007 08:14:03 -0700 (PDT)
Date: Tue, 10 Apr 2007 18:14:12 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1704526428.20070410181412@gmail.com>
To: "Mike (mwester)" <mwester@dls.net>
In-Reply-To: <009901c77b80$b9b02e70$6e01a8c0@twilight>
References: <evcm2e$15q$1@sea.gmane.org>
	<1176155636.5842.25.camel@localhost.localdomain>
	<432beae0704091515n6a55a294jfdf64c9e855b9537@mail.gmail.com>
	<3ef3a7ad0704100602v610f6c10k447a1551f79ca750@mail.gmail.com><1176215946.5809.90.camel@localhost.localdomain>
	<461BA347.5060908@gmail.com>
	<009901c77b80$b9b02e70$6e01a8c0@twilight>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: OE a deterministic build system?
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
X-List-Received-Date: Tue, 10 Apr 2007 15:14:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Mike,

Tuesday, April 10, 2007, 5:58:40 PM, you wrote:

>>> Can someone make sanity.bbclass detect dash and exit with a
>>> warning/error? :)
>>
>> Probably better is to make bash-native and depend on it?
>> (or ash)
>> Just curious.

> Ack!

  I bet you meant "Nak!".

> OE already builds a lot of stuff natively -- there's no need to slow
> builds done even more by building something natively that one should be able
> to presume exists on every reasonable build machine.  I think if a build
> machine has gcc, it shouldn't be too much more difficult to expect a working
> bash as well, IMO.

  Sure, it makes no sense to *depend* on them. But it would make sense
to still has comprehensive set of *-native recipes, and make sanity.bb
to be smart enough to suggest user that one could build *-native thing
manually as one way to resolve missing build-time dependency. (No, I
don't think that sanity.bb should be smartass and build missing things
itself - user should request that explicitly).

> Mike (mwester)


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



