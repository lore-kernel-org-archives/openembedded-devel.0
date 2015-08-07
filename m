Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6EF2376794
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 14:01:52 +0000 (UTC)
Received: by iodb91 with SMTP id b91so52474003iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Aug 2015 07:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=ud1qkF5p30VRIYtbeq8EyTd1nK9j8mSAWFIYnjZyXaY=;
	b=ZKIVMmrz3pgCYwSUl0FtJ9OLJGnXnCEHzYl+ozOwRVBC0N9HoR8lYozrLAfikG+EeZ
	qj0HPclGMt2uQ0gt5dtQbC5ScqoLgb8GRxEiblXghum6K8EhHlPwWgFRhCu7KSBFYz4s
	NoHe24QP7ANEi3o8UicfPUWAKPNfeo5B49YUn5VbpW7yVntrF5BuWUe3F+ibZ12+vv7i
	ZjRtyw0Hjb5nsFZiZN/kmvh3X0v5Yp+pkylaz7/3vEhRtQDPYryS8oljm0c5tAWAVcqs
	xMXe/s2qezvqJLCyegu33EJF4GGY3DnGx4zjq+CPjB8qJV6WVYOGfm6IMShAKi0RnyBO
	NKYQ==
X-Gm-Message-State: ALoCoQlKvM/Vt+mRrOdZnKi+EQFKIjskTh4Cy8PCuJgJKEUhC/B6fI/aygQIhswNLWk0C3twYNIt
X-Received: by 10.107.34.147 with SMTP id i141mr7581732ioi.59.1438956111709;
	Fri, 07 Aug 2015 07:01:51 -0700 (PDT)
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com.
	[209.85.223.181]) by smtp.gmail.com with ESMTPSA id
	q187sm6870995ioe.37.2015.08.07.07.01.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Aug 2015 07:01:50 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodd187 with SMTP id d187so112419153iod.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Aug 2015 07:01:50 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.137.218 with SMTP id t87mr7545384ioi.37.1438956110577;
	Fri, 07 Aug 2015 07:01:50 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 7 Aug 2015 07:01:50 -0700 (PDT)
In-Reply-To: <1438950796-21610-1-git-send-email-marek.belisko@gmail.com>
References: <1438950796-21610-1-git-send-email-marek.belisko@gmail.com>
Date: Fri, 7 Aug 2015 11:01:50 -0300
Message-ID: <CAP9ODKqpjPVqpdM1Tc2vNFqnUXY1Ry=JNCMbJYQeEKaVyzEkZA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH] qt5.inc: Fix packaging of qtquickcontrols
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
X-List-Received-Date: Fri, 07 Aug 2015 14:01:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 7, 2015 at 9:33 AM, Marek Belisko <marek.belisko@gmail.com> wrote:
> Fixes following:
> ERROR: QA Issue: qtquickcontrols: Files/directories were installed but not shipped
>   /usr/lib/qt5/qml/QtQuick/Controls/Styles/Flat/.debug
>   /usr/lib/qt5/qml/QtQuick/Controls/Styles/Flat/.debug/libqtquickextrasflatplugin.so
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/qtquickextras.metainfo
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/gauge-icon.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/statusindicator-icon16.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/dial-icon.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/statusindicator-icon.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/delaybutton-icon16.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/piemenu-icon.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/piemenu-icon16.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/togglebutton-icon16.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/circulargauge-icon16.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/picture-icon.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/picture-icon16.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/togglebutton-icon.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/delaybutton-icon.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/dial-icon16.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/tumbler-icon16.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/gauge-icon16.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/circulargauge-icon.png
>   /usr/lib/qt5/qml/QtQuick/Extras/designer/images/tumbler-icon.png
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
>
> Signed-off-by: Marek Belisko <marek.belisko@gmail.com>

It seems alright.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

