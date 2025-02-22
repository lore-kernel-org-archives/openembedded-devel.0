Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126C8C021B2
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 12:25:03 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.45270.1740227099609340104
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Feb 2025 04:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=efdERGfe;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso30088875e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Feb 2025 04:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740227098; x=1740831898; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h2ZfeDBkfmQnFNgQ7Nj7siQoGgf2sDBspxfAkx55M7M=;
        b=efdERGfe+wLwzHyME+i16iJ2l22QYND/l3dl7GmikHynHDW0uZ3PhBZkoGmAm4ypDl
         N9XMPMEUj/wySRNk5VLCtgqrBrfBDGmwDxTUVwjE0CMOPFaL8wY+E09aHRzEu2KcvmQ5
         IUZOYNItAaGCjODwDAMUu8JtjGBdNh5DKaNDX747gHaxlM+idfc5OoWUkw5DEqaf+7sw
         yvhARLO1Vj27wlNqZVOtnVbXNaxcMM8M/yflVbxMbX4mTgpy1YPLKQN6oOJunYKyPmfb
         85fr3QW3SfkW0nNRGCKBJSmvFp4ZAqEblUYOcDbdalXuaVNn7l4Lr2hIU1qGklpE/sCe
         x2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740227098; x=1740831898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2ZfeDBkfmQnFNgQ7Nj7siQoGgf2sDBspxfAkx55M7M=;
        b=McnafRJM2jaJ65jByMvpLmKdM318Y2XGsVGdWeb0Tx89CR5zjFal6t5F4SgByTuzfl
         y+aMk0SSkYVaCi7TFAJgsIkWPfxktEM8eghl1BpCy4RlC9MMuU1KvrMlRZ6ibQaA5tdZ
         HJhsc0HKjzw/hMjoInBOEAEoedz0ttn85Ki+XCYltj/kMUprvfhgDiYUV2Nf4ehUatrQ
         3wiwg6NHspSM5x0D1jF9S4TSXNyFz/aOqhNisdrjMUIWQYztz39StNTfAglCXqUZVDrM
         XVvNOiX/PB0JRco7j6v806G3od60DiQkBIPJKM/p3+Z9bbg6HTbH2rUyOjTn0nKfjHJz
         SnBw==
X-Forwarded-Encrypted: i=1; AJvYcCXi0W25+rG6dvKYejNpFgLadbhMcKYaCEYQEsSk27eKkCpeuXUDYdI0P8mJpq6om2Xj96Be0qZO6vnHX0ucosqnGx0=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxccv19Tilvn/nkbXSp/2BFq546IiONzspbkpt7clbW0tPonEl7
	l9OuzB8hLWlIiwAevqEY5gLWt1Ab4cnr4An6L6LJ+4ySDuWecKIR
X-Gm-Gg: ASbGncvdatQnprYAs7ma09TBB5n5GkYvZ8mP3VHyL5oOe+MNed6QoDU/yLq9RuercWR
	+UCj4XT8Z9qWVjOm2WtBtkdrC3xx8RjY/v263PXlZx+6ybB9wepPi7dTrmvePgaWMPiNf/SZlGr
	LgiZqCD6LWUT1gfnOnxHK23bGwHZdK2VVeg7W63ipOcVQ193m32CmOLD4EJxD99iZqqX89M84Q7
	u4CwGv/7lwrg8pT8ANL19u+8NekmGT9A3AOBDpKqNUN5GQOGUFnHUyChwOybFwL/t58ziWIMYxu
	Tv2XvXnX0aWSx46qQNBOq9vuEOCB5Jsw8Q==
X-Google-Smtp-Source: AGHT+IEBe7gVKebyDrYMbqaT1qLEvOaRGDZ+oFWXPWybnIa0IqR/Kk4pNJiDVI9lqHjtxCeW7OMHGg==
X-Received: by 2002:a05:600c:190c:b0:439:a30f:2e67 with SMTP id 5b1f17b1804b1-439ae1f17c6mr66489225e9.17.1740227097761;
        Sat, 22 Feb 2025 04:24:57 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5655sm26029324f8f.77.2025.02.22.04.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 04:24:57 -0800 (PST)
Message-ID: <15179d61-7acf-40cc-ad25-4d33ace18897@gmail.com>
Date: Sat, 22 Feb 2025 13:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH 1/1] wireshark: version bump 4.2.10
 -> 4.2.11
To: jan.vermaete@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250222121505.291425-1-jan.vermaete@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250222121505.291425-1-jan.vermaete@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Feb 2025 12:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115538

On 22.02.25 13:15, Jan Vermaete via lists.openembedded.org wrote:
> @@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
While you are at it, do you think the SRC_URI could be also changed to
https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz?
These URLs seem to be more stable, it looks like they are not deleted
like the not "all-versions" ones.

