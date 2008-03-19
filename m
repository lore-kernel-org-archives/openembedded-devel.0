Received: from [216.252.110.227] (helo=web56303.mail.re3.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <catinella@yahoo.com>) id 1Jc0I1-00037A-KN
	for openembedded-devel@openembedded.org; Wed, 19 Mar 2008 16:33:20 +0100
Received: (qmail 62531 invoked by uid 60001); 19 Mar 2008 15:33:14 -0000
X-YMail-OSG: 2yfBY78VM1lv6uL0.xi1hzu4.pg54B6nmO9MpEsoSGn5hcYs9LIh9rtUclPJOd8LiQ--
Received: from [193.227.215.155] by web56303.mail.re3.yahoo.com via HTTP;
	Wed, 19 Mar 2008 08:33:14 PDT
Date: Wed, 19 Mar 2008 08:33:14 -0700 (PDT)
From: Silvano Catinella <catinella@yahoo.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47DF918E.6070907@gmail.com>
MIME-Version: 1.0
Message-ID: <780389.61498.qm@web56303.mail.re3.yahoo.com>
X-SA-Exim-Connect-IP: 216.252.110.227
X-SA-Exim-Mail-From: catinella@yahoo.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: WPkg
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
X-List-Received-Date: Wed, 19 Mar 2008 15:33:20 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hello,

I am writing a new concept package manager, it is born just for my softwares
but perhaps it would be interesting for embedded linux distro. I hope ;-)

Many persons told me: why a new software package manager?? there are already
many!

I had necessity to install a software with many platform dependent components
and some independent one. So because I would not many packages the available
package managers where inadequate. The problem is the same if the software I
want install is composed by a core and many GUI library dependent (eg. GTK, QT,
Motif..), or is the same if I have many different pointer devices (eg. mouse,
pen, joystik..).

In order to have a general solution that allows me to install a software in a
non perfectly defined system I started to write WPkg.

This is basically a framework, the developper can write new plugins to perform
new actions or tests, and inside the package's configuration file he can use
them. The plugins are generic ones and he or others can use them in other
packages.

My first releases was in C/Tcl. The C component was a small xml-database. 
A database is necessary because the plugins can modify the configuration data,
that is read by another plugin... and so on. I have not used one of the many
fast available xml-db because I want a very small and light code.

Now, I am rewriting this component in C/C++, and when I will produce a beta
release I will start to integrate it with the other project parts (C++/C/Tcl).
I will also begin to write a parallel version of Tcl components, but they will
be written in C++, so I will obtain a pure C/C++ code too.

I would ask you if my project could be useful for you.


Thank you for your time.

Best regards

Silvano Catinella
catinella@yahoo.com



      ____________________________________________________________________________________
Never miss a thing.  Make Yahoo your home page. 
http://www.yahoo.com/r/hs


