Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gwossum@pager.net>) id 1K5nBj-0006ti-6W
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jun 2008 21:37:55 +0200
X-ASG-Debug-ID: 1213039957-596d00550000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from mail.pager.net (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 9D286C98DE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jun 2008 14:32:37 -0500 (CDT)
Received: from mail.pager.net ([192.168.1.254]) by barracuda.pager.net with
	ESMTP id h1XDg68dOGCGoucL for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jun 2008 14:32:37 -0500 (CDT)
X-ASG-Whitelist: Sender
Received: from [192.168.1.71] ([192.168.1.71]) by mail.pager.net with
	Microsoft SMTPSVC(6.0.3790.1830); Mon, 9 Jun 2008 14:37:23 -0500
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] DEPENDS="gettext" vs. DEPENDS="virtual/libintl"
Date: Mon, 9 Jun 2008 14:32:37 -0500
User-Agent: KMail/1.9.9
References: <200806061706.11880.geoffrey@pager.net>
	<20080606222450.GA6145@rhein.zuhause.netz>
	<200806071231.54955.geoffrey@pager.net>
In-Reply-To: <200806071231.54955.geoffrey@pager.net>
MIME-Version: 1.0
Message-Id: <200806091432.37869.geoffrey@pager.net>
X-OriginalArrivalTime: 09 Jun 2008 19:37:23.0328 (UTC)
	FILETIME=[3D432800:01C8CA68]
X-Barracuda-Connect: UNKNOWN[192.168.1.254]
X-Barracuda-Start-Time: 1213039957
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
X-List-Received-Date: Mon, 09 Jun 2008 19:37:55 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 07 June 2008 12:31:54 pm Geoffrey Wossum wrote:
> On Friday 06 June 2008 05:24:50 pm Henning Heinold wrote:
> > On Fri, Jun 06, 2008 at 05:06:11PM -0500, Geoffrey Wossum wrote:
> > > I'm working on exorcizing gettext as a requirement for building OE.
> > > Since glib-2.0 absolutely has to have libintl, I've found an alternate
> > > way of providing.  uClibc's libintl stub has a pretty bad case of
> > > bitrot, but I found proxy-libintl, which was written to get GNOME onto
> > > Windows. By setting proxy-libintl up as the PREFERRED_PROVIDER for
> > > virtual/libintl, I can get past glib-2.0 now.

It works!  I got rid of gettext.  It didn't fix all my problems, but it fixed 
crashes with aplay and Xfbdev.  avahi still crashes, must be a separate 
issue...

Submitted patches for this as bug #4370:
http://bugs.openembedded.net/show_bug.cgi?id=4370

You'll need to add PREFERRED_PROVIDER_virtual/libintl = "proxy-libintl" and 
USE_NLS = "no" (if you didn't already have it from somewhere like 
angstrom-uclibc.inc) to actually make use of proxy-libintl.

---
Geoffrey


