Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4606560043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 13:19:51 +0000 (UTC)
Received: by lbbsx3 with SMTP id sx3so11222244lbb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 06:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=ekInXTjbO7zOytXHDo4FE5Zr6h9u77T5trtRvul5Rdg=;
	b=Wlg9pXGoQu+sh6VawoPLGe7jFetNs2HeZEqM0tCA622vzMBHVjukbkWHGEyVc3As/o
	iAohbKQMZ92BZa8tK21ZUvFxQLhrU2CYOo+RX0VzANS1Mm4Qh5Qr4f6EighWGeEs0BpI
	jGU+6+pT+H64Bx969OvnM1tJb5+Z3OhV5NwzIScYne/eKSLXl3SiMIcbHyOlT0/SQN95
	pjeEBv5y6QfGaqaUOmHaw6YYvYcvWzXbywKnFSKETTG3zU8jaafZ1d7iDPNxWwSyGxsf
	ewN8pPSYyuzI4onpvgennUY8OxMnSjZfBj5oR6upYDmahSi44qKMCvoVK9HZbHaVIA3r
	59Gw==
X-Gm-Message-State: ALoCoQkzGC7mIl4IRN4QaItnUWn5+E9qbwwOQlgiqsSOEWD5BrsZdxF6zIlXNwrmzSPojR2dKATJ
X-Received: by 10.112.92.101 with SMTP id cl5mr2112945lbb.67.1440681591102;
	Thu, 27 Aug 2015 06:19:51 -0700 (PDT)
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com.
	[209.85.217.182])
	by smtp.gmail.com with ESMTPSA id db9sm583361lad.11.2015.08.27.06.19.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 06:19:49 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by lbbpu9 with SMTP id pu9so11183911lbb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 06:19:49 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.112.160.165 with SMTP id xl5mr2522320lbb.44.1440681589845;
	Thu, 27 Aug 2015 06:19:49 -0700 (PDT)
Received: by 10.112.211.132 with HTTP; Thu, 27 Aug 2015 06:19:49 -0700 (PDT)
In-Reply-To: <992F06D0-90FC-4648-B271-545B0DA26248@gmail.com>
References: <1439928871-17797-1-git-send-email-mario@ossystems.com.br>
	<1439928871-17797-2-git-send-email-mario@ossystems.com.br>
	<992F06D0-90FC-4648-B271-545B0DA26248@gmail.com>
Date: Thu, 27 Aug 2015 10:19:49 -0300
Message-ID: <CAP9ODKqcheB=Q2Sab8UNSJHVzYMqWeie-+VB4noayLr1MVc8-g@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-java][PATCH 2/3] Avoid parse time errors due to dependency on x11, for distros without x11
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Aug 2015 13:19:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2015 at 8:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Aug 18, 2015, at 1:14 PM, Mario Domenech Goulart <mario@ossystems.com=
.br> wrote:
>>
>> BitBake raises some errors when processing recipes that depend on x11
>> for distros that don't have x11 in DISTRO_FEATURES. To work around
>> that issue, REQUIRED_DISTRO_FEATURES =3D "x11" (from
>> distro_features_check.bbclass) has been set for the following recipes:
>>
>> * cacao
>> * classpath
>> * jamvm
>> * openjdk-6-release
>> * openjdk-7-release
>>
>> That makes BitBake skip those recipes during the cache generation
>> (they'd still be parsed, but ignored).
>
> This will also cause native versions of java to now check for x11, thats =
a wrong assumption. Please fix it asap.
> meta-java is currently regressing on two recent commits including this on=
e.
>
> so, I would propose to revert this commit if we can=E2=80=99t fix it in s=
hort period of time.

This does not seem to be the culprit and I didn't revert it; I did the
other one.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

