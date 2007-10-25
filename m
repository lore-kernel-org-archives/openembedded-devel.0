Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@haerwu.biz>) id 1Il6MC-0005po-A4
	for openembedded-devel@openembedded.org; Thu, 25 Oct 2007 19:18:56 +0200
Received: (qmail 19815 invoked by uid 813007); 25 Oct 2007 17:11:32 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 25 Oct 2007 17:11:32 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2007 19:11:26 +0200
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200710251911.29188.openembedded@haerwu.biz>
Subject: [RFC] src_distribute class change
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
X-List-Received-Date: Thu, 25 Oct 2007 17:18:56 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


In Poky we have rewritten version of src_distribute.bbclass which I would 
like to merge into OpenEmbedded. The problem is that it works in a bit 
other way then OE version (on which Poky version is based).

OE version use conf/licenses.conf file to get list of LICENSE values which 
user running build wants to distribute. This method works but many 
recipes has own values of LICENSE field so editing of file is not so 
comfortable.

Version available in Poky solves it in other way. Each source is 
copied/moved/symlinked to SRC_DISTRIBUTE_DIR/LICENSE_VALUE where 
LICENSE_VALUE is name (or part of it if there are spaces in it) of 
license. This way user can select which sources he wants to distribute by 
just copying directories - no need to manually enter values into 
licenses.conf file (which is now deprecated and not used).

As I do not know how many people use this class I prefer to write about 
changes and wait for comments. If there will be no comments until Monday 
29 October 2007 I will merge it like it is.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

Vi has two modes: the one in which it beeps, and the one in which it 
doesn't.




