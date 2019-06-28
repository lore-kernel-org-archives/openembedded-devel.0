Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7A26D606B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 09:43:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45ZsK46cwNz3l;
	Fri, 28 Jun 2019 11:43:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561715017;
	bh=CCm2Mw8/1sKmTITZNsfvgRqBvbhXeFZUfQ++2sXZ+5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aFMVwtgaRf68DRxgzA4r/8BCl7RK4c5UIpTPQqMr8f6iaQxaSbMEeb2j5hVwawa5I
	eU1YfcVOD09xRFLbjEITLjSg59e48Rp9N8Nx3fNbgCUCEV8bZKWIuedU5QBewORdsY
	eeqoavSAu3RoIosPWXl2k7wWXFXs60Q+IIda2jiVpoCsWRT0KrL5Jg12ufZKyiDHIx
	xaedTpOxdMHLqJbu0S9Cv/Wyij2OHQ4ChLCctOwSOxEWAqfA4K7ounXwC72US73YHy
	kD57lpX72R9q028f+fJskBLKKW8VvFRuH4+xTsUXTFTtcbTdjjiDbBrCNDXteF9uuJ
	CvbRajbRAjRMLdpcs1brI+PcR9tooZD/tv/5xEnB8crgA65I/8sBjq1Tv1id+NyI9T
	FJ6uA1cO+ZwV8igQ1HnR6ALiX8wFLSEt0PIig5XGWHxuFrzY82mCZMh82QHuZfh9SE
	apSrMFzeFVdWxmMKeXMPWuaA6WOpD8Pf8O+g5nX7va4Rl03xy+Lpsomt7exyTzsS/R
	f9aSg5BCBJS6m8uvgwr5fTQdnZrwNVxkwlZt+c0RIVRp3rqKD4XaDDYyVsxUTKe/Yj
	iC8jZ/KpEF5jMz39mDhu11rQ8q3gXDJeOFagXtPajxUJsigk5kMcFt7hLn4FmWLGf0
	ZF64aCWBzsAZVua1iD9uR2Ts=
Date: Fri, 28 Jun 2019 12:43:32 +0300
From: Adrian Bunk <bunk@stusta.de>
To: changqing.li@windriver.com
Message-ID: <20190628094332.GA18526@localhost>
References: <1561686490-12445-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1561686490-12445-1-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/6] Upgrade 5 packages build with waf
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
X-List-Received-Date: Fri, 28 Jun 2019 09:43:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jun 28, 2019 at 09:48:04AM +0800, changqing.li@windriver.com wrote:
>...
> Changqing Li (6):
>...
>   libldb: upgrade 1.4.1 -> 1.6.3
>...
>   samba: upgrade 4.8.12 -> 4.10.5
>...

It was a mistake that required workarounds in both libldb and samba
when libldb was upgraded to 1.4.1 (which doesn't work with samba 4.8).

Now that samba gets upgraded, all these workarounds should be removed
and samba should use the external libldb again.

For samba 4.10 this also means that libldb has to be upgraded to 1.5,
not to 1.6.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


