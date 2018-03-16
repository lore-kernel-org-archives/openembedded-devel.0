Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id A3A0777F90
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 17:56:22 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id w12-v6so6367063plp.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 10:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=ErnusRJ04fqK4PXY5BhTb31IPBCb7xySFYR2DBw6aB8=;
	b=BCNwZvfRuri49sj5HM97n3gCQxLiNSnSN2uDDRZ9K5cTx4mFcc4RS1utP5F6/0PKXq
	I48qc1bSanDsBYhS5obsOu1f55WiY8s+I+bO61VC9AFEJvzW07Lf1wekUdmPKCyWW4x8
	LnfjnGMh4t8Ddy1SnezPPZI6OYtq7rF4i1GvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=ErnusRJ04fqK4PXY5BhTb31IPBCb7xySFYR2DBw6aB8=;
	b=A9ZNJ7t+CTLiFIcmrrjs7Zh6eIjBF8ocgansPeziqVyGEQyC5VkM8pUFb1CXA9NUop
	wzxbO7knLhGdZzV/DIJEuo5bbKTeDc+R0446B0CVcnkqhmNzT07KNGCJoc+8NgjO4i0r
	d8WZbtyBALbsoOYAgGJkD/s0jWzrSg1nJHYWYRuxXZpsYEtTmAacnf8c0dsIxWfT8CSZ
	dD//2V62pY12lpHkrB6Y6ebzA1zviTX4Z0pZV23e/E0ZzZNhHJmNUk2AOugrY2WwoaO9
	DgsWikBRaS/FQlG1Fbj5CpBZh6ZuyCVdq6LHUccf9Pv6IhoyIp3a0Kk/HZIAv40AekLH
	FyaQ==
X-Gm-Message-State: AElRT7H5GIWbepyAXzcG+l6c+10ibkd4lKPuoEggGqLqRH6/nWpdtAoJ
	yl7St6LUoOcE+kLJwg6GkGJLDVf0D1I=
X-Google-Smtp-Source: AG47ELtDfyEwpTWUy/aA5bXq6Htj8sc/Y2qTawi6v3/6IgFWxdBuxkhoe/5+Bk25doOJjw+Hl6W5Uw==
X-Received: by 2002:a17:902:bd4b:: with SMTP id
	b11-v6mr3035310plx.225.1521222983754; 
	Fri, 16 Mar 2018 10:56:23 -0700 (PDT)
Received: from [192.168.17.68] (50-39-175-47.bvtn.or.frontiernet.net.
	[50.39.175.47]) by smtp.gmail.com with ESMTPSA id
	c11sm19495449pfe.109.2018.03.16.10.56.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Mar 2018 10:56:22 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org,
	yocto-infrastructure@yoctoproject.org
From: MIchael Halstead <mhalstead@linuxfoundation.org>
Organization: Linux Foundation
Message-ID: <608c81f2-6c48-a68d-aee9-d85f8eae65f0@linuxfoundation.org>
Date: Fri, 16 Mar 2018 10:56:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
Subject: [Infra] 1 minute unplanned outage http://layers.openembedded.org
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
X-List-Received-Date: Fri, 16 Mar 2018 17:56:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The layerindex was offline between the following times:
Fri Mar 16 17:40:17 UTC 2018
Fri Mar 16 17:40:57 UTC 2018

The webserver failed to come back up after renewing the SSL cert and 
routine updates due to failing pre-launch configuration checks. We will 
avoid this in the future by running configuration checks in a test 
container before restarting the webserver.

-- 
Michael Halstead
Linux Foundation / SysAdmin

