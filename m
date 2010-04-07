Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1NzU4G-000671-4b
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Apr 2010 14:09:12 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 1807FE976E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Apr 2010 08:00:52 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Wed, 07 Apr 2010 08:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:message-id:mime-version:content-type;
	s=smtpout; bh=PD8x8jEye2EVxkRaGuNsX+LSQ7o=;
	b=sYVx02tmTQCj11WaCaeP5A5Jc1TjUOuPaWXPzEPxdr3XryqUDYUNbgdrPSMJqUBv0XP3AnureW4j3hHZ3iTfN2a0weFSJkCdqX+W5hwR5ztFMpcW7SwG4mPdvcpcKZzOb3VCFhPkdab4GtrE689aJZbAbK3v1vYzWFR6+hzz5uY=
X-Sasl-enc: uv0n/AfR6xICMQzAZGLSCvO1tzUeAl9GBqJzs3speGeb 1270641651
Received: from vitus.devnet.local (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 0F22A32FA8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Apr 2010 08:00:50 -0400 (EDT)
Date: Wed, 7 Apr 2010 14:00:47 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <alpine.DEB.1.10.1004071258530.3313@vitus.devnet.local>
User-Agent: Alpine 1.10 (DEB 962 2008-03-14)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: recipe to always fetch latest from SCM
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
X-List-Received-Date: Wed, 07 Apr 2010 12:09:13 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

Hello!

What is the best way to code a recipe which always fetches HEAD from a 
SCM?  Without accessing mirror servers first?

For some internal packages which are still WIP I would like to fetch the 
newest sourcecode from a git server whenever I do a "-c clean" and 
rebuild.  I've experimented with AUTOREV and SRCREV but without adding 
"tag=HEAD" this fails and when I add HEAD bitbake refers to a tar.bz2 
built some days ago.  Maybe related to that I would like to fetch from a 
branch?

Below my latest try, this tries to fetch revision "1" (?) from git :-(

bitbake version 1.8.18
openembedded stable branch

----------------
PV = "0.0.0+gitr${SRCREV}"
PR = "r0"

SRC_URI = \
 	"git://git@server.local/prog.git;protocol=ssh+git;branch=devel \
         "

S = "${WORKDIR}/git"

inherit cmake
----------------

Any pointers?  I've searched the wiki and existing recipes but this way to 
fetch is obviously uncommon for public recipes.

Bye,
   Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


