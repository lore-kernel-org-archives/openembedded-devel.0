Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MDni7-0003Bv-Av
	for openembedded-devel@openembedded.org; Tue, 09 Jun 2009 00:52:59 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MDnYs-0006Qg-JA
	for openembedded-devel@openembedded.org; Mon, 08 Jun 2009 22:43:27 +0000
Received: from h24-207-4-118.primesignal.com ([24.207.4.118])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 08 Jun 2009 22:43:26 +0000
Received: from quickx by h24-207-4-118.primesignal.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 08 Jun 2009 22:43:26 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: NBeing <quickx@hotmail.com>
Date: Mon, 8 Jun 2009 22:43:15 +0000 (UTC)
Message-ID: <loom.20090608T220743-20@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 24.207.4.118 (Mozilla/5.0 (Windows; U; Windows NT 5.1;
	en-US) AppleWebKit/530.5 (KHTML, like Gecko) Chrome/2.0.172.30
	Safari/530.5)
Sender: news <news@ger.gmane.org>
Subject: Various Bug - Questions
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
X-List-Received-Date: Mon, 08 Jun 2009 22:52:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello all.  I've been working with OE for a week or two now and run into some 
questions / possible bugs.

1. Bug: gpe-mini-brower doesn't compile on Ubuntu with default g++ (4.3.3). 
Digest Log:

