Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0A0AE71957
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 23:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CD866209AE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 23:45:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Eg7EnyamM3hR
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 23:45:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B38EF208C9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 23:45:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 21B0A1626DE; Tue,  3 Oct 2017 19:45:35 -0400 (EDT)
Date: Tue, 3 Oct 2017 19:45:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20171003234535.GG16828@denix.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: nativesdk-qtbase 5.9.2 C++11 errors with gcc 6.3?
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
X-List-Received-Date: Tue, 03 Oct 2017 23:45:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Martin, Khem,

Have you tried building Qt 5.9 with gcc 6.3 from oe-core? I'm seeing bunch of 
what seems to be C++11 related errors during do_configure of nativesdk-qtbase. 
Target qtbase builds fine and switching to gcc 7.2 seems to resolve it as well.

Any ideas or pointers? Thanks!


Errors are like these:

In file included from ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1:0,
                 from /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h: In function 'bool qnumeric_std_wrapper::__builtin_isnan(double)':
../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:45: error: '__builtin_isnan' is not a member of 'std'
 static inline bool isnan(double d) { return std::isnan(d); }
                                             ^~~
../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:45: note: suggested alternatives:
<built-in>: note:   '__builtin_isnan'
In file included from /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/recipe-sysroot/tmp/sdk/sysroots/x86_64-oe-linux/usr/include/c++/6.3.0/cmath:45:0,
                 from ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:56,
                 from ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1,
                 from /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:20: note:   'qnumeric_std_wrapper::__builtin_isnan'
 static inline bool isnan(double d) { return std::isnan(d); }
                    ^
../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h: At global scope:
../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:105:20: error: expected ')' before '(' token
 static inline bool isinf(double d) { return std::isinf(d); }
                    ^
In file included from ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1:0,
                 from /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h: In function 'bool qnumeric_std_wrapper::__builtin_isfinite(double)':
../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:106:48: error: '__builtin_isfinite' is not a member of 'std'
 static inline bool isfinite(double d) { return std::isfinite(d); }
                                                ^~~
../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:106:48: note: suggested alternatives:
<built-in>: note:   '__builtin_isfinite'

