Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D4AEE4981
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 15:51:14 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66654.1767109866166499906
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 07:51:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YPQXvO8v;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so7858525f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 07:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767109864; x=1767714664; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdNLj/r6rhKwLWBPCd7eOOa4/OWPv21EgrK+96tSu+c=;
        b=YPQXvO8vN5fyDJRMd7oP8+Q0q7+vDtQKzB4sMYgwlx6r5VEDOEiQPZjSOCH1YGg4Lg
         sKnVQekLSIGlEeN7Zs9k4H0+Aaq9TeEyAr1j9j60yqW/A5UJ6mPYR+Jw3vrbQvtKMAcx
         vBW0Dedrl1TNE89kBnW0YrqOlgoq6GMItn8DaiEBcIW/048En6hlf0fV2Uo71GCbCZR9
         SyOkdKCTteV+fO+IXPnLtmjChVzDQ73hV9MZB7BMJNfjSDg2JCMIcsC7hbui7bBN07ok
         l4FNgal0Kb956HEN9hz+0yQlcJWJ97JQboqQ7sTxedqRwll+Mqu7N0LHshyjBnbrcDH4
         Cs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767109864; x=1767714664;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdNLj/r6rhKwLWBPCd7eOOa4/OWPv21EgrK+96tSu+c=;
        b=jOP7OqqsY3iHEm9U/raQiBJDmOzpyhS+ArZNphjK65IQssRvmHgPM7wujkUr+Z/oft
         bZgB6aGSxqOCsYXYCbxVzfqZBEyTPai3dCSrHQ8LjldXV9ZheYnixBisuy1RjziUgjOt
         wQT7s0sM3XK4lxNiUEMet2+xHqZ/NL4rKVi2fiVe3au+lCW/0vOQHFVvhYLSyNICgYkl
         +j/p17TzZL19YJVilrCWAOU9WHihg9up8UKU9/9KRJUeVoJKmcoEhWvjRQwijMy9/6Fn
         DKdYxicJNaTouspv0v0shwvVQtGcIX32QP6xstb5Z50IMUnNTipJZFTR5Ms1KPxF0BfP
         dPhg==
X-Gm-Message-State: AOJu0Yx++2PXk7H6OK0jmBBNpKM4oKtf3eg9hCVu+g+dUmQEfoSIvT+y
	dg/xzZ2BamJHzUnRcn9mWpD3HZoUTneWFaarhmMo9GAeEw2ufwKgVlrtlYp2Jg==
X-Gm-Gg: AY/fxX6f34GCCKn8FV/BFNB8+OeUqrf/8limMPq5UN96RTgwdguyrOlvL4h/eWv4jDS
	SHKh6APJKRAhx3HA2BKeKnc9kD/9VQS9c1Ttb/4Ke+/qLbbXXUsFADnRS1xA/NLwhLl6N7hQARn
	bgbU+itkJDXWNLBubfXxVCVb/FVYbGObMjkPSX8gsiriKGX3d1/7cqORuJUOc+IZb75hLxSjhLs
	d0Ta3PAedlVvpz9sKxRjpuv9Dh7kcirua9f8gw6QA4lQNMsrqNIzTVZYCqQjjY7sdFYv3j6sTSd
	WdQ6McJxNur4WhfT9pqNKyiFd0YP2vSkAq9zYAD5uryRIOzEEQSMkydzQMeaACGgaMnz0IuyDRl
	kECNaszn+oHIdJROSMIo2TO36Npwg8ifPctSJgOoiHv3U9FLFogpSSHehSqsx+Fut/JfUg8RlQE
	2QqaohaIpmD5W6jlzLt+c=
X-Google-Smtp-Source: AGHT+IFkPMMnRVbtJ+ub7U4ve8wL/ewpO30pxVvtJxss4a+KI56GsiSDwwN9aYD96BJnzOUOqQbGlg==
X-Received: by 2002:a05:6000:402a:b0:430:f41f:bd5d with SMTP id ffacd0b85a97d-4324e708e9amr33622414f8f.55.1767109864452;
        Tue, 30 Dec 2025 07:51:04 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm69357468f8f.7.2025.12.30.07.51.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 07:51:04 -0800 (PST)
Message-ID: <3d4935dc-f9b9-400e-831e-843104190500@gmail.com>
Date: Tue, 30 Dec 2025 16:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: Many CVE_PRODUCTS patches
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 15:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123037

Apologies for this CVE_PRODUCT patch-tsunami. 

While reviewing an earlier submitted CVE patch, I was wondering why that
CVE didn't show up in the CVE report - it turned out that almost all
recipes using the pypi class use the default CVE_PRODUCT, however there
are quite a few where it is not appropriate, making the cve-checker to
miss relevant CVEs.

For today I don't plan to spam further, but I'm only about halfway
through my list for the master branch, about the same amount left for
tomorrow-ish.