$ bitbake my-x11-image
...
isystem/home/dustin/oe/build/tmp/staging/armv5te-angstrom-linux-
gnueabi/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-
pointer -O2 -fpermissive -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -
nostdinc++ -fno-threadsafe-statics -MT protected_values.lo -MD -MP -MF 
.deps/protected_values.Tpo -c protected_values.cpp  -fPIC -DPIC -o 
.libs/protected_values.o
| protected_values.cpp:215: error: explicit template specialization cannot have 
a storage class
| protected_values.cpp:234: error: explicit template specialization cannot have 
a storage class
| make[3]: *** [protected_values.lo] Error 1
| make[3]: Leaving directory `/home/dustin/oe/build/tmp/work/armv5te-angstrom-
linux-gnueabi/osb-jscore-0.5.2+svnr117-r1/JavaScriptCore/kjs'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory `/home/dustin/oe/build/tmp/work/armv5te-angstrom-
linux-gnueabi/osb-jscore-0.5.2+svnr117-r1/JavaScriptCore/kjs'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/dustin/oe/build/tmp/work/armv5te-angstrom-
linux-gnueabi/osb-jscore-0.5.2+svnr117-r1/JavaScriptCore'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: /home/dustin/oe/build/tmp/work/armv5te-angstrom-linux-
gnueabi/osb-jscore-0.5.2+svnr117-r1/temp/log.do_compile.10444
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/dustin/oe/openembedded/recipes/gtk-webcore/osb-
jscore_svn.bb do_compile failed
ERROR: Task 4088 (/home/dustin/oe/openembedded/recipes/gtk-webcore/osb-
jscore_svn.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 1813 tasks of which 0 didn't need to be rerun and 
1 failed.
ERROR: '/home/dustin/oe/openembedded/recipes/gtk-webcore/osb-jscore_svn.bb' 
failed
$ 

---Solutions I Have Found---
a. Solution 1: In the file "protected_values.cpp" (/oe/build/tmp/work/armv5te-
angstrom-linux-gnueabi/osb-jscore-0.5.2+svnr117-
r1/JavaScriptCore/kjs/protected_values.cpp).  You can remove static from the 
following two lines and it compiles file.  It opens on the board but I haven't 
been able to test with internet.

~Line 189 (protected_values.cpp): template <> static inline unsigned 
hash<4>(ValueImp *pointer) 
~Line 117 (protect_values.cpp): template <> static inline unsigned 
hash<8>(ValueImp *pointer)

b. Solution 2: Using the GCC 4.2.x compiler instead of 4.3.

Is this the right group for the gpe-mini-browser problem?  Also is it 
recommended to use the gcc 4.2.x compiler for OE, or should I try to stick with 
gcc 4.3.x if I can?

log.do_compile.10444:  http://www.mediafire.com/?ehjdxgindzt
run.do_compile.10444:  http://www.mediafire.com/?h2zttcmjyyu



2. Bug: gpe-filemanger has a weird bug.  Opening up, moving back 1 directory, 
then double clicking the home directory results in:  "Error: Invalid URI".  If 
you are in "View Icons" mode then you are able to reenter the home directory.  
This is the only directory I've run into with this problem.  The "Home" button 
works fine in all cases.  The the program usually closes after the error box.  
Address bar after the error seems to have random data (which is the invalid 
URI): IE
1. *box symbole**x symbol**box symbole
2. audio/3gpp2
etc



3. Question: U-Boot isn't in the deploy directory after I do a "bitbake my-x11-
image".  However it is there after I do a "bitbake x11-image".  Would someone be 
able to look at my-x11-image.bb and see the problem?

my-x11-image.bb:  http://www.mediafire.com/?dziuw2hojgn

If I bake u-boot after I run a "bitbake my-x11-image" then it works fine.  
"bitbake my-x11-image" returns no errors/fails, and it does produce a u-boot 
folder in the work directory, it just doesn't seem to deploy.  Here is the 
complete log:
dustin@dds186:~/oe/build$ bitbake my-x11-image
[...]
dustin@dds186:~/oe/build$ bitbake u-boot
__builtin__:74: DeprecationWarning: the sets module is deprecated
__builtin__:74: DeprecationWarning: the sets module is deprecated
NOTE: Handling BitBake files: / (6853/6853) [100 %]
NOTE: Parsing finished. 6572 cached, 0 parsed, 281 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 445 of 449 (ID: 15, /home/dustin/oe/openembedded/recipes/u-
boot/u-boot_2009.01.bb, do_package_stage_all)
NOTE: Running task 446 of 449 (ID: 14, /home/dustin/oe/openembedded/recipes/u-
boot/u-boot_2009.01.bb, do_distribute_sources)
NOTE: Running task 447 of 449 (ID: 11, /home/dustin/oe/openembedded/recipes/u-
boot/u-boot_2009.01.bb, do_qa_staging)
NOTE: Running task 448 of 449 (ID: 10, /home/dustin/oe/openembedded/recipes/u-
boot/u-boot_2009.01.bb, do_deploy)
NOTE: Running task 449 of 449 (ID: 0, /home/dustin/oe/openembedded/recipes/u-
boot/u-boot_2009.01.bb, do_build)
NOTE: Tasks Summary: Attempted 449 tasks of which 444 didn't need to be rerun 
and 0 failed.
dustin@dds186:~/oe/build$


Would be more convenient if I can have my "my-x11-image.bb" act like the "x11-
image" in this regard.


4. Question: My last question is I've been trying to get internet on my board 
via usb.  I've read the AngstromManual and confirmed that the "Network Setup" is 
writing the information in the /etc/networking/interfaces file, however, I don't 
believe my board has the g_ether module by default; it isn't in the "modules-
2.6.28-r9-at91sam9261ek.tgz" file, and the board says "g_ether module not found" 
when I try to modprobe it.

I've gotten the USB ethernet working with Buildroot in the past by editing the 
kernel "make linux26-menuconfig" but unsure if there is a way for me to add the 
Kernel module via my "my-x11-image.bb" with OE?

I'm sure either of the two would work:
a. Create my own DefConfig for the kernel, find the DefConfig in 
/oe/openembedded/*, and replace it with my DefConfig.
b. bitbake virtual/kernel -c menuconfig & bitbake my-x11-image

Is there a way to accomplish this task with just "my-x11-image.bb"?  Or a 
recommomended way of adding things like g_ether?  Angstrom already has the 
interface for usb0 in the Network Setup, is it already suppose to be there by 
default?

Thanks for any help :)  Sorry if some of these are very simple - I am very new 
to OE and just finished reading the manuals I could find.

If any additional information is needed I can attempt to provide.  I'm using the 
development branch, and my local.conf is the "local.conf.sample" with my machine 
set basically.



