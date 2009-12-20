Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NMRC4-0003cQ-TX for openembedded-devel@lists.openembedded.org;
	Sun, 20 Dec 2009 20:11:55 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NMRAJ-0003WG-JP
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Dec 2009 20:10:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Dec 2009 20:10:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Dec 2009 20:10:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 20 Dec 2009 20:05:59 +0100
Message-ID: <hglsin$2vi$2@ger.gmane.org>
References: <200912190854.11510.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091201 Shredder/3.0.1pre
In-Reply-To: <200912190854.11510.holger+oe@freyther.de>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Qt4 GLES (once again)
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
X-List-Received-Date: Sun, 20 Dec 2009 19:11:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19-12-09 08:54, Holger Hans Peter Freyther wrote:
> Hi Koen, All,
>
> we have the GLES problem once again in the Qt4 recipes. My opinion is still
> the same that a "bitbake meta-toolchain-qte" should work without requiring
> downloading proprietary stuff from TI/PowerVR.

Exactly

>  From what I think to know, the only difference between GLES and the non GLES
> recipe is that we have one plugin more. Koen could you help me to verify that?

For qt/e it's one plugin more (a gfxdriver) and library (openvg) and for 
qt/x11 it's one plugin (gldriver) + 2 libs (opengl + openvg) more.

> If the above is the case, we could just use qt4-embedded-gles (without
> claiming to provide anything else) and then just package the GLES plugin?

That was my original goal, but the current structure of the .inc makes 
that very hard to do. I tried packaging *only* the extra stuff, but that 
leave to with one big problem: you need to build regular QT first and 
you can't build QT if a QT is present in staging.

I'm open to suggestions that don't involve useflags.

regards,

Koen



