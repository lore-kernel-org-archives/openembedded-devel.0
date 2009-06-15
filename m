Received: from [17.148.16.90] (helo=asmtpout015.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGEwM-0001r6-Va
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Jun 2009 18:21:47 +0200
MIME-version: 1.0
Received: from [87.201.169.122] by asmtp015.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLA00IQXFN0BP60@asmtp015.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	15 Jun 2009 09:11:31 -0700 (PDT)
Message-id: <522EC177-58EA-4408-857C-5A010D5C2A1A@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <4A3665DF.7040109@balister.org>
Date: Mon, 15 Jun 2009 20:11:15 +0400
References: <D661B752-90B3-4974-B31E-2B136D05B47F@mac.com>
	<h1557n$fir$1@ger.gmane.org>
	<A333C385-1DED-40D9-AD9E-08DF830A732E@mac.com>
	<4A3665DF.7040109@balister.org>
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Help required to create recipe for FANN library
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
X-List-Received-Date: Mon, 15 Jun 2009 16:21:47 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi Philip,
			I think I tried that earlier and got the same results.

ERROR: function do_install failed

Could you try the recipe at your end?

# libfann-2.0.0 recipie
SECTION = "libs"
DEFAULT_PREFERENCE = "1"

# Package information
DESCRIPTION = "libfann, Fast Artificial Neural Network Library is a  
free open source neural network library, which implements multilayer  
artificial neural networks in C with support for both fully connected  
and sparsely connected networks."
LICENSE = "BSD"

PN = "libfann"
PV = "2.0.0"
PR = "r01"

SRC_URI = "http://prdownloads.sourceforge.net/fann/fann-${PV}.tar.bz2"

inherit autotools_stage pkgconfig


If you look at the log files, nothing gets configured or compiled. And  
the image folder is empty.


Best regards,

Elvis

[elvis@zeus overo-oe]$ bitbake libfann-2.0.0
NOTE: Handling BitBake files: \ (6912/6912) [100 %]
NOTE: Parsing finished. 6632 cached, 8 parsed, 272 skipped, 2 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 271 of 435 (ID: 1, /tool/overo-oe/user.collection/ 
recipes/libfann/libfann_2.0.0.bb, do_setscene)
NOTE: Running task 420 of 435 (ID: 2, /tool/overo-oe/user.collection/ 
recipes/libfann/libfann_2.0.0.bb, do_fetch)
NOTE: Running task 421 of 435 (ID: 3, /tool/overo-oe/user.collection/ 
recipes/libfann/libfann_2.0.0.bb, do_unpack)
NOTE: Running task 422 of 435 (ID: 13, /tool/overo-oe/user.collection/ 
recipes/libfann/libfann_2.0.0.bb, do_distribute_sources)
NOTE: Unpacking /usr/share/sources/fann-2.0.0.tar.bz2 to tmp/work/ 
armv7a-angstrom-linux-gnueabi/libfann-2.0.0-r01/
NOTE: Running task 423 of 435 (ID: 4, /tool/overo-oe/user.collection/ 
recipes/libfann/libfann_2.0.0.bb, do_patch)
NOTE: Running task 424 of 435 (ID: 5, /tool/overo-oe/user.collection/ 
recipes/libfann/libfann_2.0.0.bb, do_configure)
NOTE: Running task 425 of 435 (ID: 6, /tool/overo-oe/user.collection/ 
recipes/libfann/libfann_2.0.0.bb, do_qa_configure)
NOTE: Running task 426 of 435 (ID: 7, /tool/overo-oe/user.collection/ 
recipes/libfann/libfann_2.0.0.bb, do_compile)
NOTE: Running task 427 of 435 (ID: 8, /tool/overo-oe/user.collection/ 
recipes/libfann/libfann_2.0.0.bb, do_install)
ERROR: function do_install failed
ERROR: log data follows (/tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/libfann-2.0.0-r01/temp/log.do_install.16832)
| NOTE: make DESTDIR=/tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/libfann-2.0.0-r01/image install
| make: *** No rule to make target `install'.  Stop.
| FATAL: oe_runmake failed
NOTE: Task failed: /tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/libfann-2.0.0-r01/temp/log.do_install.16832
ERROR: TaskFailed event exception, aborting
ERROR: Build of /tool/overo-oe/user.collection/recipes/libfann/ 
libfann_2.0.0.bb do_install failed
ERROR: Task 8 (/tool/overo-oe/user.collection/recipes/libfann/ 
libfann_2.0.0.bb, do_install) failed
NOTE: Tasks Summary: Attempted 426 tasks of which 418 didn't need to  
be rerun and 1 failed.
ERROR: '/tool/overo-oe/user.collection/recipes/libfann/ 
libfann_2.0.0.bb' failed
[elvis@zeus overo-oe]$




