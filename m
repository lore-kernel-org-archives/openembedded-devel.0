Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 94A8C60089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 19:34:01 +0000 (UTC)
Received: by iejt8 with SMTP id t8so11397313iej.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2015 12:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=ASgrOX3Q+Fd3PC/hWbbb7bvK49Ml9wAwwGZIZ+QUnQg=;
	b=BQlY/CqC7B+ewWLgbnM/8NbaSPXM9zSZCwFB6YqOlWcscvTm+VpJedGoicI2yId24R
	MgaV9NRQdZa95ibaQhmRtiYZ4JidnXocRhZ/wb+UDqmVTxF0SbG/8xtu/tQJp1u2NWmK
	Yu9IXV429NSuWCNN/W1Mn4Wxu1MiylCKhM2Av89RNHf7eeZiWb3ci/6J9LNGrJh+YL1y
	7mgQlK6IdJ+0HGsFbO8W5QEFPs4p6ij8FeCQNMpdUGT3PaxEdGBet3n8O36D3fZ2gyHt
	6S+aVA1BUOWYoHD9qM51/2EfLR7V2DeIncT4zsdumWRuu7tnNgchM4NuRQS5exYh544X
	ARbg==
MIME-Version: 1.0
X-Received: by 10.107.130.165 with SMTP id m37mr38052417ioi.62.1428521642147; 
	Wed, 08 Apr 2015 12:34:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Wed, 8 Apr 2015 12:34:02 -0700 (PDT)
In-Reply-To: <1428517786-17717-1-git-send-email-neena.busireddy@freescale.com>
References: <1428517786-17717-1-git-send-email-neena.busireddy@freescale.com>
Date: Wed, 8 Apr 2015 16:34:02 -0300
X-Google-Sender-Auth: a36k9L0gySA25SRxqf_XbuCHMrY
Message-ID: <CAP9ODKo-Tj103XpkUVTrodpgkXdHDXOA4+ZZHtx3jQyv2a+xUg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Neena Busireddy <neena.busireddy@freescale.com>
Subject: Re: [meta-qt5][PATCH] qt5nmapper: Fix compatibility issue
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
X-List-Received-Date: Wed, 08 Apr 2015 19:34:03 -0000
Content-Type: text/plain; charset=UTF-8

Hello Neena,

On Wed, Apr 8, 2015 at 3:29 PM, Neena Busireddy
<neena.busireddy@freescale.com> wrote:
> qt5nmapper app fails to run with the following error:
>
> file:///usr/share/qt5nmapper-1.0/Qt5_NMapper.qml:34:5: Type Panel unavailable
>          Panel {
>          ^
> file:///usr/share/qt5nmapper-1.0/content/Panel.qml:118:9: Type Switch unavailable
>              Switch {
>              ^
> file:///usr/share/qt5nmapper-1.0/content/Switch.qml:8:21: Cannot assign a value to a signal (expecting a script to be run)
>          property string onText: "On"
>
> This patch changes the string from onText to onTextstring which was
> introduced with Qt 5.3
>
> Signed-off-by: Neena Busireddy <neena.busireddy@freescale.com>
...

The patch file needs to have the Upstream-Status field. I think it
would be Pending.

...
> --- a/recipes-qt/examples/qt5nmapper_1.0.bb
> +++ b/recipes-qt/examples/qt5nmapper_1.0.bb
> @@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://README;beginline=47;endline=58;md5=9fb5bf76d564bc5381
>
>  DEPENDS = "qtdeclarative qtgraphicaleffects"
>
> -SRC_URI = "http://quitcoding.com/download/Qt5_NMapper_1.0.tgz"
> +SRC_URI = "http://quitcoding.com/download/Qt5_NMapper_1.0.tgz \
> +           file://change-property-string.patch"
>  SRC_URI[md5sum] = "dafc425280144d8e286788e75a0dba0f"
>  SRC_URI[sha256sum] = "607fbf4c448f00d3c563f9ef8a582bcb6e8fe550e80b56bf8d9127a417faa53b"

Other than the .patch missing field, it is fine.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

