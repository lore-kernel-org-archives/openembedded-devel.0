Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UQAP5-0002TF-I1
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 07:50:43 +0200
Received: by mail-ea0-f179.google.com with SMTP id f15so537293eak.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 22:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=pT2coc9QqGclOENxoYUV/ptthfky5tiJhv2YM9XqL38=;
	b=NfQutGDz19Uk1ev/D1nQWuWRK4GPoRhpubYqd+SlXUqw6lxuUx1aGdm7JprNDhujxC
	OPO1O9XnZzZ46V4uAqoT5pzfaaiHTvPl9nlxG81P8a9l1cRfq/RRFvDRTv7izBFZqcc0
	LkXKCIzUkmiWl+QJG3CxdlYaOBXW++1gx/N+4PMq2uqbIjZePb7h63Mo1Qsx8y8pkP9B
	/cNDDFIXGdkQkben/OFLvW2M6zEtl6H09Yi26QKjMy4oPSIVKsxVfcjJCvA2aREQ9jj1
	ONUn1LtLuie1HGy1f/GO+SxqZtBbtheOOv7P8FoyAndubcY1Anmdw/MkMqLnAFWDPIfz
	40Ug==
X-Received: by 10.14.202.71 with SMTP id c47mr13008933eeo.39.1365658392901;
	Wed, 10 Apr 2013 22:33:12 -0700 (PDT)
Received: from ?IPv6:2001:610:612::71d6:d8f2:72cc:23da?
	([2001:610:612:0:71d6:d8f2:72cc:23da])
	by mx.google.com with ESMTPS id q5sm3465007eeo.17.2013.04.10.22.33.11
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 22:33:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130410220423.GH2471@jama>
Date: Thu, 11 Apr 2013 07:33:10 +0200
Message-Id: <9B4BCA43-0F29-4F57-A776-281D257DAC37@dominion.thruhere.net>
References: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
	<1365610462-29689-4-git-send-email-koen@dominion.thruhere.net>
	<20130410220423.GH2471@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkY+38n0U7FdqsRTsUkKTL/nObaHaQVQA3S+TuU0t2RKB2MJzF6JaeMqH53VctrdV6uy/8e
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 4/8] gateone: fix html5 feature check
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
X-List-Received-Date: Thu, 11 Apr 2013 05:50:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 apr. 2013, om 00:04 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Wed, Apr 10, 2013 at 06:14:18PM +0200, Koen Kooi wrote:
>> The BlobBuilder and Blob checks never succeeded, even on cutting edge =
browsers. Nudge SRCREV forward to drag in those fixes.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta-oe/recipes-connectivity/gateone/gateone_git.bb | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb =
b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
>> index 652876f..8133cf9 100644
>> --- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
>> +++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE.txt;md5=3Dee5b168fc7de89a0cadc49e27830aa2c"
>> PR =3D "r9"
>>=20
>> PV =3D "1.1"
>> -SRCREV =3D "bb74e1095adb66b04b51ed6ff10ae0aa96afdd46"
>> +SRCREV =3D "ea5db3dcb3bbbe445ae6d1a5611c1f8d547c57b9"
>=20
> I'll at least bump PR in this one.

Wait, what? Isn't PRSERV mandatory nowadays?=


