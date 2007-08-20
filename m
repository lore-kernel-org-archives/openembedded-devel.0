Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1IN7X3-0004ft-9A
	for openembedded-devel@openembedded.org; Mon, 20 Aug 2007 15:43:06 +0200
Received: (qmail 17427 invoked by uid 813007); 20 Aug 2007 13:42:07 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 20 Aug 2007 13:42:07 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2007 15:41:52 +0200
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200708201541.54798.openembedded@hrw.one.pl>
Subject: QEmu update from Poky
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2007 13:43:11 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


In Poky we use qemu 0.9+20070613 for some time. It works on i386 and amd64 
build machines and generate binary locales for ARM without problems.

OE use old 0.8.2 version which fails on amd64. There is also 0.9+20070701 
version set as non-default and this one should work on amd64 machines 
(but probably will fail on i386 due to lack of MAP_32BIT on this arch).

I plan to replace old 0.8.2 and 0.9+20070701 versions by 0.9+20070613 from 
Poky to give people version which works on 32/64 machines without 
problems. This version has also some other extras added by OH - like 
touchscreen emulation based on USB Wacom tablet emulation.

Any objections?

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

          Monday is a hard way to spend one-seventh of your life.




