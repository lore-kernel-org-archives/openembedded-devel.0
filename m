Received: from [74.93.1.97] (helo=azazel.hughes-family.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <craig@gumstix.com>) id 1IexiH-0008SX-Iz
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Oct 2007 20:52:22 +0200
Received: from [192.168.1.114] (adsl-70-231-255-90.dsl.snfc21.sbcglobal.net
	[70.231.255.90])
	by azazel.hughes-family.org (Postfix) with ESMTP id 1B3AF9D2AB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2007 11:46:38 -0700 (PDT)
Message-Id: <DE31D336-513F-40FF-B766-DCED127697B0@gumstix.com>
X-Habeas-Swe-6: email in exchange for a license for this Habeas
X-Habeas-Swe-3: like Habeas SWE (tm)
Date: Mon, 8 Oct 2007 11:46:40 -0700
X-Habeas-Swe-8: Message (HCM) and not spam. Please report use of this
From: Craig Hughes <craig@gumstix.com>
X-Habeas-Swe-5: Sender Warranted Email (SWE) (tm). The sender of this
X-Habeas-Swe-2: brightly anticipated
To: openembedded-devel@lists.openembedded.org
X-Image-Url: http://www.hughes-family.org/craig/craig64.jpg
X-Habeas-Swe-7: warrant mark warrants that this is a Habeas Compliant
Mime-Version: 1.0 (Apple Message framework v752.3)
X-Habeas-Swe-4: Copyright 2002 Habeas (tm) 
X-Habeas-Swe-1: winter into spring
X-Habeas-Swe-9: mark in spam to <http://www.habeas.com/report/>.
X-Mailer: Apple Mail (2.752.3)
Subject: monotone question
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
X-List-Received-Date: Mon, 08 Oct 2007 18:52:22 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed

I'm trying to propagate changes from the org.openembedded.dev branch  
onto my own branch, which I'd previous split off of org.oe.dev:

craig@azazel ~/code/gumstix/build/oe/org.gumstix.oe $ mtn propagate  
org.openembedded.dev org.gumstix.oe
mtn: propagating org.openembedded.dev -> org.gumstix.oe
mtn: [source] 1a130f677a5150a067c580db5a25b619d936b441
mtn: [target] 4cd685ff40e8d2ee51c4e79e8fe6545549b865b6
mtn: warning: rename target conflict: nodes 24673, 24302, both want  
parent 2139, name udev-115
mtn: warning: rename target conflict: nodes 24685, 24309, both want  
parent 2139, name udev_115.bb
mtn: warning: rename target conflict: nodes 24693, 24630, both want  
parent 25, name wifistix
mtn: warning: rename target conflict: nodes 24718, 24372, both want  
parent 23861, name gumstix-pxa270-mmc.patch
mtn: warning: rename target conflict: nodes 24719, 24373, both want  
parent 23861, name smc911x-fixup.patch
mtn: warning: resolve non-content conflicts and then try again.
mtn: error: merge failed due to unresolved conflicts

Now after some googling and head scratching, I've managed to decipher  
those errors (which call themselves warnings) mean that the left and  
right branches both added a new file with the same name.  But, how do  
I resolve this conflict in a propagate?  In a merge, I could just mv  
the file from my workdir then merge to get the file from the other  
branch, then manually merge; kind of a PITA it should just diff3 them  
for me with an empty ancestor or something and let me do the merge  
that way -- no idea why there's a special case when the ancestor is  
non-existent vs existent.  But with a propagate, there is no  
"workdir" in which to perform this.  Is the only way to resolve this  
to, say, checkout org.gumstix.oe, then delete the files from it,  
commit, then propagate?  That seems really bad cos there's a window  
there where the org.gumstix.oe needs to be committed in a broken  
state (missing those files)....

Anyone got any thoughts on how to resolve this?

C


