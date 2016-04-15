Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3324F60017
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 15:23:26 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id c20so57795898pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 08:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=TIf9r0uN4fZB3bQModRRN2EeEg1D1itBBRXsbBUmnaM=;
	b=eFzMwW2dFGV9LbVQz6fAMLtHYM71U8L4975SjNtzboxs5rDEopAbb/hkm4yFXWa1+H
	yj3iVWdCK9VdlDor5GSQhy0QbBzaLDQhLZVJz7V0CnyVV2PEd2j+Sa51RKHoJxwsEZF5
	j9jC1qZIBtW2raHaB0QPxChLt5EKB/wEEPy34bV04O74RYPhBwpJFJR+pQnT8ayVwbAL
	zE0vTYZcKdf9NuHkQMqJRQWkohTvyR/uvLWjwlZm4EDMhgVwpCpFa6n3A+6XT2Lj7uHC
	S5GWY4pDAhIT51yUoKYwaOSfGDxnTLfC78SMIQO9dPKNrGsHBR16ziiQojMkUES9rIWN
	Xv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=TIf9r0uN4fZB3bQModRRN2EeEg1D1itBBRXsbBUmnaM=;
	b=VuKQrlCBkUeNhu3SmE0wSQkFDxTGYRlNik6rOsR2j2l3rmb3o3Uh9h5NE4oSH/0i11
	D5qkYp8UjrPzlUgX176mfnJz59JnnEqaITz1cT2+xKkafUFbwExphjKZcPY+EMxexkIn
	/TkelmFgaxJcUwc/3ajT0kx788YUOokrmGm+E7mbvRk7TAIRljnxP030dWrr4RJviMyh
	lwQtuSQOQ/MdCTb6BEW66JtqOMIBvDAEhhjJsdU1XS1LjqhnOKKOscCjy09qUoY9GHLq
	Kz586QNcsPydYnJUJvOgJWIt8Bfu3d6e6NA/3ELVdVCMW94+OAizK4Cr4B1sGam5yTHe
	CpPQ==
X-Gm-Message-State: AOPr4FXPGVnSabTZCjGK98UE77QWWD/NxO/lVM5pRVJDhtKFsqhOEAABEUh6RHGtIIm/Hw==
X-Received: by 10.98.86.157 with SMTP id h29mr30104454pfj.105.1460733807271;
	Fri, 15 Apr 2016 08:23:27 -0700 (PDT)
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com.
	[209.85.192.180]) by smtp.gmail.com with ESMTPSA id
	u64sm65488413pfa.86.2016.04.15.08.23.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Apr 2016 08:23:26 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f180.google.com with SMTP id n1so57877507pfn.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 08:23:25 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.11.205 with SMTP id 74mr30091840pfl.98.1460733805535;
	Fri, 15 Apr 2016 08:23:25 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Fri, 15 Apr 2016 08:23:25 -0700 (PDT)
In-Reply-To: <CAP9ODKrgiJvzB5NaH6GD2Sv8nt9nKAy=1kHzYXULQDLA9hd0_Q@mail.gmail.com>
References: <CAOd_LFyF5A_Xp5SGVM7cQXU=w3zhPeWsWVohb2V9VDVxMLwoTA@mail.gmail.com>
	<CAP9ODKrgiJvzB5NaH6GD2Sv8nt9nKAy=1kHzYXULQDLA9hd0_Q@mail.gmail.com>
Date: Fri, 15 Apr 2016 12:23:25 -0300
X-Gmail-Original-Message-ID: <CAP9ODKocX2ZV8SgatTYx6RhYfzngn_g6U7_Fq+jQHcHz7pYVgg@mail.gmail.com>
Message-ID: <CAP9ODKocX2ZV8SgatTYx6RhYfzngn_g6U7_Fq+jQHcHz7pYVgg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: anyone using docker for OE builds?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Apr 2016 15:23:29 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 15, 2016 at 12:21 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello Cliff,
>
> On Thu, Apr 14, 2016 at 10:44 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
>> Does anyone have any suggestions or tips for using Docker to host OE
>> builds -- especially the storage aspect?
>
> Some of us here, at O.S. Systems, are using it as we migrated for Arch
> Linux and we use Docker container (Debian 8) as build environment.
> This works very well and we mount the $HOME as a volume so storage is
> not a problem.
>
> We are now in the process of int

(pressed Send too soon)

We are now in the process of integrating it into our autobuilder
structure so we are going to use it to mix different distributions for
test.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

