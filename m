Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA107ED46
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2019 08:04:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46hZgb1q7Nz87;
	Mon, 30 Sep 2019 10:04:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1569830684;
	bh=fo4zTcqPskVpsPPq9KeczF+QGUuI8CiU0xo/IaIdRDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W/PpfFt3aLKnOBzazaAp34iPTIvVpGGx6pWXG8CXOJL4eBAXB1EWs3tvr/0qbB4Xf
	2KlAiyHDvmZ7NbjjjeLHQZeFy7KZZvmVzRqAc3i2q8b2gBy64TOT1nz5DAtFip/4CS
	eEQV+ujFBtofO9TKlDpRvxekLH5KEM1A+t4LDzxFqa+/yqEjqFQv+BEh3/glKSBlDH
	zq6eNPNebv9enIGOYi1wNRutrCf6ZCijiNCVIcGRf4PZvtlFQQ1yh8W8v6TbDc7NLw
	HG/kj9G710RCudLDgV8KQRgiTeo1o4s0/zAjetuXuGLbXZLYZe5JgnjtzZRSBnvie4
	dGH/3lH+wSiG8/ih1NIKziMhdh6IW8Yv6mzoSFAmMW4rqHS+EJQ2jjuJRXs/LFGkm8
	M30CGYIwCXLxxGA5AK5/ZY413hs6X7mzQQdbAV3JX/x3PlEJwg1u2vaD7Ak0t5qc9j
	43wuJQxt7sNH+B2IlhqjV/qkUKyisgG0djnAz+Fpl9DmPbb6I5cl7ZOwmoqhJpXXdv
	gxEdGz+Na6EXXGmNyVaXeXeEFwrWOoR8v+95+eeiNsau/Fx7lOo+xTMOIn39KCCiga
	hitoM+QOJWM9b4fa5qsCQqN6u/+a1t+veevqg2UCYeZ7gecrQ5lQKssavhnoYxe4zr
	tn8PEV6yY8R6FSMSQCmjGQ1I=
Date: Mon, 30 Sep 2019 11:04:41 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190930080441.GA31191@localhost>
References: <cover.1569801183.git.akuster808@gmail.com>
	<6748bb66d50cab6acb56a0c4596d9d3c7650e4fb.1569801183.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6748bb66d50cab6acb56a0c4596d9d3c7650e4fb.1569801183.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior-next 06/10] klibc: Fix build with 5.2+ kernel headers
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
X-List-Received-Date: Mon, 30 Sep 2019 08:04:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

This and the other 3 "fix build with 5.2 headers" patches are all for 
userspace code that uses the UAPI kernel headers that won't change in 
warrior, so these 4 commits are not needed.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


