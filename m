Return-Path: <henry@kittyhawk.aero>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 95BB360124
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 18:17:37 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id b5so9681661pas.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 11:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kittyhawk-aero.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nzks51yWxkA73QK+UyFihY0Rk3VDnToM0ou6KiKxhqY=;
	b=FwbXX20esrangEu+KRWITIYhFerZWbXTn1wo0f6/PF0CZ7ObajgkVjl4BlrCc4Z0bQ
	Yl8+eOYhdtO8jkGpsB4/0THLyDhnjApH2U7XKkyqklsl9mqWqcxl4RvroAXHBNcRX4U/
	dpXj9FCQG1dRWXgc02ke7Ln/F1/Y7cL4EU2tYf+aXJXw4Sdzvg4SSsvHZkRwfPgi+8TG
	5ZnQFXlLeN9VUuHBIui33uFCDmqgvLVaMpzIwDdyciEdk095EqcS6XlspnFEnwsiLEqb
	DcJylzaEz8WUTAHjFFVjaDvS5ci7LWdFxFGZZ48QTN+Sv6H/14kWScq9ORMvntuHBrmw
	CtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nzks51yWxkA73QK+UyFihY0Rk3VDnToM0ou6KiKxhqY=;
	b=iCJsVOU3DFT8Bws2S0+QswjNwW8jb6o+DTajTaLuxYwXGxOvk1u7RC5YVWATWO69TB
	LDxmmQiec7zWSGk30pTmvmTaSQ+TRnuE9RUzviALy8z4Rfsym7SHe4W3NKk5GqV6RU9o
	vfIqkDV7OIkq3ouvNFBwYUCJQWyKySu1Wnwq6JCQ8xE5Ch4bFeqv06gNJALRGJKjwmq6
	JVIJiu0BOFXfhqkjDmnQfCjtiI4Zx/X16Yga23GmoywNhi4ap7dzQH69ZIL3yMAOCSOi
	tYKcEu4jwSLucYgUlQ4EZ+BhzgpAUszTT2wCNJGPrd3DuIE4FACOrqVTuEDZ3nD1jmLe
	pOeA==
X-Gm-Message-State: ALyK8tICYJUs12DXjsxI42MNX4WMTfmVZSrnoVRTF8yUAUSCDNHRCTn0+wAkcZQHP5S6TrXm
X-Received: by 10.66.185.229 with SMTP id ff5mr76963pac.132.1466014658057;
	Wed, 15 Jun 2016 11:17:38 -0700 (PDT)
Received: from hhz440.kittyhawk.aero ([66.201.63.226])
	by smtp.gmail.com with ESMTPSA id
	fj13sm54714780pab.0.2016.06.15.11.17.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jun 2016 11:17:37 -0700 (PDT)
From: Henry Hallam <henry@kittyhawk.aero>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jun 2016 11:17:26 -0700
Message-Id: <1466014647-56745-1-git-send-email-henry@kittyhawk.aero>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <D56F5A73-035E-4C81-9CEE-F23311639B42@dominion.thruhere.net>
References: <D56F5A73-035E-4C81-9CEE-F23311639B42@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-networking][PATCHv3] chrony: Versatile implementation of NTP
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jun 2016 18:17:39 -0000


Patch version 3:
- Move variable defs to appropriate places in the recipe, per Koen's feedback
- Correct location of drift file
- Add conflict with ntimed, and note about systemd-timesyncd

Thanks, Henry

