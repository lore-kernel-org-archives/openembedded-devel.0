Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PVT2p-0001tG-4E
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 19:04:11 +0100
Received: by gyh20 with SMTP id 20so2313064gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 10:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=PPHxJnXgTxc92sl4FWx9SUm50MQJYsJK7B/wNpkSXrA=;
	b=HjT8zXmPeqPPegX8ZTxz0SAyDg4rZlhA/dC7mQTOK2gwyHYw6OEEOQYbC/j7DWvbCM
	3RRgANZkcJL0TcECtUMmFsHFhWHxmH9lnMLc5Fb4TqhzPBshJWBBIY0LYufos3f6hJfH
	1YwOBsy0RQzXECBTLAi8ZSgJPpvOWnv8fFZsA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Td5pGYYAJpgXwlGz1ZbMzAYc8t0a+ZpfWVlCPhkdRqtYjcJGbLhn/4j1RUMqzmFdYN
	rjQRiQFGpVzWvMqDi19j22MoiIIusaqW1X2Tq+IpsofDf/bna6MaPJX2V1QXA9ZeyQAL
	4GW05o9bniTOToucAtKCtCKYaUo2ovy1oRWVE=
Received: by 10.90.97.19 with SMTP id u19mr8847938agb.166.1293041039752; Wed,
	22 Dec 2010 10:03:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 22 Dec 2010 10:03:38 -0800 (PST)
In-Reply-To: <iesd3q$kf4$1@dough.gmane.org>
References: <1292999142-28338-1-git-send-email-raj.khem@gmail.com>
	<iesd3q$kf4$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Dec 2010 10:03:38 -0800
Message-ID: <AANLkTi=2BJmJz26aijSnZHuHV4cRpSQxuRmfOnCDJscz@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sane-toolchain.inc: FEED_ARCH should be prepended to OVERRIDES
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
X-List-Received-Date: Wed, 22 Dec 2010 18:04:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 22, 2010 at 12:32 AM, Koen Kooi <k.kooi@student.utwente.nl> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 22-12-10 07:25, Khem Raj wrote:
>> Currently it ends up after local override and hence appears first in FIL=
ESPATH
>> and for buiding uclibc_git.bb on qemuarm it picks wrong uClibc.machine f=
ile from
>> uclibc-git/armv5te where as it should have picked from uclibc-git/qemuar=
m
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0conf/distro/include/sane-toolchain.inc | =C2=A0 =C2=A02 +-
>> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/includ=
e/sane-toolchain.inc
>> index 6802eb2..f5ca22b 100644
>> --- a/conf/distro/include/sane-toolchain.inc
>> +++ b/conf/distro/include/sane-toolchain.inc
>> @@ -75,7 +75,7 @@ require conf/distro/include/toolchain-${TOOLCHAIN_TYPE=
}.inc
>> =C2=A0# Add FEED_ARCH to the overrides list so that we can override the
>> =C2=A0# ARM_INSTRUCTION_SET like below
>>
>> -OVERRIDES .=3D ":${FEED_ARCH}"
>> +OVERRIDES =3D. "${FEED_ARCH}:"
>>
>> =C2=A0# ARM920T and up can use thumb mode to decrease binary size at the=
 expense of speed
>> =C2=A0# (the complete story is a bit more nuanced due to cache starvatio=
n)
>
> Shouldn't that be BASE_PACKAGE_ARCH nowadays?

logically yes. I think I will change it to BASE_PACKAGE_ARCH


