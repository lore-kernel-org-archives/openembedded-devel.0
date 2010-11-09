Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dexuan.cui@intel.com>) id 1PFeTx-0006JY-OJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Nov 2010 04:02:50 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Nov 2010 19:01:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.59,173,1288594800"; d="scan'208";a="571557944"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga002.jf.intel.com with ESMTP; 08 Nov 2010 19:01:51 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Tue, 9 Nov 2010 11:00:59 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Tue, 9 Nov 2010
	11:00:57 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Nov 2010 11:00:56 +0800
Thread-Topic: [oe] Fail to build eglibc on testing
Thread-Index: Act/tufDhPEVIXacQFOXLCB7uMcc+gAAp0Zg
Message-ID: <1865303E0DED764181A9D882DEF65FB67A65C6F4D5@shsmsx502.ccr.corp.intel.com>
References: <AANLkTikVxU787_ktH03HKBdCCFiGZOvxXk6pJ94+RK6Q@mail.gmail.com>
	<AANLkTikKbo9JQGzRMFjU+ud7QYkEZTMxc2PynO23SZV6@mail.gmail.com>
In-Reply-To: <AANLkTikKbo9JQGzRMFjU+ud7QYkEZTMxc2PynO23SZV6@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 134.134.136.24
X-SA-Exim-Mail-From: dexuan.cui@intel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Fail to build eglibc on testing
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
X-List-Received-Date: Tue, 09 Nov 2010 03:02:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Chris Larson wrote:
> On Mon, Nov 8, 2010 at 7:31 PM, Otavio Salvador
> <otavio@ossystems.com.br>wrote:=20
>=20
>> I got this build fail. Anyone knows anything about it?
>>=20
>>> nscd.c:(.text+0x573): undefined reference to `__stack_chk_guard'
>>> nscd.c:(.text+0x5cd): undefined reference to `__stack_chk_guard'
>>>=20
>> /home/otavio/hacking/ossystems/oe/oetmp-current/work/i586-oe-linux/eglib=
c-2.12-r15.6+svnr11762/build-i586-oe-linux/nscd/nscd.o:
>> In function `parse_opt':
>>> nscd.c:(.text+0x5fc): undefined reference to `__stack_chk_guard'
>>> nscd.c:(.text+0x8cf): undefined reference to `__stack_chk_guard'
>>=20
>=20
>=20
> I've run into this before in the past.  Never had time to
> investigate, but throwing out a "me too" :)

In Sep, when working on Poky side, I happened to meet with the same issue (=
I think here it's the same issue.:-)=20
In my Poky side, it turned out to be a gcc's with_build_sysroot configurati=
on issue:
http://bugzilla.pokylinux.org/show_bug.cgi?id=3D366=20
http://git.pokylinux.org/cgit/cgit.cgi/poky/commit/?id=3D2a066e7ca90a28d568=
1c5fa895a29e999ed7c88b

Thought I worked on Poky for several months, I'm new to OE. I hope the abov=
e links can help to fix your issue.

Thanks,
-- Dexuan


