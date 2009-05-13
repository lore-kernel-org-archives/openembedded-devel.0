Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M4Fqh-0006ja-NJ
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 16:54:23 +0200
Received: (qmail 25655 invoked by uid 813007); 13 May 2009 14:47:38 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 May 2009 14:47:38 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 16:46:53 +0200
Message-Id: <1242226019-10881-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3
MIME-Version: 1.0
Subject: Some updates for GeodeLX based devices
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
X-List-Received-Date: Wed, 13 May 2009 14:54:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

As recently some useer on Angstrom-devel mailing list asked about state
of GeodeLX based devices in OE I decided to make it more up to date.

Result is this set of patches for review. I did not yet checked build
results on Alix.1c but this is planned for next few days.

[PATCH 1/6] Remove alix machine, update geodelx one to use Alix settings

This patch renames 'alix' machine to 'geodelx' which can be used by
anyone for other GeodeLX based devices.

[PATCH 2/6] kaeilos/sane-feed: remove alix, mark geodelx as i586

Fixed architecture settings for geodelx.

[PATCH 3/6] kaeilos.inc/sane-feed.inc: use spaces instead of tabs
[PATCH 4/6] kaeilos: use include/sane-feed.inc

Patch 2/6 looks strange when 4/6 is applied too but I wanted to make it
clean.

[PATCH 5/6] linux: drop alix, move geodelx to 2.6.29

GeodeLX machine in OE used 2.6.10 kernel which is deprecated in Ångström
(as our udev require at least 2.6.12 (if not .16 even)).

[PATCH 6/6] angstrom: use GCC 4.3.3 for Geode devices

GCC 4.3.3 has "-march=geode" which is used in tune-geode.inc so I bumped
it for Ångström. This is part of 'upgrade gcc/binutils' plan.




