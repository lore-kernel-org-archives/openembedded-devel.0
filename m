Received: from [74.93.1.97] (helo=azazel.hughes-family.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <craig@gumstix.com>) id 1IiDXB-0007ZN-IH
	for openembedded-devel@openembedded.org; Wed, 17 Oct 2007 20:22:21 +0200
Received: from [JB?????IPv6:fe80::216:cbff:fe05:3ed7] (unknown
	[IPv6:fe80::216:cbff:fe05:3ed7%eth0])
	by azazel.hughes-family.org (Postfix) with ESMTP id B9C599D2C2;
	Wed, 17 Oct 2007 11:00:40 -0700 (PDT)
X-Habeas-Swe-9: mark in spam to <http://www.habeas.com/report/>.
X-Habeas-Swe-6: email in exchange for a license for this Habeas
X-Habeas-Swe-3: like Habeas SWE (tm)
Date: Wed, 17 Oct 2007 11:00:41 -0700
X-Habeas-Swe-8: Message (HCM) and not spam. Please report use of this
From: Craig Hughes <craig@gumstix.com>
X-Habeas-Swe-5: Sender Warranted Email (SWE) (tm). The sender of this
X-Habeas-Swe-2: brightly anticipated
In-Reply-To: <47163EAF.7040000@student.utwente.nl>
References: <47163EAF.7040000@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
X-Image-Url: http://www.hughes-family.org/craig/craig64.jpg
X-Habeas-Swe-7: warrant mark warrants that this is a Habeas Compliant
Mime-Version: 1.0 (Apple Message framework v752.3)
X-Habeas-Swe-4: Copyright 2002 Habeas (tm) 
X-Habeas-Swe-1: winter into spring
Message-Id: <5AEA0308-32D1-44FD-BBE3-0E34B440FB8F@gumstix.com>
X-Mailer: Apple Mail (2.752.3)
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: COMPILE_FEATURES?
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
X-List-Received-Date: Wed, 17 Oct 2007 18:22:22 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed

On Oct 17, 2007, at 9:56 AM, Koen Kooi wrote:

> [18:53] hrw: COMPILE_FEATURES = "thumb iwmmxt"
> [18:53] hrw: or ARCH_FEATURES
> [18:53] koen: that starts to look an awfull lot like use flags, though

Also, I don't think is really is like USE flags.  Well, it's a very  
small subset of USE.  The specification here is simply more fine- 
grained detail on the architecture, and differs from specifying  
CFLAGS I guess only in that some packages will have custom code (like  
hand-written assembler or something) for different architectures.   
This is not definition a change in functionality of the package, but  
just a change in which implementation of the functionality to  
select.  Most USE flags specify a feature set to include/exclude --  
"iwmmxt" or "thumb" don't really change "features", but just the  
implementation details of those features.

C


