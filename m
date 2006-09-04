Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GKMTD-0005Pu-QK for openembedded-devel@lists.openembedded.org;
	Mon, 04 Sep 2006 23:59:08 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 3E73E401B3B; Mon,  4 Sep 2006 14:35:37 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060904213537.3E73E401B3B@tinman.treke.net>
Date: Mon,  4 Sep 2006 14:35:37 -0700 (PDT)
Subject: [Bug 1383] [PATCH] packages ztenv and libeb
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
X-List-Received-Date: Mon, 04 Sep 2006 21:59:08 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1383





------- Comment #5 from koen@dominion.kabel.utwente.nl  2006-09-04 14:35 -------
libeb is currently unmergable due to the 'ZAURUS' stuff in the patch. Having a
recipe that is (unnecessarily) broken from 80% of the machines in OE is IMO
worse than not having it.

the badness is in ztenwindow.cpp:

#ifdef ZAURUS
extern "C" {
  extern int zau_use_itimer;
  extern int zau_c3000_mode;
  extern int zau_opened;
  int zau_temporary_close_all(void);
  void zau_get_zio_status(char *buf, int fd);
  extern void (*zau_open_trig) (void);
};#endif

So the patch to libeb only seems to be needed in 'ZAURUS'-mode (whatever that
may be). The whole zio.patch smells like hackery to avoid bugs (like running
out of file descriptors) in the 2.4.crappix kernel.
I'll have a stab at adding libeb without zio.patch tomorrow. Could you ask
'Nemo' to provide his full name
(http://www.openembedded.org/wiki/MaintainerPolicy)? 


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


