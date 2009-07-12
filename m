Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MQ6RL-000770-9k
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Jul 2009 23:18:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 28FC3503B36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2009 17:05:24 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22118-02 for <openembedded-devel@lists.openembedded.org>; 
	Sun, 12 Jul 2009 17:05:24 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 0189C503766
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2009 17:05:24 -0400 (EDT)
Date: Sun, 12 Jul 2009 17:05:21 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <h39dju$tfg$1@ger.gmane.org>
Message-ID: <Pine.LNX.4.64.0907121701300.3621@juice.ott.cti.com>
References: <1247272621-26730-1-git-send-email-msmith@cbnco.com>
	<1247272621-26730-2-git-send-email-msmith@cbnco.com>
	<1247272621-26730-3-git-send-email-msmith@cbnco.com>
	<h39dju$tfg$1@ger.gmane.org>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 3/4] hicolor-icon-theme: don't inherit gnome
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
X-List-Received-Date: Sun, 12 Jul 2009 21:18:39 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 11 Jul 2009, Koen Kooi wrote:

> On 11-07-09 02:37, Michael Smith wrote:
> > inherit autotools instead, so the theme doesn't end up depending
> > on gconf and gnome-common.
> 
> NAK, it's dragging gnome for gtk-icon-cache.bbclass to update the theme cache
> files, your change would break that.

OK, I'll inherit gtk-icon-cache.

I'm going to set RDEPENDS = "" to override the RDEPENDS = 
"hicolor-icon-theme" in gtk-icon-cache.bbclass. The package shouldn't 
depend on itself (although it hasn't hurt anything thus far).

I'm also setting RDEPENDS_${PN} = "" because I think the RDEPENDS in 
gtk-icon-cache should probably be RDEPENDS_${PN}, and maybe someone will 
fix it later :)

Mike


