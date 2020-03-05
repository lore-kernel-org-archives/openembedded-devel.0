Return-Path: <robert.berger.oe.devel@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id D2E9561147
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2020 15:33:02 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id a132so6824432wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2020 07:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:cc:from:subject:message-id:date:user-agent:mime-version
	:content-language:content-transfer-encoding;
	bh=q1XKZcBWfEh/VykEXAQswckChTM8MTM6s03qaFO6kZU=;
	b=NRqD7I+CyezFOTs9pf3l7H0xgO+jiTYr7ln+sR71QrjXf0tu/xknfgfv8eYHt0JUd5
	0+H5UHfFf6uJi/KsZjQLO0ehpoNocUqfoxUYrHeXQTqooOTJJ6hP4RhFGTgCa7j7k0rM
	wJK3iWYtdg+jkgR6dfgDzUCpE7+5bve492l06p17N9m4ZBckbvfAI+0vkC6rO46bsio8
	Df2+wWCD7E3HZIS2I3sB1AKIpB8V3Dt+hNi76hpXKniM+tI3PmQbHvMBvJ5lg1gXqjpp
	F9oMgjjh2fuEev0EHP6XSBcFPTDCa3A92zy1bOxj4RTogkeWW0bkTNGubArE2Y1Rlv6j
	ebNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=q1XKZcBWfEh/VykEXAQswckChTM8MTM6s03qaFO6kZU=;
	b=jcTEf83nze7owecAR4UUe9q4tfw6V5DlUlsgxY/Xyx3lfS5DQWwF7JDsJcJxuZxCbL
	km05SGefyo9YNHFOe7RTZBVOWZaJ5s0HT2+KDtBRe0NnOPZ2l2xqC9dS1qOehJi7gjYG
	HCrD3W0aQ7RAMVCiTnqm5dopS4+wP+mcCec/Zr+fSlc99cSzF+ZyMPfyZS2B7M/TvcIA
	C7Qc1XbXJRZqh7cB2bC3JwRIqlJKVVPUGXe5veczQ7JVI2mZ6aD9Tr6Tagow01FMAUut
	7E2IO342mpEYC5d20A+Ux6SbYQQY1bnU+0u4Urx34Mk/o/V0kZlwoqdr/MW5wz1Uk42/
	dn/w==
X-Gm-Message-State: ANhLgQ39p/UnF74cPDFz539Y8JmtDR3fZjQ7T+qsiYXnVc9iFcUz6Ht/
	0Y10UDlT3OnMGfZG4E1mGWRCr1Pu
X-Google-Smtp-Source: ADFU+vsrSY/maMFZiAHvE19HD20ljanLrAGCfYlmfA5bt7CzTaSTcnTfjnc1p2bEN1SesoXHN9OL1A==
X-Received: by 2002:a05:600c:24d2:: with SMTP id
	18mr10209026wmu.149.1583422383065; 
	Thu, 05 Mar 2020 07:33:03 -0800 (PST)
Received: from ?IPv6:2a02:587:3b17:4058:898f:61bf:ff8a:d241?
	([2a02:587:3b17:4058:898f:61bf:ff8a:d241])
	by smtp.gmail.com with ESMTPSA id x9sm3687442wrx.0.2020.03.05.07.33.01
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 05 Mar 2020 07:33:02 -0800 (PST)
To: Richard Leitner <richard.leitner@skidata.com>
From: "robert.berger.oe.devel" <robert.berger.oe.devel@gmail.com>
Message-ID: <4c466104-c2f3-0ad6-447a-f6bc3496c25a@gmail.com>
Date: Thu, 5 Mar 2020 17:33:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: issue with -Wno-unknown-warning
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
X-List-Received-Date: Thu, 05 Mar 2020 15:33:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Richard,

Sorry for coming back after such a long time, but I am pretty busy;)

Anyhow, I tried what you suggested in some off-list e-mail:

 >> 1.2) You need 2 patches [2][3]
 >>
 >> [2] 
https://github.com/RobertBerger/meta-java/commit/898a0ae33c9102387aae2e3427a007e3935e663e
 >
 > That's basically fine, but in case of icedtea7-native this restricts the
 > host compilers to >= gcc9. Therefore you should also add
 > "-Wno-unknown-warning".
 >
 > Furthermore please remove the "old" line instead of adding it as a 
comment.

Here is what I did as per your suggestion:

https://github.com/RobertBerger/meta-java/commit/3d8ae5afb639ec7abcc48f15c74b42b373863c57

 >
 >
 >>
 >> [3] 
https://github.com/RobertBerger/meta-java/commit/213b40c25602d23d00366149a778d2e53779b018
 >
 > Looks good.


... but it does not build:

https://pastebin.com/B1nxHcPH

cc1plus: error: unrecognized command line option ‘-Wno-unknown-warning’ 
[-Werror]

That's my host gcc:

pokyuser@3a469e7032d9:/workdir$ gcc --version
gcc (Ubuntu 9.2.1-17ubuntu1~16.04) 9.2.1 20191102
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

pokyuser@3a469e7032d9:/workdir$

Please advise.

Regards,

Robert




