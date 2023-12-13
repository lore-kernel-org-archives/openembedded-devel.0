Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1EFC10DCE
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:19 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.30693.1702451237908746765
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fh6n+2N2;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-590a2a963baso2767639eaf.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451237; x=1703056037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5MBTBMsv/semI4MwbRISDh+D2ECX0VJxAs+R8EZNkk=;
        b=fh6n+2N25nDozqLfmsqSkduENRH6SEk5k2p9TDbHcZOCnl7TZRC9s8iXHsA6zs6h+Z
         95rZ9bBfUDzV8zwdNANXLl3OBCkFG7lNhw70fyumk77z8cAaMiThbov+b8at6FVRcuil
         ebbey/qwEuf2YM/aiIOo4ciENC01M+YCP9a5+Wu7e/7YEYP6dW0SnPKNEMAJorMHQTm2
         /T7Ym66QMCtAu9b+zZuKcWWXJ8e0cEI3bb1lBV4Qm+ISlQGkne+SFo5uoXSZMQoJEiE9
         wDkosHvJ/1LP9TiJN69av9/+Oto9uLGcq2apW3Zdxyt4wFT196KrSxsAlX8UsHqaJn94
         QNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451237; x=1703056037;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5MBTBMsv/semI4MwbRISDh+D2ECX0VJxAs+R8EZNkk=;
        b=BwFWL0g2AL2g96n0X46qPBLTeFHDwQonoa2yAQ3jg2YzJCOm0gdu0INqeGthAvt2ca
         snvoQo1o8RwNUgZXZhkqYBXHH1PqXgBDehSvmIuE5ltzLYeXzZMzjaXUvFhHpyl7zXmH
         L6BKUK1H8N3TwSdIXIvpKo96GHZ4GfE4aTuGAX19QaBLuX/F7VE0sZ6EkT9R0lzbQFmQ
         jBk7mJoJBqp0BlJTatD5I+1qh1IIr7tNFElD5T6bKredFopULGQwYLQw5F6C2GcwO+bn
         dvLkfJNlGrb8MDNIM+K76jGrI+v4fTY8gc06SIiGtX5MeWp1P61ow6mLnsHK2ky5G6WD
         ccJA==
X-Gm-Message-State: AOJu0Yy9OyxOvqcvmUfLZubePU8q4bETQR371j031bq4+IYLk1fWSVDt
	1B6K8YV194Ie3VF4LZx6fmySOJkGhxQ=
X-Google-Smtp-Source: AGHT+IHN3YSROK4PD01PAbILCBmWyEtM/Z57qPEM+m6ZZQo+RQByF9p0WHgKGgATWawQ3Do5UVFf9g==
X-Received: by 2002:a05:6808:23c1:b0:3a7:1d15:28fe with SMTP id bq1-20020a05680823c100b003a71d1528femr10198273oib.56.1702451236901;
        Tue, 12 Dec 2023 23:07:16 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Cc: =?utf-8?q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
In-Reply-To: <20231206114941.183121-1-zboszor@gmail.com>
References: <20231206114941.183121-1-zboszor@gmail.com>
Subject: Re: [meta-gnome][PATCH] mutter: Make gnome-desktop and libcanberra
 dependencies optional
Message-Id: <170245123616.133993.5174490547279873718.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:16 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107353


On Wed, 06 Dec 2023 12:49:41 +0100, Zoltán Böszörményi wrote:
> mutter may be used as a standalone compositor and even an X11 WM
> without the complete GNOME desktop environment. Make this optional
> and add the new control knob to PACKAGECONFIG by default.
> 
> The built-in sound player functionality depends on libcanberra
> which is considered outdated. Make this optional.
> 
> [...]

Applied, thanks!

[1/1] mutter: Make gnome-desktop and libcanberra dependencies optional
      commit: d6f689da36fe88110d0fb7cad9a1bd84524d9e8c

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


