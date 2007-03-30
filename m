Received: from [216.82.253.51] (helo=mail153.messagelabs.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <jeremy.dufour@motorola.com>) id 1HXHIC-0004VL-Cc
	for openembedded-devel@openembedded.org; Fri, 30 Mar 2007 15:37:24 +0200
X-VirusChecked: Checked
X-Env-Sender: jeremy.dufour@motorola.com
X-Msg-Ref: server-12.tower-153.messagelabs.com!1175261842!6063107!1
X-StarScan-Version: 5.5.10.7.1; banners=-,-,-
X-Originating-IP: [129.188.136.9]
Received: (qmail 17182 invoked from network); 30 Mar 2007 13:37:22 -0000
Received: from ftpbox.mot.com (HELO ftpbox.mot.com) (129.188.136.9)
	by server-12.tower-153.messagelabs.com with SMTP;
	30 Mar 2007 13:37:22 -0000
Received: from az33exr01.mot.com ([10.64.251.231])
	by ftpbox.mot.com (8.12.11/Motorola) with ESMTP id l2UDbLoh002696
	for <openembedded-devel@openembedded.org>;
	Fri, 30 Mar 2007 08:37:22 -0500 (CDT)
Received: from az10vts01 (az10vts01.mot.com [10.64.251.242])
	by az33exr01.mot.com (8.13.1/Vontu) with SMTP id l2UDbJbo024697
	for <openembedded-devel@openembedded.org>;
	Fri, 30 Mar 2007 08:37:20 -0500 (CDT)
Received: from zfr01-2138.crm.mot.com (zfr01-2138.crm.mot.com [10.161.201.138])
	by az33exr01.mot.com (8.13.1/8.13.0) with SMTP id l2UDbGdp024558
	for <openembedded-devel@openembedded.org>;
	Fri, 30 Mar 2007 08:37:17 -0500 (CDT)
Received: by zfr01-2138.crm.mot.com (sSMTP sendmail emulation);
	Fri, 30 Mar 2007 15:37:19 +0200
Date: Fri, 30 Mar 2007 15:37:19 +0200
From: Jeremy Dufour <jeremy.dufour@motorola.com>
To: openembedded-devel <openembedded-devel@openembedded.org>
Message-ID: <20070330133719.GF4796@zfr01-2138.crm.mot.com>
Mail-Followup-To: openembedded-devel <openembedded-devel@openembedded.org>
Mime-Version: 1.0
User-Agent: Mutt/1.5.11
X-Vontu: Pass
Subject: Problem for building glibc (ipkg-build: command not found)
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
X-List-Received-Date: Fri, 30 Mar 2007 13:37:24 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

Hello,

As I was reading the mails of the mailing-list, I decided to switch to
bitbake-1.8. I also decided to remove all my TMPDIR directory to restart
from scratch.

I am currently using OE unstable with "OZ-unstable" distro for a "tosa"
machine.

When I build a package, I obtained the following error:

NOTE: Resolving missing task queue dependencies
NOTE: multiple providers are available for virtual/arm-linux-libc-for-gcc (glibc, glibc-intermediate);
NOTE: consider defining PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc
NOTE: Preparing Runqueue
NOTE: Executing runqueue
NOTE: Running task 144 of 182 (ID: 90, /home/djerem/work/zaurus/oe/stuff/org.openembedded.dev/packages/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb, do_fetch)
NOTE: package ipkg-utils-native-1.6+cvs20050404: started
NOTE: package ipkg-utils-native-1.6+cvs20050404-r8: task do_fetch: started
NOTE: package ipkg-utils-native-1.6+cvs20050404-r8: task do_fetch: completed
NOTE: package ipkg-utils-native-1.6+cvs20050404: completed
NOTE: Running task 145 of 182 (ID: 84, /home/djerem/work/zaurus/oe/stuff/org.openembedded.dev/packages/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb, do_unpack)
NOTE: package ipkg-utils-native-1.6+cvs20050404: started
NOTE: package ipkg-utils-native-1.6+cvs20050404-r8: task do_unpack: started
NOTE: Unpacking /home/djerem/work/zaurus/oe/dl_dir/ipkg-utils_anoncvs.handhelds.org__20050930.tar.gz to /home/djerem/work/zaurus/oe/stuff/tmp/work/i686-linux/ipkg-utils-native-1.6+cvs20050404-r8/
NOTE: package ipkg-utils-native-1.6+cvs20050404-r8: task do_unpack: completed
NOTE: package ipkg-utils-native-1.6+cvs20050404: completed
NOTE: Running task 148 of 182 (ID: 107, /home/djerem/work/zaurus/oe/stuff/org.openembedded.dev/packages/glibc/glibc_2.3.5+cvs20050627.bb, do_package_write)
NOTE: package glibc-2.3.5+cvs20050627: started
NOTE: package glibc-2.3.5+cvs20050627-r13: task do_package_write: started
sh: ipkg-build: command not found
NOTE: Task failed: ipkg-build execution failed
NOTE: package glibc-2.3.5+cvs20050627-r13: task do_package_write: failed
ERROR: TaskFailed event exception, aborting
NOTE: package glibc-2.3.5+cvs20050627: failed
ERROR: Build of /home/djerem/work/zaurus/oe/stuff/org.openembedded.dev/packages/glibc/glibc_2.3.5+cvs20050627.bb do_package_write failed
ERROR: Task 107 (/home/djerem/work/zaurus/oe/stuff/org.openembedded.dev/packages/glibc/glibc_2.3.5+cvs20050627.bb, do_package_write) failed
ERROR: '/home/djerem/work/zaurus/oe/stuff/org.openembedded.dev/packages/glibc/glibc_2.3.5+cvs20050627.bb' failed


I decided to switch back to bitbake-1.6, and it works fine.

So I am wondering where the problem can come from? A problem of dependancy
wrong handled by bitabke, a problem of package glibc/ipkg-utils?

I can provide more information if needed i(local.conf maybe or run the
command in a more verbose way) or open a bug report (in this case, I report
it to bitbake or openembedded ?).

In any case, thanks in advance.

Best regards,

djerem


