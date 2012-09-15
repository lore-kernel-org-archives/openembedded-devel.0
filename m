Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1TCstF-0007vx-7H
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Sep 2012 15:58:33 +0200
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id A2FFA254346B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2012 13:49:29 +0000 (UTC)
Received: from ich by sangmingze-mail.local with local (Exim 4.80)
	(envelope-from <holger+oe@freyther.de>) id 1TCsIh-0003pp-KL
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Sep 2012 15:20:47 +0200
Date: Sat, 15 Sep 2012 15:20:47 +0200
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120915132047.GK22757@localhost>
References: <1347641974-4993-1-git-send-email-holger+oe@freyther.de>
	<k31hk6$es6$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <k31hk6$es6$1@ger.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] meta-systemd: Introduce a create-volatile to create tmp directories
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
X-List-Received-Date: Sat, 15 Sep 2012 13:58:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 15, 2012 at 11:26:35AM +0200, Koen Kooi wrote:
> Op 14-09-12 18:59, Holger Hans Peter Freyther schreef:
> > From: Holger Hans Peter Freyther <zecke@selfish.org>
> > 
> 
> I'm not sure this is the right place to fix it, I'd prefer a base files
> bbappend and an fs-perms.txt for this. You know, like angstrom does :)

Hi,

I will have to read about about fs-perms.txt but at least recent oe-core
started to assume to that /var/log is volatile storage and changed the syslog
configuration. The other option is to change the syslog*.conf of oe-core
to revert to using a in-memory storage.

The other issue is that with a modified base-file it is impossible to build
sysvinit and systemd images from the same build directory.

holger


