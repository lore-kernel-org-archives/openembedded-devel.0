Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTzew-0004vX-HJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 18:34:00 +0100
Received: by faat2 with SMTP id t2so3696512faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2011 09:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=kzeo7gQu6CmiPjp2NvFyL5fVG3fE7K4y8n6fkMUfttU=;
	b=gjXGymRV6pn7rEAQElIQ+0b1E5hzCTR77fCqJdxel7IkFMXFiesKTm13+rLU4Rbbl3
	YGd4OwC8V/7XR4+EVA++8ACYs+P2HcbCKcd/iqAvjhvqbNLb7Mp+WP/cw4K8sB4i68sS
	THjNTr+407XOW3r/dj2qGBNYtmmPvrIMInrSA=
Received: by 10.152.111.1 with SMTP id ie1mr8471494lab.7.1322242044149; Fri,
	25 Nov 2011 09:27:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 25 Nov 2011 09:26:52 -0800 (PST)
In-Reply-To: <4ECF2887.2040400@googlemail.com>
References: <4EC81A85.8050704@googlemail.com>
	<CAMKF1srcWq1mD4wNZEi2Eff2iMCVcwvjL_swTJ7z1Y6=qjZA1Q@mail.gmail.com>
	<4ECE4B0D.6030401@googlemail.com> <4ECE5422.3070504@googlemail.com>
	<20111124174936.GA28767@sakrah.homelinux.org>
	<4ECE87A9.8040109@googlemail.com>
	<20111124182713.GH28767@sakrah.homelinux.org>
	<4ECEE6D8.7080802@googlemail.com>
	<20111125050922.GA30623@sakrah.homelinux.org>
	<4ECF2887.2040400@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Nov 2011 09:26:52 -0800
Message-ID: <CAMKF1srBccnok0GsuwZxsRCpUNwT7nLz=iJi9vhNZSykxhztfA@mail.gmail.com>
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: "cannot find -lppl_c" link error
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
X-List-Received-Date: Fri, 25 Nov 2011 17:34:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2011 at 9:32 PM, Mr Dash Four
<mr.dash.four@googlemail.com> wrote:
>>> That did not work, unfortunately - "perl ./Configure" doesn't like thes=
e:
>>
>> well where did you add them ? they should ONLY be added for gcc-cross
>> recipe
> Well, considering my OE experience is just a few days old (if you can cal=
l it that), I placed this in my local.conf file. Then I realised I should p=
ut it with the failed task recipe (gcc-4.5-initial) and then by looking at =
the actual file itself I realised that the gcc-4.5.bb is the place to go.
>
> I have just finished my built - the whole lot and with a lot of warnings,=
 mainly from unpackaged files - don't know whether these are important thou=
gh.

they should be looked into sometimes there might be important files that
go unpackaged

>
> I'll probably spend the weekend fine-tuning this as my build went over 25=
G in size - massive! Thanks for your help Raj, much appreciated!
>

yes its big since a lot of software is built you could use rm_work
feature where it will try to delete the work dirs after they are
successfully built but I would suggest not to do that unless you
really need it.


