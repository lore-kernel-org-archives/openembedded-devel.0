Return-Path: <jason.liu@gumstix.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5B85660116
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 16:42:50 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id x187so31467654oig.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 09:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gumstix.com; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=uB+JFzVOfpj/opqrYFQEdjqDuK91IRQ1crnV/KCV6yY=;
	b=buItS3LRJUbEf8tnEutumngWKdirH/3cfb8pxdQZQhI7PqYH88T8ECDMIKBpnKHEBa
	XMv6PHZVJfX4MnSZ+q8yAp5mj40ZdtCIb84X8DE+6LF/kxmwXYdG9Mk28Hxao2IUePB3
	vFPVslF3/gxKYY4PvTJ0KPGuw1JN+Tx08lQ1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=uB+JFzVOfpj/opqrYFQEdjqDuK91IRQ1crnV/KCV6yY=;
	b=Fd7c7N0OJWJ7qX6UHV2Dim/lK1hD7IfM+R5X7EgrYBUO+OARzKhymPtmicxlBSgU6O
	U9gM+PuUeGnc2V63y93cs6h0T19CtyfDqSh/f5r18X63iZn0/sEQ2j7h8apgRLWz3s5R
	SleYf8S6EkSLhZOO8CPSI06WgIiM5kJ7BfMEwAAIZG+fOwbvtCbaiGBf2J+UR4ehAnsR
	+5JOg7+9+hgyonW1ZOM1W1qnw5JD/UYsRlBizP63WwmiJu8JJEnyT4lbT0LzAORIT93S
	2PySd2VcmWNuknPzAojupW2Ugozrsm6mVm+Ue7EN9EcPJGdaWaA4Ka6qk2E3kflhvhQZ
	rNWA==
X-Gm-Message-State: AIVw110R8eTwpc7RixaxS2pV58NipFJjfUKjss9OBj1/nkbLm+gwyNvW
	LdkxTKtoUx56g7ff/rEd7zQ3qzX9iMYt9WQ=
X-Received: by 10.202.3.194 with SMTP id 185mr47107oid.156.1500568970729; Thu,
	20 Jul 2017 09:42:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.129.18 with HTTP; Thu, 20 Jul 2017 09:42:50 -0700 (PDT)
From: Jason Liu <jason.liu@gumstix.com>
Date: Thu, 20 Jul 2017 09:42:50 -0700
Message-ID: <CAGkS5bn1Ke-k4W_-aCAQ9Mcp2ZvW4g+9ahx9CLrrpAf05SnLcw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Pull Request
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
X-List-Received-Date: Thu, 20 Jul 2017 16:42:51 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Openembedded,

Currently we are developing our kernel using morty branch openembedded
recipe and we found that there is no libvdpau package in morty branch. So I
did cherry-pick to apply the commit from master to add the bb file in.

The pull request is https://github.com/openembedded/meta-
openembedded/pull/48.
Please confirm the changes.

Regards,

Jason

