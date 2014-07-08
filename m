Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AF95B70196
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jul 2014 16:14:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2014 09:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,625,1400050800"; d="scan'208";a="540336702"
Received: from fear.jf.intel.com (HELO rage.localnet) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 08 Jul 2014 09:14:02 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 08 Jul 2014 09:13:53 -0700
Message-ID: <4246514.6uHudSIxWy@rage>
User-Agent: KMail/4.12.4 (Linux/3.14-1-amd64; KDE/4.13.1; x86_64; ; )
MIME-Version: 1.0
Subject: meta-xfce: xfce4-taskmanager fails do_configure with git timeout
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jul 2014 16:14:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Building xfce4-taskmanager from behind a proxy is failing during 
do_configure as xdt-autogen attempts to clone the doc submodule.

Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 
'bit-64', 'x86_64-linux', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| xdt-autogen: Automatically initializing the doc submodule.
| Synchronizing submodule url for 'doc'
| Cloning into 'doc'...
| fatal: unable to connect to git.xfce.org:
| git.xfce.org[0: 138.48.2.107]: errno=Connection timed out
|
| Clone of 'git://git.xfce.org/xfce/xfce4-docs' into submodule path 
'doc' failed
| xdt-autogen: Pulling the xfce4-docs git submodule failed. See errors
|              above for more information and take a look at
|              http://wiki.xfce.org/documentation.
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at 
/build/yocto/daisy/intel-
corei7-64_20140620142725/build/tmp/work/corei7-64-eywa-linux/xfce4-
taskmanager/1.0.0+gitAUTOINC+e5d958738b-r0/temp/log.do_configure.18692)

Interestingly, if I run the devshell and execute the contents of the 
xfce-git.bbclass do_configure_prepend function, the clone completes 
successfully and subsequent bitbake builds succeed.

devshell> NOCONFIGURE=yes ./autogen.sh
...

Any thoughts on why this might fail from bitbake but succeed from the 
devshell?

Any thoughts on how to avoid cloning the docs altogether just to get 
around this and get things building?

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center

