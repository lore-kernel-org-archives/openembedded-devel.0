Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NXErB-0007el-6q
	for openembedded-devel@openembedded.org; Tue, 19 Jan 2010 15:15:00 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o0JE8L04024511; Tue, 19 Jan 2010 14:08:21 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 76UysgmSyfwu; Tue, 19 Jan 2010 14:08:21 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o0JE8GJ3024498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 19 Jan 2010 14:08:17 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Chris Larson <kergoth@gmail.com>
In-Reply-To: <1263856469.26227.155.camel@dax.rpnet.com>
References: <1263852540.26227.133.camel@dax.rpnet.com>
	<b6ebd0a51001181417v3d5486f3l243927a7aeb7dae2@mail.gmail.com>
	<1263856469.26227.155.camel@dax.rpnet.com>
Date: Tue, 19 Jan 2010 14:12:58 +0000
Message-Id: <1263910378.26227.167.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: [Bitbake-dev] bitbake 'events' - How to fix the	current	problems?
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
X-List-Received-Date: Tue, 19 Jan 2010 14:15:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2010-01-18 at 23:14 +0000, Richard Purdie wrote:
> For worker -> server its not desirable to transfer the datastore.
> Event
> handlers in the metadata happen in the server's process space just like
> parsing so passing the datastore to them isn't an issue. Passing to the
> UIs is a different process space and passing the datastore is not
> desirable.
> 
> If we ditch the datastore, the core code is going to be a lot simpler as
> the objects will just work with the standard serialization.
> 
> We could just make this an internal change by changing the parameters of
> the fire() call to pass the datastore and then pass this on as
> event.data to the metadata handlers, manually inserting it into the
> objects when wanted.

FWIW this is now done in bitbake master. The IPC between the workers and
the server is implemented and working well too which avoids a whole raft
of problems.

I think I'm going to switch Poky to bitbake master soon and drop 1.8
there - we're getting much closer to the 1.10 release, just need to look
at those parsing changes and fix a BBCLASSEXTEND issue.

Cheers,

Richard



