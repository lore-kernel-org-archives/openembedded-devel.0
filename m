Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NBPzz-0003cN-FO
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 10:41:54 +0100
Received: from tamarin.localnet (siminn-int-gw.on-waves.com [157.157.59.158])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id D9FAC1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 09:51:58 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Nov 2009 10:40:17 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <alpine.LFD.2.00.0911200415360.22257@localhost>
In-Reply-To: <alpine.LFD.2.00.0911200415360.22257@localhost>
MIME-Version: 1.0
Message-Id: <200911201040.17657.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: FYI, non-fatal fetch errors for ffmpeg
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
X-List-Received-Date: Fri, 20 Nov 2009 09:41:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 20 November 2009 10:20:25 Robert P. J. Day wrote:

>   obviously, the fetch of ffmpeg eventually works, but any value in
> cleaning up the initial fetch errors?

This is normal operation. The reasoning is that we want to be good to the 
upstream infrastructure and don't want all OE users hammer on the SCM Servers 
of the upstream project to checkout a static tarball.

This is why OE tries to download a snapshot from a tarball stash, in your case 
two have been tried and then it falls back to the SCM of the upstream 
directly.

Now one can argue that another output on the console would be nice... but so 
far no one has been bothered enough to do it. Help is greatly appreciated and 
I can point you to the places in bitbake and classes/base.bbclass.

possible output

Trying to find tarball for ffmpeg revision XYZ:
    ... trying www.foo-mirror.org/... FAIL
   .... trying wwww.bla-mirror.org/ ... FAIL

Couldn't find a tarball for ffmpeg revision XYZ, checking it out..

wget starts



