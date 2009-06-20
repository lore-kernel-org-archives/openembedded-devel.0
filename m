Received: from [17.148.16.96] (helo=asmtpout021.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MI70e-0003PF-OB
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 22:17:57 +0200
MIME-version: 1.0
Received: from [87.201.169.152] by asmtp021.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLJ003P7ZVLQE30@asmtp021.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	20 Jun 2009 13:07:02 -0700 (PDT)
Message-id: <FEE3EFAC-2D2D-4E03-9F05-8D480E5162C1@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <1245527560.29153.295.camel@lenovo.internal.reciva.com>
Date: Sun, 21 Jun 2009 00:06:41 +0400
References: <B7B72D38-62FD-4B6B-9856-DF4F470F832F@mac.com>
	<1245521341.29153.288.camel@lenovo.internal.reciva.com>
	<3186A9DE-F7A1-4400-8B6B-ABE119EDA16A@mac.com>
	<1245523070.29153.290.camel@lenovo.internal.reciva.com>
	<B7C10C35-361B-469B-975E-B80AA8B7ED6A@mac.com>
	<1245527560.29153.295.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Sat, 20 Jun 2009 20:17:57 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi Phil,

On Jun 20, 2009, at 11:52 PM, Phil Blundell wrote:
>>
>
> Does it help if you put an extra layer of quoting around the directory
> list, i.e. oe_runmake SUBDIRS="'src doc examples'"?  Could also try  
> just
> oe_runmake SUBDIRS=src and see if it works like that.


Just specifying SUBDIRS=src worked perfectly. :-)

However, when I specified SUBDIRS=""src examples"" , it did a rebuilt  
the recipe twice for some reason as shown below:

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
NOTE: Running task 427 of 436 (ID: 9, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_install)
NOTE: Running task 428 of 436 (ID: 13, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_package)
NOTE: Running task 429 of 436 (ID: 10, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_populate_staging)
NOTE: Running task 430 of 436 (ID: 11, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_qa_staging)
NOTE: Running task 431 of 436 (ID: 17, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_package_write_ipk)
Packaged contents of libserial-dbg into /tool/overo-oe/tmp/deploy/ 
glibc/ipk/armv7a/libserial-dbg_0.6.0rc1-r0.3_armv7a.ipk
Packaged contents of libserial into /tool/overo-oe/tmp/deploy/glibc/ 
ipk/armv7a/libserial0_0.6.0rc1-r0.3_armv7a.ipk
NOTE: Not creating empty archive for libserial-doc-0.6.0rc1-r0.3
Packaged contents of libserial-dev into /tool/overo-oe/tmp/deploy/ 
glibc/ipk/armv7a/libserial-dev_0.6.0rc1-r0.3_armv7a.ipk
NOTE: Not creating empty archive for libserial-locale-0.6.0rc1-r0.3
NOTE: Running task 432 of 436 (ID: 12, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_package_write)
NOTE: Running task 433 of 436 (ID: 16, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_package_stage)
NOTE: Running task 434 of 436 (ID: 15, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_package_stage_all)
NOTE: Running task 435 of 436 (ID: 0, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_build)
NOTE: Running task 436 of 436 (ID: 1, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_rebuild)
NOTE: Tasks Summary: Attempted 436 tasks of which 418 didn't need to  
be rerun and 0 failed.
[elvis@zeus overo-oe]$


Best regards,

Elvis


