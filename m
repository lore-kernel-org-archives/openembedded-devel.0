Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.1864.1602692061424481287
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 09:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dresearch-fe-de.20150623.gappssmtp.com header.s=20150623 header.b=DrzycaNr;
 spf=pass (domain: dresearch-fe.de, ip: 209.85.221.66, mailfrom: schuknecht@dresearch-fe.de)
Received: by mail-wr1-f66.google.com with SMTP id g12so4547450wrp.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 09:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=2f1S00vLievTfvJttsaVqHKXbYEj4juRHJfYzfbJSeI=;
        b=DrzycaNr7MnPzCZ32zir1OjUkeOxk1TkDyv2jt6yzVg7y1zbYo9bta/HV2RL6e+ZbJ
         mgyTJtlnAvFnTKKjd/ytctBLpnJvnQX6rzsmYWzOlJBxJt5gikXCAAJGc5m6WThk/TTu
         D6u7ccTBZK8MkoFaMkXwlZ/RUXe33UFnTR7XOZMaCJ5asW6mAwdnNn3v5EKsoGp7+0sY
         IZAruuSP8mrDPTRiU3w4dS6cPpK604isBrn30mxlC+bKJSlbkFtCo3+RJssMF0WH7tMV
         6NE0rweCIczM60wNLnGDEjXFcUh0cT9vRrPu/mZyXpH/U9+Bbvrtcw8WeH8JUBZ+M33D
         ZlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=2f1S00vLievTfvJttsaVqHKXbYEj4juRHJfYzfbJSeI=;
        b=H7Zg4AVq3eK22FmRvoJhXx2fognsupGTrkE6A59ZoWgXis8qigRtTwL3mhRphuFGCR
         aOkpH1VcvY1dxTUq4lgaXLuD++ExRTKmsFuZM3QYrZS4uxkp6LSKH+gmug7ELdst9NJY
         KC1gGgwR81vI9g2rkrQTE8frGd8lp4XbFFFSo9JGJDJsaNPSxRavBPPLP6XiM557Mcou
         I/HrxhjrPW+qBghflgsSUcg7zpWR00zNPXyqXuAX/J5GqaVHgkLCSZcpvLch8L+kMZ27
         mTJ/zrDqDEPCvAN0h1/r/9ydHdQCpJpZcaP3bgTwDtbH2p5GTF74tZqrA1BJt+fztCnE
         XYDw==
X-Gm-Message-State: AOAM5332Eksy3bRzHPhA8t+XhAQpyAYplaEALatmkOzjcAxXW5aEMbri
	VzJEIPirN9T2r6E+qtw4mfYYPH1TUTSxq1elHtO9Y8IQf/HqNx+f
X-Google-Smtp-Source: ABdhPJyXVGPqQgd38usamn7rM4osn0BtQ5vY3DM5ISgHmyUKrXJsUZrlSTkTxeDZorSfUQkpMExzNuRfZbB28SxCKN8=
X-Received: by 2002:adf:eb04:: with SMTP id s4mr6907482wrn.81.1602692059628;
 Wed, 14 Oct 2020 09:14:19 -0700 (PDT)
MIME-Version: 1.0
From: "Mario Schuknecht" <schuknecht@dresearch-fe.de>
Date: Wed, 14 Oct 2020 18:14:08 +0200
Message-ID: <CAAwVp3u1hs6PLobTqtqkSbGpFyEqYdUa-BZbYeGce+JFO=BDdQ@mail.gmail.com>
Subject: [meta-oe][dunfell][PATCH] wireguard-tools: Fix systemd service installation
To: openembedded-devel@lists.openembedded.org
Cc: steve@sakoman.com, stefan@agner.ch, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"

Systemd configuration file wg-quick@.service is now installed in the
usual systemd path.

Signed-off-by: Mario Schuknecht <mario.schuknecht@dresearch-fe.de>
---
 .../recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
index f698b9a9a..73e049f2e 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
@@ -9,7 +9,7 @@ DEPENDS += "wireguard-module libmnl"

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
