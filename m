Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M0lE1-0003qQ-No
	for openembedded-devel@openembedded.org; Mon, 04 May 2009 01:36:02 +0200
Received: (qmail 23537 invoked from network); 3 May 2009 23:30:17 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 3 May 2009 16:30:17 -0700
Date: Sun, 3 May 2009 16:30:17 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090503233017.GE7973@smtp.west.cox.net>
References: <20090503233009.B15601880DC@amethyst.openembedded.net>
MIME-Version: 1.0
In-Reply-To: <20090503233009.B15601880DC@amethyst.openembedded.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [oe-commits] Tom Rini : base.bbclass: check_gcc3 needs to	check for gcc-3.4.6 first.
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
X-List-Received-Date: Sun, 03 May 2009 23:36:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2009 at 01:30:09AM +0200, GIT User account wrote:

> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 714bed6ab1174ec126ea7d8c8655d1cfd6900325
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=714bed6ab1174ec126ea7d8c8655d1cfd6900325
> 
> Author: Tom Rini <trini@embeddedalley.com>
> Date:   Sun May  3 19:23:57 2009 -0400
> 
> base.bbclass: check_gcc3 needs to check for gcc-3.4.6 first.
> Comment on what this function is used for primarily.  The default
> gcc3-native that we build is called 'gcc-3.4.6' so look for that one
> first.

I thought we had fixed this before, but apparently we had not.  I'd like
to propose two related changes, and then pull this all out for
stable/2009.  First, no distro has a preferred version for gcc3-native,
so I would like to drop gcc-native_3.4.4 and just use 3.4.6.  Second,
I'd like to change the order to:
'gcc-3.4.6 gcc-3.4.7 gcc-3.4 gcc34' as I'm unconvinced that anything
older than that will work for qemu-native (the only caller of
check_gcc3) given that people have problems with too old of a version of
gcc-3.4 being provided by their distro in the 'gcc 3.4.x toolchain'
package.

-- 
Tom Rini


