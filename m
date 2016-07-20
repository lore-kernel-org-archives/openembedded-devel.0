Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 71EEE60722
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 10:44:22 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id b199so35395616lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 03:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=jD8W31WhvfqKnzuw59bzTaN+VXEaVK6TPFje04WerSg=;
	b=RjA6MGvDBunVxyz5LoaYZay+sl25jTDgrcmS1HcdvVBiNZ9HUmRVK+N9H8ObZXqOQ9
	4NZw/rHBqtTbI5AuvSan5NpTlIUoSQx9vjWmn1ViEaSx7QsHEnv3HcBRQJ7P8+1pr6Hp
	ZBXdwlIUYLFnEdWrFmRqe0ixJVbO43M0hDrSBGoX2+johl9H/0eXXAJu+bsS6n1Iv1Ti
	i7d+Q1E+RSHtIWcRm4Qy9SJDL33yOQjQVLFfZCL7AMztEGXEYdEahiGWSvksAGAlE90D
	wR+ep4qW4NcLnngIUaNvLpsGp96szMzs6ELeXR1YVfTjXJ5C30+HMduBfmQLjPUsBuqq
	2Czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=jD8W31WhvfqKnzuw59bzTaN+VXEaVK6TPFje04WerSg=;
	b=b1cwJMAJV734tr+08m2YKrn9Aato9kRZXpHSr1TSrMsqcs1ZS1Kz4CZCLysVG5+ZoX
	cQ5ANDJ18ApuwF4S0H37iX9To5lsbdI8aek4Luz1C0Qmo+WLpNAjza/3TzlcRXEKg+7v
	2xVYhB6poPvTyoab17QiLJaEjnPHpIr7LerT4o/Q69io+eji8dVXfF97PvUoTjhsV+e8
	/OXlUQWKjDecf5lcNw2YEi4VzdpN4c3OPgSyNg0q+ua6TEY6i4Ybv7VAnnHYpNiTIqJz
	eKgIxU8Sek9HlZKiGkU0zyfb3RU00yTWvpwg1iz+CzfIRnWDtNCqTJL3rWqjhmfH5wFr
	+9Uw==
X-Gm-Message-State: ALyK8tKOBSTFm5H8qWqyoY171cMiTd+AB0qeTo5MIq9jStE2zVbhgcfg/8PD/UUW5eaWxO9T
X-Received: by 10.25.151.66 with SMTP id z63mr22883722lfd.159.1469011463021;
	Wed, 20 Jul 2016 03:44:23 -0700 (PDT)
Received: from [192.168.70.35] ([212.247.53.108])
	by smtp.gmail.com with ESMTPSA id h68sm480715ljh.38.2016.07.20.03.44.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jul 2016 03:44:22 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <1469010648-25671-1-git-send-email-gordan.markus@pelagicore.com>
	<CA+chaQcPZx9AHzQfCy3N7pUZ-URR=owOjGyZY6DE6BrjPNrVzQ@mail.gmail.com>
From: =?UTF-8?Q?Gordan_Marku=c5=a1?= <gordan.markus@pelagicore.com>
Message-ID: <578F5605.3060302@pelagicore.com>
Date: Wed, 20 Jul 2016 12:44:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcPZx9AHzQfCy3N7pUZ-URR=owOjGyZY6DE6BrjPNrVzQ@mail.gmail.com>
Subject: Re: [meta-qt5][PATCH] qt5: update the recipes to the latest LTS stable Qt 5.6.1-1
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
X-List-Received-Date: Wed, 20 Jul 2016 10:44:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for the feedback Martin. I'll convert the SRCREV tags to hashes.

On 2016-07-20 12:35, Martin Jansa wrote:
> Sorry, but no tag names in SRCREV - that causes bitbake parsing to 
> reach git repositories every time to convert them to git SHA.

-- 

Gordan Markuš
Embedded Linux Software Developer

Pelagicore AB
Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
+46 (0)7333 04579
gordan.markus@pelagicore.com
www.pelagicore.com

Registered Office Gothenburg, Sweden
Registration No. 556780-4199



