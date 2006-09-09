Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <freyther@inf.fu-berlin.de>) id 1GMB0D-0000Mh-Lb
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Sep 2006 00:08:41 +0200
Received: from [91.64.167.72] (helo=[192.168.1.100])
	by coruscant.onosendai.de with esmtpsa (TLS-1.0:RSA_ARCFOUR_SHA1:16)
	(Exim 4.60) (envelope-from <freyther@inf.fu-berlin.de>)
	id 1GMAx9-0001YQ-4b for openembedded-devel@lists.openembedded.org;
	Sun, 10 Sep 2006 00:05:31 +0200
Mime-Version: 1.0 (Apple Message framework v752.2)
X-Gpgmail-State: !signed
Message-Id: <515E53C3-61FE-4845-8DAF-1F274F173334@inf.fu-berlin.de>
From: Holger Freyther <freyther@inf.fu-berlin.de>
Date: Sun, 10 Sep 2006 00:04:08 +0200
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.752.2)
X-Broken-Reverse-DNS: no host name found for IP address 91.64.167.72
Subject: BitTest advertisement
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Sep 2006 22:08:41 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

after having posted results of BitTest and it being available from  
BitBake SVN for almost a year I had to recognize it was almost unknown.

What is BitTest?
	- BitTest allows to parse BitBake files and to run checks in many  
different configurations on the data.
	- We have checks to check if patches apply, source is available, - 
native packages depending on non-native packages, sections, license,  
etc. are right...
	- One can easily write new tests by implementing your own module.  
Even a skeleton exists.
	- BitTest can write the test result into a txt file or send it as a  
report to the TinderBox
	- One can easily write new output formats
	- It uses default BitBake classes to load, parse and execute tasks

Issues of BitTest:
	As it uses the BitBake library PYTHONPATH had to be set correctly to  
point to bitbake/lib and BBPATH had to point to the bitbake_qa  
directory and the OpenEmbedded meta-data. Also a testrun.conf had to  
be written. This file is needed if you want to run tests for more  
than one TARGET_OS, TARGET_ARCH, DISTRO or MACHINE at once. A big  
iron could run a specific check for all machine and distro  
combinations we currently have.


As people started to reinvent the wheel I decided to remove this tool  
from SVN as it went unnoticied anyway, as configuration seemed to be  
too hard I have writen 'bittest_signle' which tries to set the  
PYTHONPATH manually and extracts the current configuration  
(TARGET_ARCH,TARGET_OS,MACHINE and DISTRO) from local.conf (we can't  
load bitbake.conf as openzaurus.inc resets DISTRO...)



How to get it:
	You can currently get it from here http://handhelds.org/~zecke/ 
bitbake-qa-0.1.tar.bz2 until I have found a better home


How to use it:
	- Make sure bitbake is in your PATH (e.g. adding bitbake/bin)
	- Make sure bittest    is in your PATH
	- Make sure BBPATH is setup properly
	- Make sure you have a local.conf


	Invoking "bitest_single -r TestReportTinder  depends_checker" will  
check all BBFILES and send the test result to the tinderbox (if you  
have setup local.conf correctly)




peace and pleasure
	h.


