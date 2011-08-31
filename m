Received: from smtp.cardinalpeak.com ([208.43.163.138])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbeal@cardinalpeak.com>) id 1QytZZ-00041l-4L
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 00:47:54 +0200
X-Footer: Y2FyZGluYWxwZWFrLmNvbQ==
Received: from [192.168.0.128] ([75.145.125.125])
	(authenticated user dbeal@cardinalpeak.com) by smtp.cardinalpeak.com
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 16:42:54 -0600
From: Dave Beal <dbeal@cardinalpeak.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1314829829.2284.12.camel@scimitar>
References: <1314811518.1457.10.camel@DaveBeal-Ubuntu-laptop>
	<1314819305.2284.2.camel@scimitar>
	<1314825521.1457.12.camel@DaveBeal-Ubuntu-laptop>
	<1314829829.2284.12.camel@scimitar>
Organization: Cardinal Peak, LLC
Date: Wed, 31 Aug 2011 16:39:04 -0600
Message-ID: <1314830344.1457.22.camel@DaveBeal-Ubuntu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: How to prevent fetching?
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
X-List-Received-Date: Wed, 31 Aug 2011 22:47:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Thanks again, Joshua.  I found my base.bbclass (in
sources/openembedded/classes), and sadly, my base_do_fetch() uses
bb.fetch, not bb.fetch2.

- Dave


-----Original Message-----
From: Joshua Lock <josh@linux.intel.com>
Reply-to: openembedded-devel@lists.openembedded.org
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] How to prevent fetching?
Date: Wed, 31 Aug 2011 15:30:24 -0700


On Wed, 2011-08-31 at 15:18 -0600, Dave Beal wrote:
> Thank you, Joshua.  I don't know what you mean by "if your metadata uses
> fetch2".  Is fetch2 some python function?  How would I know if I'm using
> it?

Fetch2 is a Python module that's part of BitBake. It's used from the
base_do_fetch() method of base.bbclass.

You can see that OE.dev isn't using  fetch2[1] but OE-Core is[2].

Joshua

1.
http://git.openembedded.org/cgit.cgi/openembedded/tree/classes/base.bbclass#n99
2.
http://git.openembedded.org/cgit.cgi/openembedded-core/tree/meta/classes/base.bbclass#n80


Dave Beal 
Cardinal Peak
(303) 665-3962 x124 | Email | vCard
| Web | Company Blog | LinkedIn 

 

 



