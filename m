Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 551E5719CF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 06:16:12 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id d2so45826943pfd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 23:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=VjYciyvpeIstfc20L5nD5CaTDmVImLKUrUoVWq/j4CE=;
	b=z1DBoXLkU2c7vb0Su0Qjhkph9nbnVbXrOIn7fUc8rc20sOTJ/OFX3GZqVOeDPvJVOb
	C7IhG3NdrKuv4np4/mCDNFrE4LHsKooo1+pZTusvo68COWjxq/qgXuv7gPrcmhiaD+FZ
	Wvvft6nNGvyfsGZnugW2n3n2eLd5An7QNUj8s9AUg3Uacu/4X2xc/K3aLj0RHvfzgurk
	W/WUfiZoDPJGY3iMh+xCqObwK+yS1vcA8GtT8nq3agnNUYvE5BzOj6snhzzbZrONp80q
	g26sPRGwgvFPaRqwcG98Ay4l1cu0Nz8OlXMIKKKcWvbxL0unYklo4y4FsX25rsN4kAC5
	+fLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=VjYciyvpeIstfc20L5nD5CaTDmVImLKUrUoVWq/j4CE=;
	b=YK4Nq36C3BYOvxycjQ2Y6KhFrGIJkPSTmrenp0Z+wBM4betXtR0s1pf93ygCaGMWEg
	rcJUPXwDZMOizRghVuOFEmZ0mFU6Kc+tnNlOxdLJXaOFh+3KAI/2vkxg17gISX68ZDVb
	klmbbEmn5GRyXN2NuOmHKNK57d6zQby4Jl17xLOk1NuwyxcQ/0jc3LF764StVNKLKA7w
	mG54OyERuEf76n/8xlqiYN/kD+7C2xG1t8UGBBZolpngYbdU+5GPjzXIyoZajGF/hVBh
	vcEbbSZcKnjE8dP1vDM8jBRBkSE5WDT6S5bwYolB/z93yOhYsFZdFrJ6oBoKbJJAJKl5
	zstw==
X-Gm-Message-State: ABUngvcgQF30SXqBCl1aA7YYpttf0H42lfMmZYKKnhuU9Wo7uAD9JN00SDrrMEqOauORWA==
X-Received: by 10.99.7.210 with SMTP id 201mr19672877pgh.51.1478240174005;
	Thu, 03 Nov 2016 23:16:14 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:805d:6344:9917:92f9?
	([2601:646:8882:b8c:805d:6344:9917:92f9])
	by smtp.gmail.com with ESMTPSA id
	c2sm17055502pal.42.2016.11.03.23.16.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 23:16:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CANx9H-BkdLaOBamyAW5BNVSDaG7ZjMHxBE0YBN9vM7D9Y7rjyA@mail.gmail.com>
Date: Thu, 3 Nov 2016 23:16:04 -0700
Message-Id: <C2899A6F-1F4A-48CA-AE72-6570456599D2@gmail.com>
References: <1478225282-27345-1-git-send-email-timothy.t.orling@linux.intel.com>
	<CAMKF1spNzuAWTGU+S_n2v8PD8yZSz8OhRfj6NwZs_Qfu3rK5KA@mail.gmail.com>
	<CANx9H-C=g=ai3AO-95nWa49+9Jv=_00AA7sBBcBXHN4OVjG_Zg@mail.gmail.com>
	<CANx9H-BkdLaOBamyAW5BNVSDaG7ZjMHxBE0YBN9vM7D9Y7rjyA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-oe][PATCH] mariadb: use faster download URL
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
X-List-Received-Date: Fri, 04 Nov 2016 06:16:14 -0000
X-Groupsio-MsgNum: 63739
Content-Type: multipart/signed;
	boundary="Apple-Mail=_647665E2-F1EE-459A-8D79-6A2084467D20";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_647665E2-F1EE-459A-8D79-6A2084467D20
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On Nov 3, 2016, at 9:44 PM, Tim Orling <ticotimo@gmail.com> wrote:
> 
> On Thu, Nov 3, 2016 at 9:42 PM, Tim Orling <ticotimo@gmail.com> wrote:
> 
>> 
>> 
>> On Thu, Nov 3, 2016 at 8:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> 
>>> On Thu, Nov 3, 2016 at 7:08 PM, Tim Orling
>>> <timothy.t.orling@linux.intel.com> wrote:
>>>> The current URL takes about 2 hours to download.
>>> 
>>> how fast is new one, do they keep the tarballs there for long time ?
>>> or shove them into archive after new release is out
>>> 
>>> 10 MB/s vs. 3.4KB/s by my test.
>> It is the same organization, just a different server.
>> We could instead trust GitHub archives if you prefer. But the current URL
>> is just not working.
>> 
> 
> And from what I can tell by browsing the URL, all the old versions are
> still there.

OK sounds good


--Apple-Mail=_647665E2-F1EE-459A-8D79-6A2084467D20
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgcJ6wACgkQuwUzVZGdMxTAUgCdEC+kgPvprbR5Xe5jNGksbJsP
DmUAnRg9oDYZM76Lq9lsonMe4N44BLFL
=YBzU
-----END PGP SIGNATURE-----

--Apple-Mail=_647665E2-F1EE-459A-8D79-6A2084467D20--
