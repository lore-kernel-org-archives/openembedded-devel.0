Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id A6EE879826
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 07:23:05 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id c190-v6so38199663oig.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 00:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HABbLCXivr5fK5O7v0e7xp/w7gPlMWv3TAwGkxvkOJ4=;
	b=OSwHWgSnZ219aOXlw4uoKZ6iZ7qmGjG6VWC9nADKJlBbXjQO6M4nltt9ATwKvtQGcL
	YXcHs/l1R5U6o2owa0ZGXU9Oqge014w81takz+ROfUsWhyZenTS3h3zk2x44lBuzt4wT
	AwI0u0+cO9yeGGajYxYpC0wpmoiU8qHhThzWC0Z0h5MAQA9q2GXVZMnRxkPVYhRf7IYy
	rOGJTT6a5YNr5yBHjRiVBFYQuwN1FuLHgIB3dA1nZPJYRsKhe0J42n9FWmJdY4hWWvwX
	JMlqavac0zexkCMTfZvIKWdsuubnhsr+7jNWt9AxiRxbAO/0dciO0lTw79CK3foaNz19
	uZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HABbLCXivr5fK5O7v0e7xp/w7gPlMWv3TAwGkxvkOJ4=;
	b=GKGTYeng1F4Tt+HQoXE9CCpdZdhF6y2eEibc8AdrGGPuIYan7OEEVqswrqm+6lcpTj
	8QbC7QmnCU2GQx1F0TD2rc6ztIUSqlfoT9cNxZTUNvmZ1EZRsdl6RWE3Afafuq1rYJtQ
	A2KcA/gbo0D3MxmbIJ+xgHDOWOMYHWTrbzqXOZlZCbP8AMBcudM3xGc/6wxPX3EOI8jn
	W4gopaHE3B5NtuRXrtlt4ctbCi5CaUibxPhOGBQd894YfW2b6o2c1keZOAF4eV5oQjBX
	OWVhs8CljaCKTttmwt4jhwi4ZvFy9ZpbSO9cqiq9X4QMZOZk4kS+TK+eanVZlCZ8Qt4z
	GYyg==
X-Gm-Message-State: APzg51Az/QLulE4la6nVMvEbNpvglcfpsDUJypYWwa2x387oIHMxb0tM
	oaMIooih+Alo+12ncggltOSBJBQymuWZ+hLe5jI=
X-Google-Smtp-Source: ANB0VdZ8e1KrrrXT6oA6P6MVePWDhl1daZ5eguTacGU3RAGozymscZx3BCXhKIqkzGwMGhPyGfu+hKv/5n43YjYf6zk=
X-Received: by 2002:aca:e38d:: with SMTP id
	a135-v6mr21272730oih.16.1536564186708; 
	Mon, 10 Sep 2018 00:23:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:490c:0:0:0:0:0 with HTTP; Mon, 10 Sep 2018 00:23:06
	-0700 (PDT)
In-Reply-To: <20180910050629.16170-1-raj.khem@gmail.com>
References: <20180910050629.16170-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 10 Sep 2018 09:23:06 +0200
Message-ID: <CALbNGRTK2mY-88koia-Tjw9=pP9OWMLVugkwXw-tPXnPLnqt5w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH 01/10] xfce4-vala: Build for vala 0.42 to match oe-core
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
X-List-Received-Date: Mon, 10 Sep 2018 07:23:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 10, 2018 at 7:06 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
> index 388659f20b..97007bec4c 100644
> --- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
> +++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
> @@ -11,7 +11,7 @@ SRC_URI = "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/
>  SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
>  SRC_URI[sha256sum] = "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997a01b4af77260ae7b"
>
> -EXTRA_OECONF = "-with-vala-api=0.40"
> +EXTRA_OECONF = "-with-vala-api=0.42"
>
>  FILES_${PN} += "${datadir}/vala-*/vapi"
>
> --
Thanks - I should implement some self aligning solution...

Andreas

