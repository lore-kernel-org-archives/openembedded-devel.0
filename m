Return-Path: <jaragunde@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 0BF3C60079
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 09:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=kVHZJ7VNAJDjprj3187E89q97sOTq+gg0x0yHh+a9kw=; 
	b=KOnj2QRu75D1CmP/ZlBKTB56nH7U+j3JqDOTREMrARezsm+g1Y+NQZe73K1p/IGnpAL/U/NZx1EZB545OcnC7fEJJaU7e1i6Yc36GSnA99icPQz42WOAoV7+7Zb9AjOr8dHr+qmRbsESjUOG9UISOiiHT8UJyDBrVLl7SKklhRyCpNfOpWJa2P/TCoUoI2ufdkT2BzrSgSvudcAlVaCs4zA4YzsDXanZfh0FC/aXrWzyYU60m1UI9oSrG5AY0i2bJoOJXVDShXd4PImvhVy5LprHY2DV2Pf1ZwMrwwGACa4LqLkOSAXPplmKAeyZy27l5a/pH9lg3ALv/Ak3wCtn1A==;
Received: from [192.168.10.193] by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1e80ni-0005lK-6b; Fri, 27 Oct 2017 11:19:38 +0200
To: openembedded-devel@lists.openembedded.org
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
	<CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
	<4e71f40e-63cb-0857-f292-ec3a120776c1@igalia.com>
	<87d15w4a02.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAHUNapSvuLFcVyjc+FB4cG7U753SeedOfJ5xCtFLCx-+fK0QVQ@mail.gmail.com>
	<1507662641.20629.9.camel@intel.com>
	<CAHUNapRps8ck3S=aKHYH3UmzBgsZW-VDx4x0PgY2D4zXuh88_Q@mail.gmail.com>
	<87r2u93f1r.fsf@rkubodac-desk.ger.corp.intel.com>
	<b8acd1ce-4c60-ac3d-4c48-fca5d9b43f26@zonque.org>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <26a54d7c-1c81-8ba9-9d1f-3a62803a85a8@igalia.com>
Date: Fri, 27 Oct 2017 11:19:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <b8acd1ce-4c60-ac3d-4c48-fca5d9b43f26@zonque.org>
Subject: Re: [meta-browser] Modern Chromium with GN
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
X-List-Received-Date: Fri, 27 Oct 2017 09:19:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27/10/17 10:49, Daniel Mack wrote:
> 
> I'd like to give Chromium 62 a shot on arm64, but the recipes currently
> only support x11, is that correct? My platform is based on wayland, any
> plans on supporting that?
> 

The problem is that upstream Chromium does not support Wayland natively
yet. There is a fork under development to implement this support, which
is quite advanced now: https://github.com/Igalia/chromium

Patches from the fork will start pouring into upstream Chromium shortly.

-- 
Jacobo Aragunde
Software Engineer at Igalia

