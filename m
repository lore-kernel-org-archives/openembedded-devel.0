Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KTbrr-0003K8-H8
	for openembedded-devel@openembedded.org; Thu, 14 Aug 2008 14:23:53 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KTbr8-0007LF-8q
	for openembedded-devel@openembedded.org; Thu, 14 Aug 2008 12:23:06 +0000
Received: from ip-62-143-12-162.hsi.ish.de ([62.143.12.162])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 14 Aug 2008 12:23:06 +0000
Received: from no2spam by ip-62-143-12-162.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 14 Aug 2008 12:23:06 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 14 Aug 2008 14:22:56 +0200
Message-ID: <g81830$r40$1@ger.gmane.org>
References: <g7vqvs$3fi$1@ger.gmane.org>	<1218699665.10360.25.camel@lenovo.internal.reciva.com>	<g815ta$ca0$1@ger.gmane.org>
	<48A41F24.1070507@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-12-162.hsi.ish.de
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
In-Reply-To: <48A41F24.1070507@dls.net>
Sender: news <news@ger.gmane.org>
Subject: Re: git and dir
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
X-List-Received-Date: Thu, 14 Aug 2008 12:23:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Mike (mwester) wrote:
> So can we consider a middle ground?

How about this?  If $GITBRANCH was available when defining TMPDIR it 
would be just perfectly possible to define it as TMPDIR = 
"${OEHOME}/tmp/${DISTRO}/${GITBRANCH}" and not have any issues.  For 
those who want to share stuff and know what they are doing, it would be 
possible to leave out DISTRO and GITBRANCH fi they want to.

The issue that I see is that although it may have been technically 
possible to switch branches in the same directory with mtn, I would 
consider that a very advanced technique (I consider myself rather 
well-versed in mtn and didn't even know it was possible).  Whereas, this 
is kind of the norm with git.  The easy switching is one of the reasons 
we decided to go forward with git.  Just like Mike said, I think we are 
going to see a lot of wasted time for everyone and I think now is a good 
time to proactively prevent that.



