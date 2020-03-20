Return-Path: <robert.berger.oe.devel@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id EF2DF61A0A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 16:53:18 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id h6so8341438wrs.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 09:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:cc:from:subject:message-id:date:user-agent:mime-version
	:content-language:content-transfer-encoding;
	bh=Tg4AnKcChsA675oaMgwSBU5DUuNvz6hmHPlNlEGdoM4=;
	b=qiQxfBzpmTjuI9lX3yIOXZSmnJ91YbrjwS992Jvio4zWbVO1JIP4TlumrHHSe579dq
	4nhwZ475mfzGxUrEun5Izp5qmsI8dhfnjs6SdwAj/4/rpZt3oZ2tiG7uisqoOwFhHc5V
	PRF+xTvax4yaRrMRDQFWpzUvdNLQCqBlVY0Gm9sWQ8dG00Tu2e00ndvQgSzsGz6dk8OA
	bcVjAvPxHijnGxgJVXBsacfxtRIpEcIWGGqvvbPSmO6m/Jt/GzNr1T5GMCGCtRiRb3ME
	jKiwRQROVDyVPg02VcJI/f+TguICTL3u9k0y0LeJiwznxy7bco3cdYEAFwqrwbn0eM6s
	kjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=Tg4AnKcChsA675oaMgwSBU5DUuNvz6hmHPlNlEGdoM4=;
	b=aB6h4mi5+ZqA50MddyJzHFFlmSpARJYJuncqFqqBiI0PjeTbKNw7O+YLbmnvRA8+eV
	MixyTngo6xa8GMiX28HbB2k/UqPcHQ29uC6e4c0U0hypTHCT8/ZjhOphwUEtD7SeWQSs
	eNfRnRLVo3ziJYNyH7rTWxyIj9kGEF/uRDj0T1y5yKtbf0CtJhljqMxBOde1l94wp7/K
	FhJ9bEBMvBLXMrkVpuABN+jPLzWiWDsUtvoOOOGEChlpecczScsZ/3N3E7jcMxgzn3Hc
	I6uGUgKxwsSUHJltu9jkmXmHqQToVymw8LuJ9Ktb+zvUzvrEmFazeE3pj0EfVMkIstJx
	AJhA==
X-Gm-Message-State: ANhLgQ3G/5qlKtL//2lG5k11i4GLfM/QUOejHpGwlkOos7q3vZok1CTN
	gqcCvTXvMjnw7hrpRBcxgmM=
X-Google-Smtp-Source: ADFU+vsa3/MHPiRu2OK6vpiva5aW2JBT1B8EP4yzDS7e1CCHUtGKETaUulTbg+H20FnpEO++sjSE/w==
X-Received: by 2002:a05:6000:111:: with SMTP id
	o17mr12116347wrx.111.1584723199407; 
	Fri, 20 Mar 2020 09:53:19 -0700 (PDT)
Received: from [192.168.42.52] (athedsl-4432938.home.otenet.gr.
	[79.129.148.26]) by smtp.gmail.com with ESMTPSA id
	u16sm8913980wro.23.2020.03.20.09.53.18
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 20 Mar 2020 09:53:19 -0700 (PDT)
To: Richard Leitner <richard.leitner@skidata.com>
From: "robert.berger.oe.devel" <robert.berger.oe.devel@gmail.com>
Message-ID: <7946cd8c-4a94-5e5a-7bdc-64963af21006@gmail.com>
Date: Fri, 20 Mar 2020 18:53:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Robert Berger <robert.berger@reliableembeddedsystems.com>
Subject: [meta-java] host gcc-9, icetea-7 gcc-9 but how older gcc versions?
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
X-List-Received-Date: Fri, 20 Mar 2020 16:53:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

I tried to add support for a host gcc-9 and suggested this patch[1]

[1] 
https://github.com/RobertBerger/meta-java/commit/898a0ae33c9102387aae2e3427a007e3935e663e

and, as per your suggestion, since it restricts the host compiler to >= 
gcc9 I added "-Wno-unknown-warning".

https://github.com/RobertBerger/meta-java/commit/3d8ae5afb639ec7abcc48f15c74b42b373863c57

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

