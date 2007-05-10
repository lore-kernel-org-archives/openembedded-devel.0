Received: from [66.249.82.234] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1HmA97-0006if-8O
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 May 2007 17:01:38 +0200
Received: by wx-out-0506.google.com with SMTP id s14so552338wxc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2007 08:00:51 -0700 (PDT)
Received: by 10.90.53.16 with SMTP id b16mr1683648aga.1178809251467;
	Thu, 10 May 2007 08:00:51 -0700 (PDT)
Received: from cube ( [77.122.190.213])
	by mx.google.com with ESMTP id m2sm9100974nzf.2007.05.10.08.00.49;
	Thu, 10 May 2007 08:00:50 -0700 (PDT)
Date: Thu, 10 May 2007 18:00:54 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <31583224.20070510180054@gmail.com>
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
X-List-Received-Date: Thu, 10 May 2007 15:01:49 -0000
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

        Any news on this? I've been running with this patch soon since
its original post and don't see any issues. One small nuisance is that
ls -l /var/log doesn't show what you want, but hardly something can be
done about that, plus shell completion uses /var/log/ immediately.

        I suggest committing this patch.

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



