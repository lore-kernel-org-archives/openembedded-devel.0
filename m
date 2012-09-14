Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1TCUYm-0002jl-Mb
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 13:59:48 +0200
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 29F822543428
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2012 11:50:42 +0000 (UTC)
Received: from ich by sangmingze-mail.local with local (Exim 4.80)
	(envelope-from <holger+oe@freyther.de>) id 1TCUMZ-0006qh-Kv
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 13:47:11 +0200
Date: Fri, 14 Sep 2012 13:47:11 +0200
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120914114711.GF22757@localhost>
References: <20120914081644.GC22757@localhost>
MIME-Version: 1.0
In-Reply-To: <20120914081644.GC22757@localhost>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd] base-files and systemd services
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
X-List-Received-Date: Fri, 14 Sep 2012 11:59:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 14, 2012 at 10:16:44AM +0200, Holger Hans Peter Freyther wrote:
> Good Morning,
> 
> 
> a.) Use a tempfiles.d/volatile.conf to create these directories?

this does not work due the implementation of systemd-tmpfiles. It might
or might not (depending on the hash of the dir to be created) create the
/var/volatile/tmp dir before it creates /var/log/tmp/wtmp. I will have
to patch the tmp.conf.

> b.) Install initscripts in my systemd image?
> c.) ???


