Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Nu8T2-0005sU-8X
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 19:04:41 +0100
Received: (qmail 18464 invoked by uid 813007); 23 Mar 2010 18:01:33 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Mar 2010 18:01:33 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Mar 2010 19:01:23 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.34-rc2; KDE/4.4.1; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201003231901.24017.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] Removal of e2fsprogs-libs
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
X-List-Received-Date: Tue, 23 Mar 2010 18:04:41 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit


During last days I spent a bit of time on e2fsprogs* and util-linux-ng 
recipes. They are cleaner now but there is still some work to do.

We have many recipes which depends on 'e2fsprogs-libs' when they want 
'libblkid' or 'libuuid' which are provided by 'e2fsprogs-libs' and 
'util-linux-ng' recipes. I checked how Debian solves that and got into point 
where there is no 'e2fsprogs-libs' recipes in my tree and everything is 
building.

What needs to be changed?

1. git rm -r recipes/e2fsprogs-libs
2. check each recipe which depends on 'e2fsprogs-libs' which library it really
   wants
3. change each recipe which wants 'libblkid' or 'libuuid' to depend on 
   'util-linux-ng'
4. change each recipe which wants 'libcom_err' or 'libss' to depend on 
   'e2fsprogs'
5. add "--with-elf-shlibs" to 'e2fsprogs' to get 'libcom_err' and 'libss'
6. fix packaging of 'e2fsprogs' to get separate packages for libraries.

I can work on that in next days but want to inform everyone that such change 
will be done.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




