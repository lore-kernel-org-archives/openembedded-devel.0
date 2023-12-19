Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93E0C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:56 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.6846.1702967276486034112
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iotg+FgL;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d3d0faf262so9470465ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967276; x=1703572076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TlPjXgsIjwOeYVMFR4vG0B+V5QG7vEIeGBJ/eRC6Pmg=;
        b=Iotg+FgL23JJmIuksI1s6pln5kefwgYL8KGGx0tlfAuCQQt6q/S81BRQDp/MNiZcVz
         N8OReIh0XFSla4t4Xkp95dwpAmj1PBGp4fB3fZr3KvPMlsbsddEWsUDr1GCzu8lcbyL7
         iOWxwBSMOih9340dSW8b5n4KYog5GbDBY3nEx6omohq6eslgOIbg0b9GxolwzxGWC/ok
         VqdnUyqYJJH5V0D7MulL3qiO7PRXJ5T0n43rX4JwyjmazwsFLE7GEBahZCrKYGTBK6nu
         u6qBzXY9nW+VdQ4tNKIOO+jYChI5RGbgtmKwIfKyUr/xvz6dWN61GPgOkCCnFwibfOQ4
         6FBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967276; x=1703572076;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlPjXgsIjwOeYVMFR4vG0B+V5QG7vEIeGBJ/eRC6Pmg=;
        b=KL/6dRUKv358rqNKsNai20p/goSNhH4MX9qgBI+u7EnNfz/GQ5auT76fcbe7fJEcuP
         UJ5c7ItFeGipTEMrNkjPtQv0mzK1WcUqswcbSLTYo7VmMa7Me9i/MXt5FqZQ2gO2BcZw
         hjXn+rLiinjjGRoB/XW3H38bn6jKXWbiukmfmxipeiqA69ZnH0meUiEg7Bcybz/TWn4X
         v6Mgbm0ptM33Q8E1ONBKeGeK/g9wI8EfZOxACDhcLpZnoV+fhIRO9BLmuapAWWIxfzsx
         1n+8ZMbDFVd9uRz3puNip4DnwNna65gBSycXj9cPt8BZ6zvluh9mKPVuIKAvQE18lzqi
         sd+Q==
X-Gm-Message-State: AOJu0YxORUso4LO65C2kPlaWeAGZpX/f2Obme+CctfNW0hxd3cBw/zrw
	kR5QELVALyFExv2FkFWITlBt9GzDmVc=
X-Google-Smtp-Source: AGHT+IFs9jAwsY4PoxvadUx91V6cjCXwfZ4eaflX5J4aNC96UhzCj40NY5u5yGdrIpvC5y4Vc+VDXQ==
X-Received: by 2002:a17:902:c412:b0:1d0:5ac4:4959 with SMTP id k18-20020a170902c41200b001d05ac44959mr23481768plk.6.1702967275934;
        Mon, 18 Dec 2023 22:27:55 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231215173830.4145-1-f_l_k@t-online.de>
References: <20231215173830.4145-1-f_l_k@t-online.de>
Subject: Re: [meta-gnome][PATCH] gnome-software: update 45.1 -> 45.2
Message-Id: <170296727508.1627685.4242287820501863257.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:55 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107618


On Fri, 15 Dec 2023 18:38:29 +0100, Markus Volk wrote:
> - add backport patches for appstream-1.0.0 support
> 
> 

Applied, thanks!

[1/1] gnome-software: update 45.1 -> 45.2
      commit: 882aaf9506fb779a19a65c7040de2dbe69406e76

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


