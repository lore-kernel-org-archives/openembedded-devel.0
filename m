Received: from mail-gx0-f213.google.com ([209.85.217.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NqW6K-0005me-4k
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 19:30:16 +0100
Received: by gxk5 with SMTP id 5so943420gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Mar 2010 10:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NcjJj1OFaqysuoq9Qb0KLYARu4r48y5H/2OEDhNkWLE=;
	b=C1CJxkWCxNXgAce5M6TJ1thtOCAqkNdV5MVXt4cfiV2mS6bPaINCdYZja0l3iwPl3E
	oEb+LFTtdgmdKKfKDL7zggv6d2Yl05VibEVOZMUXUEyROZL6iOwsiuRVLFWIidRhTkbR
	v/WNCubb81LR0CquBgoUfy71oYKBFF8nclx4Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=o8hF41MzSw0P8x4na/6F5X3WUoYxgKCINnjTvFUOxouJTkolc6S+h+SHR9ggtQKkPj
	B32JYftdW9sp9A7aP31ciBSTGIS7LVCIoOv7T0igqDcAn66/WIKjnm7zc68aWpIvgTtT
	Tx+D9zWp25j2loeYDgbU30tOtIAU3B3ZOWrmU=
MIME-Version: 1.0
Received: by 10.101.151.2 with SMTP id d2mr1779372ano.33.1268504834381; Sat, 
	13 Mar 2010 10:27:14 -0800 (PST)
In-Reply-To: <4B9BD33E.502@zenlinux.com>
References: <1268465302-3725-1-git-send-email-sgarman@zenlinux.com>
	<19c1b8a91003130002g55d34a65l9858e5ae62062eb3@mail.gmail.com>
	<4B9BD33E.502@zenlinux.com>
Date: Sat, 13 Mar 2010 19:27:14 +0100
Message-ID: <ac9c93b11003131027m21a1fefcyfd62d4128630d30a@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.213
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sed: migrate -native to BBCLASSEXTEND
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
X-List-Received-Date: Sat, 13 Mar 2010 18:30:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/3/13 Scott Garman <sgarman@zenlinux.com>:
> On 03/13/2010 12:02 AM, Khem Raj wrote:
>>
>> On Fri, Mar 12, 2010 at 11:28 PM, Scott Garman<sgarman@zenlinux.com>
>> =A0wrote:
>>>
>>> Signed-off-by: Scott Garman<sgarman@zenlinux.com>
>>
>> can you also convert other native recipes for sed to use BBCLASSEXTEND
>
> Yep, that was my plan. Although there is only one other sed-native recipe
> for v4.1.1. Should I just convert that one, or is there also any value in
> adding BBCLASSEXTEND =3D "native" for the two other v4.0.x recipes?
>
Are the 4.0.x recipes or 4.1.1. of any use ??
to me sed seems typically something that just does its job

FM


