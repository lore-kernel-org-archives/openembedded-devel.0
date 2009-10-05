Received: from [74.125.92.145] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1Mui16-00072V-UA
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Oct 2009 09:30:00 +0200
Received: by qw-out-1920.google.com with SMTP id 4so918515qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Oct 2009 00:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=BQ7TqxJnahfpfu0EDRnuuFsqEzhNlVJKT2HmcEuoSfA=;
	b=A3+RnIZA0vmEdJpkSlsfPenaIHPYfcN0eSOtP2jUauUk8FYox2IYZPxPH9y5kiLaSc
	JHA1YHQDEweSi07FHSFIC4mQIVjO0UY5quApQektuLWxQ0Jn9VtLRZ5oVD+PR9BMkMBB
	rpix3sLOpbkDWFlB5nlzDostbm10jBKSU2umQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=RTr6dmSO2KwBeTtdoSzr5D8Eh8/pXC9gXxELuJQxZg4lsXbF5U+M1PM5IwOE6upQwY
	YGPI2UfAau87F2iIMLcyHXxsSQbdqtMD44gzOoYrxucWW+kLg9VyQWmJZg2Q3PkmbkqC
	6foNe/fqjoUg+GCt3PcqBSxp6cvT9nxT8JXU0=
MIME-Version: 1.0
Received: by 10.229.44.19 with SMTP id y19mr3757241qce.48.1254727750919; Mon, 
	05 Oct 2009 00:29:10 -0700 (PDT)
In-Reply-To: <5f2b60909300139o6222d53do81e90af139d326da@mail.gmail.com>
References: <5f2b60909290445h117f28f0s807430bcec2176e1@mail.gmail.com>
	<20090929181518.GB12138@denix.org>
	<5f2b60909300139o6222d53do81e90af139d326da@mail.gmail.com>
Date: Mon, 5 Oct 2009 09:29:10 +0200
Message-ID: <5f2b60910050029u12068f51w86d3734ffa6bc11c@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.145
X-SA-Exim-Mail-From: bjorn.forsman@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: dm6446-evm kernel broken
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
X-List-Received-Date: Mon, 05 Oct 2009 07:30:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2009/9/30 Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>:
> Hi Denys,
>
> 2009/9/29 Denys Dmytriyenko <denis@denix.org>:
>> On Tue, Sep 29, 2009 at 01:45:58PM +0200, Bj??rn Forsman wrote:
>>> Hi all,
>>>
>>> It seems like commit "linux-davinci: add DA850/OMAPL138, update other
>>> DaVinci machines",
>>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Da967304=
54f6f8d86519317ad0798b2f96dfcdd45,
>>> broke the kernel for the dm6446-evm.
>>>
>>> After this commit, my kernel will not boot. This is what I get:
>>>
>>> [console printout begin]
>>> ## Booting image at 80700000 ...
>>> =C2=A0 =C2=A0Image Name: =C2=A0 Angstrom/2.6.30-r10+gitr5212151f
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^
>>
>> From the commit you referred above, none of the SRCREVs use 5212151f com=
mit
>> number/hash. Please check what kernel you are building/booting.
>
> The OE .dev branch from yesterday seems to build
> recipes/linux/linux-davinci_2.6.30.bb by default.
> It has the following SRCREV:
> =C2=A0 =C2=A0SRCREV =3D "5212151f26e688416faac9f6f33ddd958f7de96c"
> (And my local.conf does not specify any preferred kernel
> version/provider stuff.)
>
> So maybe the question is what kernel *you* are using? :-)
> Are you building linux-davinci_git.bb? That would explain why you don't
> see the SRCREV I do.

Ping.

(New build from yesterday still uses linux-davinci_2.6.30.bb with
    SRCREV =3D "5212151f26e688416faac9f6f33ddd958f7de96c"
which fails to boot.)

Best regards,
Bj=C3=B8rn Forsman


