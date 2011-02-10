Received: from drewtech.com ([66.36.241.150] helo=server.drewtech.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joravec@drewtech.com>) id 1PndBP-0006Za-Us
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 21:32:08 +0100
Received: (qmail 17405 invoked from network); 10 Feb 2011 15:27:56 -0500
Received: from adsl-75-58-206-177.dsl.sfldmi.sbcglobal.net (HELO
	?192.168.0.152?) (75.58.206.177)
	by drewtech.com with SMTP; 10 Feb 2011 15:27:55 -0500
Message-ID: <4D544976.6010800@drewtech.com>
Date: Thu, 10 Feb 2011 15:24:22 -0500
From: Joey Oravec <joravec@drewtech.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.14) Gecko/20110123 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: openembedded with a prebuilt external toolchain
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
X-List-Received-Date: Thu, 10 Feb 2011 20:32:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm trying to use openembedded with an external prebuilt toolchain. The 
docs at http://docs.openembedded.org/usermanual/usermanual.html mark 
this as TODO so maybe we can "do" that in this email chain. :)

Marvell provides a *.tar.gz with gcc and C libraries, which I've 
uncompressed somewhere in my home directory. My goal is to build a root 
filesystem with some assortment of packages, but at this point I'm just 
trying "bitbake nano" which is the very first example in the Getting 
Started. That seems like a logical start to board bring-up.

I'm assuming that I need to add some lines to build/conf/local.conf that 
tell OE to make no attempt at building its own compiler or C library (it 
can't anyway, it doesn't know my chip!) and to call my pre-built one 
instead. It looks like I'd want to add a few lines about TOOLCHAIN_*, 
but that uses a recipe for external toolchain, which assumes that it has 
some meta toolchain, and I'm floundering and getting nowhere. Couldn't 
find any of these magic variables documented in the usermanual so I've 
been digging through recipes to learn any of this.

Is it possible to add a few lines that tell OE the path and filename of 
my compiler? Or is it more complicated than that?

-joey


