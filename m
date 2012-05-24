Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SXVVA-0004bN-I7 for openembedded-devel@lists.openembedded.org;
	Thu, 24 May 2012 12:42:40 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SXVLI-00032D-3W for openembedded-devel@lists.openembedded.org;
	Thu, 24 May 2012 12:32:28 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2012 12:32:28 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2012 12:32:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 24 May 2012 12:32:10 +0200
Message-ID: <jpl2nd$o5t$1@dough.gmane.org>
References: <1337108462-14996-1-git-send-email-gizero@gmail.com>
	<CAC+thW2CJEGYJxPK63F_w7u+iZE+yv0Gda_XYwc6iB4TAOsy9w@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <CAC+thW2CJEGYJxPK63F_w7u+iZE+yv0Gda_XYwc6iB4TAOsy9w@mail.gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: [meta-oe][PATCH v3] libmodbus: ported recipe from classic and updated
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
X-List-Received-Date: Thu, 24 May 2012 10:42:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 24-05-12 07:52, Andrea Galbusera schreef:
> Hello,
> 
> On Tue, May 15, 2012 at 9:01 PM, Andrea Galbusera <gizero@gmail.com>
> wrote:
>> * based on recipe by Radoslav Kolev which was in classic * updated to
>> latest released version 3.0.2
>> 
>> v2: * drop git version of recipe * drop no longer used PRIORITY
>> 
>> v3: * drop PR = "r0"
>> 
>> Signed-off-by: Andrea Galbusera <gizero@gmail.com> --- 
>> .../recipes-extended/libmodbus/libmodbus_3.0.2.bb  |   16
>> ++++++++++++++++ 1 files changed, 16 insertions(+), 0 deletions(-) 
>> create mode 100644
>> meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
>> 
>> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
>> b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb new file mode
>> 100644 index 0000000..03b7fcc --- /dev/null +++
>> b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb @@ -0,0 +1,16
>> @@ +SUMMARY = "A Modbus library" +DESCRIPTION = "libmodbus is a C
>> library designed to provide a fast and robust \ +implementation of the
>> Modbus protocol. It runs on Linux, Mac OS X, FreeBSD, \ +QNX and
>> Windows." +HOMEPAGE = "http://www.libmodbus.org/" +SECTION = "libs" + 
>> +LICENSE = "LGPLv2.1+" +LIC_FILES_CHKSUM =
>> "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c" + +SRC_URI
>> =
>> "http://github.com/downloads/stephane/libmodbus/libmodbus-${PV}.tar.gz"
>>
>> 
+
>> +inherit autotools pkgconfig + +SRC_URI[md5sum] =
>> "1aaacce9d9779d3a84f7d1a75774c943" +SRC_URI[sha256sum] =
>> "927ec90e0e299a7d4ec7086b1e2590566bdfc3bbc22e12204229361c029f2615" -- 
>> 1.7.5.4
>> 
> 
> Does v3 of the patch look acceptable

Yes, it went in 8 days ago:
http://cgit.openembedded.org/meta-openembedded/commit/?id=984fa94e2b75d1665077953fa3c9c6e74e8fc328
:)

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPvg4qAAoJEHZqAkdh1vT6TUYQAImDWVVdZVOJprjAxSvvaJg3
OALPfada1MpLhKlAScbddz/msAHOZw1TWeqnUGLhVCKB011oeICpL3yB7ftGyMrc
fTKMOB2eojaYmZfjMUPoi/0hu8kQOf7z/9A0c/5N2Ane7ZY+pZlk3tfw39c4x6/q
K3VoLYmpVOB2yva3N4AYdIDpIQ2wuLtVppRYK0f7C/hCS01lrumm66lkZkGFGHcG
syZMfTu/2rYZjY8fnEEvpEQ8z81PAIc1W5VfdxXSvXKqVOgT3KJKCIN9ABXqQ1b8
uC12ZtiCqNXSbn2Tq1pWQr0ynkQg+oJtYxPpm59Qgz9VBrx2CQaoCJlAys32lZXj
tYyDO0guzI/YhPYgaCmbYAzv4oTfK5jXfzLIHR2EV0eQC3rUlumBoTaGo7b2IvGc
i2zC7f5BPXyw7d5izibenPDpZBQqq/3vM6zUdaVcYDep77kQ6oM5sljTxl0Lo1Ap
GcS3MKyd3lW4ULwX/3CJBii9QqZKpvoEXtIBSuICUfgtZkm/qlKrxdCWbjcrXPOP
w9h/XCpQ0P8wO+S/ASfxAMAcXDO0D5uSrbmFT64aWV/ynKrVibTSzSOIqUFrahDE
O+JARhXU+dDuFUEeyxgLkAnZp0gonfEkii/B5Uf3P5c3q3A2hf8JzIcUFxnS48m3
OvUPBYQ0nj1ejoiFcgYh
=u6Sh
-----END PGP SIGNATURE-----



