Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DD0BA7D6B5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 11:23:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 454TYx5qbtz9m;
	Thu, 16 May 2019 13:23:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558005798;
	bh=pixpMtHiaQupz8yWQuPdXND8PyiDTQ9XKpMDSu2cuwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EmFyBFYJPRuqsAj3eZsKscAZdTW+RldosgF3jnD7M82uGU3oM83TfbN5KVOONQyRz
	wT+Hot83LAl4shXLHorabOueOjeza+v3gx5K4RRnAaF/zSF7hRuQfiXz9UBhPqURpu
	2/1jg93o8NoI4UcolXrn7L/q8ewQ41PPwAcrcLegsNrJtPc0XkOjOQX9H/RHlUcs96
	kSzbTK/4XJlhKTwIxLSER9PV0pQaUbTbiZc3Gv1ymPvQBXz/1BaoMAVk289gTcG0/B
	yA7ABchkTn0t+PsZ86SRlScOueHzuM4/OyjHaRtjXirund8fsSoogRE2DgGgGyPQrQ
	4KZizobIbBh4CKmdVn8WIM8AMotS9pHzpREFZbpe1G6GwH9EKfpSn+WiGd5X6eXhTb
	WZXiImB8NPravnu/baSQ/EftflrBVnr1WPV3aVU7K35nXcuz415DLrXGZ7ubtMVIX9
	81XdlvUvn9fZf5nQ2atXKs/kmopHTUGuBVGdeNpwjuRTwO83ktgIZNSZGUh4yFq0Jb
	qQTJQNJwHRHh8GqdyCJChRiyIODh5ZIb5EU6WgQHd43KJuyX2P/kuFB3ohLUMfvIzs
	HjcwF4u8XJpIc5xzBvQEIJGt6p+i/rBl8E0+9pThGLIoVdEp5zZws1TyB/TacOyO44
	VvftrUBbYdIvOR7cJDP0Ahug=
Date: Thu, 16 May 2019 14:23:15 +0300
From: Adrian Bunk <bunk@stusta.de>
To: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC@Cisco)" <oobitots@cisco.com>
Message-ID: <20190516112315.GA17876@localhost>
References: <036838bbf1cb46dc9c9e3b16bd8027a0@XCH-RCD-007.cisco.com>
MIME-Version: 1.0
In-Reply-To: <036838bbf1cb46dc9c9e3b16bd8027a0@XCH-RCD-007.cisco.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] protobuf: Fix ptest compilation
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
X-List-Received-Date: Thu, 16 May 2019 11:23:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 16, 2019 at 08:57:04AM +0000, Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco) via Openembedded-devel wrote:
> Tests require c++11 support, so add -std=c++11
> to compiler flags.
>...

What compiler are you using to compile for your target?

The description sounds as if it would be gcc < 6.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


