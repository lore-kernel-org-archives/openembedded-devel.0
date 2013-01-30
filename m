Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1U0Toz-0004hk-2C
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 10:19:22 +0100
Received: by mail-ee0-f54.google.com with SMTP id c41so689111eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2013 01:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=x5D7XZuWz5eyKGHiGlE4CI+5nTIy8lYWTINbjVqEiZU=;
	b=eUm+cYX1c+L6tbWVm0+AXLyzVEavnsVpTGaa/jIj4WlY7cat0i5bo9cNotdIXrOW5Y
	OIyPlr7/iYcRdZV2SofUWFaB3GaUNRQOplgN267qD6MIlMUtHWjEMRiFK2dGWAIl5Gwq
	Gkg9yO9FvEYgKZ2MSoUOZ7fq3ZgUeq/fdn0FivW6Y8eS/yc3rDrdydeipmfcpVSXTauh
	LNE7s59u995H79tc1sZLwp+9Ta2vUrRUKs+ZcQHOr1VmFSE9BIkOJVLF45h7msDsDT28
	CBhrxwvGMAZOuqJymPNEAg1IXWtYJeLGOSHPPwXoco+sdueDFD3E6+iVTqx3gRdONWBh
	mQvQ==
X-Received: by 10.14.198.198 with SMTP id v46mr13267100een.4.1359536608156;
	Wed, 30 Jan 2013 01:03:28 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id h5sm952959eem.1.2013.01.30.01.03.26
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 01:03:27 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130130095127.29acc1c8@e6520eb>
Date: Wed, 30 Jan 2013 10:03:27 +0100
Message-Id: <4BEA8945-4DD7-49A2-9AAB-6B98C4074F4E@dominion.thruhere.net>
References: <1359532955-16954-1-git-send-email-koen@dominion.thruhere.net>
	<20130130095127.29acc1c8@e6520eb>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQnAmZwutMqCfMFo+eR7sCcD10wnKsf4MRm1QKCdrMrDWehnT3yr9yNhrTuPxYTdda85uIBs
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][[RFC][PATCH] nodejs: add 0.8.18
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
X-List-Received-Date: Wed, 30 Jan 2013 09:19:27 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 30 jan. 2013, om 09:51 heeft Eric B=E9nard <eric@eukrea.com> het =
volgende geschreven:

> Hi Koen,
>=20
> Le Wed, 30 Jan 2013 09:02:35 +0100,
> Koen Kooi <koen@dominion.thruhere.net> a =E9crit :
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patch
>> @@ -0,0 +1,27 @@
>> +=46rom 8891cb4cae57a6b7db54edb33a43743c4b09c53a Mon Sep 17 00:00:00 =
2001
>> +From: Jason Kridner <jdk@ti.com>
>> +Date: Wed, 7 Nov 2012 14:43:55 -0500
>> +Subject: [PATCH] Enable NEON
>> +
>> +Read this was necessary on a blog.
>> +
>> =
+http://www.code-with-passion.com/2012/11/07/cross-compiling-nodejs-and-no=
de-modules-for-armbeaglebone/
>> +---
>> + deps/v8/build/common.gypi |    1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/deps/v8/build/common.gypi b/deps/v8/build/common.gypi
>> +index 7a780cc..237f53f 100644
>> +--- a/deps/v8/build/common.gypi
>> ++++ b/deps/v8/build/common.gypi
>> +@@ -29,6 +29,7 @@
>> +=20
>> + {
>> +   'variables': {
>> ++    'arm_neon%': 1,
>> +     'use_system_v8%': 0,
>> +     'msvs_use_common_release': 0,
>> +     'gcc_version%': 'unknown',
>> +--=20
>=20
> How will that behave on CPU without neon (armv5 for example) ?
> Did you test it on qemu for example ?

Same as on armv7a as it turns out, a noop :) Dropping the patch. I =
should learn to never trust blogposts from people running ubuntu on arm.=


