Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <zecke@selfish.org>) id 1HNuUy-0002Xq-V8
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2007 18:27:52 +0100
Received: from [91.64.160.193] (helo=[192.168.1.100])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1HNuUy-0007QW-M3
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2007 18:27:52 +0100
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <45EAFBBA.6000704@dominion.kabel.utwente.nl>
References: <3812EAEB-7EFE-40F3-8311-1047D0540BD6@selfish.org>
	<45EAFBBA.6000704@dominion.kabel.utwente.nl>
Message-Id: <0557FD1D-5750-4125-8820-D42B787ACAA1@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Sun, 4 Mar 2007 18:27:44 +0100
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Broken-Reverse-DNS: no host name found for IP address 91.64.160.193
Subject: Re: Recent wordpress attacks and md5sum
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
X-List-Received-Date: Sun, 04 Mar 2007 17:27:53 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 04.03.2007 um 18:02 schrieb Koen Kooi:

> I have a bunch of sources, but how do I know that these have the  
> correct md5sum? Should we
> all run md5sum on our DL_DIR and compare results?

1.  go to the HOMEPAGE of the software and compare their md5sum with  
yours
2. write down a list of known and good md5sums and send them here


>
>
>> PS: I wonder if bitbake should refuse to fetch code without md5sum/
>> shasum
>
> Another extension for insane.bbclass? How do we handle mirrors for  
> svn/cvs checkouts?

This is the tricky part with varying solutions. The best one is to  
use git, mtn or a similiar solution with some sort of builtin  
security. From my understanding it is not easy to checkout a cracked  
revision. And one could verify it.
	
	For recipes with fixed revision/date we can add md5sum and then  
compare the md5sum with the tarball we have created. There are some  
issues with svn though. The .svn directories like to change and if  
you have a different version of svn installed the md5sum will not  
match. The same might apply to cvs. To get around with that we could  
add a flag to the SRC_URI (e.g. export=1) to use svn export which  
will not contain a .svn directory. This can be a good compromise with  
people developing inside the workdir.

	Distributions should not build packages from a svn/cvs host unless  
ssl/ssh is used and the certificate/key is checked. Additionally  
using the export flag and md5sum should be checked.

	E.g. we could toggle the export flag on distributions builds to not  
conflict with people developing inside the workdir?

comments?
	Agent z.







