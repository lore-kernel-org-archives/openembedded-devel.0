Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L5eaQ-0006rr-QM
	for openembedded-devel@openembedded.org; Thu, 27 Nov 2008 11:59:06 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L5eXP-0008Dv-5Y
	for openembedded-devel@openembedded.org; Thu, 27 Nov 2008 10:55:59 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 27 Nov 2008 10:55:59 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 27 Nov 2008 10:55:59 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 27 Nov 2008 11:55:49 +0100
Message-ID: <gglubl$651$1@ger.gmane.org>
References: <200811271142.31596.valentin.longchamp@epfl.ch>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081120 Shredder/3.0b1pre
In-Reply-To: <200811271142.31596.valentin.longchamp@epfl.ch>
Sender: news <news@ger.gmane.org>
Subject: Re: sanity test problems at end of build
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
X-List-Received-Date: Thu, 27 Nov 2008 10:59:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-11-08 11:42, Valentin Longchamp wrote:
> Hello,
>
> Sorry if it is a repost, but I have got not answer and have not seen my mail
> in the mailing-list archives, so I send it again

I know the problem exists for some people, but I have never been able to 
reproduce it. People having this problem should debug why ncurses 
suddenly decides to mess up its .la files. Or better, look at the .la 
files to see what's triggering insane.bbclass

regards,

Koen



> I have seen various people that have experienced the same problem during the
> last months, but I have never read a clear answer or fix to what is wrong with
> this issue.
>
> OE builds just fine all the needed packages for my system, but in the I get a
> failed sanity check for various libraries. Here is the log for a console-image
> for instance:
>
>> NOTE: Running task 1589 of 1960 (ID: 217,
>> /usr/local/OE/openembedded/packages/angstrom/angstrom-version.bb,
>> do_populate_staging) NOTE: package angstrom-version-2008.1-test-20081120:
>> started
>> NOTE: package angstrom-version-1_2008.1-test-20081120-r1: task
>> do_populate_staging: started NOTE: package
>> angstrom-version-1_2008.1-test-20081120-r1: task do_populate_staging:
>> completed NOTE: package angstrom-version-2008.1-test-20081120: completed
>> NOTE: Running task 1861 of 1960 (ID: 216,
>> /usr/local/OE/openembedded/packages/angstrom/angstrom-version.bb,
>> do_package_write) NOTE: package angstrom-version-2008.1-test-20081120:
>> started
>> NOTE: package angstrom-version-1_2008.1-test-20081120-r1: task
>> do_package_write: started NOTE: package
>> angstrom-version-1_2008.1-test-20081120-r1: task do_package_write:
>> completed NOTE: package angstrom-version-2008.1-test-20081120: completed
>> NOTE: Running task 1862 of 1960 (ID: 215,
>> /usr/local/OE/openembedded/packages/angstrom/angstrom-version.bb,
>> do_package_stage) NOTE: package angstrom-version-2008.1-test-20081120:
>> started
>> NOTE: package angstrom-version-1_2008.1-test-20081120-r1: task
>> do_package_stage: started NOTE: package
>> angstrom-version-1_2008.1-test-20081120-r1: task do_package_stage:
>> completed NOTE: package angstrom-version-2008.1-test-20081120: completed
>> NOTE: Running task 1892 of 1960 (ID: 5,
>> /usr/local/OE/openembedded/packages/images/console-image.bb, do_qa_staging)
>> NOTE: package console-image-1.0: started
>> NOTE: package console-image-1.0-r0: task do_qa_staging: started
>> NOTE: QA checking staging
>> ERROR: QA Issue: libpanel.la failed sanity test (workdir) in path
>> /usr/local/OE/angstrom//staging/armv6-angstrom-linux-gnueabi/usr/lib ERROR:
>> QA Issue: libncurses.la failed sanity test (workdir) in path
>> /usr/local/OE/angstrom//staging/armv6-angstrom-linux-gnueabi/usr/lib ERROR:
>> QA Issue: libmenu.la failed sanity test (workdir) in path
>> /usr/local/OE/angstrom//staging/armv6-angstrom-linux-gnueabi/usr/lib ERROR:
>> QA Issue: libform.la failed sanity test (workdir) in path
>> /usr/local/OE/angstrom//staging/armv6-angstrom-linux-gnueabi/usr/lib ERROR:
>> QA staging was broken by the package built above
>> ERROR: Error in executing:
>> ERROR: Exception:<type 'exceptions.SystemExit'>  Message:1
>> ERROR: Printing the environment of the function
>> ERROR: Build of /usr/local/OE/openembedded/packages/images/console-image.bb
>> do_qa_staging failed ERROR: Task 5
>> (/usr/local/OE/openembedded/packages/images/console-image.bb,
>> do_qa_staging) failed NOTE: Waiting for 1 active tasks to finish
>> NOTE: 1: /usr/local/OE/openembedded/packages/gnutls/gnutls_2.4.2.bb,
>> do_configure (13056) NOTE: package gnutls-2.4.2-r3: task do_configure:
>> completed
>> NOTE: package gnutls-2.4.2: completed
>> NOTE: Tasks Summary: Attempted 1890 tasks of which 1873 didn't need to be
>> rerun and 1 failed. ERROR:
>> '/usr/local/OE/openembedded/packages/images/console-image.bb' failed
>
> I had read that this could have something to do with the fact that -tmp was in
> the name of the tmp build dir. However it is not the case for me and the
> problem is still here. Here is my local.conf file:
>
>> # Where to store sources
>> DL_DIR = "/usr/local/OE/downloads"
>>
>> # Which files do we want to parse:
>> BBFILES := "/usr/local/OE/openembedded/packages/*/*.bb"
>> BBMASK = ""
>>
>> # qemu has a few problems with our architecture
>> #ENABLE_BINARY_LOCALE_GENERATION = "0"
>> # We only need a few locales
>> # does not work with ENABLE_BINARY_LOCALE_GENERATION = "0"
>> GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 fr_CH.UTF-8"
>>
>> # ccache always overfill $HOME....
>> CCACHE=""
>>
>> # What kind of images do we want?
>> IMAGE_FSTYPES = "jffs2 tar.gz"
>>
>> # Set TMPDIR instead of defaulting it to $pwd/tmp
>> TMPDIR = "/usr/local/OE/${DISTRO}/"
>>
>> # Make use of my SMP box
>> PARALLEL_MAKE="-j4"
>> BB_NUMBER_THREADS = "2"
>>
>> # Set the Distro
>> DISTRO = "angstrom-2008.1"
>>
>> # 'uclibc' or 'glibc' or 'eglibc'
>> #ANGSTROM_MODE = "glibc"
>>
>> MACHINE = "mx31moboard"
>
> Thank you for your help, that would be really nice to fix this, because I am
> not able to build rootfs images at this point because of this problem.
>
> Regards
>
> Valentin




