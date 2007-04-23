Received: from [64.233.166.176] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HfxZz-0006N9-W6
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2007 14:23:51 +0200
Received: by py-out-1112.google.com with SMTP id n39so1202822pyh
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Apr 2007 05:23:37 -0700 (PDT)
Received: by 10.64.53.20 with SMTP id b20mr11197272qba.1177313377174;
	Mon, 23 Apr 2007 00:29:37 -0700 (PDT)
Received: from cube ( [82.193.98.7])
	by mx.google.com with ESMTP id m1sm8916134nzf.2007.04.23.00.29.34;
	Mon, 23 Apr 2007 00:29:35 -0700 (PDT)
Date: Mon, 23 Apr 2007 10:29:32 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <7010026723.20070423102932@gmail.com>
To: Michael 'Mickey' Lauer <mickey@vanille-media.de>
In-Reply-To: <1771542973.20070410132539@vanille-media.de>
References: <1168683040.20070405173920@gmail.com>
	<1771542973.20070410132539@vanille-media.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Cleaning up service handling in OE
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
X-List-Received-Date: Mon, 23 Apr 2007 12:24:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Michael,

Tuesday, April 10, 2007, 2:25:39 PM, you wrote:

> Thanks for raising this issue, Paul.

> The state of the service handling in OE has buggered me since long,
> not just because of the (very valid) points you mentioned, but also
> because of their relationship to sysvinit -- the initscripts are just
> too specialized in my opinion.

> One example: I can see OpenMoko moving to another sysinit scheme,
> most likely upstart. Now how are we (OE) supposed to support that
> while keeping sysinit support updated at the same time.

> We should do it like we support different packaging systems and image
> types -- let me propose going to a more high level description for service
> handling and having a bbclass (INHERIT += sysvinit or INHERIT +=
> upstart) parsing this description and emitting
> the actual init scripts.

        Sorry, I'm not much familiar with alternative startup
managers, so it took me some time to glance over upstart as an
example. So, instead of symlinks to predefined set of dirs, it uses
small file descriptor for each service script, which specifies
parameters, dependencies, etc.

        Then yes, I see what you propose as a good idea. For this, we
would rename update-rc.d.bbclass to sysvinit.bbclass for example (as
its purpose is exactly handling sysvinit's view of things).

        As for specific implementation, I guess this still should
start with adding initial upstart support per se. My guess is that
it's quite probable that we can abstract typical service parameters,
and make specific bbclass implement them in term of some startup
system, but only practice can tell ;-). In worst case, separate
descriptors would need to be written, but at least with
INHERIT += <startup_man>, one needed can be selected by bbclass,
without further specification in .bb.

> What do you think?

> Regards,

> :M:



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



