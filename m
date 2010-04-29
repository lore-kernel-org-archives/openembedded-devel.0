Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1O7RnF-0000Hs-Ir
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 13:20:34 +0200
Received: from [192.168.1.8] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id C43895849CB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Apr 2010 13:21:46 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
Organization: Vanille-Media
Date: Thu, 29 Apr 2010 13:16:53 +0200
Message-ID: <1272539813.5855.3.camel@opal>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [Fwd: package_deb and update-alteernatives-dpkg-native on amd64 fails]
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
X-List-Received-Date: Thu, 29 Apr 2010 11:20:34 -0000
X-Groupsio-MsgNum: 18875
Content-Type: multipart/mixed; boundary="=-T/aFB0hz797wPB31zHO+"

--=-T/aFB0hz797wPB31zHO+
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



--=-T/aFB0hz797wPB31zHO+
Content-Disposition: inline
Content-Description: Weitergeleitete Nachricht - package_deb and
 update-alteernatives-dpkg-native on amd64 fails
Content-Type: message/rfc822

Return-Path: <mailman-bounces@lists.linuxtogo.org>
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb3 (2006-10-05) on 
 drlauer-research.com
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=BAYES_00 autolearn=ham 
 version=3.1.7-deb3
X-Original-To: mickey@vanille-media.de
Delivered-To: mickey@vanille-media.de
Received: from linuxtogo.org (linuxtogo.org [188.40.83.200]) by
 phalanx.drlauer-research.com (Postfix) with ESMTP id 7957158415B for
 <mickey@vanille-media.de>; Thu, 29 Apr 2010 12:48:51 +0200 (CEST)
Received: from localhost ([127.0.0.1]) by linuxtogo.org with esmtp (Exim
 4.69) (envelope-from <mailman-bounces@lists.linuxtogo.org>) id
 1O7RHN-0006gu-Ju for mickeyl@linuxtogo.org; Thu, 29 Apr 2010 12:47:37 +0200
Received: from micropolis.microdata-pos.de ([212.202.104.142]
 helo=squirrel.microdata-pos.de) by linuxtogo.org with esmtp (Exim 4.69)
 (envelope-from <michael@awek-microdata.de>) id 1O7RHL-0006fC-6C for
 openembedded-devel-owner@lists.openembedded.org; Thu, 29 Apr 2010 12:47:35
 +0200
Received: by squirrel.microdata-pos.de (Postfix, from userid 2006) id
 8600028083; Thu, 29 Apr 2010 12:14:38 +0200 (CEST)
Date: Thu, 29 Apr 2010 12:14:38 +0200
To: openembedded-devel-owner@lists.openembedded.org
Message-ID: <20100429101438.GD15511@squirrel.microdata-pos.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.13 (2006-08-11)
From: michael@awek-microdata.de (Michael Westermann)
Subject: package_deb and update-alteernatives-dpkg-native on amd64 fails
Sender: mailman-bounces@lists.linuxtogo.org
Errors-To: mailman-bounces@lists.linuxtogo.org
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: mailman-bounces@lists.linuxtogo.org
X-SA-Exim-Scanned: No (on linuxtogo.org); SAEximRunCond expanded to false
Content-Transfer-Encoding: 7bit

Hi,

I use openembeeded too make a short distro for our embedded boards. We
use a arm mx27 cpu. The Host system is a amd64 debian sid linux.
I use the git version from openembedded-dev.

I've the follow mistake/problem, on the rootfs the update-alternatives
dont work. I get the foolow messages:

Can't locate dpkg-gettext.pl in @INC (@INC contains: /etc/perl
/usr/local/lib/perl/5.10.1 /usr/local/share/perl/5.10.1 /usr/lib/perl5
/usr/share/perl5 /usr/lib/perl/5.10 /usr/share/perl/5.10
/usr/local/lib/site_perl . ../usr/lib/dpkg) at
/opt/oe/platform/cwmx27-awek-smartstorage-rel1/staging/x86_64-linux/usr/sbin/update-alternatives
line 7.

/opt/oe/platform/rel1/staging/x86_64-linux/usr/sbin/update-alternatives 

in /usr/sbin/update-alternatives are the

$admindir= "/var/lib/dpkg"; 
$dpkglibdir= "/usr/lib/dpkg";

but this is are paths from the host-system, the location from
dpkg-gettext.pl is:

/opt/oe/platform/rel1/staging/x86_64-linux/usr/lib/dpkg/dpkg-gettext.pl

How can I set the correct this paths?

I've test different versions from update-alternatives-dpkg-native e.g.

PREFERRED_VERSION_update-alternatives-native = "1.13.22"
PREFERRED_VERSION_dpkg-native = "1.13.22"

Michael


--=-T/aFB0hz797wPB31zHO+--
