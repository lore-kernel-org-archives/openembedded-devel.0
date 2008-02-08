Received: from [64.233.166.183] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1JNMbG-0006OF-8j
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2008 07:20:38 +0100
Received: by py-out-1112.google.com with SMTP id y77so3476376pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2008 22:20:50 -0800 (PST)
Received: by 10.35.65.17 with SMTP id s17mr13580371pyk.19.1202451650491;
	Thu, 07 Feb 2008 22:20:50 -0800 (PST)
Received: from ?192.168.1.207? ( [24.107.189.117])
	by mx.google.com with ESMTPS id y45sm16060801pyg.9.2008.02.07.22.20.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 07 Feb 2008 22:20:49 -0800 (PST)
Message-ID: <47ABF4BE.4060603@gmail.com>
Date: Fri, 08 Feb 2008 00:20:46 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
References: <49bdfd00802070537t38c658f8h1abb3323e6470c18@mail.gmail.com>
In-Reply-To: <49bdfd00802070537t38c658f8h1abb3323e6470c18@mail.gmail.com>
Cc: Using OE <openembedded-users@lists.openembedded.org>
Subject: Re: Problems building konqueror embedded
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
X-List-Received-Date: Fri, 08 Feb 2008 06:20:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/07/2008 07:37 AM, Piero Pezzin wrote:
> Hello everyone.
> 
> I'm trying to build konqueror embedded for ARM platform using openembedded.
> I've correctly configured OE (I succesfully built nano for ARM), but 
> when I run
> 
> bitbake konqueror-embedded
> 
> I get the following error:
> 
> NOTE: package uicmoc3-native-3.3.5: started
> NOTE: package uicmoc3-native-3.3.5-r3: task do_configure: started
> ERROR: function do_configure failed
> ERROR: log data follows 
> (/home/piero/work/openembedded-nobk/build/tmp/work/x86_64-linux/uicmoc3-native-3.3.5-r3/temp/log.do_configure.20299)
> | cp: cannot stat 
> `/home/piero/work/openembedded-nobk/build/tmp/staging/x86_64-linux/share/qmake/linux-oe-g++/*': 
> No such file or directory
> NOTE: Task failed: 
> /home/piero/work/openembedded-nobk/build/tmp/work/x86_64-linux/uicmoc3-native-3.3.5-r3/temp/log.do_configure.20299
> NOTE: package uicmoc3-native-3.3.5-r3: task do_configure: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package uicmoc3-native-3.3.5: failed
> ERROR: Build of 
> /home/piero/work/openembedded-nobk/org.openembedded.dev/packages/uicmoc/uicmoc3-native_3.3.5.bb 
> do_configure failed
> ERROR: Task 255 
> (/home/piero/work/openembedded-nobk/org.openembedded.dev/packages/uicmoc/uicmoc3-native_3.3.5.bb, 
> do_configure) failed
> NOTE: Tasks Summary: Attempted 205 tasks of which 0 didn't need to be 
> rerun and 1 failed.

Forwarding to dev list. You probably would like to file a bug report, 
describe your build environment and attach the log file.

btw, uicmoc3-native-3.3.5-r3 builds fine for me for Angstrom-2008.1@tosa

Regards
Gordon


