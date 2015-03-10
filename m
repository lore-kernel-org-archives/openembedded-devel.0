Return-Path: <sledz@dresearch-fe.de>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 40CB473A6D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 14:38:51 +0000 (UTC)
Received: by wevl61 with SMTP id l61so2278543wev.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 07:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=9BzSWzQVudIOAUCj4VZ4Y8b2GU0e/r7LNuyIfVS44yA=;
	b=Ob51dcK3RQWHx13irGRWwMCoGBPq9ypiCF6T4nsfZ8GDuveeNwgPnRyGfgsS+Bfahw
	v0ituQJR11EQbiSVBqOtLZKmugbQBV8fVLRsDlTgskyINhLAd9IPMDCQB7ULFD3BNWV2
	5hyKCD9AobM72zexRC170bbNB/8v/UcZCdawtPe2Rew+JyIuhmDdDDo4h3KNibax46H2
	LNrE2H7GVCm5eeyQ2bIz8hXbno0etpY5jGDAfewvUhg2xgFpTdRxMQlVAtLuPTVc45Pa
	0rfijG7NAkGTZEnEfZ+szaBSTYzDY9CpvUjNetf9qLAKEpl1Y/OfOt3eF4ksTF296/3a
	WEig==
X-Gm-Message-State: ALoCoQmcyokp3e3ZDTokYk1lynCp8+VNWtZI/MWCSDnqsgJanRlyWpVi6gdP+TkAxOrpVwZeAHIr
X-Received: by 10.194.59.112 with SMTP id y16mr70835755wjq.36.1425998332763;
	Tue, 10 Mar 2015 07:38:52 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id q10sm2147529wic.5.2015.03.10.07.38.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Mar 2015 07:38:51 -0700 (PDT)
Message-ID: <54FF01FA.4040403@dresearch-fe.de>
Date: Tue, 10 Mar 2015 15:38:50 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <54FD8999.4030303@dresearch-fe.de>
	<FAE79245-0EDA-4219-86E5-A3950BDA7682@dominion.thruhere.net>
In-Reply-To: <FAE79245-0EDA-4219-86E5-A3950BDA7682@dominion.thruhere.net>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	angstrom-distro-devel <angstrom-distro-devel@linuxtogo.org>
Subject: Re: meta-angstrom commit 75f0f25e breaks build of opencv from meta-openembedded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Mar 2015 14:38:52 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 10.03.2015 14:50, Koen Kooi wrote:
> 
>> Op 9 mrt. 2015, om 12:52 heeft Steffen Sledz <sledz@dresearch-fe.de> het volgende geschreven:
>>
>> Commit 75f0f25e55f0745a011640b5c81d88be99366f45 in meta-angstrom/recipes-tweaks (branch angstrom-v2014.12-yocto1.7) introduces version 10.5 of libav.
>>
>> This version does no longer provide defines like CODEC_ID_H264 which are needed for opencv 2.4.9 from meta-openembedded/meta-oe/recipes-support (branch dizzy).
>>
>> ---------------------> snip <----------------------
>> .../tmp-glibc/work/armv5te-angstrom-linux-gnueabi/opencv/2.4.9+gitAUTOINC+df8e28283f-r0/git/modules/highgui/src/ffmpeg_codecs.hpp:104:7: error: 'CODEC_ID_H264' was not declared in this scope
>>     { CODEC_ID_H264, MKTAG('H', '2', '6', '4') },
>>       ^
>> .../tmp-glibc/work/armv5te-angstrom-linux-gnueabi/opencv/2.4.9+gitAUTOINC+df8e28283f-r0/git/modules/highgui/src/ffmpeg_codecs.hpp:105:7: error: 'CODEC_ID_H264' was not declared in this scope
>>     { CODEC_ID_H264, MKTAG('h', '2', '6', '4') },
>>       ^
>> .../tmp-glibc/work/armv5te-angstrom-linux-gnueabi/opencv/2.4.9+gitAUTOINC+df8e28283f-r0/git/modules/highgui/src/ffmpeg_codecs.hpp:106:7: error: 'CODEC_ID_H264' was not declared in this scope
>>     { CODEC_ID_H264, MKTAG('X', '2', '6', '4') },
>>       ^
>> .../tmp-glibc/work/armv5te-angstrom-linux-gnueabi/opencv/2.4.9+gitAUTOINC+df8e28283f-r0/git/modules/highgui/src/ffmpeg_codecs.hpp:107:7: error: 'CODEC_ID_H264' was not declared in this scope
>>     { CODEC_ID_H264, MKTAG('x', '2', '6', '4') },
>> ...
>> ---------------------> snip <----------------------
>>
>> I'm not sure if this problem occurs in the master branches too, but the dizzy/angstrom-v2014.12-yocto1.7 branches are unusable for some of our applications beacause of this problem at the moment. :(
> 
> Sorry about that, I looked at that this weekend, but forgot to push the patches to meta-angstrom. 744d6439175058909002d1e22439e93945d53e22 should fix the issues you are seeing.

Yupp. Fixed.

Thx,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

