Received: from [74.93.1.97] (helo=azazel.hughes-family.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <craig@gumstix.com>) id 1IZtG0-0000rz-1H
	for openembedded-devel@openembedded.org; Mon, 24 Sep 2007 21:06:12 +0200
Received: from [10.8.22.2] (adsl-76-246-147-241.dsl.pltn13.sbcglobal.net
	[76.246.147.241])
	by azazel.hughes-family.org (Postfix) with ESMTP id 1592F9D4B4;
	Mon, 24 Sep 2007 12:01:51 -0700 (PDT)
X-Habeas-Swe-9: mark in spam to <http://www.habeas.com/report/>.
X-Habeas-Swe-6: email in exchange for a license for this Habeas
X-Habeas-Swe-3: like Habeas SWE (tm)
Date: Mon, 24 Sep 2007 12:01:53 -0700
X-Habeas-Swe-8: Message (HCM) and not spam. Please report use of this
From: Craig Hughes <craig@gumstix.com>
X-Habeas-Swe-5: Sender Warranted Email (SWE) (tm). The sender of this
X-Habeas-Swe-2: brightly anticipated
In-Reply-To: <46F80688.2020702@trolltech.com>
References: <46F587F7.4060501@balister.org> <46F80688.2020702@trolltech.com>
To: openembedded-devel@lists.openembedded.org
X-Image-Url: http://www.hughes-family.org/craig/craig64.jpg
X-Habeas-Swe-7: warrant mark warrants that this is a Habeas Compliant
Mime-Version: 1.0 (Apple Message framework v752.3)
X-Habeas-Swe-4: Copyright 2002 Habeas (tm) 
X-Habeas-Swe-1: winter into spring
Message-Id: <70B54FE7-41C6-4C21-AB2D-073399350E5A@gumstix.com>
X-Mailer: Apple Mail (2.752.3)
Cc: openembedded-devel@openembedded.org
Subject: Re: How should OE be used?
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
X-List-Received-Date: Mon, 24 Sep 2007 19:06:12 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed

On Sep 24, 2007, at 11:48 AM, Lorn Potter wrote:

> I have always thought that oe needed an easier way to choose packages,
> like buildroot.
>
> Some gui that can edit all the conf's and task's, and image.bb's
> painlessly and easily would make a tom of difference.
> The learning curve for oe is too high.
>
> Take buildroot, for example. A person can download it, run make
> menuconfig, set up the system, arch, and select packages, all in  
> one go.
> You do not need to know that you should have to either edit or create
> your own tasks, or image .bb's, much less the syntax for those files.

You're kind of comparing apples to tangerines though.  In buildroot,  
yes, for packages which already exist (and work properly -- there's  
much dead wood in buildroot) you can select them to be compiled using  
a menuconfig/xconfig thing.  But in OE, you could just download and  
install the .ipkg instead, which is a lot cleaner.  Buildroot is  
missing 90% of the packages which are in OE, and for those, in  
buildroot, you'd have to write your own package/*.mk, as well as  
figure out what patches you need to implement to get the package to  
cross-compile, etc.  And you definitely need to learn the ins and  
outs of how buildroot does things internally to implement one of  
those *.mk files correctly.

But your basic premise of select-packages-to-go-into-image using some  
kind of UI thing does make sense.  I just don't think it's as bad in  
OE as you think, nor as good in buildroot ;)

C


