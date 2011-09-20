Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R61Tk-0007v8-Hp
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Sep 2011 16:39:20 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1R61Of-0007gT-Aj; Tue, 20 Sep 2011 16:34:05 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Sep 2011 15:34:04 +0100
In-Reply-To: <1316384457-23718-2-git-send-email-dbaryshkov@gmail.com>
References: <1316384457-23718-1-git-send-email-dbaryshkov@gmail.com>
	<1316384457-23718-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1316529245.3510.85.camel@phil-desktop>
Mime-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [meta-micro 2/2] sane-feed.inc: rework FEED_ARCH settings
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
X-List-Received-Date: Tue, 20 Sep 2011 14:39:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-09-19 at 02:20 +0400, Dmitry Eremin-Solenikov wrote:
> Currently meta-micro's sane-feed.inc file is full of per-machine
> substitutions for FEED_ARCH. At best this is redundant (armv5te
> machines). Even worse, some settings are plain wrong (arm-oabi boxes
> come to mind). So instead of big per-machien table, use TUNE_PKGARCH as
> it's done in meta-angstrom.

It's not actually obvious to me that this FEED_ARCH is serving any
useful purpose here.  I'm inclined to just delete sane-feed.inc
altogether unless you know a reason why it is useful to keep it.

p.




