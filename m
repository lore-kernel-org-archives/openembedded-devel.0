Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0wSi-0002cM-1q
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 15:49:32 +0100
Received: by bkwq11 with SMTP id q11so2167194bkw.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 06:41:09 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.112.29.34 as permitted sender)
	client-ip=10.112.29.34; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.112.29.34 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.112.29.34])
	by 10.112.29.34 with SMTP id g2mr1102782lbh.40.1330094469453 (num_hops
	= 1); Fri, 24 Feb 2012 06:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=YVZOFpE0hiTDcv5tyArmURDtDYHUP88UrgwuKQpBCr4=;
	b=RQgtQIAob7+6WJDpaKNxwbEwFYmi6RFpSpwCimfS6M19HMsP7n33m71L6B4jUjSn+i
	GRQNdrkRlZu/Ul2/fxVKpVRiyj1k5nXj6p5H5h2T5Sg3nVueFYTsGb/gEW+yUsxghspO
	o9JQMCpEAYqIpFOZGDm8fQARRaCikLcDehm+Q=
MIME-Version: 1.0
Received: by 10.112.29.34 with SMTP id g2mr908744lbh.40.1330094468139; Fri, 24
	Feb 2012 06:41:08 -0800 (PST)
Received: by 10.112.29.74 with HTTP; Fri, 24 Feb 2012 06:41:08 -0800 (PST)
In-Reply-To: <20120224122806.GI3769@jama.jama.net>
References: <1330084384-1267-1-git-send-email-schnitzeltony@googlemail.com>
	<20120224122806.GI3769@jama.jama.net>
Date: Fri, 24 Feb 2012 15:41:08 +0100
Message-ID: <CALbNGRTSMK=jUUNasU+4TAOajUMythNBxys8xLHGzN6b+7peAw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-mozilla 1/2] firefox: change URI to fetchable ftp / bump to 10.0.2
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
X-List-Received-Date: Fri, 24 Feb 2012 14:49:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 1:28 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Feb 24, 2012 at 12:53:03PM +0100, Andreas M=FCller wrote:
>> build tested from scratch
>>
>> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>> ---
>> =A0...l10n-af_10.0.1.bb =3D> firefox-l10n-af_10.0.2.bb} | =A0 =A04 ++--
>> =A0...l10n-ak_10.0.1.bb =3D> firefox-l10n-ak_10.0.2.bb} | =A0 =A04 ++--
>> =A0...l10n-ar_10.0.1.bb =3D> firefox-l10n-ar_10.0.2.bb} | =A0 =A04 ++--
>> =A0...l10n-as_10.0.1.bb =3D> firefox-l10n-as_10.0.2.bb} | =A0 =A04 ++--
>> =A0.../firefox-l10n/firefox-l10n-ast_10.0.1.bb =A0 =A0 =A0 =A0| =A0 =A09=
 ---------
>> =A0.../firefox-l10n/firefox-l10n-ast_10.0.2.bb =A0 =A0 =A0 =A0| =A0 =A09=
 +++++++++
>
> Interesting that it detected rename in first 4 locales and then the rest
> is add/del, but otherwise look ok.
>
> Please reset those PR in those locale files to ${INC_PR}.0.
>
> Cheers,
>
Ehm I did not create them: I let the very nice script in /scripts do
that - a bit off topic: I already started to create such a script
before I saw it is already there :( So Otavio what was your intention
on starting at ${INC_PR}.1?

Cheers

Andreas


