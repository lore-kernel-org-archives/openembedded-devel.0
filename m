Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Nl6PD-00082O-SX
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 21:03:26 +0100
Received: from tamarin.localnet (unknown [92.116.223.162])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id DB09E1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 20:02:15 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Feb 2010 21:00:19 +0100
User-Agent: KMail/1.13.0 (Linux/2.6.33-rc8; KDE/4.4.0; i686; ; )
References: <201001230827.49805.holger+oe@freyther.de>
In-Reply-To: <201001230827.49805.holger+oe@freyther.de>
MIME-Version: 1.0
Message-Id: <201002262100.19410.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded and known security issues
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
X-List-Received-Date: Fri, 26 Feb 2010 20:03:26 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 23 January 2010 08:27:49 Holger Hans Peter Freyther wrote:

> 2.) The second mode of the script is to compare installed versions with the
> list of known vulnerabilities...
> 
> 
> Now here comes the idea... Hack OE or bitbake to compare the PN to the PN
> of the database and the PV to the PV of known vulnerabilities.. and then
> mention a problem while parsing and then quit.

Hi,
I will try to hack something tomorrow on my flight to iceland... So we do have

1.) auditfile.tbz from FreeBSD (of course this will not help us with busg in 
udev and linux specific things)
2.) I use the output of bitbake -s
3.) I create a file that claims when a FreeBSD issue was fixed (the PR we did)


i try to merge that all with python and spit out a list of vulnerable software 
in our tree...


z.


