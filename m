Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SV7JF-0003rl-TD
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 22:28:30 +0200
Received: by yhjj56 with SMTP id j56so2452024yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 13:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=aa96rH9ikAHrorK+iUqpmN8dI3aExUVeMLsVXam2TDM=;
	b=FuNVAnxu3HTP27dzdpdC9J/Z2njy/oFuxVtqYrJdPYbnr4Ae3o+xHM2vJsBwAOKI2l
	a6xqvT+XLqPIqmQlvLgztwXOevWBQwPxzblezGbck1v8GeqMnK2Kv2mXORMKSamlDT8t
	2O6EFIFV5O4g+RdPfzkOkwH3verK0aKf2js3eUrjsUyRxqSNjZMf3a9NjhlEmE+fEWLP
	uEljkONCua+HzeO1dIpgBhfg0BX4VUhubbQeP/n3w90ZCQJ59VdncQZtoIJ1WMYo1BT1
	Ku0QTEYrFrsd0hqRWyXUxYSlfFH6I4DYrFpT18PRBGa1tpU45SfDuBSmhpCEog/UJ+iI
	Y/Hg==
MIME-Version: 1.0
Received: by 10.50.179.104 with SMTP id df8mr6853055igc.11.1337285906029; Thu,
	17 May 2012 13:18:26 -0700 (PDT)
Received: by 10.42.170.195 with HTTP; Thu, 17 May 2012 13:18:26 -0700 (PDT)
In-Reply-To: <jp3k9b$p58$1@dough.gmane.org>
References: <CALbNGRRSxKD_QqhCbLH=aRj3S0PEyTmQs9j8Lgg-5EObqMypxQ@mail.gmail.com>
	<jp3k9b$p58$1@dough.gmane.org>
Date: Thu, 17 May 2012 22:18:26 +0200
Message-ID: <CALbNGRRGD=oykOV8mb0tTi+ZhHHTjsA7bbSTGSPr_OYUi=sPUQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: meta-systemd
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
X-List-Received-Date: Thu, 17 May 2012 20:28:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2012 at 9:41 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 17-05-12 15:07, Andreas M=FCller schreef:
>> Hi
>>
>> happy to see this happen I have few questions on what is planned.
>>
>> In README is written:
>>
>>> And we're working to break the dependency on this one:
>>>
>>> URI: git://git.openembedded.org/meta-openembedded
>>
>> Maybe it is a misunderstanding but I would expect for contents of this
>> layer
>>
>> * systemd.bbclass * all from meta-oe/recipes-core/systemd * bbappends fo=
r
>> all recipes with systemd support.
>>
>> Is this correct?
>
> Correct. The bbappends will likely cause dependencies on non-oecore layer=
s,
> but so be it. We might need to set the unbreak-me flag for missing bb fil=
es
> that match our bbappends.
> Unless people actually start reporting the bugs they encounter by includi=
ng
> meta-oe...
Two more questions:

1. Has anybody patches in queue to fill meta-systemd? If not I would
stand up to prepare some.
2. Any complaints against the original idea to RRECOMMEND *-systemd
package as suggested [1] to avoid *-systemd packages in tasks/images.
AFAICR this was NAKed because a distro-var was necessary.

Andreas

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-February/0=
37750.html


