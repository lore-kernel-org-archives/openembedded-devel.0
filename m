Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id 7823972F4E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Apr 2017 13:19:18 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>)
	id 1cvOMh-0003uH-TJ; Tue, 04 Apr 2017 15:19:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:To:Subject;
	bh=/g+ypqtDngRPozVy+y65mcD4ZbJGZ+OTmzQz850+5M4=; 
	b=WxlmxtpbXfj4tvyzIPQDLCg4XJvBUTjkyKiR7zVLlV6wqphIuuH6HXnT61jiG9icCa+eWxvwz6dj1RlC5NtHXLFw7cGdgvhNZrEj/cHaVEMfzRP56bgVne6dK1d6rnwwesZGonBbpiXlS1SRyMZJV8zDNuTVg3e8RVmC3vjOIyiiPUHQ/amS7wjH9jPhz6LmKgB2DumAPGG5pNzR+gSgi06yzX+FK1j6UCryt1nRo/2HE8DG3T2rUUydFSrTYmJtrjCM5fYYRwdf3h58XPSIJZohV1a8m38R0csWaH5UPCvNCe646YN5jSepC8JBisOmB9PbA1xC8DiqG4FUnU0Zqw==;
Received: from host-87-242-51-16.prtelecom.hu ([87.242.51.16]
	helo=s002.sicom.com)
	by mail.pr.hu with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>)
	id 1cvOMd-0001Bz-UQ; Tue, 04 Apr 2017 15:19:17 +0200
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170403170132.19588-1-zboszor@pr.hu>
	<CA+chaQeh0DU630Bp2sd+Mzk+Fq-1=h1oJveKSeSOrsGU0+8Wfg@mail.gmail.com>
From: Boszormenyi Zoltan <zboszor@pr.hu>
Message-ID: <b6d5c349-8caa-4bc7-a6d4-9de24a6a0083@pr.hu>
Date: Tue, 4 Apr 2017 15:19:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQeh0DU630Bp2sd+Mzk+Fq-1=h1oJveKSeSOrsGU0+8Wfg@mail.gmail.com>
X-Spam-Score: 1.1 (+)
X-Scan-Signature: 02d3abc61471e6dd9f9388029c518d83
X-Spam-Tracer: backend.mail.pr.hu 1.1 20170404131917Z
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Extend to kernel-module-split.bbclass
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
X-List-Received-Date: Tue, 04 Apr 2017 13:19:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Catch 22.

I subscribed to openembedded-core ML two days ago, no confirmation or
admin approval yet.

A day later I sent this series to the openembedded-core ML, the automatic
reply said subscription is needed to send mail to the list.

Please someone wake up the list admins.

2017-04-03 20:04 keltezéssel, Martin Jansa írta:
> This needs to go to openembedded-core ML.
>
> On Mon, Apr 3, 2017 at 7:01 PM, Zoltan Boszormenyi <zboszor@pr.hu <mailto:zboszor@pr.hu>>
> wrote:
>
>
>     The changes are in two topics:
>
>     Support kernel module compression, both gz and xz. It needs
>     the kmod package to be built with zlib and/or lzma support.
>     The space saving is substantial.
>
>     The kernel-modules meta-package should refer to module subpackages
>     with versions, so if someone upgrades only a limited number of
>     packages at once instead of everything, the kernel upgrade can be
>     done by typing the kernel and kernel-modules package.
>
>     Signed-off-by: Zoltan Boszormenyi <zboszor@pr.hu <mailto:zboszor@pr.hu>>
>
>      meta/classes/kernel-module-split.bbclass | 21 ++++++++++++++++++---
>      1 file changed, 18 insertions(+), 3 deletions
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


