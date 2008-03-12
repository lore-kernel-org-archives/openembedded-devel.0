Received: from [216.239.58.190] (helo=gv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZXAb-0004hP-W4
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 21:03:31 +0100
Received: by gv-out-0910.google.com with SMTP id l14so1065933gvf.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 13:01:18 -0700 (PDT)
Received: by 10.150.197.8 with SMTP id u8mr4764030ybf.182.1205352077215;
	Wed, 12 Mar 2008 13:01:17 -0700 (PDT)
Received: from widy.localdomain ( [88.231.54.215])
	by mx.google.com with ESMTPS id j9sm7071527mue.6.2008.03.12.13.01.13
	(version=SSLv3 cipher=OTHER); Wed, 12 Mar 2008 13:01:15 -0700 (PDT)
Date: Wed, 12 Mar 2008 22:02:47 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: angstrom-distro-devel@linuxtogo.org
Message-ID: <20080312220247.2d1891fd@widy.localdomain>
In-Reply-To: <47D828CB.9080900@opensimpad.org>
References: <47D8134C.5010704@opensimpad.org> <fr95ov$s0f$1@ger.gmane.org>
	<20080312201143.32eb13d2@widy.localdomain>
	<47D828CB.9080900@opensimpad.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 216.239.58.190
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=AWL,RDNS_NONE,WEIRD_PORT
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] [RFC] backport base_version_less_or_equal() (base.bbclass) from .dev to stable branch
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
X-List-Received-Date: Wed, 12 Mar 2008 20:03:31 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Wed, 12 Mar 2008 20:02:35 +0100
Bernhard Guillon <Bernhard.Guillon@opensimpad.org> wrote:

> Paul Sokolovsky wrote:
> >
> > Well, it's about base_version_less_or_equal() which indeed was added
> > recently. I hope Bernhard will look up exact revision to pluck.
> >
> >
> >   
> Hello,
> I am not sure about the exact revision. I am not that familiar with 
> monotone. 

Well, it's not that much about monotone as about revision control.
Dealing with revisions is essence of it, and no matter what tool we'll
use, we, humans, using these tools, will still deal with revisions.

> While searching *ViewMTN* on openembedded.org I found this 
> entry [1].  so revision is* *
> 38f8ae6418f23fd2c13f29ecf5b41628ff3dedcd ?

Well, why 38f... ? Your link contains 437..., and that's what the page
has at the top (I might agree that ViewMTN UI is not the best, but
it's not a reason to not read stuff it has).

So, the revision is 43753505f023f7853afdd0f497c28ef65c4b2509 and you
can verify that it contains the change you need with 

mtn log --diffs --from 43753505f023f7853afdd0f497c28ef65c4b2509 --next 1

The next step is to submit output of that command to
angstrom-distro-devel list, with subject starting with "[Review]".
Please do so next time - change control procedures work well if
everyone follows them, not when few people do it for everyone else.

For this time, let's assume that was done, +1 from me on the change, we
have required 2 votes, and I push it next time I do plucks, if noone
else will do that before.

> 
> best regards
> Bernhard Guillon
> 
> 1 
> http://www.openembedded.org:1081/revision/info/43753505f023f7853afdd0f497c28ef65c4b2509?q=viewmtn/revision/info/43753505f023f7853afdd0f497c28ef65c4b2509

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


