Received: from [128.222.32.20] (helo=mexforward.lss.emc.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Lin_Lynn@emc.com>) id 1MEMDy-0000Dq-Ef
	for openembedded-devel@openembedded.org; Wed, 10 Jun 2009 13:44:10 +0200
Received: from hop04-l1d11-si03.isus.emc.com (HOP04-L1D11-SI03.isus.emc.com
	[10.254.111.23])
	by mexforward.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	n5ABYREW020690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 10 Jun 2009 07:34:27 -0400 (EDT)
From: Lin_Lynn@emc.com
Received: from mailhub.lss.emc.com (numailhub.lss.emc.com [10.254.144.16]) by
	hop04-l1d11-si03.isus.emc.com (Tablus Interceptor) for
	<openembedded-devel@openembedded.org>;
	Wed, 10 Jun 2009 07:34:18 -0400
Received: from corpussmtp2.corp.emc.com (corpussmtp2.corp.emc.com
	[128.221.14.146])
	by mailhub.lss.emc.com (Switch-3.3.2/Switch-3.3.2) with ESMTP id
	n5ABY9kF025695 for <openembedded-devel@openembedded.org>;
	Wed, 10 Jun 2009 07:34:18 -0400
Received: from CORPUSMX100C.corp.emc.com ([128.222.76.50]) by
	corpussmtp2.corp.emc.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 10 Jun 2009 07:34:15 -0400
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 10 Jun 2009 07:34:16 -0400
Message-ID: <065E68EB87448440A3E75B4DBB5E871C525CCA@CORPUSMX100C.corp.emc.com>
In-Reply-To: <BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] OE Build :error configure failed to discover size of unix
	socket path
Thread-Index: AcnpmDhazrm0aAfqTdaGJuKkOuV2NQAJth6w
References: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl><1244144325.6678.0.camel@port4><BLU137-W9D00E1434DB12273A400AD4480@phx.gbl><1244206438.6643.46.camel@port4>
	<BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>
To: <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 10 Jun 2009 11:34:15.0350 (UTC)
	FILETIME=[62453D60:01C9E9BF]
X-EMM-EM: Active
Subject: Re: OE Build :error configure failed to discover size of unix socket path
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
X-List-Received-Date: Wed, 10 Jun 2009 11:44:10 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: quoted-printable

Maybe you need give more information when you submit a bug
you can post the log file


Lynn Lin
-----Original Message-----
From: openembedded-devel-bounces@openembedded.org =
[mailto:openembedded-devel-bounces@openembedded.org] On Behalf Of =
=C1=F5=B7=BC=BB=AA
Sent: Wednesday, June 10, 2009 2:49 PM
To: openembedded-devel@openembedded.org
Subject: [oe] OE Build :error configure failed to discover size of unix =
socket path



Hi!

   I met a error while I build:

/mono/io-layer/wapi-private.h:22:2: error: #error configure failed to =
discover size of unix socket path
| make[3]: *** [collection.lo] Error 1
| make[3]: Leaving directory =
`/home/build/stuff/workspace/work/i586-ThunderST-linux/mono-2.4-r0/mono-2=
.4/mono/io-layer'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory =
`/home/build/stuff/workspace/work/i586-ThunderST-linux/mono-2.4-r0/mono-2=
.4/mono'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory =
`/home/build/stuff/workspace/work/i586-ThunderST-linux/mono-2.4-r0/mono-2=
.4'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: =
/home/build/stuff/workspace/work/i586-ThunderST-linux/mono-2.4-r0/temp/lo=
g.do_compile.10880
NOTE: package mono-2.4-r0: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package mono-2.4: failed
ERROR: Build of /home/build/stuff/openembedded/packages/mono/mono_2.4.bb =
do_compile failed
ERROR: Task 9 (/home/build/stuff/openembedded/packages/mono/mono_2.4.bb, =
do_compile) failed
NOTE: Tasks Summary: Attempted 7 tasks of which 0 didn't need to be =
rerun and 1 failed.
ERROR: '/home/build/stuff/openembedded/packages/mono/mono_2.4.bb' failed
NOTE: build 200906101437: completed

Any advice will be appreciated!


_________________________________________________________________
Messenger10=C4=EA=BC=CE=C4=EA=BB=AA=A3=AC=C0=F1=C6=B7=B4=F3=BD=B1=B5=C8=C4=
=E3=C4=C3=A3=A1
http://10.msn.com.cn
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


