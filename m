Received: from smtp.cardinalpeak.com ([208.43.163.138])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbeal@cardinalpeak.com>) id 1QysIx-000259-VZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 23:26:40 +0200
X-Footer: Y2FyZGluYWxwZWFrLmNvbQ==
Received: from [192.168.0.128] ([75.145.125.125])
	(authenticated user dbeal@cardinalpeak.com) by smtp.cardinalpeak.com
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 15:21:42 -0600
From: Dave Beal <dbeal@cardinalpeak.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1314819305.2284.2.camel@scimitar>
References: <1314811518.1457.10.camel@DaveBeal-Ubuntu-laptop>
	<1314819305.2284.2.camel@scimitar>
Organization: Cardinal Peak, LLC
Date: Wed, 31 Aug 2011 15:18:41 -0600
Message-ID: <1314825521.1457.12.camel@DaveBeal-Ubuntu-laptop>
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
X-List-Received-Date: Wed, 31 Aug 2011 21:26:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Thank you, Joshua.  I don't know what you mean by "if your metadata uses
fetch2".  Is fetch2 some python function?  How would I know if I'm using
it?

- Dave


-----Original Message-----
From: Joshua Lock <josh@linux.intel.com>
Reply-to: openembedded-devel@lists.openembedded.org
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] How to prevent fetching?
Date: Wed, 31 Aug 2011 12:35:00 -0700


On Wed, 2011-08-31 at 11:25 -0600, Dave Beal wrote:
> My company is using OE to develop the embedded Linux infrastructure of a
> medical device.  The US government agency that approves such devices
> (FDA) requires that its source code be strictly controlled.  We would
> like to configure our OE installation to prevent the fetching of new
> source code except when we explicitly allow it.
> 
> Is there a way to accomplish this that doesn't require modifying all the
> individual .bb files?  Is there a global configuration option that would
> prevent fetching?  I've looked through the OE and Bitbake User Manuals,
> but haven't found an answer.

If you're using relatively recent BitBake and your metadata uses fetch2
(I don't know if oe.dev does, but oe-core is using fetch2) you can set
BB_NO_NETWORK="1" in a conf file somewhere.

Regards,
Joshua


Dave Beal 
Cardinal Peak
(303) 665-3962 x124 | Email | vCard
| Web | Company Blog | LinkedIn 

 

 



