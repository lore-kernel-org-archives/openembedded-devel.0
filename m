Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <zecke@selfish.org>) id 1Hsbcj-0001Ma-7b
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 May 2007 11:34:45 +0200
Received: from [91.64.161.147] (helo=[192.168.10.100])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1HsbbK-0005Bt-6Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 May 2007 11:33:18 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <A16C87CA-5E9D-4B3B-B237-3BD3890A7D28@selfish.org>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
From: Holger Freyther <zecke@selfish.org>
Date: Mon, 28 May 2007 11:33:10 +0200
X-Mailer: Apple Mail (2.752.3)
X-Broken-Reverse-DNS: no host name found for IP address 91.64.161.147
Subject: RPATH hacks
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
X-List-Received-Date: Mon, 28 May 2007 09:34:51 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed

Hey,

I have just pushed a change to libtool-cross that will disable -rpath  
for all cross compiled packages. This should fix all issues with  
rpath on libtool based packages.

What can break?
	I can imagine if you have a binary you can not statically link,  
can't write a /etc/ld.so.conf and can't set LD_LIBRARY_PATH you might  
have troubles now. In that case please speak up and we can look at a  
solution.

I have not tested the resulting image, so if you end up with  
unbootable images feel free to tear and feather me (I like it).


z.



