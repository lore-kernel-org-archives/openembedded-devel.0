Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GuSmv-0007rO-Bu
	for openembedded-devel@openembedded.org; Wed, 13 Dec 2006 13:00:55 +0100
Received: (qmail 8991 invoked by uid 813007); 13 Dec 2006 11:54:19 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 13 Dec 2006 11:54:19 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
Organization: OpenEmbedded
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Dec 2006 12:54:18 +0100
User-Agent: KMail/1.9.5
X-PRIORITY: 2 (High)
Priority: urgent
MIME-Version: 1.0
Message-Id: <200612131254.18279.openembedded@hrw.one.pl>
Subject: Unifing recipes
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
X-List-Received-Date: Wed, 13 Dec 2006 12:01:18 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


One of things on my todo list was 'improve dbus packaging'. But when 
I looked into packages/dbus/ I discovered 6 recipes of same software (in 
misc versions) without common things moved into one included file.

Does it was really hard to create common dbus.inc when 2nd or 3rd recipe 
was added? 

I know that 'cp old.bb new.bb' is easiest way of adding new version but 
sooner or later we will came into situation when we will have many recipes 
which will be hard to fix without splitting first.

So if you are a developer - please create common PN.inc file when you are 
adding new recipe for other version of application.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                 Don't panic. Count to ten ... then panic!




