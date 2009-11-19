Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NB7WD-0004pQ-T6
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 14:57:57 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAJDrGJ2005769 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 13:53:16 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id labVbjgaNbsK
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 13:53:16 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAJDrDt3005737
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 13:53:15 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d0911190542j2bea66ccs65d6261b9c92bf87@mail.gmail.com>
References: <be7a9f3d0911181211s614defeaq5a49ca33c3691c50@mail.gmail.com>
	<1258576924.25369.687.camel@lenovo.internal.reciva.com>
	<be7a9f3d0911181421i4d3a1ffy2417cbbd91d9a1ff@mail.gmail.com>
	<1258631715.23826.63.camel@mill.internal.reciva.com>
	<be7a9f3d0911190542j2bea66ccs65d6261b9c92bf87@mail.gmail.com>
Date: Thu, 19 Nov 2009 13:56:06 +0000
Message-Id: <1258638966.5229.25.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Merging of stable/2009 into dev
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
X-List-Received-Date: Thu, 19 Nov 2009 13:57:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-11-19 at 11:42 -0200, Otavio Salvador wrote:
> Hello,
> 
> On Thu, Nov 19, 2009 at 9:55 AM, Phil Blundell <philb@gnu.org> wrote:
> > Right, but I think these conflicts are a result of attempting what seems
> > like a nonsensical merge.
> >
> > Which specific changesets from stable/2009 do you feel are missing
> > in .dev?
> 
> Ok but what is the planned migration path from users that used
> stable/2009 to stable/2010?
> 
> I mean, when we start stable/2010 we expect that users that based
> their distros in stable/2009 need to redo all work to move to
> stable/2010? If we merge stable/2009 into .dev then this is going to
> be much easier.

I think you actually want to do something like:

git-merge --strategy=ours

which should leave OE.dev unchanged.

Does that actually help though?

Cheers,

Richard



