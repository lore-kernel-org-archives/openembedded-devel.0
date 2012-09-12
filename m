Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1TBjhB-0004Qs-F2
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2012 11:57:40 +0200
Received: by eekb57 with SMTP id b57so1001070eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2012 02:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=arITa0MCviD59nIWbiK1VcTclgy8d/Kr9mTjmWLU6z4=;
	b=gUwx47ys0MZkRmMjGI5BHZSXQFo2gNfiTLkOjphc0e+AwqcZHzblqeVfAidgfrb+Yv
	8oHjjcdIA6gFm/7nvHKtHigMT7R8Hk77paiibJcQFy/gVDo+xStX9y2FVQkRTWtNjWtn
	FiVuE9TBb2ucRCc86TIVvddYh1MRaIpt2WsL+6BGjsTvp0v3AoSHHmwUAyYbQuStjhdu
	GN0l/O0X57Z37ib2zVzFRgd140spdQDhP5VFQ/bldE+kJj2pVqvFKeZMNamzZB4Q+QLK
	+CYxG87ZzesXb29L1xUetbdqEZHGXyIv0ro2Lfgp6KnkRRjLgm2l1aCDuOSGVp5hTWry
	dabw==
Received: by 10.205.135.146 with SMTP id ig18mr5527228bkc.80.1347443089258;
	Wed, 12 Sep 2012 02:44:49 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de
	(ip-77-24-151-199.web.vodafone.de. [77.24.151.199])
	by mx.google.com with ESMTPS id hg13sm11279335bkc.7.2012.09.12.02.44.46
	(version=SSLv3 cipher=OTHER); Wed, 12 Sep 2012 02:44:47 -0700 (PDT)
Message-ID: <5050598C.2010805@dresearch-fe.de>
Date: Wed, 12 Sep 2012 11:44:44 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120825 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <504D81F8.9020702@dresearch-fe.de>
	<1347367374-10517-1-git-send-email-sledz@dresearch-fe.de>
	<CAJTo0Lahx_1K64aBhag10RN=jSE+fz=APC9HnCwp-zxyb0-qgw@mail.gmail.com>
	<2875794.FvkJFEeAV6@helios>
	<CAJTo0LY5GyeesgKbsgjX8zRZSTrH=41UUey_9vGWg20A_fd-Gw@mail.gmail.com>
In-Reply-To: <CAJTo0LY5GyeesgKbsgjX8zRZSTrH=41UUey_9vGWg20A_fd-Gw@mail.gmail.com>
X-Enigmail-Version: 1.4.4
X-Gm-Message-State: ALoCoQmi9tnWxrih4d/HNiA5Dnm6QRCsU/+NyUU9C2jTSLSvQN9isRa9YPHiJLk0l4zyHc1QfHE2
Subject: Re: [2011.03-maintenance][PATCH] gdk-pixbuf: add missing dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 09:57:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.09.2012 15:39, Burton, Ross wrote:
> On 11 September 2012 14:03, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>>> oe-core master has 2.24.1 at the moment, is there a good reason why
>>> meta-oe is hanging onto 2.10.14?
>>
>> This is the OE-Classic 2011.03-maintenance branch. I was surprised too until I
>> realised where this was :)
> 
> Oh, wow.  In that case I recommend either patching out those
> dependencies instead, or upgrading to a more modern version of
> gdk-pixbuf.

This is a maintenance branch. Tom normally does not accept upgrade patches if there's no critical problem it fixes.

I just wanted to fix a build problem introduced with Khem's commit.

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


