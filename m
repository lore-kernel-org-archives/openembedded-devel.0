Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NVCjb-0008Sj-Km for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 00:34:46 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NVChK-0006hS-Ci
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 00:32:22 +0100
Received: from p5b3b3319.dip.t-dialin.net ([91.59.51.25])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 00:32:22 +0100
Received: from no2spam by p5b3b3319.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 00:32:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 14 Jan 2010 00:31:58 +0100
Message-ID: <hill5g$ll0$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b3319.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: RFC: Sane default for SPLASH
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
X-List-Received-Date: Wed, 13 Jan 2010 23:34:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

the variable SPLASH is currently defined and not defined in a variety of
places leading to undesired results.  I think it should be set OE-wide
to a sane default.  Sane for me would be either "" to not have a splash
at all or psplash or some other generic splash that shows an OE logo.
As always, this would be set ?= so that distributions and individuals
can override the setting.  I think the sane default is no splash but
invite your opinion on the matter.

Regards

Rolf



