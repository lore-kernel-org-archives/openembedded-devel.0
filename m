Return-Path: <fsukalia@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 92CE577C05
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 17:19:09 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id g204so39749146oib.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 10:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=1Acq2HWIKpCaGtH8PEnqcfWb6j0lch33Xa+T7FKJCkw=;
	b=E36nI5eM5Fml8Pv5D2a/DSDMWluT7vkHf9FyEyaR4WK3adMNNxWavqGAQU+q0YWCGV
	3nV3JGOP9UdNMeJT0ohoBT1YwagnI6uPE9Syy2Q9/g8FzJdoymdaiuGtV+ZTEv0aRAZB
	y2oyWqiJ/MNZMw4g51wbOjdQjez7koYBdhb6xhphOwoCnuHq9h0/s5uOkWie0gvGdggb
	VkEUj+tDyz9oKkGP+K8enZtSF0eb+Ds2BVlM7YgwAImro6upkbOrlAC0POHhKlJurxPv
	rEiG+nZxt3z0Znebyc5QgzYi8FN1ZXut+/yp2CJKAr9s/aCcg5x9G72TLa1T7d7KvJ6A
	RwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=1Acq2HWIKpCaGtH8PEnqcfWb6j0lch33Xa+T7FKJCkw=;
	b=sU4gfqjwatIUzb3ac5boAh6MX0NgisiyUOVcw5Bc7h9VBqw1hDq2sR96MRzgepxtkO
	eQZi3tn/NEMNjkc6r8t0d0j2SROvSu518C72+Bt41dFkM5YKXZcOqtbtf9cCjxMpVeOC
	KMvhXMvxktVSTGZPZwlarm3iGbFoE0KfnEIFetC/FUxXdzHuT/BRKy65GE7BpMGFjbgE
	jAfwABDDrNG/7dRcy/+/RGVaf52zyBYXc7ORg9Le6ID1tFvTdBZUGhtgIEuGeoUSevEf
	UszOZrwOjrzjHdmbLc7oPdxAK4hFHJLb1QAhRFSJjLmVgduYxy335oXrnrwpAxVoZQUI
	ksxA==
X-Gm-Message-State: AN3rC/773m+MFI638zUXtrwxdYMPqUv1tcuzJFg+taKNQNsZZTOiusWkEUH9Sm4X9G9oahWRuqpq/Xsyb+ECww==
X-Received: by 10.202.69.195 with SMTP id s186mr14990934oia.99.1492017551195; 
	Wed, 12 Apr 2017 10:19:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.7.135 with HTTP; Wed, 12 Apr 2017 10:19:10 -0700 (PDT)
From: Fabjan Sukalia <fsukalia@gmail.com>
Date: Wed, 12 Apr 2017 19:19:10 +0200
Message-ID: <CAPq_R_ewQocz6eqxt+iEwd=G8g38W89JzQcnHCWRVqsURwv1jQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Full Python3 Installation
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
X-List-Received-Date: Wed, 12 Apr 2017 17:19:11 -0000
Content-Type: text/plain; charset=UTF-8

Hi all!

I'm working with a Poky installation on a Zynq-Board. I have added python3
to the image with

CORE_IMAGE_EXTRA_INSTALL_append = " python3"

With this python3 is available on the target system but sadly not all
modules are installed like on an usual desktop system, e.g. sockets can't
be used because the selector module is missing, also the subprocess module
is missing.

How do I get a "full" python installation that is comparable with desktop
systems? Thanks in advance.

Best regards,
Fabjan Sukalia

