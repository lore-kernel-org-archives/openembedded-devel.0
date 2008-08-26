Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KXykv-0005Ho-Fm
	for openembedded-devel@openembedded.org; Tue, 26 Aug 2008 15:38:45 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KXyjR-0002Fs-QA
	for openembedded-devel@openembedded.org; Tue, 26 Aug 2008 13:37:13 +0000
Received: from ip-62-143-12-162.hsi.ish.de ([62.143.12.162])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 26 Aug 2008 13:37:13 +0000
Received: from no2spam by ip-62-143-12-162.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 26 Aug 2008 13:37:13 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 26 Aug 2008 15:37:09 +0200
Message-ID: <g910u2$t3k$1@ger.gmane.org>
References: <g90p1m$r3m$1@ger.gmane.org>	<200808261428.20385.mickey@vanille-media.de>
	<g90ugc$iqk$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-12-162.hsi.ish.de
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
In-Reply-To: <g90ugc$iqk$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: disapprove 9cdbd45b5ff507c6e00fc91c08ec5e17929302f4
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
X-List-Received-Date: Tue, 26 Aug 2008 13:38:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> If you look at other image recipes using $XSERVER you'll notice they all 
> have a weak assignment to fbdev on top.

Which is the wrong place to do this.  Work has been started to try and 
fix all this "right".

> The other smartphone people (magician, htc-universal, blueangel, etc) 
> were wondering why they couldn't build fso-image anymore.

Understood.  IMHO, until things have been fixed properly, it would have 
been "more correct" to add other machines that have a correct XSERVER 
definition to COMPATIBLE_MACHINE than to drop the line.  I agree it's 
kind of silly and temporary work, so let's all hold our breath for a few 
days until the XSERVER situation has been straightened out.



