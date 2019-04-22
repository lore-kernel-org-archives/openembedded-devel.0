Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0365B60017
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 21:26:43 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id j9so17307973wrn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 14:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RUPLlsqQs/86jeCqR2x25cQVVW3EhVuhzosMQhbwdXw=;
	b=AoNGdRtv5k5ObhqG/s5mJOpATeXNCq5x04tDYWQcD95G1QvNkX5mIQrSz7rvZgJhgk
	cYvsyTNjY1TGwwI8arD7XBdKtOd8MFc7B7RJTxvwhY9IljnxepfRseNbsZSce30f2eXj
	jfMKyMt0wav12FivEhZ2en0snVA39rTLxR6tORZdoDo/QfND2/vNMeKqNkOdZsc+Jcs4
	ruLOZ8m1qMI7/E+9x4wrWJXjT/6yBvwFW19qfKUi3d/BPsYDErdDGVE6n6xw7fElMBL3
	FGVcm9a3Q/ur07iITKm/zSrupyBvM5zy/Mt9lK2d+IKKL2ejIA/o4FSbCrACf53sCnxX
	qC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RUPLlsqQs/86jeCqR2x25cQVVW3EhVuhzosMQhbwdXw=;
	b=FWMgiN5YioiK2GdVmpbekJLuFKucOI0R+avDLOItQ0QapSQeTX+wUaxq2NZrEhJMcM
	xAAhVh6G4svy+IrPWfNOWKcUIDJTRRt7mNLNHj0ZloVNxtQ1AXxPHSiH1I8blcLFGcdn
	1Sm7oy/fY5VODw1vLIKlxLisLKr86CXVpnW3V62l58hd+YjFK5mRtU784cxCGcg03kHX
	EQxOugyXkqv/z3lrBgBSfUEQKO9VvWbX1ZE+bXkOd9NlT4BtBQJDkg2wHjZXF/dJ5KQV
	IFC0/KWM7GNz42RDcx+RXHO/AHG///7V5PEEn9QbuvqIFVsTXJ+81bWKlD5shhqb2mmF
	j3Ng==
X-Gm-Message-State: APjAAAUoM0b6DG4WoGBW0a7wwBJa3U5gXekeFh1dECApQ6/U2/P65YGr
	pFRHcITAhZvT3V0xqOu0yVpUNWh9vxTnOhY53PbHGA==
X-Google-Smtp-Source: APXvYqzaIXvvMFeYhUmoNIwmlBbYHf/S1tic1AfXE7c81l7Mxkl06aGZhRFJ8rIpOJ9kMFRTtnLs7hKOfZMKPQ5wvlc=
X-Received: by 2002:adf:ef49:: with SMTP id c9mr14909326wrp.321.1555968403696; 
	Mon, 22 Apr 2019 14:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190422203956.GY2112@denix.org>
In-Reply-To: <20190422203956.GY2112@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 22 Apr 2019 23:26:32 +0200
Message-ID: <CA+chaQetp3rE=vPK9VGBvQYUytwWi3Wz0juVFUptDtsnzDU8xQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] Re: qtwayland: improve manual header installation
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
X-List-Received-Date: Mon, 22 Apr 2019 21:26:44 -0000
Content-Type: text/plain; charset="UTF-8"

Cherry-pick the last commit from warrior, will merge it to thud as well
tomorrow.

On Mon, Apr 22, 2019 at 10:39 PM Denys Dmytriyenko <denis@denix.org> wrote:

> Updated meta-qt5 in Thud with this new commit:
>
> https://github.com/meta-qt5/meta-qt5/commit/600fefbde15eea52fbc438bbe5e9757f5e735baa
>
> Distro features are -x11 +wayland +opengl
>
> Got the following breakage:
>
> | Manual install: qwayland-wayland.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-wayland.h
> | Manual install: wayland-qtkey-extension-client-protocol.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-qtkey-extension-client-protocol.h
> | Manual install: wayland-hardware-integration-client-protocol.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-hardware-integration-client-protocol.h
> | Manual install: qwayland-touch-extension.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-touch-extension.h
> | Manual install: qwayland-text-input-unstable-v2.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-text-input-unstable-v2.h
> | Manual install: qwayland-qt-windowmanager.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-qt-windowmanager.h
> | Manual install: qwayland-xdg-shell-unstable-v6.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-xdg-shell-unstable-v6.h
> | Manual install: wayland-server-buffer-extension-client-protocol.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-server-buffer-extension-client-protocol.h
> | Manual install: wayland-xdg-shell-unstable-v6-client-protocol.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-xdg-shell-unstable-v6-client-protocol.h
> | Manual install: qwayland-xdg-shell.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-xdg-shell.h
> | Manual install: qwayland-qtkey-extension.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-qtkey-extension.h
> | Manual install: wayland-xdg-shell-client-protocol.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-xdg-shell-client-protocol.h
> | Manual install: wayland-surface-extension-client-protocol.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-surface-extension-client-protocol.h
> | Manual install: qwayland-surface-extension.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-surface-extension.h
> | Manual install: wayland-touch-extension-client-protocol.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-touch-extension-client-protocol.h
> | Manual install: wayland-qt-windowmanager-client-protocol.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-qt-windowmanager-client-protocol.h
> | Manual install: wayland-text-input-unstable-v2-client-protocol.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-text-input-unstable-v2-client-protocol.h
> | Manual install: qwayland-server-buffer-extension.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-server-buffer-extension.h
> | Manual install: wayland-wayland-client-protocol.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/wayland-wayland-client-protocol.h
> | Manual install: qwayland-hardware-integration.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtWaylandClient/5.11.3/QtWaylandClient/private/qwayland-hardware-integration.h
> | Manual install: qwayland-server-server-buffer-extension.h to
> .../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtCompositor/5.11.3/QtCompositor/private/qwayland-server-server-buffer-extension.h
> | install: cannot create regular file
> '.../work/armv7at2hf-neon-linux-gnueabi/qtwayland/5.11.3+gitAUTOINC+9ce3088d22-r0/image/usr/include/QtCompositor/5.11.3/QtCompositor/private/qwayland-server-server-buffer-extension.h':
> No such file or directory
>
> Looks like
> ${D}${includedir}/QtCompositor/${SHRT_VER}/QtCompositor/private/
> doesn't exist before trying to install files there.
>
> --
> Denys
>

