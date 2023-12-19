Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FC7C46CD2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:25 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.6822.1702967244183256133
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OmmnL7Rz;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d3ce28ace2so9997115ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967243; x=1703572043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8Lbw5ZXFZDc8o+z+R+Ti7RINMCN5801ZT9GzxSDTNI=;
        b=OmmnL7RzN2eqlNOr1BEnpsGJX0GUdugh8d8HgTwCy+7tjTB5/PqDkV7rohTX1uC4vY
         4jzPxDnUOmoVG3WyO2eQDEbohQLs3jdlRtnBA9ykwgAMm2Bl6k/1DXDVtSO7nu0S+6dL
         AOo6ZGWEfQndzgIiQW8R9lpb9PixjfwrEpBF08GWpU/qVqXMwbOYa6fprBIBMXTI1oVc
         srd8pr4SkSq2DJhc6EcbFKkvFyX9PrhyJ54sT3tHNJ/pHRlDxx1F8pTmbG5PziN1vVCr
         0TJjQpxAyAHSYpWqCqG9cR3ntqwzkOT5IwkkAh418mm1ke2k8JfCYTdBDYr0rdkhU+Ci
         BpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967243; x=1703572043;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8Lbw5ZXFZDc8o+z+R+Ti7RINMCN5801ZT9GzxSDTNI=;
        b=dxBmQ/xv4ZU5r4Pv2c4ihvkc6HlZWOZk4TYZUFal148+DsyLagXUN/oQAoNc+LQhBH
         eL7sVVu57mZiMZIug5rJ9J59nRXz0eoanEv5fNvZOws9tlGjnJFIin8Myy8AR9lipcRe
         4N3E2OZC6C25lyMTcsRDrl4+uYWt7OgsMhLhYSsvEhfpmYCJLNbSuw2UhKcm1cLDTCLl
         +XnFv3TkOKQQWXOss7IdtmuNSaxC0BxJFRJVONjAXpOcjzRznBghM20r2h2Uth4R2Rlh
         wr1NPnqcN6fz3q/0TTWVJzja+mUmJeXnvQ+AvBK+nqrkAkQbjtb571r34UAA5RIjOv8s
         KQAA==
X-Gm-Message-State: AOJu0YybYcszDAu3J9z3PbCgFEn6rRA5l32yfExqs1Wuu2IBIeu9YebW
	c31XMonmtx4sNOXDcpmBcfI=
X-Google-Smtp-Source: AGHT+IGdSgnq+0Y0+YFBW1V15qz4ir8SZOKgKsChQNrY9reP+JIkvMHfEYtHi7XwJOSTxBUfL1fvuQ==
X-Received: by 2002:a17:902:db01:b0:1d3:44ad:215b with SMTP id m1-20020a170902db0100b001d344ad215bmr13043648plx.92.1702967243537;
        Mon, 18 Dec 2023 22:27:23 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702543900-27748-1-git-send-email-wangmy@fujitsu.com>
References: <1702543900-27748-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-flask-restx: upgrade 1.2.0
 -> 1.3.0
Message-Id: <170296724276.1627685.12107434268634866619.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:22 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107581


On Thu, 14 Dec 2023 16:51:40 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> * Fixing werkzeug 3 deprecated version import. Import is replaced by new style version check with importlib
> * Fixing flask 3.0+ compatibility of 'ModuleNotFoundError: No module named 'flask.scaffold'' Import error.
> * Fix wrong status code and message on responses when handling 'HTTPExceptions'
> * Add flask 2 and flask 3 to testing matrix.
> * Update internally pinned pytest-flask to 1.3.0 for Flask >=3.0.0 support.
> * Python 3.12 support.
> * Fix wrong status code and message on responses when handling HTTPExceptions.
> * Update changelog Flask version table.
> * Remove temporary package version restrictions for flask < 3.0.0, werkzeug and jsonschema
> 
> [...]

Applied, thanks!

[1/1] python3-flask-restx: upgrade 1.2.0 -> 1.3.0
      commit: eaa7d950ed3bd848bc65ca57d92ae073f679b22d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


