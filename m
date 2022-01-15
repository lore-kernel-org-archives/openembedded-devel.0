Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FEBC433EF
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 14:27:59 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.7643.1642256878806053154
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MeDhqqqq;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso16909760pjg.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=il8VWTvloA8FZUiyXDNdkvkmGPZYIEGNbF+kPczLHZM=;
        b=MeDhqqqqqAYZIJSxGBADGi8Dy643h+//xB3LVdGi4uXDdJypJiFlfNJDlm/1d2YGb9
         g4emwQUUntvkPt7G/sy57wY6lS5kAlZw4FHQuEtUvW326H9/SlQH7Py9UxW2YT4nKQnv
         1W1U4FW9ktKZsvdTvvC8CbcXSZcV+KZ98FXQq/qcG21Y2f4TCcv6cKJ2dwsu6rsBmMCB
         ObC21YV9RVCei9/xIcOw+3YSKFsD/x1SKy/Erf3Bmw1HuHiuOp9XbbxgrruPdyLpK3fT
         AvGzMX6+8VvX9Nb3WKDzyXtBnpaXjQGOiRUHV27eWELJVm7r6IT4+VR5fc9nFnmsR+fg
         RXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=il8VWTvloA8FZUiyXDNdkvkmGPZYIEGNbF+kPczLHZM=;
        b=02AwA2UvNy5WLr3zCcp+rB44NjZUrzTjr6wIxHErsMNTUiOdXUk+3l0dAXAYI1B+AN
         /iqr1l3XAeJc539tdceLFs99YdbIyduwOIwVyEciHWPLargzjsf+BPWHTgkVichx7nI+
         jkNZVNnK3l2DPnhrJOH2XbyDhMd8oihwKvehfrzi8+9w3x820qf9K2eBTY4YMXmdjrNL
         2GfwrvtTLQz8dLbLl1+u5DBsvWkfMTycqy+Pn5z3RxNM4I66NUJHVXqwARwlsOu85F7O
         CGIPZixmKHW89x8NYz2XFHQ9tw7G8myYiS0JvPavSB7cu8ORum1930WbJrYYy+kRyL5L
         x+nA==
X-Gm-Message-State: AOAM530/6tDZ3eDCk63xGdZsQhFNf8WeCrnvkCJRXEVs936hrx+gOPzv
	6aHZDHtj544xyMMFavTRm4ikC0QMCKSm6A==
X-Google-Smtp-Source: 
 ABdhPJx3yvybbI5BuGxJsfi2I3Z2+IrEnAZZNX9E3KzUJzxsO4E/Y5KHzBVtNDqazYLuQFWeXf6fVw==
X-Received: by 2002:a17:902:d883:b0:14a:4ba5:6e72 with SMTP id
 b3-20020a170902d88300b0014a4ba56e72mr14368651plz.27.1642256878205;
        Sat, 15 Jan 2022 06:27:58 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:7ab9:6507:6566:58c8])
        by smtp.gmail.com with ESMTPSA id
 k20sm8606779pfk.111.2022.01.15.06.27.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 06:27:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 01/11] syslog-ng: adjust control socket location
Date: Sat, 15 Jan 2022 06:27:44 -0800
Message-Id: 
 <bc906a49dcc070c219587e6cf98caf2ea2219043.1642256649.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642256648.git.akuster808@gmail.com>
References: <cover.1642256648.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 14:27:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94860

From: Changqing Li <changqing.li@windriver.com>

Commit [1] changed the pidfile dir to /var/run/syslog-ng. This also changed
the location where the control socket is searched for, causing the following
error with systemd:

root@qemux86-64:~# syslog-ng-ctl config
Error connecting control socket, socket='/var/run/syslog-ng/syslog-ng.ctl',
error='No such file or directory'

Update the systemd service file to point to the new location.

[1] 00d1d63e4f7f ("syslog-ng: provide correct PID directory location to
                   restart/stop syslog-ng daemon")

(master rev: b57d824fdf822a4c3fdb153b92063f88705e3a6b)

Signed-off-by: lmorales <luisalejandro.moralespena@windriver.com>
Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/syslog-ng.service-the-syslog-ng-service.patch         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
index 0e1d09492b..7334800304 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
@@ -38,7 +38,7 @@ index 0ccc2b9..7f08c0e 100644
 -CONTROL_FILE=/var/run/syslog-ng.ctl
 -PID_FILE=/var/run/syslog-ng.pid
 +PERSIST_FILE=@LOCALSTATEDIR@/lib/syslog-ng/syslog-ng.persist
-+CONTROL_FILE=@LOCALSTATEDIR@/lib/syslog-ng/syslog-ng.ctl
++CONTROL_FILE=@LOCALSTATEDIR@/run/syslog-ng/syslog-ng.ctl
 +PID_FILE=@LOCALSTATEDIR@/run/syslog-ng.pid
  OTHER_OPTIONS="--enable-core"
 -- 
-- 
2.25.1


