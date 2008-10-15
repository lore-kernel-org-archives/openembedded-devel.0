Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kq1jT-0006Xk-Oz
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 10:27:51 +0200
Received: from [92.116.174.84] (helo=[10.129.174.84])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kq1eV-0006nU-Q6
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 10:22:44 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2008 10:22:36 +0200
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200810151022.38477.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.116.174.84
Subject: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Wed, 15 Oct 2008 08:27:51 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey guys,

I would start linking everything with -Wl,--hash-style=both as this is said to 
speed up the loading of shared libraries by about 50% (google is your 
friend). This is an option for binutils and was introduced with binutils 
2.17. Now there are two ways to achieve this:

Change TARGET_LDFLAGS in e.g. the distro config (as this knows if binutils has 
this option available) or to change the "specs" of gcc to enable this by 
default. There is a patch from debian for gcc4.3 but it is leaving 
arm/armeabi out. What do you guys prefer?

I'm pretty sure that we will want to use the GNU hash style at Openmoko and 
this is creating an interesting problem in regard to a full system upgrade 
(which is supposed to work). Again there are two ways. Use force and bump PE 
on each package but we should avoid this. I propose to rename PR to FILE_PR 
and change PR  to "${FILE_PR}${DISTRO_PR}" so everytime a distro is changing 
something that effects every package we can bump (e.g. Setting DISTRO_PR 
to .1 for Openmoko).

comments?
	z.


