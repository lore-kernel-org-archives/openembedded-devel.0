Received: from [74.93.1.97] (helo=azazel.hughes-family.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <craig@gumstix.com>) id 1If7Pl-0007nt-HK
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2007 07:13:53 +0200
Received: from [????????p???I#?$IPv6:fe80::216:cbff:fe05:3ed7] (Pookah.local
	[IPv6:fe80::216:cbff:fe05:3ed7%eth0])
	by azazel.hughes-family.org (Postfix) with ESMTP id 371EE9D2AB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2007 22:08:07 -0700 (PDT)
Message-Id: <ABA57F92-B9FA-41C5-B0CD-76A4A6A146A5@gumstix.com>
X-Habeas-Swe-6: email in exchange for a license for this Habeas
X-Habeas-Swe-3: like Habeas SWE (tm)
Date: Mon, 8 Oct 2007 22:08:07 -0700
X-Habeas-Swe-8: Message (HCM) and not spam. Please report use of this
From: Craig Hughes <craig@gumstix.com>
X-Habeas-Swe-5: Sender Warranted Email (SWE) (tm). The sender of this
X-Habeas-Swe-2: brightly anticipated
In-Reply-To: <432beae0710081610k11b018a9s164aff560466718d@mail.gmail.com>
References: <DE31D336-513F-40FF-B766-DCED127697B0@gumstix.com>
	<432beae0710081610k11b018a9s164aff560466718d@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Image-Url: http://www.hughes-family.org/craig/craig64.jpg
X-Habeas-Swe-7: warrant mark warrants that this is a Habeas Compliant
Mime-Version: 1.0 (Apple Message framework v752.3)
X-Habeas-Swe-4: Copyright 2002 Habeas (tm) 
X-Habeas-Swe-1: winter into spring
X-Habeas-Swe-9: mark in spam to <http://www.habeas.com/report/>.
X-Mailer: Apple Mail (2.752.3)
Subject: Re: monotone question
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
X-List-Received-Date: Tue, 09 Oct 2007 05:13:54 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed

On Oct 8, 2007, at 4:10 PM, Justin Patrin wrote:

> That's essentially the only way to fix it. You could also rename them
> or move them to another place. Monotone doesn't merge these since they
> aren't the same file ancestrally, they just happen to have the same
> name.

*sigh* OK.  It sucks that it doesn't at least give you the option of  
merging them, since identically named files in the same directory are  
more than likely related even if monotone doesn't know about it yet.   
For example, two branches both modify a package's patches in the same  
way because upstream changed...

>> That seems really bad cos there's a window
>> there where the org.gumstix.oe needs to be committed in a broken
>> state (missing those files)....
>
> True, but if you always expect every single revision to be bug- 
> free.....

Bug free is not the same as broken.  You'll never be bug free, but  
you should never be broken.  In situations where you have a build  
tree with multiple people working on it, people throw things at you  
hard if you ever break the build.  Big heavy things.  I guess the way  
around this potentially in this situation would be to just create a  
new branch off the current one, break that branch, propagate to it,  
fix the merge issues, then propagate from that branch back to the  
original one once everything's unbroken.  Huge pita, but it won't  
break the build for others working on the original branch in the  
meantime.

C


