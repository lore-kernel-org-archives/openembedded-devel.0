Return-Path: <jaragunde@igalia.com>
X-Greylist: delayed 2006 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Oct 2017 16:08:43 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id AEB5572F91
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Oct 2017 16:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To;
	bh=xUrU70aHCg8Ug3gUYH/BO2smlwXDwobu0YPIp0iGA68=; 
	b=rPSJwWnA5eSMax6TqjiltqXBSvdCfcIuVSJsFT3qKjjYUrv4cnX9JbjoB73O5LYy3VjWDwIB4Hu5zUlGfHH/Jeq0xffJ8RPOrsnCn9KoGGttxcx9Sppf3hvuuMb2MslQtknzNA7/W11GJCnMshV886Eh+fkqwWQ4V7MM22IGYAn6AV9T/Gy4gXbEHILavINNb5RelHJIvnZsiOYV2Ud14ivN/2n9B7EMdNGBZzmxBZdAlnUlve1lvgOCqZJq2WqnJ5lJyQ16lFDHFAWErlUhzO5D4S1Z1ALrbs6lia7n+A84G3aKzLCHRy0S0V9NlUmAZ9qH1tbpQsp1ELIrf9KI6Q==;
Received: from [192.168.12.149] by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1dz2kY-0002vz-3e; Mon, 02 Oct 2017 17:35:18 +0200
To: Trevor Woerner <twoerner@gmail.com>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
Date: Mon, 2 Oct 2017 17:35:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [meta-browser] Modern Chromium with GN
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
X-List-Received-Date: Mon, 02 Oct 2017 16:08:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Trevor,

I think you spent some time trying to get a more recent version of
Chromium for meta-browser but it's been difficult. I have booked some
time during the Web Engines Hackfest [1], happening now, to try to do this.

I recently learned about the usage of custom toolchains with GN, whis
are the proper way to configure Yocto's toolchain on the recipe, instead
of using the `cros_*` flags like we had done in the meta-browser fork I
previously pointed you to. That's the approach I will follow.

I will send patches as soon as I have something!

[1] https://webengineshackfest.org/
[2] https://github.com/Igalia/meta-browser

Best,
-- 
Jacobo Aragunde
Software Engineer at Igalia

