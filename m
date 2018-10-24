Return-Path: <krussell7711@gmail.com>
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
	[209.85.221.172])
	by mail.openembedded.org (Postfix) with ESMTP id F16C67458B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2018 21:16:05 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id m199-v6so1631703vke.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2018 14:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=KBI3cs1W0P1pXIHh+++wjNo+ec2apJ3nEgqIump1lq0=;
	b=HzttQk/yUfIknzJZUo8l99qxa9QWkvJOwAEi/Nn8Pf3DPYCh9aakyD+omFk6A5C4zL
	lKGULn2ExcK6viZe2PJHjF3nhP+4SM+tynbwktNxasM01d9CqQ57g0kh/hwZjhSuNZHi
	Y1VtXdhIJv5bq5WxQeuizpRA3eb0+qMv7TJtreqYG7n8EqUWerwuOKORsLJ/g1sHZ4oT
	+kV4zqh7qfegqRHw2hUhtanWOlnDZuRAq61fVJA+wUtm7JIJnvcYxVFdLKEto+dpDmxp
	/DWfHUGT8SQqrHFgOtKuG5VEE7zBZz3xY5JrJe6eS8IB6MqFsA8/Bk5bY1A00ZpDzx4l
	doLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=KBI3cs1W0P1pXIHh+++wjNo+ec2apJ3nEgqIump1lq0=;
	b=T4oFsiFPskbpAyuWj+5H2iyL5s/66bF3TICu/nGiU7Q2MpDAq2ZzfC4iVSCPk8uuTR
	82cOH/KZSQVtMPjLvWuwFs0jJZVDbkzFTEVjtNMy9JP1lJNoVLC/dJNoSyTsoeKf46Kl
	VWRPkiUuwn1K7XBWfIVHQw2Yf8sdkF32Psb2vFmVZeHnlgh5Bf0zmn/CLxeEzClfg778
	m062MaAgSgULAi0U7UQuNjBSSr6R5dMnV1zTey81CGVSlnEi4/+8rOWATNQ48tG+Hs7m
	5xAsuaqGr+IRJF0LYxlT0d6pe9A4K7k6tdQTaCtJZmGgCDpSAr9x7HZ5x8WLHWldLq8P
	kUrw==
X-Gm-Message-State: AGRZ1gLgjSWDxVq8SVLrvqSo6NFOQZp5HreRLTeyk+NsVaq/+MYflW5q
	1Ct1UUwQWrIE/yOSOrqhmmwjn2RIWnGK8Rz6lCvT7A==
X-Google-Smtp-Source: AJdET5dq1GUrHrVfStjovWjMxt2glIOgAgjM2/mudvpm7zkQ6AJH6NQtCOi4lyjgyVSPfpHipj8HTEHA7n1WC0IWuLU=
X-Received: by 2002:a1f:2a93:: with SMTP id q141mr2011077vkq.20.1540415766091; 
	Wed, 24 Oct 2018 14:16:06 -0700 (PDT)
MIME-Version: 1.0
From: Kyle Russell <bkylerussell@gmail.com>
Date: Wed, 24 Oct 2018 17:15:54 -0400
Message-ID: <CAFrQVPNLu4KJWK3hLWVC7yjq7aLmb9a1c066hTC5BHj_=qdZZg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: meta-java configuration
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
X-List-Received-Date: Wed, 24 Oct 2018 21:16:06 -0000
Content-Type: text/plain; charset="UTF-8"

It looks like the only javac that meta-java exposes through its bbclasses
comes from libecj-bootstrap-native 3.6.2.  A few years ago, it looked like
there was an attempt to allow openjdk-8-native to provide
virtual/javac-native, but it has since been reverted.

I think I understand libecj is needed as part of the bootstrap process to
build openjdk, but if other layers want to build newer java code using
javac from openjdk 8 once available after bootstrap, does meta-java provide
support for using javac from openjdk-8-native, or is the expectation that
other layers would depend directly on openjdk-8-native and setup
EXTRANATIVEPATH as needed to reach its tools?

Maybe this is planned future work, but I wanted to make sure I was
configuring the layer correctly and using it as intended.

Thanks!

Kyle

