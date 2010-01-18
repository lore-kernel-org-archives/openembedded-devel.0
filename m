Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NX0ph-0000Z8-BW
	for openembedded-devel@openembedded.org; Tue, 19 Jan 2010 00:16:32 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o0IN9uQ8021502; Mon, 18 Jan 2010 23:09:56 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id c1CEVB7SRgrA; Mon, 18 Jan 2010 23:09:56 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o0IN9oc9021478
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 18 Jan 2010 23:09:52 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Chris Larson <kergoth@gmail.com>
In-Reply-To: <b6ebd0a51001181417v3d5486f3l243927a7aeb7dae2@mail.gmail.com>
References: <1263852540.26227.133.camel@dax.rpnet.com>
	<b6ebd0a51001181417v3d5486f3l243927a7aeb7dae2@mail.gmail.com>
Date: Mon, 18 Jan 2010 23:14:29 +0000
Message-Id: <1263856469.26227.155.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: [Bitbake-dev] bitbake 'events' - How to fix the current	problems?
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
X-List-Received-Date: Mon, 18 Jan 2010 23:16:32 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2010-01-18 at 15:17 -0700, Chris Larson wrote: 
> We already have better semantics, we just don't use it.  isinstance()
> can be used for this.
[...]
> isinstance can operate against an iterable of classes, or a base
class: 
> 
> if isinstance(e, (TaskStarted, TaskSucceeded)):
> 
> works great.

Great, makes perfect sense. We should start doing this.
 
>         3. Inclusion of the data dictionary within every event
>         
>         This messes up the bitbake client/server code no end since if
>         you want
>         to pickle or otherwise transport the event via IPC, it has the
>         whole
>         data dictionary in it. We need the event objects to be
>         marshallable
>         ideally. 
> 
> 
> Is there a reason we can't customize the serialization process for
> these objects to exclude the reference to the datastore?

We could do that but it turns into a pain. For example we have the
situation where we want to communicate an event (say bb.error) from a
worker thread to the server process which then needs to send this to the
clients (event handlers in the metadata, UIs, whatever).

For worker -> server its not desirable to transfer the datastore. Event
handlers in the metadata happen in the server's process space just like
parsing so passing the datastore to them isn't an issue. Passing to the
UIs is a different process space and passing the datastore is not
desirable.

If we ditch the datastore, the core code is going to be a lot simpler as
the objects will just work with the standard serialization.

We could just make this an internal change by changing the parameters of
the fire() call to pass the datastore and then pass this on as
event.data to the metadata handlers, manually inserting it into the
objects when wanted.

>         4. The pointless return values
>         
>         These should just die, they're useless. 
> 
> 
> Agree wholeheartedly.

Return values were ripped out of bitbake master a while ago. If we do
another 1.8 release it should have them removed too, then we can remove
the references from the code. Having said that, I'm now planning a 1.10
branch based off master ASAP with the XML bits bypassed with some loops.
This assumes I can get worker -> server events working though.

> I don't really see the gain of separating the name from the data
> rather than using an object here, but I don't have a very strong
> opinion either way.

The isinstance calls buy us a lot. If I can fix the marshalling over
XMLRPC, I can fix a lot of the UI code to stop using the text strings
and everything should be nicer. It also looks like we don't need a flag
day as I think I could keep this bitbake internal only.

> The only other thing that might be nice as a feature add would be the
> ability to express the events you're interested in via a variable
> flag, rather than conditionals, just to reduce the boilerplate code in
> the various event handlers, but that could also reduce flexibility, so
> that would be both arguable, and something that could be visited /
> discussed at a later time, rather than as part of this effort.

Agreed, this would be nice to have and would save us some processor
time, particularly when we start using inter-process calls.

Thanks for the discussion, its cleared my head a bit :)

Cheers,

Richard





