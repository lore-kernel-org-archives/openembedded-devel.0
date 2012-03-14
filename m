Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1S7laA-0000ng-95
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 11:37:26 +0100
Received: by bkcjg15 with SMTP id jg15so1222643bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2012 03:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=mBvF6Ga+EPVausw9kSnhNV1rbN8GPhKRngNECbNY7HY=;
	b=KBl+tclCzjj4w5/2c+ts+NUrrFg31NqQpytWZjOYUUVMeraLVQ0BFRbIxEHR6ZRtez
	ILx6MRCAOA5Di4Yh7HNSezaajdeQv1mqeG2A+TEnTJXEWQXp3/i1dpvHkrF7Ij21/Leo
	XIwO87PK8NGjliNg4Cj4q0eoDuezeXStJJnE1tnVFnBvEDHwEV/hVRVpuENzWKuCZqoS
	lGy9ZPRRZwU6xqsBwycr4EQbthgRAxwr2A9uKGGlOpiCsP7hFeDxyOLaZpnRYtsE/+cn
	is6QbQrq4g1dT9RHX3FU5uEnaYFV/DiHmkqIq3ghKdqJSzCYuLoXpOHyhAarrm2jliuN
	+jMw==
Received: by 10.205.130.1 with SMTP id hk1mr712280bkc.140.1331720921009;
	Wed, 14 Mar 2012 03:28:41 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id r14sm6886706bkv.11.2012.03.14.03.28.39
	(version=SSLv3 cipher=OTHER); Wed, 14 Mar 2012 03:28:40 -0700 (PDT)
Message-ID: <4F6072D7.6080300@dresearch-fe.de>
Date: Wed, 14 Mar 2012 11:28:39 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: Tom Rini <tom.rini@gmail.com>
References: <cover.1330097955.git.sledz@dresearch-fe.de>
	<562d0d44a950d86ec19d98621d837e4a227db73a.1330097955.git.sledz@dresearch-fe.de>
	<20120224202626.GA14969@bill-the-cat>
	<4F605D42.6020109@dresearch-fe.de>
In-Reply-To: <4F605D42.6020109@dresearch-fe.de>
X-Enigmail-Version: 1.4
X-Gm-Message-State: ALoCoQmdwoVuIJ86/JSokvoepd6WFg+SWmWgbrzj1/aWegnBjmvQ3odFi6Q0NHedP+Z4NFVlGvYE
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 2/7] fakeroot-native: update to 1.14.5
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
X-List-Received-Date: Wed, 14 Mar 2012 10:37:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.03.2012 09:56, Steffen Sledz wrote:
> On 24.02.2012 21:26, Tom Rini wrote:
>> On Fri, Feb 24, 2012 at 04:47:19PM +0100, Steffen Sledz wrote:
>>
>>> * version 1.9.6 is no longer fetchable
>>
>> It _IS_ fetchable if you use a versioned string on snapshot.debian.org.
>> Please use this instead (and we have an example or two already, possibly
>> even for fakeroot I'd have sworn).
> 
> I tried to fetch from <http://snapshot.debian.org/archive/debian/20080803T000000Z/pool/main/f/fakeroot/fakeroot_1.9.6.tar.gz> but this resulted in an checksum mismatch error. :(
> 
> ERROR: The checksums for "/home/sledz/sources/fakeroot_1.9.6.tar.gz" did not match.
>   MD5: expected "9441c981bfd4e521abcd5d93385f71d8", got "2f1c02c186eb34f29a15cef8c33ac6e4"
>   SHA256: expected "06c2772ae6e446227f6798ad8994fcdb1fe64385bc83a34f7e29fd8af2e4f5da", got "55b727aa5c8bac0447504c1e7fd7308b80b8a193913b4bc604cf6c3bc6d042b0"

Forget this!

There was an old file with the same name and some XML content in the sources dir. After cleaning up everything worked well.

Sorry for disturbing,
Steffem

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


