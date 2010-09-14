Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvVOx-0000ID-S2
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 15:18:25 +0200
Received: by iwn2 with SMTP id 2so6143762iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Sep 2010 06:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bGjSouvjzWu8iwqLOlB4jwoV5GuEihVZ5nouHE+4G/8=;
	b=PDI+E58mNboI87m23Pi9PUupZi+yoylYCdYxNJtxhmd7SXhvg0sIjIKJcs6g8cJXKj
	mZsWmLT4VnHHOPzqRu7ltqtYSLL4+pm02sjz6RHwlxaS4rNd8B0LT6wY0Fprw43vuvnR
	XpK11rNhMD9NJMCVTOFfIWNSr7W3dip5+G30M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dLollC06z+P/J3jRqLhGgHljpwnVQzhOBYWUnqPdFEQROIrZ5Sw69ENPTIx/bwx3tU
	yOBrJkTgLFwwxbWNXEtPHe0JIbMRBf+ZxDWDd/dOOA8bCeuA1j2iwy7NK82oZEGcTdqf
	l/bGMAzParr0fjxC9rtmMIStk7XmS8sHmg4Rw=
MIME-Version: 1.0
Received: by 10.231.59.83 with SMTP id k19mr7961407ibh.178.1284470257096; Tue,
	14 Sep 2010 06:17:37 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Tue, 14 Sep 2010 06:17:36 -0700 (PDT)
In-Reply-To: <AANLkTi=TNCakw39uSUHbVudgdJrxwaQPPZZHmpbO38zN@mail.gmail.com>
References: <1284404613.4133.103.camel@mattotaupa>
	<AANLkTi=TNCakw39uSUHbVudgdJrxwaQPPZZHmpbO38zN@mail.gmail.com>
Date: Tue, 14 Sep 2010 15:17:36 +0200
Message-ID: <AANLkTi=ay75ZtCe7g5td8tAMwHki-Hk0_FWjYSkT+KoL@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] preferred-xorg-versions-X11R7.5-latest.inc: Use Pixman 0.18.4.
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
X-List-Received-Date: Tue, 14 Sep 2010 13:18:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/13 Khem Raj <raj.khem@gmail.com>:
> On Mon, Sep 13, 2010 at 12:03 PM, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
>> Date: Mon, 13 Sep 2010 20:53:48 +0200
>>
>> Cairo 1.10.0 was added in 1d4c650b1d8dac6adee3d3d4208b81bc9b67bd3d [1] a=
nd requires Pixman 0.18.4. This fixes at least the distribution Minimal whi=
ch does not set the version of cairo explicitly.
>>
>>
>> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D1d4c=
650b1d8dac6adee3d3d4208b81bc9b67bd3d
>> [2] http://cgit.freedesktop.org/cairo/commit/?id=3D8127f1f5d52bb716dbd70=
efe096894f2a542f4a9
>>
>> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Paul, thanks for the fix!

Acked-by: Frans Meulenbroeks <frans.meulenbroeks@gmail.com>

>
>> ---
>> =A0.../preferred-xorg-versions-X11R7.5-latest.inc =A0 =A0 | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.=
inc b/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
>> index 3c9aac0..634265e 100644
>> --- a/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
>> +++ b/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
>> @@ -108,7 +108,7 @@ PREFERRED_VERSION_libxxf86misc ?=3D "1.0.2"
>> =A0PREFERRED_VERSION_liblbxutil ?=3D "1.1.0"
>> =A0PREFERRED_VERSION_liboldx ?=3D "1.0.1"
>> =A0PREFERRED_VERSION_libxkbui ?=3D "1.0.2"
>> -PREFERRED_VERSION_pixman ?=3D "0.16.2"
>> +PREFERRED_VERSION_pixman ?=3D "0.18.4"
>> =A0#proto
>> =A0PREFERRED_VERSION_evieext ?=3D "1.1.0"
>> =A0PREFERRED_VERSION_fontcacheproto ?=3D "0.1.3"
>> --
>> 1.7.1
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>
>
>
> --
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


