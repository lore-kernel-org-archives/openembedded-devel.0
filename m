Received: from [17.148.16.94] (helo=asmtpout019.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MKEAX-0003dA-Ap
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 18:20:53 +0200
MIME-version: 1.0
Received: from [87.201.169.194] by asmtp019.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLU00KV7SV2TA70@asmtp019.mac.com> for
	openembedded-devel@lists.openembedded.org; Fri,
	26 Jun 2009 09:09:07 -0700 (PDT)
Message-id: <7D58AE12-9642-4B1C-97F4-075F1E7447D3@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Jun 2009 20:08:41 +0400
X-Mailer: Apple Mail (2.935.3)
Subject: Incorrect PR number appended to /tmp/work/ recipe folder
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
X-List-Received-Date: Fri, 26 Jun 2009 16:20:53 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
          In my linux-omap3-2.6.29.bb recipe file, I have set PR =  
"r45" as follows:

PN = "linux-omap3"
PV = "2.6.29"
PR = "r45"

but when I run bitbake, it is appending r37 to the file folder:

NOTE: Running task 950 of 2941 (ID: 841, /tool/overo-oe/ 
user.collection/recipes/linux/linux-omap3_2.6.29.bb, do_setscene)
NOTE: Running task 2858 of 2941 (ID: 842, /tool/overo-oe/ 
user.collection/recipes/linux/linux-omap3_2.6.29.bb, do_fetch)
NOTE: Running task 2859 of 2941 (ID: 843, /tool/overo-oe/ 
user.collection/recipes/linux/linux-omap3_2.6.29.bb, do_unpack)
NOTE: Unpacking /usr/share/sources/ 
git_git.kernel.org.pub.scm.linux.kernel.git.tmlind.linux- 
omap-2.6.git_90e758af52ba803cba233fabee81176d99589f09.tar.gz to tmp/ 
work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.29-r37/

This shouldn't be happening.

Best regards,

Elvis





