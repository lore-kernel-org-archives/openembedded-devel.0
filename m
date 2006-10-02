Received: from [64.233.166.180] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GUNUL-0006ug-7V
	for openembedded-devel@openembedded.org; Mon, 02 Oct 2006 15:05:41 +0200
Received: by py-out-1112.google.com with SMTP id z59so2011069pyg
	for <openembedded-devel@openembedded.org>;
	Mon, 02 Oct 2006 06:00:17 -0700 (PDT)
Received: by 10.35.79.3 with SMTP id g3mr7684903pyl;
	Mon, 02 Oct 2006 06:00:16 -0700 (PDT)
Received: from CUBE ( [82.193.96.236])
	by mx.gmail.com with ESMTP id r15sm5547361nza.2006.10.02.06.00.14;
	Mon, 02 Oct 2006 06:00:16 -0700 (PDT)
Date: Mon, 2 Oct 2006 16:00:11 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <192578441.20061002160011@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1159280896.5573.123.camel@localhost.localdomain>
References: <1159280896.5573.123.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>, bitbake-dev@lists.berlios.de
Subject: Re: Bitbake past, present and future [long]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Oct 2006 13:05:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Tuesday, September 26, 2006, 5:28:15 PM, you wrote:

> Paul's comments in #oe have highlighted the fact that whilst I and
> perhaps some others know where things are going (and have come from), a
> lot of things are in my head which isn't perhaps the best place for
> them.

  Richard, thanks for this comprehensive discussion. Before rushing
with (stupid) questions, I decided to (re)read bitbake-dev and other
archives to have clearer picture myself. I've captured what I found at
http://www.openembedded.org/bitbakebackground (linked from OE's wiki
frontpage).

  With this overall picture in mind, the changes in bitbake over last
year (most of which were led by you) are indeed big and highly
improving, and it's IMHO clear that they should be continued, until
BitBake and OE metatada would indeed scale well in both perfomance and
maintenance.

  I still don't have general understanding of BitBake internal
functioning, but I guess, the best thing I can do is find answer to my
specific questions myself in the code.

  But I have to questions of general nature:

1. What is status of bitbake-ng?

IIRC, once info about it was in OE wiki. But now searching for it
returns only that it is scheduled topic for OEDEM. So, I guess,
exact answers will be known after it, and so far it's in "postponed"
state. Well, I cannot say that I personally regret aboy this - it's
possible to implement non-so-scalable patterns (or antipatterns) in C
as well, but C brings segfaults and higher steep hacking curve with
it. Python seems like very perfect language for the tool like BitBake.

2. Using structured secondary storage (i.e. SQL db) as datastore

No surprise, I wasn't the first to consider sqlite for the backend ;-)
- Holger tried that long ago,
https://lists.berlios.de/pipermail/bitbake-dev/2005-May/000018.html

So, my question would be: after all the refactors BitBake undergone
since that, would sqlite backend be more feasible?

But again, I understand, the answer will likely be: "try and see".


    So, I'm going to understand internal datastructures of BitBake
better first. And in the meantime, work on some trivial/small (thanks
to Python!) tweaks/improvements. One thing I want to grasp first is
unittesting of BitBake. Again, I'm glad there's bitbake-tests
directory in BB trunk already.

[]

> If anyone wants to discuss any of this or better still help with the
> code, please do so!

> Richard



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



