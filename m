Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1It2k3-0005FF-Cs
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Nov 2007 16:04:23 +0100
Received: by an-out-0708.google.com with SMTP id c31so226163ana
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Nov 2007 07:02:37 -0800 (PST)
Received: by 10.100.232.13 with SMTP id e13mr2706484anh.1195221551770;
	Fri, 16 Nov 2007 05:59:11 -0800 (PST)
Received: from lenovo ( [75.121.174.189])
	by mx.google.com with ESMTPS id 15sm89774nzn.2007.11.16.05.59.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2007 05:59:10 -0800 (PST)
Received: by lenovo (sSMTP sendmail emulation); Fri, 16 Nov 2007 07:59:09 -0600
Date: Fri, 16 Nov 2007 07:59:09 -0600
From: David Farning <dfarning@gmail.com>
To: OpenEmbedded Development List <openembedded-devel@lists.openembedded.org>
Message-ID: <20071116135909.GA19085@lenovo>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: Cross compiler questions
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
X-List-Received-Date: Fri, 16 Nov 2007 15:04:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I am trying to get my mind wrapped around how OE handles
cross-compiling.  The first question is where is the cross compiler
tool chain getting pulled into the build queue?

I am greping for gcc-native and quilt to figure out how they are
included or required?  I see a PREFERED_VERSION set in the distro.  Is
PREFERED_VERSION a method of including dependancies?

Also, the tmp/cross directory has three distinct file groupings.

dfarning@lenovo:~/oe/oetmp$ find cross -maxdepth 3 -type d
cross
cross/i586-angstrom-linux
cross/i586-angstrom-linux/bin
cross/lib
cross/lib/gcc
cross/lib/gcc/i586-angstrom-linux
cross/i686-linux
cross/i686-linux/i586-angstrom-linux
cross/i686-linux/i586-angstrom-linux/lib
cross/i686-linux/i586-angstrom-linux/include
cross/bin
cross/libexec
cross/libexec/gcc
cross/libexec/gcc/i586-angstrom-linux
cross/include
cross/share

What is the difference between 
cross
cross/i586-angstrom-linux
cross/i686-linux/i586-angstrom-linux

Why are thing different things being placed in different dirs?


Thanks
David Farning



