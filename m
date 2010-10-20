Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P8dDa-0008T1-ND
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 20:17:01 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LAL00LIKPEN8UH2@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 Oct 2010 13:16:06 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2405914AF64; Wed,
	20 Oct 2010 14:15:58 -0400 (EDT)
Date: Wed, 20 Oct 2010 14:15:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101020181558.GN11514@denix.org>
References: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>
	<AANLkTinR7QSaFb1FTzETX9=k9=JZh58iZgyD=7=So1uF@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA2BC@dlee06.ent.ti.com>
	<i8vln6$njo$1@dough.gmane.org>
	<AANLkTik+qU9YfpoHybY=v87sVGOE9M8RjdKgfgwfL-JF@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA314@dlee06.ent.ti.com>
MIME-version: 1.0
In-reply-to: <131E5DFBE7373E4C8D813795A6AA7F080310FFA314@dlee06.ent.ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Wed, 20 Oct 2010 18:17:01 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Oct 11, 2010 at 02:53:59PM -0500, Maupin, Chase wrote:
> > 
> > I'm not sure if it is a policy. Haven't seen it being pulished as such.
> > Having said that, I have no problems with it (although there is no
> > problem with enforcing patents or so for v2+ , as that still falls
> > under the v2 umbrella).
> > 
> > I guess most of our recipes that say GPLv2 are wrong and are v2+.
> > It might be hard to distinguish between these though, it could well be
> > that the license file says v2 and a comment in the code says v2+.
> > Glad I do not have to deal with this any more....
> 
> Frans,
> 
> That is exactly the issue that is so annoying.  The COPYING file usually 
> says the standard GPLv2, but if you go and read the license text in the code 
> that is where it says GPLv2 (or later) so GPLv2+.  This patch was modified 
> to go off the license in the code since that is more likely what the 
> developer actually intended and not an auto-generated file.
> 
> Koen,
> 
> What about GPLv3 licensed files with an exception?  Right now I have that as 
> GPLv3+exception.  Was there ever any discussion about how to handle these?  
> I am trying to indicate that it is not a standard GPLv3 license.

Chase,

Does it say what kind of exception it is? If it has a name, it's better to 
specify it. For libgcc/libstdc++ I ended up specifying "GPLv3 with GCC RLE", 
which stands for GCC Runtime Library Exception:

http://www.gnu.org/licenses/gcc-exception.html

-- 
Denys


