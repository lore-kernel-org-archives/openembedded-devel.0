Return-Path: <erkka.kaaria@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A477E73D46
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2015 08:10:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Nov 2015 00:10:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,265,1444719600"; d="scan'208";a="815166961"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by orsmga001.jf.intel.com with ESMTP; 09 Nov 2015 00:10:47 -0800
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.13]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.251]) with mapi id
	14.03.0248.002; Mon, 9 Nov 2015 08:10:46 +0000
From: "Kaaria, Erkka" <erkka.kaaria@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java] Sporadic segfaults when compiling
	jamvm-native and classpath-native
Thread-Index: AdEYh1mleQZx3N4ORrSipg5JNSUBowAGbqoAAIjBfnA=
Date: Mon, 9 Nov 2015 08:10:46 +0000
Message-ID: <17C19527BD855F428F22685986FD58BEA33E02@IRSMSX103.ger.corp.intel.com>
References: <17C19527BD855F428F22685986FD58BEA213D3@IRSMSX106.ger.corp.intel.com>
	<CAP9ODKpP17FSRs+iNU=nne4empeDXCJbVq07ydq-6MoGAmO+yQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpP17FSRs+iNU=nne4empeDXCJbVq07ydq-6MoGAmO+yQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [meta-java] Sporadic segfaults when compiling jamvm-native and classpath-native
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
X-List-Received-Date: Mon, 09 Nov 2015 08:10:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Otavio Salvador
> Sent: Friday, November 6, 2015 4:40 PM
> To: OpenEmbedded Devel List <openembedded-
> devel@lists.openembedded.org>
> Subject: Re: [oe] [meta-java] Sporadic segfaults when compiling jamvm-
> native and classpath-native
> =

> On Fri, Nov 6, 2015 at 9:44 AM, Kaaria, Erkka <erkka.kaaria@intel.com>
> wrote:
> > There seems to be something wrong with cacao-initial-native JIT compiler
> that causes sporadic segfaults when compiling jamvm-native or classpath-
> native. This is fairly rare, I estimate around 1% of the builds fail due =
to
> segfault. I use 64 bit Ubuntu 15.04 with GCC 4.9.2 as build machine.
> =

> Did you check if cacao-staging tree does not include a fix for it?
> =


Hi,

I briefly glanced at the cacao-staging commit history, but I didn't find an=
y patches that would fix this segfault specifically. There are several patc=
hes that fix issues and race conditions in the jit compiler, for example ht=
tps://bitbucket.org/cacaovm/cacao-staging/commits/7e6eef2b4c94 and https://=
bitbucket.org/cacaovm/cacao-staging/commits/56697326cf27. One of these patc=
hes may very well fix the segfault, but the problem is that the cacao versi=
on that is used in the bootstrapping process is positively ancient (0.98, r=
eleased in 2007). The linked patches for example are patching files that ar=
e either substantially different from the ones in 0.98 or don't even exist =
in 0.98. Backporting any patches to would not be easy. =


While the workaround would leave the underlying cause unfixed, it only requ=
ires changing one line. Since the cacao-initial-native is only used briefly=
 during the build process, I think small workaround is better than large sc=
ale changes to the old codebase. I also didn't notice any difference in cla=
sspath-native or jamvm-native build times, so the performance impact is neg=
ligible.  =


On a related note, I ran the clean\recompile script over the weekend and sa=
w no segfaults, so I think the workaround works. =


Best Regards,
Erkka K=E4=E4ri=E4
---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


