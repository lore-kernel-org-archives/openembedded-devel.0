Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1M28yE-0003g0-35
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 21:09:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 7A86E4A7CF0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 May 2009 15:03:18 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19790-01 for <openembedded-devel@lists.openembedded.org>; 
	Thu,  7 May 2009 15:03:18 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 545EC4A700B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 May 2009 15:03:18 -0400 (EDT)
Message-ID: <4A033076.1080604@cbnco.com>
Date: Thu, 07 May 2009 15:03:18 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <0977f5062aba3031df4132b6571b5c88ff4866c8.1241639516.git.msmith@cbnco.com>	<84090287fafa5bca668308285fcfa06650df22cd.1241639516.git.msmith@cbnco.com>	<20090506223838.GA15339@denix.org>
	<1241678721.23982.71.camel@lenovo.internal.reciva.com>
In-Reply-To: <1241678721.23982.71.camel@lenovo.internal.reciva.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 2/2] grub: allow menu.lst to be	overridden	using GRUB_CONFIG_PACKAGE.
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
X-List-Received-Date: Thu, 07 May 2009 19:09:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Wed, 2009-05-06 at 18:38 -0400, Denys Dmytriyenko wrote:
>> On Wed, May 06, 2009 at 03:55:57PM -0400, Michael Smith wrote:

>> It was discussed many times here - no USE flags in OE.
> 
> Although you're right that it comes up here frequently, I think this "no
> USE flags" dogma is somewhat misguided.  It seems, frankly, absurd to
> require people to effectively fork a recipe whenever they want to make
> some or other configuration change.

I agree. If OpenEmbedded is a toolset for building distributions, rather 
than just a single distribution, then it'd be great if there were an 
easy way for distribution builders to make different packaging choices 
than the ones that have been made for Angstrom, without maintaining a 
forked copy of everything.

There might be ways to do it without USE flags. I think some tweaks to 
the overlay mechanism would help here. First, if I could create a 
package in an overlay that references files from the upstream in 
SRC_URI, I wouldn't have to copy all the patches, initscripts, etc. over 
to the overlay. For example, if my tree looks like the one below:

top/
  |-- local (overlay)
  |   `-- recipes
  |       `-- grub
              |-- grub_0.97.bb (overlay)
  |           `-- files
  |               `-- menu.lst (overlay)
  `-- openembedded (upstream)
      `-- recipes
          `-- grub
              |-- grub_0.97.bb (upstream)
              `-- files
                  |-- menu.lst (upstream)
                  `-- some.patch (upstream)

My grub_0.97.bb could reference file://some.patch in its SRC_URI and 
bitbake could look in the next COLLECTION after failing to find it in 
the local one. In fact, I wouldn't even really need a bbfile in the 
overlay; just having files/menu.lst in the overlay could be enough to 
replace it. I guess this might just require some fudging to how 
FILESPATH is set up in base.bbclass.

Second, if a recipe could include a recipe of the same name and let 
bitbake search for it in the next COLLECTION, overlay packages could get 
a lot smaller. Say I need to add a private patch to grub -- my overlay 
grub_0.97.bb, if I had one, could just look like this:

require_next ${PN}/${PN}_${PV}.bb
SRC_URI += "file://some-private.patch;patch=1"

Something similar might be useful for INHERIT. Instead of creating an 
overlay bbfile for linux_${PN}.bb, I could just override kernel.bbclass 
and then pull in the original.

Is this something people would be interested in, or am I making it more 
complicated than it needs to be?

Mike


