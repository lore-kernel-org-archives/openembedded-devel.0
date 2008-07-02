Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gwossum@pager.net>) id 1KE7cT-00045m-So
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jul 2008 21:03:58 +0200
X-ASG-Debug-ID: 1215025241-12a1004f0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from mail.pager.net (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 62111E38FB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jul 2008 14:00:41 -0500 (CDT)
Received: from mail.pager.net (lrs-ad1.longragesystems.local [192.168.1.254])
	by barracuda.pager.net with ESMTP id 5heE1QsGrOHwm6h1 for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jul 2008 14:00:41 -0500 (CDT)
X-ASG-Whitelist: Sender
Received: from [192.168.1.71] ([192.168.1.71]) by mail.pager.net with
	Microsoft SMTPSVC(6.0.3790.1830); Wed, 2 Jul 2008 13:59:40 -0500
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] SVN Fetcher Makes Invalid Assumptions
Date: Wed, 2 Jul 2008 14:00:41 -0500
User-Agent: KMail/1.9.9
References: <200807021000.52998.geoffrey@pager.net>
	<20080702153316.GF4432@aquilonia.hyboria>
In-Reply-To: <20080702153316.GF4432@aquilonia.hyboria>
MIME-Version: 1.0
Message-Id: <200807021400.42002.geoffrey@pager.net>
X-OriginalArrivalTime: 02 Jul 2008 18:59:40.0828 (UTC)
	FILETIME=[C8354DC0:01C8DC75]
X-Barracuda-Connect: lrs-ad1.longragesystems.local[192.168.1.254]
X-Barracuda-Start-Time: 1215025241
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: SVN Fetcher Makes Invalid Assumptions
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
X-List-Received-Date: Wed, 02 Jul 2008 19:03:58 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 02 July 2008 10:33:16 am Graeme Gregory wrote:
> On Wed, Jul 02, 2008 at 10:00:52AM -0500, Geoffrey Wossum wrote:

> > The SVN fetcher assumes that all SVN repositories can be checked out
> > with "proto://url/module module", in other words that the module name is
> > at then end of the URL.  However, phonon-vlc-mplayer requires
> > using "http://phonon-vlc-mplayer.googlecode.com/svn/trunk/
> > phonon-vlc-mplayer", in other words the module name is NOT part of the
> > URL.
> We already have loads of recipes with this.
>
> just remove the trunk from the URL and say module=trunk.

I was dubious,  but that works.  Thanks!

---
Geoffrey


