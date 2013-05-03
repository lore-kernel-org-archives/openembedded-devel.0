Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UYGyR-0002df-Iw
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 16:28:37 +0200
Received: by mail-ee0-f43.google.com with SMTP id b15so777641eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 07:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=WObDqSQC5AYeaHhhCXeqwQm8at+VbVfBCRvsY5pl13k=;
	b=bnCKU1nDRd+T5662KZJtJSxInRKchYY/f4lcDrnMmepUliSNyF6Wy7EvCH80g14weB
	kcoDLrXWE9GYdlxh/MXglHcutZNUKzug/Aco5OK3qeSEaVtvm+BtHFQg3hgpsJX4D/fK
	6sf8ziC9QPk/IrRuQbx16iJ0ij23vvOXJuaTZrCp3kjaXwY43smFwXP/2upsbZ9yJel3
	xTI3QJ2Jn5FYqVBmC+ff6CBVhGETKx1+eMOQBrbzmPJQibBmLcuAKboJlA3WeiHJx9Ap
	/cZNzeObREaurlEpj7pJoVlBhqjxzzFRjqg1LTIZTZFaarfoWKWwD02C6Lmp6xf0P6QN
	bEDQ==
X-Received: by 10.15.36.135 with SMTP id i7mr31753177eev.34.1367590240290;
	Fri, 03 May 2013 07:10:40 -0700 (PDT)
Received: from ?IPv6:2001:610:612::dc8:274f:2522:bd85?
	([2001:610:612:0:dc8:274f:2522:bd85])
	by mx.google.com with ESMTPSA id c44sm12783443eeb.4.2013.05.03.07.10.38
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 03 May 2013 07:10:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1756231.MGNYtfpC2x@helios>
Date: Fri, 3 May 2013 16:10:40 +0200
Message-Id: <576F47F5-73BA-4369-9A2E-666939097E0A@dominion.thruhere.net>
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
	<68356141.McDxtR3Bre@helios> <517BA9C6.6090707@balister.org>
	<1756231.MGNYtfpC2x@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQlYsxTR+pS36RG3R0rkm5qxDv3WJzOX/cm/8Yv+zYxbqJHE7pgq6UjK86x238Oz3DSl3Tdm
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] smartmontools: import from OE classic
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
X-List-Received-Date: Fri, 03 May 2013 14:28:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 apr. 2013, om 13:13 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Saturday 27 April 2013 06:34:46 Philip Balister wrote:
>> On 04/27/2013 04:24 AM, Paul Eggleton wrote:
>>> On Friday 26 April 2013 23:41:38 Koen Kooi wrote:
>>>> And do you really need a .inc?
>>>=20
>>> Are we removing inc files if they were present in OE Classic? First =
I've
>>> heard if we are...
>>=20
>> If we are trying to reduce the number of versions of recipes we =
carry,
>> dropping .inc files would seem to be a good idea. I don't have strong
>> feelings, but it seems like something we should consider.
>=20
> I agree we should try to keep only one version of each recipe in =
software=20
> layers, however I figure it makes it easier for people to carry their =
own=20
> versions of recipes in distro layers (particularly older, which may be=20=

> required in certain circumstances) if we do keep inc files where they =
already=20
> exist.

Can people raise their hand if they want to have a different version of =
smartmontools in their layer?=


