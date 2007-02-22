Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HKCCd-0001qT-GI
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 12:33:35 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HKCCU-0005oc-3W
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 12:33:26 +0100
Received: from cm74.kappa84.maxonline.com.sg ([58.182.84.74])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 22 Feb 2007 12:33:26 +0100
Received: from robk by cm74.kappa84.maxonline.com.sg with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 22 Feb 2007 12:33:26 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Date: Thu, 22 Feb 2007 19:32:55 +0800
Message-ID: <erjv1k$sm8$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: cm74.kappa84.maxonline.com.sg
User-Agent: KNode/0.10.4
Sender: news <news@sea.gmane.org>
Subject: How to specify RDEPENDS properly?
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
X-List-Received-Date: Thu, 22 Feb 2007 11:33:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit

Hi all,

I'm trying to build my custom image after updating OE (it worked several
months back :). I've already converted several things to the new style, but
I can't get my RDEPENDS right. There are about 4 problematic packages, but
let's pick readline.

I want libreadline.so in my image, so I include readline as follows: 

export PACKAGE_INSTALL = "... readline ..."
RDEPENDS = "${PACKAGE_INSTALL}"

That doesn't work though:

| Collected errors:
| Cannot find package readline.
| Check the spelling or perhaps run 'ipkg update'

There's the following packages in deploy/ipk:

-rw-rw-r-- 1 rob users  16238 2007-02-20 13:59
libreadline-dbg_4.3-r3_i586.ipk
-rw-rw-r-- 1 rob users 123602 2007-02-20 13:59
libreadline-dev_4.3-r3_i586.ipk
-rw-rw-r-- 1 rob users  79874 2007-02-20 13:59
libreadline-doc_4.3-r3_i586.ipk
-rw-rw-r-- 1 rob users  91626 2007-02-20 13:59 libreadline4_4.3-r3_i586.ipk

I don't really understand when to use the package name (readline), and when
to use the ipk name (libreadline[4]). Several months back I had to RDEPEND
on libreadline, so try that again:

export PACKAGE_INSTALL = "... libreadline ..."
RDEPENDS = "${PACKAGE_INSTALL}"

That doesn't work either:

BB>> build display-image
SHELL: This command needs to parse bbfiles...
NOTE: Using cache in '/bulk/home/rob/oe/dev/build-epia/tmp/cache/rob-epia'
NOTE: Handling BitBake files: | (4243/4243) [100 %]
NOTE: Parsing finished. 3315 cached, 1 parsed, 196 skipped, 731 masked.

SHELL: Building display-image
ERROR: Nothing provides runtime dependency libreadline
NOTE: no buildable providers for display-image

Neither does 'libreadline4'.

I looked at how all the other images/tasks do this, but it seems readline is
not RDEPENDed anywhere...?

How should I do this, or where to RTFM, if explained there?

Cheers!

    Rob





