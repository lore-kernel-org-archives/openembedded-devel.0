Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 451 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 01 May 2019 13:26:41 UTC
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 3B6027D3AD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 13:26:40 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id Lp8fh5ZNvpYZWLp8ghZzrn; Wed, 01 May 2019 14:19:10 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=cd2sUULM c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=E5NmQfObTbMA:10 a=BlMeI24vB3fBGh1XEIwA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>) id 1hLp8f-0002CV-G0
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 May 2019 14:19:09 +0100
Date: Wed, 1 May 2019 14:19:09 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20190501131909.uhobxiuxv57o3q4t@mcrowe.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfBjjFJadkvTByqcy5wMQr5OalM6t+FPZo20P/67Lf/YtlqzQ4I4c35MY7H6F8DfTGA1qJPbddpe/S2dYv5wo28svUpzB3Tr2unABgnYxQR/34QTmPsWm
	OMFDYcu3jCTK/uowCzXkF0E0TqvzdF/AMiHS8442J5lyfvIfIBEXlWKuePfN46yi7U8SxAgN0j6lCw==
Subject: [meta-java] openjdk "IndexError: string index out of range" with ccache
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
X-List-Received-Date: Wed, 01 May 2019 13:26:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

For a long time, we've been seeing errors when building openjdk-8:

WARNING: .../meta-java/recipes-core/openjdk/openjdk-8_172b11.bb: Unable to export ${CXXFLAGS_FOR_BUILD}: Failure expanding variableBUILD_CFLAGS, expression was -isystem/.../openjdk-8/172b11-r0/recipe-sysroot-native/usr/include -O2 -pipe -Wno-error=deprecated-declarations ${@openjdk_build_helper_get_build_cflags(d)} which triggered exception IndexError: string index out of range

I finally managed to work out what was causing them. When using ccache
(built as ccache-native during the build), BUILD_CC contains "ccache gcc".
Unfortunately, with recipe-specific sysroots ccache is not always available
in the PATH for every task (in particular, for do_prepare_sysroot of
course, but there are plenty of others.) Yet, because CXXFLAGS_FOR_BUILD is
exported it must be expanded for every task.

The confusing error message is because
openjdk-build-helper.bbclass:openjdk_build_helper_get_build_cflags does
cc.communicate()[0].decode('utf-8')[0] on the empty string it received on
from stdout when ccache cannot be executed.

(I also notice that this will break with GCC 10, which is currently in
development.)

I've worked around the problem with the horrendous:

    if build_cc.startswith("ccache "):
            build_cc = build_cc[7:]

What would be a better solution to this problem? The only one I could come
up with is only export CXXFLAGS_FOR_BUILD in a prepend for do_configure and
do_compile.

Thanks.

Mike.

