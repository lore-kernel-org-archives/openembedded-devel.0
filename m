Received: from asmtpout027.mac.com ([17.148.16.102])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1P7tjl-0005rH-4z
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 19:43:07 +0200
MIME-version: 1.0
Received: from [192.168.1.65] ([59.93.35.154])
	by asmtp027.mac.com (Oracle Communications Messaging Exchange Server
	7u4-18.01 64bit (built Jul 15 2010)) with ESMTPSA id
	<0LAH00DTIVQMGA70@asmtp027.mac.com>
	for openembedded-devel@lists.openembedded.org; Mon,
	18 Oct 2010 09:42:28 -0700 (PDT)
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.2.15,1.0.148,0.0.0000
	definitions=2010-10-18_08:2010-10-18, 2010-10-18,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 suspectscore=5 phishscore=0 bulkscore=0 adultscore=0
	classifier=spam
	adjust=0 reason=mlx engine=6.0.2-1004200000 definitions=main-1010180109
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Mon, 18 Oct 2010 22:12:21 +0530
Message-id: <DF1865B2-C47F-4742-81CF-C57541F25728@mac.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 17.148.16.102
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00, RCVD_IN_NJABL_PROXY,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: runstrip command failures
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
X-List-Received-Date: Mon, 18 Oct 2010 17:43:07 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; CHARSET=US-ASCII

Hi,
       I just noticed a bunch of runstrip command failures, while building linux-2.6.36-rc7 kernel recipe that I created for wl12xx testing. Is this normal? How can I fix this error? The uImage gets built though.

ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --remove-section=.comment --remove-section=.note '/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/kconfig/conf'' strip command failed
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --remove-section=.comment --remove-section=.note '/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/genksyms/genksyms'' strip command failed
arm-angstrom-linux-gnueabi-objcopy:/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/basic/hash: File format not recognized
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --remove-section=.comment --remove-section=.note '/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/kconfig/conf'' strip command failed
arm-angstrom-linux-gnueabi-strip:/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/basic/hash: File format not recognized
arm-angstrom-linux-gnueabi-objcopy:/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/basic/hash: File format not recognized
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --remove-section=.comment --remove-section=.note '/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/basic/hash'' strip command failed
arm-angstrom-linux-gnueabi-objcopy:/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/basic/fixdep: File format not recognized
arm-angstrom-linux-gnueabi-strip:/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/basic/fixdep: File format not recognized
arm-angstrom-linux-gnueabi-objcopy:/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/basic/fixdep: File format not recognized
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --remove-section=.comment --remove-section=.note '/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/basic/fixdep'' strip command failed
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --remove-section=.comment --remove-section=.note '/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/basic/hash'' strip command failed
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --remove-section=.comment --remove-section=.note '/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/basic/fixdep'' strip command failed
arm-angstrom-linux-gnueabi-objcopy:/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/basic/docproc: File format not recognized
arm-angstrom-linux-gnueabi-strip:/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/basic/docproc: File format not recognized
arm-angstrom-linux-gnueabi-objcopy:/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/basic/docproc: File format not recognized
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --remove-section=.comment --remove-section=.note '/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/basic/docproc'' strip command failed
arm-angstrom-linux-gnueabi-objcopy:/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/mod/modpost: File format not recognized
arm-angstrom-linux-gnueabi-strip:/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/mod/modpost: File format not recognized
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --remove-section=.comment --remove-section=.note '/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/basic/docproc'' strip command failed
arm-angstrom-linux-gnueabi-objcopy:/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/mod/modpost: File format not recognized
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --remove-section=.comment --remove-section=.note '/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/mod/modpost'' strip command failed
arm-angstrom-linux-gnueabi-objcopy:/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/mod/mk_elfconfig: File format not recognized
arm-angstrom-linux-gnueabi-strip:/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/mod/mk_elfconfig: File format not recognized
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --remove-section=.comment --remove-section=.note '/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/mod/modpost'' strip command failed
arm-angstrom-linux-gnueabi-objcopy:/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/mod/mk_elfconfig: File format not recognized
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --remove-section=.comment --remove-section=.note '/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/mod/mk_elfconfig'' strip command failed
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip' --remove-section=.comment --remove-section=.note '/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/linux-omap3-2.6.36-r90/package/kernel/scripts/mod/mk_elfconfig'' strip command failed


Elvis Dowson


