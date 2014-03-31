Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1406B181
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 12:02:37 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2VC2WhQ005260 for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 13:02:33 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cJltlwff3zih
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 13:02:32 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2VC2UNQ005248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 13:02:32 +0100
Message-ID: <1396267345.14790.70.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Mon, 31 Mar 2014 13:02:25 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [meta-qt5] Antisocial layer behaviour
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
X-List-Received-Date: Mon, 31 Mar 2014 12:02:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I noticed some rebuilds happening when my cache should have been good.
"bitbake xxxx -S printdiff" showed:

Task cmake-native:do_configure couldn't be used from the cache because:
  We need hash f8a8910df42f4330ddaf9e40105baa7d, closest matching task was 93ac4b3cc3e9b5dd0868377cf287ca3d
  basehash changed from 6b93d63cb19070822b91834c3ec58922 to a805733675f04ac021199aa92ed54cb5
  Variable do_configure value changed from '    sed -i 's/^find_package(Qt5Core QUIET)$/#find_package(Qt5Core QUIET)/g' ${S}/Tests/RunCMake/CMakeLists.txt
    sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUIRED)/g' ${S}/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
    sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#  find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutomoc/CMakeLists.txt
    sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUIRED)/g' ${S}/Tests/Qt4And5Automoc/CMakeLists.txt
    sed -i 's/^  find_package(Qt5Widgets QUIET NO_MODULE)/#  find_package(Qt5Widgets QUIET NO_MODULE)/g' ${S}/Tests/CMakeLists.txt
    sed -i 's/^find_package(Qt5Widgets QUIET)/#find_package(Qt5Widgets QUIET)/g' ${S}/Source/QtDialog/CMakeLists.txt
	./configure --prefix=${prefix}
' to '	./configure --prefix=${prefix}
'

so basically the bbappend in meta-qt5 means that everything using
cmake-native will get rebuilt unless you either include or exclude the
layer everywhere :(

Can we try and find a better way to work around whatever that bbappend
is trying to fix please?

Cheers,

Richard


