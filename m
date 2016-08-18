Return-Path: <erkka.kaaria@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 95531766E1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 13:57:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 18 Aug 2016 06:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,539,1464678000"; d="scan'208";a="867607284"
Received: from irsmsx110.ger.corp.intel.com ([163.33.3.25])
	by orsmga003.jf.intel.com with ESMTP; 18 Aug 2016 06:57:09 -0700
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.204]) by
	irsmsx110.ger.corp.intel.com ([169.254.15.113]) with mapi id
	14.03.0248.002; Thu, 18 Aug 2016 14:57:08 +0100
From: "Kaaria, Erkka" <erkka.kaaria@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH v2 2/2] openjdk-8-release-102b14.inc:
	Ignore deprecation
Thread-Index: AQHR9tftY/JWcrlqBkKNr7uVqc7XgqBOmSmAgAAnwlA=
Date: Thu, 18 Aug 2016 13:57:07 +0000
Message-ID: <17C19527BD855F428F22685986FD58BEB45B37@IRSMSX103.ger.corp.intel.com>
References: <1471253780-28526-1-git-send-email-erkka.kaaria@intel.com>
	<1471253780-28526-2-git-send-email-erkka.kaaria@intel.com>
	<20160818122655.GB16863@mbabyjoh-desk.ger.corp.intel.com>
In-Reply-To: <20160818122655.GB16863@mbabyjoh-desk.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [meta-java][PATCH v2 2/2] openjdk-8-release-102b14.inc: Ignore deprecation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Aug 2016 13:57:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Maxin, =


This failure is unrelated to the patch, caused by changes in the oe-core:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Da98a8180863ff45b477a=
1f8439ebcec21151d282 =


As far as I can tell, the current openjdk version is equally affected. I'll=
 look into fixing the error though.

Best Regards,
Erkka K=E4=E4ri=E4


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Maxin B. John
> Sent: Thursday, August 18, 2016 3:27 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-java][PATCH v2 2/2] openjdk-8-release-102b14.inc:
> Ignore deprecation
> =

> Hi Erkka,
> =

> On Mon, Aug 15, 2016 at 12:36:20PM +0300, Erkka K=E4=E4ri=E4 wrote:
> > readdir_r has been deprecated since glibc 2.24. As openjdk uses this
> > function, a warning is generated during build that gets turned into an
> > error when -Werror is used.
> =

> Yes, this fixes the build error that we got with the first version. Thank=
 you!
> =

> However,we are getting another QA Error with the build:
> =

> ERROR: openjre-8-102b14-r0 do_package_qa: QA Issue: No GNU_HASH in
> the elf binary: '/media/poky/build/tmp/work/core2-64-poky-linux/openjre-
> 8/102b14-r0/packages-split/openjre-8/usr/lib/jvm/openjre-
> 8/lib/amd64/libjsig.so'
> No GNU_HASH in the elf binary: '/media/poky/build/tmp/work/core2-64-
> poky-linux/openjre-8/102b14-r0/packages-split/openjre-
> 8/usr/lib/jvm/openjre-8/lib/amd64/server/libjvm.so' [ldflags]
> ERROR: openjre-8-102b14-r0 do_package_qa: QA run found fatal errors.
> Please consider fixing them.
> ERROR: openjre-8-102b14-r0 do_package_qa: Function failed:
> do_package_qa
> ERROR: Logfile of failure stored in: /media/poky/build/tmp/work/core2-64-
> poky-linux/openjre-8/102b14-r0/temp/log.do_package_qa.22839
> ERROR: Task /home/maxin/clone/meta-java/recipes-core/openjdk/openjre-
> 8_102b14.bb:do_package_qa (/home/maxin/clone/meta-java/recipes-
> core/openjdk/openjre-8_102b14.bb:do_package_qa) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1344 tasks of which 1332 didn't need to be
> rerun and 1 failed.
> NOTE: Writing buildhistory
> =

> <snip>
> =

> Could you please look into this ?
> =

> Best Regards,
> Maxin
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


