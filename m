Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A67836AC4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2014 15:07:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Oct 2014 08:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,295,1413270000"; d="scan'208";a="599801954"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga001.jf.intel.com with ESMTP; 31 Oct 2014 08:07:32 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Fri, 31 Oct 2014 15:06:56 +0000
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.56]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.23]) with mapi id
	14.03.0195.001; Fri, 31 Oct 2014 15:06:56 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Yocto 1.7 building alsa-lib do_package fails
Thread-Index: AQHP9PNtTx0qhJq58EeLYkdHkPkpzZxKTCWg
Date: Fri, 31 Oct 2014 15:06:56 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F384F4B@IRSMSX105.ger.corp.intel.com>
References: <CAD0=qkKGx8o9xAf14G1NOXxD5QzKXKJBqfCXDBgc8saTfrW_zQ@mail.gmail.com>
In-Reply-To: <CAD0=qkKGx8o9xAf14G1NOXxD5QzKXKJBqfCXDBgc8saTfrW_zQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: Yocto 1.7 building alsa-lib do_package fails
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
X-List-Received-Date: Fri, 31 Oct 2014 15:07:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

There might be something wrong with the target machine/processor architectu=
re in your setup..

tmp-angstrom_v2014_12-glibc/work/-angstrom-linux-gnueabi/alsa-lib/1.0.28-r0=
/ looks strange;
A common root cause will trigger the ipk/opkg error.

Please provide the necessary steps to reproduce the issue.

Regards,
Cristian Iorga
Yocto Project
Intel Corporation


-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Sven Ebenfeld
Sent: Friday, October 31, 2014 12:14 PM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] Yocto 1.7 building alsa-lib do_package fails

Hi,

When I try to build alsa-lib on master branch of oe-core I get the followin=
g error:

ERROR: Function failed: opkg-build execution failed
ERROR: Logfile of failure stored in:
/media/bitbakeTmp/angstrom-dizzy/build/tmp-angstrom_v2014_12-glibc/work/-an=
gstrom-linux-gnueabi/alsa-lib/1.0.28-r0/temp/log.do_package_write_ipk.29979
Log data follows:
| DEBUG: Executing python function sstate_task_prefunc
| DEBUG: Python function sstate_task_prefunc finished
| DEBUG: Executing python function do_package_write_ipk
| DEBUG: Executing python function read_subpackage_metadata
| DEBUG: Python function read_subpackage_metadata finished
| DEBUG: Executing python function do_package_ipk
| *** Error: CONTROL/control is missing field Architecture
|
| opkg-build: Please fix the above errors and try again.
| DEBUG: Python function do_package_ipk finished
| DEBUG: Python function do_package_write_ipk finished
| ERROR: Function failed: opkg-build execution failed
ERROR: Task 1625
(/media/bitbakeTmp/angstrom-dizzy/sources/openembedded-core/meta/recipes-mu=
ltimedia/alsa/alsa-lib_1.0.28.bb,
do_package_write_ipk) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2214 tasks of which 15 didn't need to be rer=
un and 1 failed.


I'm using Angstrom setup-scripts on branch angstrom-v2014.12-yocto1.7

Can anybody give me an advice where to look for the source of the problem?

Regards,
Sven
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

