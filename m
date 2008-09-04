Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KbMVc-0001ZP-Bn
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Sep 2008 23:36:56 +0200
Received: from ip-89-168-141-231.cust.homechoice.net ([89.168.141.231]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KbMTS-0002CG-Te
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Sep 2008 22:34:43 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0809041338t15ff7146m42b94c3723410ce6@mail.gmail.com>
References: <c384c5ea0809041338t15ff7146m42b94c3723410ce6@mail.gmail.com>
Date: Thu, 04 Sep 2008 22:34:39 +0100
Message-Id: <1220564079.4641.67.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: PREFERRED_PROVIDER_x/y = "z" versus PREFERRED_PROVIDER +=	" x/y:z"
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
X-List-Received-Date: Thu, 04 Sep 2008 21:36:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-09-04 at 22:38 +0200, Leon Woestenberg wrote:
> Hello,
> 
> can someone explain the (subtle) differences between
> 
> PREFERRED_PROVIDER_x/y = "z"
> PREFERRED_PROVIDER += " x/y:z"
> ?
> 
> And also (to be completely clear) when to use what?

As far as I remember, there's no real difference between those two
things at the bitbake level.  I think the latter syntax came first, but
proved cumbersome, and the former was added afterwards as a more
convenient mechanism.  The main advantage of the former syntax is that
it stacks: you can have an include file that sets PREFERRED_PROVIDER_foo
to something, and a later-included file can easily override that
assignment or defeat it altogether.  With the latter syntax, anything
other than a straightforward append involves a lot of messy string
processing.

Personally I would recommend that you always use the former syntax.  I
can't think of any situation where the latter is necessary or desirable.

(Also, as a trivial pedantic point, note that the += operator already
adds a space for you, so in your second example there is no need to add
one explicitly.)

p.




