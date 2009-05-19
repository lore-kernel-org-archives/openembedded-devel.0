Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M6OBY-00010n-1v
	for openembedded-devel@openembedded.org; Tue, 19 May 2009 14:12:44 +0200
Received: (qmail 31015 invoked by uid 813007); 19 May 2009 12:05:20 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 May 2009 12:05:20 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 May 2009 14:05:14 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc3-00005-g51bc6b7-dirty; KDE/4.2.2;
	x86_64; ; )
MIME-Version: 1.0
Message-Id: <200905191405.15699.marcin@juszkiewicz.com.pl>
Subject: [RFC] task-proper-tools fixing
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
X-List-Received-Date: Tue, 19 May 2009 12:12:45 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


During work on 'task-proper-tools' I found a problem.

This task tries to replace busybox applets with full versions of 
applications. I am adding new entries to this recipe to get better 
coverage and found some commands which are placed in different places.

command   | busybox | command   | Debian    | package
----------|---------|-----------|-----------|-------------
chattr    | /bin/   | /usr/bin/ | /usr/bin/ | coreutils
df        | /bin/   | /usr/bin/ | /bin/     | coreutils
getopt    | /bin/   | /usr/bin/ | /usr/bin/ | util-linux-ng
mktemp    | /bin/   | /usr/bin/ | /bin/     | coreutils
nice      | /bin/   | /usr/bin/ | /usr/bin/ | coreutils
run-parts | /bin/   | /usr/bin/ | /bin/     | debianutils
watch     | /bin/   | /usr/bin/ | /usr/bin/ | procps

The question is: what do we do with those commands? Move all of them to
/bin/ directory or move them to Debian locations?


Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz





