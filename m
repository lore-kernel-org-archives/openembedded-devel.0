Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.27347.1585180978733727354
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 17:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1834040B37
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2020 00:02:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dDx46etuj2_T
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2020 00:02:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0026640AEE
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2020 00:02:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5FE731718F4; Wed, 25 Mar 2020 20:02:57 -0400 (EDT)
Date: Wed, 25 Mar 2020 20:02:57 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-qt5] qtwebkit 5.15 update failure
Message-ID: <20200326000257.GF1578@denix.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

| Source/WebKit/WebKitWidgets_autogen/J52LRV53MS/moc_DefaultFullScreenVideoHandler.cpp:116: error: undefined reference to 'QWebFullScreenVideoHandler::qt_metacast(char const*)'
| Source/WebKit/WebKitWidgets_autogen/J52LRV53MS/moc_DefaultFullScreenVideoHandler.cpp:121: error: undefined reference to 'QWebFullScreenVideoHandler::qt_metacall(QMetaObject::Call, int, void**)'
| Source/WebKit/CMakeFiles/WebKitWidgets.dir/WebKitWidgets_autogen/mocs_compilation.cpp.o:mocs_compilation.cpp:WebKit::DefaultFullScreenVideoHandler::staticMetaObject: error: undefined reference to 'QWebFullScreenVideoHandler::staticMetaObject'
| /usr/src/debug/qtwebkit/5.14.99+gitAUTOINC+ab1bd15209-r0.arago8/git/Source/WebKit/qt/WidgetSupport/DefaultFullScreenVideoHandler.cpp:45: error: undefined reference to 'vtable for QWebFullScreenVideoHandler'

FWIW, it was building just fine before the update...

-- 
Denys
