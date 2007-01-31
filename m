Received: from [204.127.225.96] (helo=alnrmhc16.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <golly@stellarwerx.com>) id 1HCNfk-00021w-Qj
	for openembedded-devel@openembedded.org; Wed, 31 Jan 2007 23:11:20 +0100
Received: from gatekeeper.stellarwerx.com
	(c-68-57-212-205.hsd1.in.comcast.net[68.57.212.205])
	by comcast.net (alnrmhc16) with ESMTP
	id <20070131221119b16005m9she>; Wed, 31 Jan 2007 22:11:19 +0000
Received: by gatekeeper.stellarwerx.com (Postfix, from userid 500)
	id 0224A2E31; Wed, 31 Jan 2007 17:15:36 -0500 (EST)
From: "Mark Gollahon" <golly@stellarwerx.com>
To: openembedded-devel@openembedded.org
X-Originating-IP: 192.168.253.203
X-Mailer: Usermin 1.230
Message-Id: <1170281735.26425@gatekeeper.stellarwerx.com>
Date: Wed, 31 Jan 2007 17:15:35 -0500 (EST)
MIME-Version: 1.0
Subject: New IXP4XX-based Machine
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
X-List-Received-Date: Wed, 31 Jan 2007 22:11:21 -0000
Content-Type: multipart/mixed; boundary="bound1170281735"

--bound1170281735
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Hello!

As I have stated before, I am a bit new, so please bear with me.

I am trying to bring up OE on a new IXP4XX-based machine and having a little trouble with the "proper" way to do it.  For example, I created a whole new machine config, inserting what I think should be machine-specific settings, and importing the (now somewhat-defunct) ixp4xx.conf configuration (and later the ixp4xxbe.conf configuration).  My bootstrap-image gets everything compiled, but when it goes to build the rootfs, ipkg fails looking for task-base.

My question is not so much about getting ipkg to work (I have found several ways), but more about the "proper" way so that I don't go "spinning into the grass" in the future.  I noticed that during the rootfs build that the "ixp4xxbe" "arch" was not in the ipkg config file, so all of my "*_ixp4xxbe.ipk" files were completely ignored - stuff like "task-base"!  I ultimately had to append "armv5te" and "ixp4xxbe" to PACKAGE_EXTRA_ARCHS and that worked, but I worked on this on-and-off for over a week to figure it out.  I really don't want to do that again when/if I try to bring up another machine.

My question is - should I even be attempting to define a new machine and including ixp4xxbe.conf in it?  Should I define my own machine by copying the contents of ixp4xxbe.conf?  Should I have specified the "ixp4xxbe" machine file in my local.conf along with the extra (what I think should be) machine config?  Or should I define my own distro and put that machine config there?  What is the most appropriate way to do this?

Thank you!
-Mark Gollahon

--bound1170281735--
