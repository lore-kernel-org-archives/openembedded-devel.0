Received: from [17.148.16.97] (helo=asmtpout022.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MI632-0004wy-Kv
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 21:16:21 +0200
MIME-version: 1.0
Received: from [87.201.169.152] by asmtp022.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLJ00IZLX12TL40@asmtp022.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	20 Jun 2009 12:05:32 -0700 (PDT)
Message-id: <B7C10C35-361B-469B-975E-B80AA8B7ED6A@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <1245523070.29153.290.camel@lenovo.internal.reciva.com>
Date: Sat, 20 Jun 2009 23:05:11 +0400
References: <B7B72D38-62FD-4B6B-9856-DF4F470F832F@mac.com>
	<1245521341.29153.288.camel@lenovo.internal.reciva.com>
	<3186A9DE-F7A1-4400-8B6B-ABE119EDA16A@mac.com>
	<1245523070.29153.290.camel@lenovo.internal.reciva.com>
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Recipe for libserial_0.6.0rc1
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
X-List-Received-Date: Sat, 20 Jun 2009 19:16:21 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi Phil,

On Jun 20, 2009, at 10:37 PM, Phil Blundell wrote:

> I'm not quite sure what you mean by "another" subdir called src.  Can
> you post the actual log output that you're seeing?
>

The original package, has 4 sub directories, src, doc, examples and  
sip. I get some sort of configuration errors with the sip folder


| make[2]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-0.6.0rc1-r0/libserial-0.6.0rc1/examples'
| Making all in sip
| make[2]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-0.6.0rc1-r0/libserial-0.6.0rc1/sip'
| python ./configure.py
| Traceback (most recent call last):
|   File "./configure.py", line 6, in <module>
|     import sipconfig
| ImportError: No module named sipconfig
| make[2]: *** [Makefile.sip] Error 1
| make[2]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-0.6.0rc1-r0/libserial-0.6.0rc1/sip'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-0.6.0rc1-r0/libserial-0.6.0rc1'
| make: *** [all] Error 2
| FATAL: oe_runmake failed


I don't need it anyway, so I added the following entry like you  
suggested:

do_compile() {
	oe_runmake SUBDIRS="src doc examples"
}

command to the recipe.

It however, does the build for the src, build and examples folder, as  
seen in the logs, and then tries to find another src folder and fails.


[elvis@zeus overo-oe]$ bitbake -c rebuild libserial
NOTE: Handling BitBake files: / (6955/6955) [100 %]
NOTE: Parsing finished. 6681 cached, 1 parsed, 273 skipped, 2 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 271 of 436 (ID: 2, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_setscene)
NOTE: Running task 420 of 436 (ID: 3, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_fetch)
NOTE: Running task 421 of 436 (ID: 4, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_unpack)
NOTE: Running task 422 of 436 (ID: 14, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_distribute_sources)
NOTE: Unpacking /usr/share/sources/libserial-0.6.0rc1.tar.gz to tmp/ 
work/armv7a-angstrom-linux-gnueabi/libserial-0.6.0rc1-r0/
NOTE: Running task 423 of 436 (ID: 5, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_patch)
NOTE: Running task 424 of 436 (ID: 6, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_configure)
NOTE: Running task 425 of 436 (ID: 7, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_qa_configure)
NOTE: Running task 426 of 436 (ID: 8, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_compile)
ERROR: function do_compile failed
ERROR: log data follows (/tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/libserial-0.6.0rc1-r0/temp/log.do_compile.18481)
| NOTE: make -j 4 SUBDIRS=doc examples src
| make  all-recursive
| make[1]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-0.6.0rc1-r0/libserial-0.6.0rc1'
| Making all in doc
| make[2]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-0.6.0rc1-r0/libserial-0.6.0rc1/doc'
| Making all in doc
| /bin/sh: line 17: cd: doc: No such file or directory
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-0.6.0rc1-r0/libserial-0.6.0rc1/doc'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-0.6.0rc1-r0/libserial-0.6.0rc1'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: /tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/libserial-0.6.0rc1-r0/temp/log.do_compile.18481
ERROR: TaskFailed event exception, aborting
ERROR: Build of /tool/overo-oe/user.collection/recipes/libserial/ 
libserial_0.6.0rc1.bb do_compile failed
ERROR: Task 8 (/tool/overo-oe/user.collection/recipes/libserial/ 
libserial_0.6.0rc1.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 425 tasks of which 418 didn't need to  
be rerun and 1 failed.
ERROR: '/tool/overo-oe/user.collection/recipes/libserial/ 
libserial_0.6.0rc1.bb' failed
[elvis@zeus overo-oe]$


Best regards,

Elvis

