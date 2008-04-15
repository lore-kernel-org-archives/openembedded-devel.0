Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JlmNT-00063y-QX
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Apr 2008 16:43:20 +0200
X-ASG-Debug-ID: 1208270587-6b06001f0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP
	id 8102E41856; Tue, 15 Apr 2008 09:43:07 -0500 (CDT)
Received: from [192.168.1.71] (LRS-CiscoBackup [192.168.1.1]) by
	barracuda.pager.net with ESMTP id s2AOqTeBvcCprflw;
	Tue, 15 Apr 2008 09:43:07 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] Building gdbserver only
Date: Tue, 15 Apr 2008 09:43:13 -0500
User-Agent: KMail/1.9.7
References: <200804141504.29481.geoffrey@pager.net>
	<4803E192.6040501@gmail.com>
In-Reply-To: <4803E192.6040501@gmail.com>
MIME-Version: 1.0
Message-Id: <200804150943.14448.geoffrey@pager.net>
X-Barracuda-Connect: LRS-CiscoBackup[192.168.1.1]
X-Barracuda-Start-Time: 1208270587
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: Building gdbserver only
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
X-List-Received-Date: Tue, 15 Apr 2008 14:43:20 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 14 April 2008 05:58:26 pm Khem Raj wrote:
> Geoffrey Wossum wrote:
> > It does support building gdbserver for the AVR32, though.  Trouble is,
> > there doesn't seem to be an "easy" way to build just gdbserver.  To build
> > just gdbserver, you run the gdb-${PV}/gdb/gdbserver/configure instead of
> > gdb-${PV}/configure.  oe_runconf() substitutes the value of ${S} in.  If
> > you try to modify ${S} so that oe_runconf() executes the correct
> > configure script, then ${S} is screwed  up for do_patch() and the patches
> > won't apply.
> >
> > Any ideas on how to solve this dillemma?
>
> How about building gdb completely but package only gdbserver.

The problem is that gdb does not build, only gdbserver.  I can't figure out a 
way to get OE to build just gdbserver for me.  oe_doconf() always wants to 
run ${S}/configure, but I need it to run ${S}/gdb/gdbserver/configure.  If I 
change S, then the patching fails.  

What would be cool is if oe_doconf() took an optional parameter telling it 
where the configure script is, instead of always using ${S}/configure.

---
Geoffrey




