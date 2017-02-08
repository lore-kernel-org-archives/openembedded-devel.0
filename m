Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id AB9DA71A0C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 07:29:37 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id c85so186277777wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 23:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=subject:mime-version:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=cDmf/pjXFP2MxUm63n43aF3VPiUIJygFavZX+suaiDs=;
	b=OELn56EiAY9heBw9MoLV4BNEbcX0z6cKh9jE2ojwg3RW37Vrk3cyOyHX4gBYk7W4LF
	jfp3CL1F6xXtSyjn0l1oOjdeDFgmu/vFHtYSXF6OQjc9mg5ZrzyWkrNdh8+x5QMO1mQD
	4q47iKTmaoPbz6Wqg9bMClnXFAVt1IJzqHQd2qMhVa73A5FK5phZ1rkEbwcWo01XSEIk
	0sWz2cw85SfdRurN4XuCoApST4QbaRM7xCYoNX1EkgW0H/N0O+hMXzTZMVI25zQwsFUZ
	3RwBJsc2fC5SwuWN/0WeC1Pdo9Hnah2DoDM1N5EyLVLXSYIIOWG+g3dpZXIiihJJue9Y
	CDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=cDmf/pjXFP2MxUm63n43aF3VPiUIJygFavZX+suaiDs=;
	b=tAIrBbn/QAYRBfPhv1j2iCaXz1oyFcWes95pLGou+7iB4DYUMaCfDPDxREEggkp1pK
	Y5vTfJcq1akKiTcV0SQPhirwyo7wnePZVdOMZfKwXjsMBVhp/nk0OjUUrRIW01Heck3Q
	svgh9kp4IuVNf9p1EHrB/XL+ChEjb350U8qtQhJsgJKosJKBL5oq53Og6KV7aBBullQV
	C7pRvJKvPjausjxnbRCa9KqEEbBpk7KmzFB7/dQbwJ91a/nyEcGUnLFk9ErunJtQDMYc
	ZjkSbX2NCtgAcx4zcXoopoEsEu79slpRbG87WxJT4fDktdIzjgC/jhLnBrcRxEGFzgcw
	v6Qg==
X-Gm-Message-State: AIkVDXJQ5XNQqc4qpRqTYKjyo9yV11a3V30lK8lLKuf+5jiWFEdXF2xcfbiGHYFVZaP2/A==
X-Received: by 10.223.169.164 with SMTP id b33mr19851572wrd.132.1486538977491; 
	Tue, 07 Feb 2017 23:29:37 -0800 (PST)
Received: from [172.20.0.85] (ip4da29576.direct-adsl.nl. [77.162.149.118])
	by smtp.gmail.com with ESMTPSA id
	y30sm11368489wrc.23.2017.02.07.23.29.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Feb 2017 23:29:36 -0800 (PST)
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: Koen Kooi <koen@dominion.thruhere.net>
X-Apple-Mail-Remote-Attachments: YES
X-Apple-Base-Url: x-msg://20/
In-Reply-To: <1486505420-14626-1-git-send-email-mark.asselstine@windriver.com>
X-Apple-Windows-Friendly: 1
Date: Wed, 8 Feb 2017 08:29:17 +0100
X-Apple-Mail-Signature: SKIP_SIGNATURE
Message-Id: <27A6758A-1B9E-4C57-8BCD-E90E8B8CF452@dominion.thruhere.net>
References: <1486505420-14626-1-git-send-email-mark.asselstine@windriver.com>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Mark Asselstine <mark.asselstine@windriver.com>
X-Mailer: Apple Mail (2.3263)
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] udisks: add missing hard dependency
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
X-List-Received-Date: Wed, 08 Feb 2017 07:29:38 -0000
Content-Type: text/plain; charset="us-ascii"


