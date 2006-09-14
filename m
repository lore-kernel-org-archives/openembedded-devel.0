Received: from [213.39.232.198] (helo=moskovskaya.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <di@mail.fh-wedel.de>) id 1GNqux-0001g9-Hs
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Sep 2006 15:06:11 +0200
Received: from di by moskovskaya.fh-wedel.de with local (Exim 4.50)
	id 1GNqrR-0005Nw-Fe for openembedded-devel@lists.openembedded.org;
	Thu, 14 Sep 2006 15:02:33 +0200
Date: Thu, 14 Sep 2006 15:02:33 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20060914130233.GA10260@fh-wedel.de>
Mime-Version: 1.0
X-PGP-Fingerprint: C98D 598A DA73 DF9F 610D  632E 4468 B911 BF9B 8D95
X-PGP-Key-ID: 0xBF9B8D95
User-Agent: Mutt/1.5.9i
Sender: Martin Dietze <di@mail.fh-wedel.de>
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: di@mail.fh-wedel.de
Subject: postinst jobs and "exit 1"
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
X-List-Received-Date: Thu, 14 Sep 2006 13:06:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

 lots of packages start their postinst jobs like this:

| test -z "$D" || exit 1

When creating firmware images using recent OE recipes (nylon
distro and mtx-2 hardware), this seems to cause problems,
either bitbake complains about "exit 1" in the log file when
doing the rootfs or lots of postinst jobs are not run after
installing the image. 

Is the above test deprecated and should be replaced by
something not exit'ing at all? If yes, who is going to adapt
all the existing packages still doing this?

Cheers,

Martin

-- 
-------------- Martin Dietze --------------- / -- 4G Systeme GmbH Hamburg ---
-- martin@the-little-red-haired-girl.org -- / ---- dietze@4g-systems.com ----
------------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Ed, the greatest WYGIWYG editor of all.


