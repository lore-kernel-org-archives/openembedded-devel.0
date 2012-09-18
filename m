Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1TDraM-0007bt-Nr
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 08:47:06 +0200
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 8ADEC254346B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 06:38:13 +0000 (UTC)
Received: from ich by sangmingze-mail.local with local (Exim 4.80)
	(envelope-from <holger+oe@freyther.de>) id 1TDrO6-0001k5-Mg
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 08:34:26 +0200
Date: Tue, 18 Sep 2012 08:34:26 +0200
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120918063426.GC1258@localhost>
References: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKr6hWv7ED5YWxX1vbouE3C-NSySoKxi=7FOW_J-xoFS_g@mail.gmail.com>
	<k378fh$nm6$1@ger.gmane.org>
	<CAP9ODKqURDO6Am2mkBH8OdEQL=6JhZLga_-zgV7CX=GdDm6vmw@mail.gmail.com>
	<k37lgg$ihf$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <k37lgg$ihf$1@ger.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [for-denzil][systemd update 0/6] Systemd updates
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
X-List-Received-Date: Tue, 18 Sep 2012 06:47:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 17, 2012 at 07:09:38PM +0200, Koen Kooi wrote:
> 
> > how you tested it against regressions?
> 
> By running the same production tests as always. Bootup, shutdown, GUI,
> adding services, removing them, inspecting the logs, things like that.

One word of warning. I am using meta-oe's version of systemd (v189) and
the journald process easily grows to 189MB virtual size within seconds
on my system. I only see VSZ as busybox's top does not show RSS.

holger


