Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E447EC636CC
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 17:56:56 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.911.1675187816022024568
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 09:56:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DF+8pAnd;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-15ff0a1f735so20382156fac.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 09:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gt4NrZYoaUiSUUrIP3MUL69xc1qqkCSIhFGZsAkpq9U=;
        b=DF+8pAndd6lbsMhW94AV4q8tGs4r21QSugCM2UfvTAYawEW9s7XjvQX1Zot44OpWR1
         uhLOWDwKBKJQqX74evrfYdQTxH8ckXa/tf3q/5BMFfdorOkCye+1SnSxjgRKSMYq13Fx
         PJTjHgc8Q9mnFklk4dJK+Vtgj8vFjff/X6Kg/m06+a+AqRkazfCPG1sPgeUZ2W0HAY8y
         ps9gTQuS81ESkoFEQWh/1ODr9We6UwM9A6OtDXFB+BEw+ejsna6msVoHI8NV45bv9slf
         Zq/8QhPDHxc4YdLPA0TtvEmJCpn5+x65V9cebIk28xlCCPIpyXeOfzr5YYOTZJ03Mdo6
         7myA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gt4NrZYoaUiSUUrIP3MUL69xc1qqkCSIhFGZsAkpq9U=;
        b=Qe8VqQQIyu0wCuwtWI6wztoOCg1xSSO9tkJsQ8+49Wqso2+znV/m9xq8w52SXRf9CQ
         GuBPqYstuZoWBn1T+Yt5gmaB55HInohpr03cQC9P3GS35f7n4CZKti42GIGgP3/Fdqt5
         WW8+h+arMJ99QPKdqlOc7n07nNXqDFVyCln2S8tImBJ8qocl7WN+eWLfWTv4+oh9H9FA
         W/zcgUYNHA5HELzTxKMYf/OqYBLYRQOGBkHws3/DMbQyyLAj04r5/fF97k/TuLjjA82i
         TrhwCBp6SzqBoKyBSpXuQZzlSOExdIGo8cM8ltuwOiIFqaIRGySNkcABODut1v24Bazf
         9oUQ==
X-Gm-Message-State: AO0yUKWvzVM4f+AxZxKFaMAexuSh0OHH7pz00N36GcIqIwRSbFLzD/jg
	/Vh33hRYxekvSfazfLvDb6EsKzo9T1bgYWRt/7M=
X-Google-Smtp-Source: AK7set/1KjFn2yD4wpMr+ZhSP5EzNgvglLhDEbL5p1B52IIswsYHe1FbQh+fuuP5VqJYf4xzaW5o5FWo7fyXwMtDOeQ=
X-Received: by 2002:a05:6870:a686:b0:163:d288:863 with SMTP id
 i6-20020a056870a68600b00163d2880863mr501650oam.55.1675187815111; Tue, 31 Jan
 2023 09:56:55 -0800 (PST)
MIME-Version: 1.0
References: <20230131170848.367522-1-f_l_k@t-online.de> <20230131170848.367522-2-f_l_k@t-online.de>
In-Reply-To: <20230131170848.367522-2-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Jan 2023 09:56:29 -0800
Message-ID: <CAMKF1soE_5+D+cg0zZRLUnB2fNqQaPu7mH4G_WYgdu4izGxN2g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] system-config-printer: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 17:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100883

On Tue, Jan 31, 2023 at 9:09 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> The OpenPrinting gui for cups configuration
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../system-config-printer_1.5.18.bb           | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
>
> diff --git a/meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb b/meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
> new file mode 100644
> index 000000000..57b238929
> --- /dev/null
> +++ b/meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
> @@ -0,0 +1,36 @@
> +DESCRIPTION = "a graphical user interface that allows the user to change print settings"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "git://github.com/OpenPrinting/system-config-printer.git;protocol=https;branch=master"
> +
> +SRCREV = "895d3dec50c93bfd4f142bac9bfcc13051bf84cb"
> +S = "${WORKDIR}/git"
> +
> +inherit autotools gettext pkgconfig python3native features_check
> +
> +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> +
> +DEPENDS = "cups glib-2.0 libusb systemd xmlto-native intltool-native desktop-file-utils-native"
> +
> +do_configure:prepend() {
> +    # This file is not provided if fetching from git but required for configure
> +    touch ${S}/ChangeLog
> +}
> +
> +FILES:${PN} += "${libdir} ${datadir}"
> +
> +RDEPENDS:${PN} = " \
> +    dbus-x11 \
> +    gtk+3 \
> +    libnotify \
> +    python3 \
> +    python3-dbus \
> +    python3-firewall \
> +    python3-pycups \
> +    python3-pycurl \
> +    python3-pygobject \
> +"
> +
> +# ignore 'requires /usr/bin/python3, but no providers found in RDEPENDS:system-config-printer? [file-rdeps]'

maybe change this to

#!/usr/bin/env python3

> +INSANE_SKIP:${PN} = "file-rdeps"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100882): https://lists.openembedded.org/g/openembedded-devel/message/100882
> Mute This Topic: https://lists.openembedded.org/mt/96656636/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

