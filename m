Received: from [66.249.82.226] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HfzrK-0002N5-2g
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2007 16:49:42 +0200
Received: by wx-out-0506.google.com with SMTP id t14so1741631wxc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Apr 2007 07:49:41 -0700 (PDT)
Received: by 10.70.111.2 with SMTP id j2mr10055364wxc.1177329190931;
	Mon, 23 Apr 2007 04:53:10 -0700 (PDT)
Received: from cube ( [82.193.98.7])
	by mx.google.com with ESMTP id j7sm9251930nzd.2007.04.23.04.53.09;
	Mon, 23 Apr 2007 04:53:10 -0700 (PDT)
Date: Mon, 23 Apr 2007 14:53:08 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1810046333.20070423145308@gmail.com>
To: Jamie Lenehan <lenehan@twibble.org>
In-Reply-To: <20070419014949.GA6540@twibble.org>
References: <1176760923.4623f25b913f9@dominion.kabel.utwente.nl>
	<20070418090235.GA21841@twibble.org>
	<46262A0F.1050805@dominion.kabel.utwente.nl>
	<20070419014949.GA6540@twibble.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Making /var/lib persistent
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Apr 2007 14:49:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Jamie,

Thursday, April 19, 2007, 4:49:50 AM, you wrote:

> On Wed, Apr 18, 2007 at 07:24:15AM -0700, Koen Kooi wrote:
> [...]
>> Sound like a good idea, do you have a patch for this?

> Try this out:

>   http://twibble.org/dist/oe/var-volatiles-1.patch

> I've tested it locally both with and without tmpfs mounted on
> /var/volatile and all seems to work as expected.

        I tried this with Angstrom builds, seems to work OK either.

> I modified the base-files recipe to create the /var/volatile

        The only concern is all this override files patchery. I wish
we had for fstab the same machinery as for autoconf site files -
ability to merge standard template with per-machine overrides. But
well, lack of such shouldn't be cause of delay with this patch, hope
to see it soon in mainline!

[]


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



