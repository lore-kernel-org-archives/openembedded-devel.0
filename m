Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <zecke@selfish.org>) id 1HXlB8-0005Rx-L6
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Mar 2007 23:32:06 +0200
Received: from [91.64.161.147] (helo=[192.168.10.100])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1HXlB8-0001lm-62
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Mar 2007 23:32:06 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <DF84F2F0-B3CE-454C-A7DE-7AFED21F57D2@selfish.org>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
From: Holger Freyther <zecke@selfish.org>
Date: Sat, 31 Mar 2007 23:32:01 +0200
X-Mailer: Apple Mail (2.752.3)
X-Broken-Reverse-DNS: no host name found for IP address 91.64.161.147
Subject: Verifying the SHA256 and MD5Sum
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
X-List-Received-Date: Sat, 31 Mar 2007 21:32:07 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed

Hi,

as of prior discussion I have committed a patch to base.bbclass to  
verify the SHA256 and MD5 of files. In contrast to the md5sum  
attribute I/we have decided to use an external file to keep track of  
the values. This allows more easy updating and more readable SRC_URI  
lines.

So the filename is conf/checksums.ini and follows the BBPATH like  
configuration files and it is using the INI file format known from  
KDE (or hopefully not from Windows)

[PN-PV-URI] or [PN-URI] are know sections/groups. and these contain  
two keys "md5" and "sha256" to store the sums.

A small example showing the file-native and ftp://... as the SRC_URI.

[file-native-4.20-ftp://ftp.astron.com/pub/file/file-4.20.tar.gz]
md5=402bdb26356791bd5d277099adacc006
sha256=c0810fb3ddb6cb73c9ff045965e542af6e3eaa7f2995b3037181766d26d5e6e7


The only downside is with -native packages as one need to list the  
files twice. So do you have comments? Do we want to go this route? Do  
we want to make it mandantory that all http,ftp file downloads have  
the md5 sum attached?


kind regards
	h.


