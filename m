Received: from [74.125.92.150] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MjaaA-0003cF-5f
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 17:20:10 +0200
Received: by qw-out-1920.google.com with SMTP id 4so226370qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2009 08:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YMQJeLn0uNcq9zIC8ioqo2Cn5enOQ6mpWKtjV4HLiH4=;
	b=cJiK5uAVKHbLe6n5dBtQabXAarBEzZXAzfNAaREpN1KJv5MqZ7Ap3IOHB3HEJ7XFRE
	tpl18h5WS+Ms0td2fnMfp6mOXibTSOopzlSg46tN2sPRH1fpyg6tjehuhzJ6nuFx1vcZ
	14BbqKfpMEywpVDubvpfu97i+R1e4hjrpR26M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=F3NgVmBnTYGbrOcSHV6rxn54SIKeuZCuw4WS4B0usWD1RqQpjOsLt1KitJg28c4fY3
	Z4/+mWOGRkplRETsooAfhYBUtPALTRyt1UDKT9VwG6x2hvACrrF/472ONLUDOgiMm4Pm
	NFXYMxIf60Q9Q4+23AqwG6ouViWne9hzhQbqY=
MIME-Version: 1.0
Received: by 10.229.44.2 with SMTP id y2mr3281290qce.76.1252076472075; Fri, 04 
	Sep 2009 08:01:12 -0700 (PDT)
In-Reply-To: <h7qnde$o9a$1@ger.gmane.org>
References: <4AA0D896.3030607@dresearch.de> <h7qnde$o9a$1@ger.gmane.org>
Date: Fri, 4 Sep 2009 08:01:12 -0700
Message-ID: <19c1b8a90909040801i74d1f55at80ef6636365a1a26@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: dropbear-0.51-r3 allow-nopw.patch: No such file or directory -> reverted
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
X-List-Received-Date: Fri, 04 Sep 2009 15:20:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2009 at 2:42 AM, Koen Kooi<k.kooi@student.utwente.nl> wrote:
> On 04-09-09 11:06, Steffen Sledz wrote:
>>
>> It seems that commit c26fc5db90702b035bd545cff3ee7575a0f9b70f was
>> incomplete.
>
> No, that commit is just plain wrong, from dropbear.inc:
>
> do_configure_prepend() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "x${DISTRO_TYPE}" =3D "xdebug" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oenote "WARNING: a=
pplying allow-nopw.patch which allows
> password-less logins!"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patch -p1 < ${WORK=
DIR}/allow-nopw.patch
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> }
>
> The faulty commit in question breaks that by applying it it unconditional=
ly
> and not fixing do_configure_prepend.
>
> I've reverted that commit in the meant time.
>

Thanks for taking care of it thats was an oversight from me

> regards,
>
> Koen
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


