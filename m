Received: from [17.148.16.88] (helo=asmtpout013.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGG4i-0001qE-RM
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Jun 2009 19:34:29 +0200
MIME-version: 1.0
Received: from [87.201.169.122] by asmtp013.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLA00441IZQMZ00@asmtp013.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	15 Jun 2009 10:23:59 -0700 (PDT)
Message-id: <00B31CC4-0799-453F-9CAE-A120C4566D1A@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <c384c5ea0906150932p1d9cf9e9u2f02da4ffe21d27c@mail.gmail.com>
Date: Mon, 15 Jun 2009 21:23:40 +0400
References: <D661B752-90B3-4974-B31E-2B136D05B47F@mac.com>
	<h1557n$fir$1@ger.gmane.org>
	<A333C385-1DED-40D9-AD9E-08DF830A732E@mac.com>
	<4A3665DF.7040109@balister.org>
	<522EC177-58EA-4408-857C-5A010D5C2A1A@mac.com>
	<c384c5ea0906150932p1d9cf9e9u2f02da4ffe21d27c@mail.gmail.com>
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: EmbeddedMicro <justin@embeddedmicro.com>
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
X-List-Received-Date: Mon, 15 Jun 2009 17:34:29 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi Leon,

On Jun 15, 2009, at 8:32 PM, Leon Woestenberg wrote:
>>
> Try setting the S variable in the recipe.

I tried this, it didn't work, still gave the same error because the  
image folder is empty so there is nothing to install. When I look at  
the log files, nothing got configured and nothing got compiled. This  
is a strange one!! :-)

ERROR: function do_install failed
ERROR: log data follows (/tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/libfann-2.0.0-r01/temp/log.do_install.7946)
| NOTE: make DESTDIR=/tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/libfann-2.0.0-r01/image install
| make: *** No rule to make target `install'.  Stop.
| FATAL: oe_runmake failed
NOTE: Task failed: /tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/libfann-2.0.0-r01/temp/log.do_install.7946
ERROR: TaskFailed event exception, aborting
ERROR: Build of /tool/overo-oe/user.collection/recipes/libfann/ 
libfann_2.0.0.bb do_install failed
ERROR: Task 8 (/tool/overo-oe/user.collection/recipes/libfann/ 
libfann_2.0.0.bb, do_install) failed
NOTE: Tasks Summary: Attempted 426 tasks of which 418 didn't need to  
be rerun and 1 failed.
ERROR: '/tool/overo-oe/user.collection/recipes/libfann/ 
libfann_2.0.0.bb' failed


Best regards,

Elvis

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

S = "${WORKDIR}/libfann-${PV}"

inherit autotools_stage pkgconfig




