Received: from ramkesd003-e.ra.rockwell.com ([205.175.240.251]
	helo=ramilwsmtp01.ra.rockwell.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mkes@ra.rockwell.com>) id 1SC5xI-0006xV-JM
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Mar 2012 11:11:12 +0200
Importance: Normal
X-Priority: 3 (Normal)
In-Reply-To: 
References: 
From: Miroslav Kes <mkes@ra.rockwell.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <OFE54BDE34.5CE49E14-ONC12579CD.0030B3B6-C12579CD.0030B3B7@ra.rockwell.com>
Date: Mon, 26 Mar 2012 10:51:57 +0200
X-Mailer: Lotus Domino Web Server Release 8.5.2FP3 July 10, 2011
X-MIMETrack: Serialize by HTTP Server on
	RAEMEAMail02/Europe/RA/Rockwell(Release
	8.5.2FP3|July 10, 2011) at 03/26/2012 10:51:57 AM,
	Serialize complete at 03/26/2012 10:51:57 AM,
	Itemize by HTTP Server on RAEMEAMail02/Europe/RA/Rockwell(Release
	8.5.2FP3|July 10, 2011) at 03/26/2012 10:51:57 AM,
	Serialize by Router on RAMilwSMTP01/Milwaukee/RA/Rockwell at 03/26/2012
	04:02:15 AM, Serialize complete at 03/26/2012 04:02:15 AM
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Broken download URI in util-linux-ng recipe
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
X-List-Received-Date: Mon, 26 Mar 2012 09:11:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"

   Hi,
   The URI specified in the
   openembedded/recipes/util-linux-ng/util-linux-ng.inc is broken.
   SRC_URI =
   "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v${PV}/util-linux-ng
   -${PV}${RC}.tar.bz2
   This evaluates for example to
   http://kernel.org/pub/linux/utils/util-linux-ng/v2.18/util-linux-ng-2.1
   8.tar.bz2 which doesn't exist! But the tarball can be found at
   http://kernel.org/pub/linux/utils/util-linux/v2.18/util-linux-ng-2.18.t
   ar.bz2
   The correct definition should look like:
   SRC_URI =
   "${KERNELORG_MIRROR}/pub/linux/utils/util-linux/v${PV}/util-linux-ng-${
   PV}${RC}.tar.bz2
   Regards
   Mira Kes

