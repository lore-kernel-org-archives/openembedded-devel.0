Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1K52Kw-0006uE-Vx
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jun 2008 19:36:19 +0200
X-ASG-Debug-ID: 1212859878-556c00300000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.103] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 30ECDC78DE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jun 2008 12:31:19 -0500 (CDT)
Received: from [192.168.1.103] (adsl-68-94-31-106.dsl.rcsntx.swbell.net
	[68.94.31.106]) by barracuda.pager.net with ESMTP id
	Ozw9CWlVU0xadDbp for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jun 2008 12:31:19 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] DEPENDS="gettext" vs. DEPENDS="virtual/libintl"
Date: Sat, 7 Jun 2008 12:31:54 -0500
User-Agent: KMail/1.9.9
References: <200806061706.11880.geoffrey@pager.net>
	<20080606222450.GA6145@rhein.zuhause.netz>
In-Reply-To: <20080606222450.GA6145@rhein.zuhause.netz>
MIME-Version: 1.0
Message-Id: <200806071231.54955.geoffrey@pager.net>
X-Barracuda-Connect: adsl-68-94-31-106.dsl.rcsntx.swbell.net[68.94.31.106]
X-Barracuda-Start-Time: 1212859879
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: DEPENDS="gettext" vs. DEPENDS="virtual/libintl"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 07 Jun 2008 17:36:19 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 06 June 2008 05:24:50 pm Henning Heinold wrote:
> On Fri, Jun 06, 2008 at 05:06:11PM -0500, Geoffrey Wossum wrote:
> > I'm working on exorcizing gettext as a requirement for building OE. 
> > Since glib-2.0 absolutely has to have libintl, I've found an alternate
> > way of providing.  uClibc's libintl stub has a pretty bad case of bitrot,
> > but I found proxy-libintl, which was written to get GNOME onto Windows. 
> > By setting proxy-libintl up as the PREFERRED_PROVIDER for
> > virtual/libintl, I can get past glib-2.0 now.
> >
> > The problem now is that some packages explicitly list "gettext" in their
> > DEPENDS.  Is this just legacy from before virtual/libintl was created? 
> > Is there any reason why these can't all be changed to "virtual/libintl"?

> I suggest looking into this packages to see why they need gettext, maybee
> they need special tools, which only gettext provides.

I masked out the gettext package, and it turned out the only package my 
current system needs that had a DEPENDS for gettext was popt.  I changed 
popt's DEPENDS from gettext to virtual/libintl, and it built fine.  I won't 
be able to test out my gettext free build on hardware until Monday, though.

It seems to me that if a package needs headers or libraries from gettext, a 
DEPENDS of "virtual/libintl" would be fine.  If a package needs tools from 
gettext to be built, then it should be depending on "gettext-native" instead 
of "gettext", I would think.  

---
Geoffrey


