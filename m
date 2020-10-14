Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.1672.1602691625610085515
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 09:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dresearch-fe-de.20150623.gappssmtp.com header.s=20150623 header.b=ywGG4SGG;
 spf=pass (domain: dresearch-fe.de, ip: 209.85.221.65, mailfrom: schuknecht@dresearch-fe.de)
Received: by mail-wr1-f65.google.com with SMTP id s9so4526139wro.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 09:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=y1hvs02VYTR7qANFCttsavOGq7hE/xN+YfSwNgjg8oA=;
        b=ywGG4SGGlVLtfPWtga7XltJ774tyDlfhwqAfAtFxfnOf3/c3KzkgFIQOcuSgSzGMxO
         GthmOTWgj4pu1Us3LKfFQ/iZg1dK0auvGKzfR5mJvp/JXGxwY8bBMoJcvpLh1/scrGq3
         RhjC58xnrybSK2bI/IjecgjasriM0V8fxLWXfO7ksxphfinSnCu3mGTfE0i0AY4stBY2
         y8e/Nr7geAGci2xSsbymbhR+uXi6K0FXdRcEJpdR/5c8mUtmc5Etd2d85HDqSInAOBMc
         C33eb0wyTnaL9n2cCljZKvnh2HDNwH3HolN3mrYr3EppPMoXZRDGi2TpqjW5xzQjGQkh
         msGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=y1hvs02VYTR7qANFCttsavOGq7hE/xN+YfSwNgjg8oA=;
        b=Ib7lb8mA1SHxuaqE7vry+zlUh8kXG3b2cjIZTpYcXxU7Nbuz83OKS/aLmP+JK6vi1J
         rW/ge8++mx/5xF+vWFCzK1UgPbi/ejsXeNFOlSae/IbKEAkAaTEiKjC3gs6q4jHPLvsP
         Xa+UagDy2toYQqUsRYf5jVowL41Tl94dxrP5paZv7bMVxihWb2Sut1f3heHca8OgrtlB
         5bH3da73QWgG0BtkKAQQSwlePLLRI6vJtwwRYUkf7E4e110ZA4uXxktJ/Crj8eO1WL8i
         a568gGtx3PK80T4JBxxKcrbObufSfRVYFTu2oVS1iWO5ENKbVKZuftvxr5SDGRjhogIq
         zJCA==
X-Gm-Message-State: AOAM533ScK6D8ZDXimHRNuk7IeRSK6xWSKCg2qy786NFXQYUzHNZTC3E
	D8NuOQAvKofNirSsbvTDqpKWijY4y1lap8HJfNbMYYLJK2pACHWg
X-Google-Smtp-Source: ABdhPJzJZ2tvIy7XWRd7Tbxs71ujZei8WLITp2hVo7nngoW0uPJKrF1i6aP24OUhNDPszgGsS+s/rS1Iv9BS2d2ACss=
X-Received: by 2002:adf:eb04:: with SMTP id s4mr6859021wrn.81.1602691623639;
 Wed, 14 Oct 2020 09:07:03 -0700 (PDT)
MIME-Version: 1.0
From: "Mario Schuknecht" <schuknecht@dresearch-fe.de>
Date: Wed, 14 Oct 2020 18:06:53 +0200
Message-ID: <CAAwVp3tD9OhFAiEKqYSpUxo9eGMaaUxqzYJ+-ADM+p4U+=-tJg@mail.gmail.com>
Subject: [meta-oe][PATCH] wireguard-tools: Fix systemd service installation
To: openembedded-devel@lists.openembedded.org
Cc: stefan@agner.ch, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"

Systemd configuration file wg-quick@.service is now installed in the
usual systemd path.

Signed-off-by: Mario Schuknecht <mario.schuknecht@dresearch-fe.de>
---
 .../recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
index 31b33a045..bd92c5d51 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
@@ -9,7 +9,7 @@ DEPENDS += "libmnl"

 do_install () {
     oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
-        SYSTEMDUNITDIR="${systemd_unitdir}" \
+        SYSTEMDUNITDIR="${systemd_unitdir}/system" \
         WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES',
'systemd', 'yes', '', d)} \
         WITH_BASHCOMPLETION=yes \
         WITH_WGQUICK=yes \
@@ -18,7 +18,7 @@ do_install () {

 FILES_${PN} = " \
     ${sysconfdir} \
-    ${systemd_unitdir} \
+    ${systemd_unitdir}/system \
     ${bindir} \
 "

--
2.16.4
