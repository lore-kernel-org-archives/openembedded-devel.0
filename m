Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MXxBt-00058q-BP
	for openembedded-devel@openembedded.org; Mon, 03 Aug 2009 15:03:01 +0200
Received: (qmail 23049 invoked by uid 813007); 3 Aug 2009 12:47:35 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 3 Aug 2009 12:47:34 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 3 Aug 2009 14:48:04 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4-00009-g83a3792-dirty; KDE/4.2.96;
	x86_64; ; )
MIME-Version: 1.0
Message-Id: <200908031448.05525.marcin@juszkiewicz.com.pl>
Subject: update-modules is broken
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
X-List-Received-Date: Mon, 03 Aug 2009 13:03:02 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi

Today Marco Cavallini pointed me to his failed build: 
http://tinderbox.openembedded.net/builds/21533/?page=1

Image was not created due to lack of 'modutils-depmod' package. But 
where from it took this dependency...

I took a look and found. Our 'update-modules' recipe has 
PACKAGE_ARCH=all but relies on MACHINE_FEATURES to check between 2.4 and 
2.6 behaviour (modutils-depmod contra module-init-tools-depmod). So if 
you do build for target which does not have 'kernel26' feature listed 
(for example: vortex86sx) you will get 'update-modules' package 
(ARCH:all) which depends on 'modutils-depmod' which will not be built 
for other targets.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




