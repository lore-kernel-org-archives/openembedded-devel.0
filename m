Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QhJL3-0001FK-T4
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 12:40:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Jul 2011 03:35:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,528,1304319600"; d="scan'208";a="27142895"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 14 Jul 2011 03:35:08 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 14 Jul 2011 18:35:04 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Thu, 14 Jul 2011 18:35:04 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Koen Kooi <koen@openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Jul 2011 18:35:02 +0800
Thread-Topic: Did the chromium recipe even build fine in OE?
Thread-Index: AcxCEbBRF2KGleTeRua/dweDWhAvlg==
Message-ID: <1865303E0DED764181A9D882DEF65FB6A7FC150F62@shsmsx502.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Did the chromium recipe even build fine in OE?
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
X-List-Received-Date: Thu, 14 Jul 2011 10:40:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all, I'm trying to port the chromium recipe from OE to Poky.  After some=
 investigation, I doubt it could ever build in OE?

1) The last update to the recipe happened in Apr, 2010 -- 15 months ago. Si=
nce that, the locations of some repos have changed, e.g., in custom_cached_=
svn, the locations of native_client, JavaScriptCore, WebCore and WebKit/chr=
omium have changed; looks pywebsocket and patched-ffmpeg-mt have been dropp=
ed from the repos. So I updated and commented them accordingly to make do_f=
etch and do_fetch_post pass.
BTW: the size of the whole source codes is really big -- more than 3G bytes=
!

2) The file include.gypi is for ARM only, so I belive the recipe was only t=
ested for ARM target, if there was any test?
So I moved the file into the same directory where gypi.patch is in and upda=
td include.gypi by changing 'target_arch' to 'ia32' and replacing 'armv7' a=
nd 'arm' to 'ia32'.

With my changes, do_configure can pass, but do_compile fails (A sligher lon=
ger long is at http://pastebin.com/8w9LJTsa) :
| /bin/sh: /bin/i586-poky-linux-ar: No such file or directory
| make: *** [out/Release/obj.target/v8/tools/gyp/libv8_nosnapshot.a] Error =
127

The 'sysroot' include.gyp is empty. This might be the cause?=20

I'm trying to look into this.=20
Please comment.
Any suggestion is appreciated!

Thanks,
-- Dexuan




