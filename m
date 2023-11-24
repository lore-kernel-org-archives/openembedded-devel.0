Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2A1C636D3
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:12 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.120989.1700784067186760731
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:01:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QO0Z1pjf;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cf98ffc257so5680555ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784066; x=1701388866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eBHSVlqD80dEouei7gwABhYHsTE9rsv6cGR+q4kk0s=;
        b=QO0Z1pjfgRhiJ+FI1klQYLN4rx+rBFZybvXteZGL1JWY7pbjwBq4mGA1Bz2HGbcVBW
         gaHV/du2wvvGABeeXHKr0WUmjJZ4M4re6u/cNUheyQ7v4+L1CAOVo/uP64lqTK54Zt63
         RxtULfvH1/ilOxh2fcl8/rcA6YrwG/ZtoLy4CA2DI0gmGV+i5zuYoq6BsXWTsY1BoXHc
         8QlQ72L82ht4os3TDbHNfUbx5pTW1ZF2TBi0K1nKQL3dw2JTb7OGKQaz6th1aZxayOj3
         nHW7A/P+Jz6iw5Tlb/ouCkC+rgN0tfNTn1bjfGPDObYbzndqJ3pd2jO+S7Zp2eDgA+hc
         UMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784066; x=1701388866;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eBHSVlqD80dEouei7gwABhYHsTE9rsv6cGR+q4kk0s=;
        b=kReFxHCJaXp0g+xeG9AUsmhonCqg44ugHqLR6EpaREpmKrFWksqTIwce9hNgiqBNJy
         Ef5KEFGaMeXRCMIaNCSWCsgRe2bEmzlm+um5QOuyl3QCAqC3AkScQLByaMYX3iswViK0
         KPe63TSpXe7TCPgzmRP938G6hTMjeGsCK+kYqAHrgZebEye0M6pPonaYLpD1ovs23Nxk
         Rjvfrtt5GP+z6sMpIm/XwNGgr6nrm/0t09lRelNK7JR9Ejvskw1iwzbRbuAlYDE3uaSI
         oghE5jexHm84Otjb0uMhuyTOmIoDJDSH8gKhHSICeSwGusOJnnIuSHSdgXcbCYw94qlB
         oTiA==
X-Gm-Message-State: AOJu0Yy9UkogD+8gcj6tp6msDTTTMK4lYFbCYhB9FFLyDcQt2oNX2mCA
	HMhGy53qTtdKrlIixgjeLehMkujolKXMLw==
X-Google-Smtp-Source: AGHT+IFxeZGhzI3HjhTRY1qUH5+ruVy5NoMm4btEQOI3XPK57tgdIq2eWIllruX9I4XULxwFcHe21Q==
X-Received: by 2002:a17:902:f60a:b0:1ce:6669:3260 with SMTP id n10-20020a170902f60a00b001ce66693260mr1542406plg.67.1700784066357;
        Thu, 23 Nov 2023 16:01:06 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:01:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700634482-8100-1-git-send-email-wangmy@fujitsu.com>
References: <1700634482-8100-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-ldap: upgrade 3.4.3 ->
 3.4.4
Message-Id: <170078406565.3118595.8873861806910473592.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:01:05 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107036


On Wed, 22 Nov 2023 14:28:02 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> =============
> -Reconnect race condition in ReconnectLDAPObject is now fixed
> -Socket ownership is now claimed once we've passed it to libldap
> -LDAP_set_option string formats are now compatible with Python 3.12
> -Security Policy was created
> -Broken article links are fixed now
> -Bring Conscious Language improvements
> -Add testing and document support for Python 3.10, 3.11, and 3.12
> 
> [...]

Applied, thanks!

[1/1] python3-ldap: upgrade 3.4.3 -> 3.4.4
      commit: 0bfb7b316460850785880444efc5300ed2568acd

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


