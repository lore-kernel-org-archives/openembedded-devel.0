Received: from [74.125.92.145] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1Msuja-0007VS-Gi
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2009 10:40:29 +0200
Received: by qw-out-1920.google.com with SMTP id 4so2220201qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2009 01:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QvbN1ilynFtrL/BoPS0wnu4nsA3vq/Od2cDNdVtYtN4=;
	b=JIZe+7URCXw8EvnXB6QUA0bzoYdcwACJh1GQy7V4hMMgm3WE7bvDSo0bTJR8iwsRlH
	ki/Yw2NlxuMxhH3Z0XmLZSbARtEXlkd+DFvpl9GF7PRP+PqK3b563B08nhIsbZRkZBnT
	k/5FRUby3h4Ivc/ErMZhu8KQJ12WUTu0kF/nA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pT872eFOicwDfGYuo0J42C4DBH0YsUkYhxYfKD4SgHUYqw7yRa8MnMx7IKq4d+MS3F
	Tl0yCRRgUBL6lHzln7Tm7tdpxArZ6jXfMBMogcHy8XIHYtjxRL4EyMZp80atAhAQ9mmk
	xRT5tWnge53YOBQTQC+k4bJFxNne1ZGvaxblo=
MIME-Version: 1.0
Received: by 10.229.23.4 with SMTP id p4mr2767965qcb.84.1254299984327; Wed, 30 
	Sep 2009 01:39:44 -0700 (PDT)
In-Reply-To: <20090929181518.GB12138@denix.org>
References: <5f2b60909290445h117f28f0s807430bcec2176e1@mail.gmail.com>
	<20090929181518.GB12138@denix.org>
Date: Wed, 30 Sep 2009 10:39:44 +0200
Message-ID: <5f2b60909300139o6222d53do81e90af139d326da@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 Sep 2009 08:40:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Denys,

2009/9/29 Denys Dmytriyenko <denis@denix.org>:
> On Tue, Sep 29, 2009 at 01:45:58PM +0200, Bj??rn Forsman wrote:
>> Hi all,
>>
>> It seems like commit "linux-davinci: add DA850/OMAPL138, update other
>> DaVinci machines",
>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Da9673045=
4f6f8d86519317ad0798b2f96dfcdd45,
>> broke the kernel for the dm6446-evm.
>>
>> After this commit, my kernel will not boot. This is what I get:
>>
>> [console printout begin]
>> ## Booting image at 80700000 ...
>> =C2=A0 =C2=A0Image Name: =C2=A0 Angstrom/2.6.30-r10+gitr5212151f
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^
>
> From the commit you referred above, none of the SRCREVs use 5212151f comm=
it
> number/hash. Please check what kernel you are building/booting.

The OE .dev branch from yesterday seems to build
recipes/linux/linux-davinci_2.6.30.bb by default.
It has the following SRCREV:
    SRCREV =3D "5212151f26e688416faac9f6f33ddd958f7de96c"
(And my local.conf does not specify any preferred kernel
version/provider stuff.)

So maybe the question is what kernel *you* are using? :-)
Are you building linux-davinci_git.bb? That would explain why you don't see=
 the
SRCREV I do.

BTW, how do you specify that bitbake should use linux-davinci_git.bb?
I tried this in my local.conf:
    PREFERRED_VERSION_linux-davinci =3D "git"
but it did not work.

Regards,
Bj=C3=B8rn Forsman


