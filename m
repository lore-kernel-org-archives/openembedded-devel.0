Return-Path: <denis@denix.org>
X-Greylist: delayed 470 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 Apr 2019 20:47:47 UTC
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4166D147
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 20:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0183640BD1;
	Mon, 22 Apr 2019 20:39:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1aeRUioNRr60; Mon, 22 Apr 2019 20:39:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D65A640BC1;
	Mon, 22 Apr 2019 20:39:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 970BB16E4FF; Mon, 22 Apr 2019 16:39:56 -0400 (EDT)
Date: Mon, 22 Apr 2019 16:39:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
Message-ID: <20190422203956.GY2112@denix.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: [meta-qt5] Re: qtwayland: improve manual header installation
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
X-List-Received-Date: Mon, 22 Apr 2019 20:47:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Updated meta-qt5 in Thud with this new commit:
https://github.com/meta-qt5/meta-qt5/commit/600fefbde15eea52fbc438bbe5e9757f5e735baa

Distro features are -x11 +wayland +opengl

Got the following breakage:

| Manual install: qwayland-wayland.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-wayland.h
| Manual install: wayland-qtkey-extension-client-protocol.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-qtkey-extension-client-protocol.h
| Manual install: wayland-hardware-integration-client-protocol.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-hardware-integration-client-protocol.h
| Manual install: qwayland-touch-extension.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-touch-extension.h
| Manual install: qwayland-text-input-unstable-v2.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-text-input-unstable-v2.h
| Manual install: qwayland-qt-windowmanager.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-qt-windowmanager.h
| Manual install: qwayland-xdg-shell-unstable-v6.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-xdg-shell-unstable-v6.h
| Manual install: wayland-server-buffer-extension-client-protocol.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-server-buffer-extension-client-protocol.h
| Manual install: wayland-xdg-shell-unstable-v6-client-protocol.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-xdg-shell-unstable-v6-client-protocol.h
| Manual install: qwayland-xdg-shell.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-xdg-shell.h
| Manual install: qwayland-qtkey-extension.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-qtkey-extension.h
| Manual install: wayland-xdg-shell-client-protocol.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-xdg-shell-client-protocol.h
| Manual install: wayland-surface-extension-client-protocol.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-surface-extension-client-protocol.h
| Manual install: qwayland-surface-extension.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-surface-extension.h
| Manual install: wayland-touch-extension-client-protocol.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-touch-extension-client-protocol.h
| Manual install: wayland-qt-windowmanager-client-protocol.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-qt-windowmanager-client-protocol.h
| Manual install: wayland-text-input-unstable-v2-client-protocol.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-text-input-unstable-v2-client-protocol.h
| Manual install: qwayland-server-buffer-extension.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-server-buffer-extension.h
| Manual install: wayland-wayland-client-protocol.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-wayland-client-protocol.h
| Manual install: qwayland-hardware-integration.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-hardware-integration.h
| Manual install: qwayland-server-server-buffer-extension.h to .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtCompositor/5.11.3/QtCompositor/private/qwayland-server-server-buffer-extension.h
| install: cannot create regular file '.../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtCompositor/5.11.3/QtCompositor/private/qwayland-server-server-buffer-extension.h': No such file or directory

Looks like ${D}${includedir}/QtCompositor/${SHRT_VER}/QtCompositor/private/ 
doesn't exist before trying to install files there.

-- 
Denys

