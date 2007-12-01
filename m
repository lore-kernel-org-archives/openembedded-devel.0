Received: from [209.85.146.177] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <cliff.brake@gmail.com>) id 1IyXIH-0003Lv-74
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Dec 2007 19:42:25 +0100
Received: by wa-out-1112.google.com with SMTP id l24so4059254waf
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Dec 2007 10:39:08 -0800 (PST)
Received: by 10.115.95.1 with SMTP id x1mr1390199wal.1196534348783;
	Sat, 01 Dec 2007 10:39:08 -0800 (PST)
Received: by 10.114.254.11 with HTTP; Sat, 1 Dec 2007 10:39:08 -0800 (PST)
Message-ID: <f96d234e0712011039k53078fa0h737f2cbc3bd65a6@mail.gmail.com>
Date: Sat, 1 Dec 2007 13:39:08 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <A0AACB011FF0474492071F3E72FB188F958C5A@USSYML02.ad.sjm.com>
MIME-Version: 1.0
References: <20071129172123.GA29463@buddha.tw.openmoko.com>
	<474F1835.6060002@student.utwente.nl>
	<A0AACB011FF0474492071F3E72FB188F958C5A@USSYML02.ad.sjm.com>
Subject: Re: Firewall blocking access to monotone server?
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
X-List-Received-Date: Sat, 01 Dec 2007 18:42:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Nov 30, 2007 12:41 AM, Tiller, Jason <jtiller@sjm.com> wrote:
> Hello, OE folx!
>
> I approached the list a couple of weeks ago asking about running OE under Cygwin.  The overwhelming consensus was that I shouldn't even embark on that headache-laden path and instead scare up a Linux box for my OE work.  Well, I took your considered advice and now I'm trying to get OE running.
>
> I'm running on a 400MHz P-III with 256MB of memory running RHEL 4.  The OS is mandated by my IT guys.  I got everything down, finally got everything built (well, so far), including git, svn, mtn, boost, (1.33.1), bb, and a whole host of other packages.  My poor little box has been compiling its little brains out.  I think I have everything in place.
>
> I read the tutorial and got stuck at the actual retrieval of the mtn database.  I downloaded the mtn 0.36 OE snapshot, but when I try to do the first "mtn pull" against monotone.openembedded.org, the connection hangs.  It also hangs against the other servers that have been mentioned.  I think this is due to our company's draconian firewall policy.

Another option would be to set up a build system outside your
organization and access it using SSH.  You can do all your builds
externally, and use scp to copy the images back to wherever you are
working.  For example, if you have high speed internet access at your
home, it is trivial to put a Linux box on the internet and access it
remotely.  This will allow how to set it up however you want.

I often do this when I'm working on-site with customers and am doing
builds on my workstation back at the office.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


