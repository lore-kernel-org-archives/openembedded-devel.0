Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id C1842621BB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2014 05:33:48 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id va2so7819111obc.38
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Mar 2014 22:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=enf4AM8rgiPph3vk/JLkAKkP2994eV1t6ZKA1BQ7tUQ=;
	b=FEdOdeoHqWxFmutrFXUFrz3mQWcdrrO9MYa86YORZRnUpNBYYBhr5SNTXZ5ibBocPk
	19jrL1ZxCIkkevBIZfapLM6YczwbkXIVHQpMlKSH6MELUXs1VaZkGvonoBpZiSygOFZf
	WJWD5itPxN2VyY1P0vt+g2Yq/s2OcUffWsVPH9cQufvqcusx3cKKFRb3PwEdydF5uuj8
	IL1V7zf2FXvxbDw2SGxrZkzCOobxgoKtQvZlDH5pCHX7wEjV6FBoiAJW73WW5iPmdpF2
	vEWybSV91XXXlrplbjhLPd9CJKZFAjsJl62WDkBxDYKYskmr4Kf+Q0kUEG3cxaE+jWEF
	PBFA==
X-Gm-Message-State: ALoCoQnsF8xToWEXXH3fSXhcJ7NgKfeedPqATNyjkwDPjiZnqLQ/wW050rIq4f+fbiOEdaKH08hP
X-Received: by 10.182.24.8 with SMTP id q8mr417066obf.38.1396157629148;
	Sat, 29 Mar 2014 22:33:49 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158]) by mx.google.com with ESMTPSA id
	oz15sm43998858oeb.13.2014.03.29.22.33.48 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 29 Mar 2014 22:33:48 -0700 (PDT)
Message-ID: <5337ACBB.4040804@linaro.org>
Date: Sun, 30 Mar 2014 01:33:47 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
References: <20140330013103.GD2428@jama>
In-Reply-To: <20140330013103.GD2428@jama>
Subject: Re: [OE-core] Quality of meta-oe metadata
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Mar 2014 05:33:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Martin,

Excellent, excellent post!

On 03/29/14 21:31, Martin Jansa wrote:
> 2) There are a lot of changes and component upgrades in oe-core which
>    sometimes aren't very straight-forward to adapt to and issues stay in
>    meta-oe for months.

Critical bugfixes aside, I think the current system of unrestrained,
perpetual package bumps is an issue. If dylan uses version 1 of package
XYZ and dora uses version 5, is there any need for the 3 intervening
package bumps which occurred between the release of dylan and dora?

If nothing else, these "irrelevant updates" increase the chance of
causing problems ;-)

> 3) OE releases work great and don't invalidate sstate signatures so often, so my
>    feeling is that most developers and projects are just using releases and
>    less and less people do CI.

Would users prefer a better-tested more-likely-to-work release
containing package versions which were several months old, or is staying
on the bleeding edge more important? There is always exponentially more
work/cost required to be an early adopter.

