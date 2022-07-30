Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CB9C19F2A
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 20:32:16 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.6889.1659213133531860565
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jul 2022 13:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nTczqVn+;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: festevam@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id d7so3534497pgc.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jul 2022 13:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mdeB4maLIdvtbrK3g7QTfsNYr3F0Mu8AXnpDydkDikw=;
        b=nTczqVn++SLa+exELOrRgr4TsGpkjrhIq/jimzLGic+LyPQ/gGDXo4X+1Ivpxmv+oY
         jGNxaIC/wCICHKa7Yf1LtWp8rK6R6CNNDcZPI5hKBYE+UFGbeX0rmUUkeVuKlJ/PGlrD
         0ZGtdnefInuwzoB8Enbvpo4I4l8O4hQPHAq9RdtB4NfOygNnEORo3lkaI881YQwBBYvD
         Or5oaJ4uymG4Q8RPdbyooyglR4QbHGrJfwVx55GJRs+eyHU4R2Zcu+Ka4cphlEmoaiBQ
         2GQpRZLM7G1zaTC3UIEwQgNYIEcHZKPbdE+BpW08nyvrZLN5v4u5nMehHeB1vZwLceFQ
         +OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mdeB4maLIdvtbrK3g7QTfsNYr3F0Mu8AXnpDydkDikw=;
        b=44Yk9dKpamI/kC1CXzYUGrySNCyT33NVEek+uoKsA1+RUvUnipoHQ0xVH0dZWLyRps
         rtWih91H8rNW6RIV4Kcx/PrfLcOAcE+s38F5w2cPzvWXbwLn/GaMOA37F2DZRHmVsEvq
         nQEWxtG6XTJrUat2zALBNJoxdYYZ6ZlcnnF6Tc7hElu2ZAqUiwzU10VAN+iPfeAe3aER
         fR8fTKP/1fqnUmOAmPWrXOT5qBOpoT6thJWx4SWA/dbc/+BbFkbIIqi7HwxgOQm6fJNK
         Gv1WaphLdvYqfu3UVJUY9lFyq/oyStxx2qB/UPhQXj53LY4gBF7jGP1Tkh6a4DpvKAUN
         HIQQ==
X-Gm-Message-State: AJIora9kTA75PCXK/zFJeQicNuqrOx/uciWrHsSEEPPkSk0oTsLlt/D5
	vrpK4yvCGBWgOFY9SUPWV/KeCdRAvLqWAO5Cfro=
X-Google-Smtp-Source: 
 AGRyM1sccSkZmebb60TvuwaHGW6epppiIKYnjcbHLnBGhjJD2nyA0+s5UrM8q0hHwkjEAF0EEdojVM9oXQ7NHHTG834=
X-Received: by 2002:a05:6a00:450d:b0:52b:84ca:9509 with SMTP id
 cw13-20020a056a00450d00b0052b84ca9509mr9229589pfb.74.1659213132707; Sat, 30
 Jul 2022 13:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220730152545.294982-1-f_l_k@t-online.de>
 <CAMKF1spWqX_q_LNzhA2f5vgVLHBHjLN4p_YkFoXn=5aWVkW8Qw@mail.gmail.com>
 <9FNUFR.YL5HBRQXU9PH1@t-online.de>
In-Reply-To: <9FNUFR.YL5HBRQXU9PH1@t-online.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 30 Jul 2022 17:31:59 -0300
Message-ID: 
 <CAOMZO5AE7AHFO5V6841gqzjw+cNA_YgOJvTAcU7kW6_GE0bd7A@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] ibus.inc: fix after branch renaming
To: Markus Volk <f_l_k@t-online.de>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Jul 2022 20:32:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98062

On Sat, Jul 30, 2022 at 4:57 PM Markus Volk <f_l_k@t-online.de> wrote:

> I'll test this tomorrow. But on the ibus github page there is no master branch anymore, so i doubt -c cleanall will help
>
> https://github.com/ibus/ibus

Does the change below fix it?

--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -10,7 +10,7 @@ PV = "1.5.26"
 DEPENDS = "unicode-ucd"

 SRC_URI = " \
-    git://github.com/ibus/ibus.git;branch=master;protocol=https \
+    git://github.com/ibus/ibus.git;branch=main;protocol=https \
     file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch \
 "
 SRCREV = "6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3"

