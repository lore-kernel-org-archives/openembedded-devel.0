Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E999F7067B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 15:51:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Aug 2014 08:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,812,1400050800"; d="scan'208";a="584262469"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.26])
	by orsmga002.jf.intel.com with ESMTP; 06 Aug 2014 08:51:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>
Date: Wed, 06 Aug 2014 16:51:38 +0100
Message-ID: <2182141.T2GfbSclhN@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.7-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <20140806081042.15013.qmail@f4mail-235-223.rediffmail.com>
References: <20140806081042.15013.qmail@f4mail-235-223.rediffmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Regarding net-snmp
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
X-List-Received-Date: Wed, 06 Aug 2014 15:51:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 06 August 2014 08:10:42 Himanshu  Pandey wrote:
> Please help me rectify the following error:
> 
> ERROR: QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/snmpnetstat ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/snmpdelta ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/snmpusm ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/snmpbulkget ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/snmpstatus ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/agentxtrap ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/snmpwalk ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/snmpget ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/snmptranslate ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/snmpgetnext ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/snmptest ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/snmpdf ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/snmptable ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/snmpbulkwalk ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/snmptrap ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/encode_keychange ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/snmpvacm ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/bin/snmpset ERROR:
>  QA Issue: non -staticdev package contains static .a library: snmp path
> '/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/li
> bnetsnmpagent.a' ERROR:
>  QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: snmp
> path
> '/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/li
> bnetsnmp.so' ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/lib/libnetsnmpmibs.so.30.0.2 ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/lib/libnetsnmpagent.so.30.0.2 ERROR:
>  QA Issue: non -staticdev package contains static .a library: snmp path
> '/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/li
> bnetsnmptrapd.a' ERROR:
>  QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: snmp
> path
> '/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/li
> bnetsnmptrapd.so' ERROR:
>  QA Issue: non -staticdev package contains static .a library: snmp path
> '/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/li
> bnetsnmphelpers.a' ERROR:
>  QA Issue: non -staticdev package contains static .a library: snmp path
> '/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/li
> bnetsnmpmibs.a' ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/lib/libnetsnmptrapd.so.30.0.2 ERROR:
>  QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: snmp
> path
> '/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/li
> bnetsnmpagent.so' ERROR:
>  QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: snmp
> path
> '/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/li
> bnetsnmphelpers.so' ERROR:
>  QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: snmp
> path
> '/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/li
> bnetsnmpmibs.so' ERROR:
>  QA Issue: non -staticdev package contains static .a library: snmp path
> '/work/x86_64-poky-linux/snmp/1.0-r7/packages-split/snmp/opt/net-snmp/lib/li
> bnetsnmp.a' ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/sbin/snmptrapd ERROR:
>  QA Issue: package snmp contains bad RPATH
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/im
> age/opt/net-snmp/lib in file
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/pa
> ckages-split/snmp/opt/net-snmp/sbin/snmpd ERROR: QA run found fatal errors.
> Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR:
>  Logfile of failure stored in:
> /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/snmp/1.0-r7/te
> mp/log.do_package.6586 ERROR: Task 466
> (/home/yocto/poky-dora-10.0.0/meta-msc/recipes-msc/msc/snmp.bb, do_package)
> failed with exit code '1'

So this is your own recipe and not the net-snmp recipe in meta-networking, is 
that correct?

As for the resolving QA errors, we have a section recently added to the Yocto 
Project reference manual which may be useful:

http://www.yoctoproject.org/docs/1.7/ref-manual/ref-manual.html#ref-qa-checks

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

