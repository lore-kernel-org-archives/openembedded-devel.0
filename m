Received: from [213.39.232.198] (helo=moskovskaya.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <di@mail.fh-wedel.de>) id 1GNszj-0003m8-RZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Sep 2006 17:19:15 +0200
Received: from di by moskovskaya.fh-wedel.de with local (Exim 4.50)
	id 1GNswD-0007Bx-Ei for openembedded-devel@lists.openembedded.org;
	Thu, 14 Sep 2006 17:15:37 +0200
Date: Thu, 14 Sep 2006 17:15:37 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20060914151537.GA13921@fh-wedel.de>
References: <20060914130233.GA10260@fh-wedel.de>
	<1158239761.5399.1.camel@localhost.localdomain>
Mime-Version: 1.0
In-Reply-To: <1158239761.5399.1.camel@localhost.localdomain>
X-PGP-Fingerprint: C98D 598A DA73 DF9F 610D  632E 4468 B911 BF9B 8D95
X-PGP-Key-ID: 0xBF9B8D95
User-Agent: Mutt/1.5.9i
Sender: Martin Dietze <di@mail.fh-wedel.de>
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: di@mail.fh-wedel.de
Subject: Re: postinst jobs and "exit 1"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Sep 2006 15:19:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, September 14, 2006, Richard Purdie wrote:

> Based on that are there any specific examples giving cause for concern?

The problem was somewhere else. Since there is some checking
for errors after having performed the offline installation into
the image's root file system I got an error after an "exit 1"
in a postinst job. As it turned out the problem was not the
action performed but the fact that there had been a `set -x'
before it in the recipe. Took me half a day to find out :)
Sorry for having bothered you with this.

Cheers,

Martin

-- 
-------------- Martin Dietze --------------- / -- 4G Systeme GmbH Hamburg ---
-- martin@the-little-red-haired-girl.org -- / ---- dietze@4g-systems.com ----
------------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Yoda of Borg I am. Assimilated you will be.


