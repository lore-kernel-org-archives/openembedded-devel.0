Received: from mazama.dcclabs.tv ([91.121.153.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pawelo@dcclabs.tv>) id 1SVmzR-0004mt-2a
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 May 2012 18:58:49 +0200
Received: from [192.168.1.1] (fish.king.net.pl [83.19.124.154])
	by mazama.dcclabs.tv (Postfix) with ESMTPSA id 6FC30403B1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 May 2012 18:43:23 +0200 (CEST)
Message-ID: <4FB7CDA6.9060507@dcclabs.tv>
Date: Sat, 19 May 2012 18:43:18 +0200
From: Pawel Osmialowski <pawelo@dcclabs.tv>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.4) Gecko/20120511 Thunderbird/10.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: tinylogin recipe
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
X-List-Received-Date: Sat, 19 May 2012 16:58:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I've pulled OE from git 15th of May 2012, and I wasn't able to build 
tinylogin - in facts, sources weren't even pull at all.

As it turned out, critical part of the recipe looks like this:

#SRC_URI = "http://tinylogin.busybox.net/downloads/tinylogin-${PV}.tar.bz2 \
SRC_URI = 
"http://limpens.net/trac/at91-kit-trac/export/4/trunk/sources/tinylogin-${PV}.tar.bz2 
\
         file://cvs-20040608.patch \
         file://add-system.patch \
         file://adduser-empty_pwd.patch \
         file://remove-index.patch"

This '\' at the end of hashed line makes SRC_URI a perfect multiline 
comment. Putting one line in between solves the problem:

#SRC_URI = "http://tinylogin.busybox.net/downloads/tinylogin-${PV}.tar.bz2 \

SRC_URI = 
"http://limpens.net/trac/at91-kit-trac/export/4/trunk/sources/tinylogin-${PV}.tar.bz2 
\
         file://cvs-20040608.patch \
         file://add-system.patch \
         file://adduser-empty_pwd.patch \
         file://remove-index.patch"

Best regards,
Paul



