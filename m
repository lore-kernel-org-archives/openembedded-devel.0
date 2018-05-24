Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id A44BE74AB8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 17:30:16 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id 200-v6so2209968ioz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 10:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fDz5vf18LAtNIM3hIxZ0M3vpepnqzemA5MPoul5TjyM=;
	b=OTzu0V+8QBff5OV+MVuaZDUMZzZ8y234kqkObG4npDuJy2pNiEiNXpJVvbrEcvcZBg
	Esje4cd/2VYghJAy4m9WeKLnrQnM8y/SI/F3oiNOoeJnha7PXXkMcB5h8dA6BYDdhxaQ
	T/5rXe+goR85ELPoPBVrAsVNOoXQdwnQI+HmvrqKU/VUOLNgV4ZSpFe6U1v1fUoVzcg7
	PMBMu2mVNxXudDhv7Dun+/+dYhSCAIk0lcZ1pyOiJ+XXQXUk1NqZnVb85emyWN8lSWxw
	mWU8fto4MJtuLL1dLzcX/8yik6AE1tOTsnVTE1rCpzJ8agmROfdYEN6rUW1bQ6ZjcpNa
	m6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fDz5vf18LAtNIM3hIxZ0M3vpepnqzemA5MPoul5TjyM=;
	b=LtVRm7k4EQmYEWE//Qxc+Gp9EKXmby98WkRDg0LYqKQWqTUSytq7ur0ndwFtNJD3XP
	EfA/DM04m/tD1pKS7iFbK58zzHNWy80/QOPOQFankxneyf/jdkPWhDcFOgbhHGWUWUl5
	jHWQ6ChFjCw5iV45I1Hb0jjEEnOBjwM/BdTHoPyrb0mF3VZQkgYzMLdDK/6/BzqVZOCX
	pIR0QbZL2HpMUkEds4uWFl8J6YuZqOpziV8sLjoKxfiqsL22ekspwMSgxXemLf02LIDy
	k2OyTxDEKsB/8lOL/S7JC9dmSpFzP3sRE3cIMAXYn2S48kCK4NbCnPGjeiv1K16fnSVf
	E8Sw==
X-Gm-Message-State: ALKqPwfLsDQPWocZq1dPdQUsGcN9LjnItVoNugJNfxC++ezlGamSFO3W
	fbJcEkrckE1RJDSM5JuAB4k=
X-Google-Smtp-Source: AB8JxZrjYp97QCHJDv6CkFLfDZ84CfMtYslTRA+GM4Us1NLRPvQZ7mLuEaantj+2u6/mFMT8jhPALg==
X-Received: by 2002:a6b:7013:: with SMTP id
	l19-v6mr7377242ioc.269.1527183017353; 
	Thu, 24 May 2018 10:30:17 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	t123-v6sm2532550itb.20.2018.05.24.10.30.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 May 2018 10:30:16 -0700 (PDT)
Date: Thu, 24 May 2018 13:30:14 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180524173013.GA30624@linux-uys3>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
	<4f227bea-48ae-8126-8326-7b51b4bbc5d1@gmail.com>
	<CAJ86T=Uey--sM3RS85duoaMc0EQi-+q8C0KPCj5xgBC0nMB0fA@mail.gmail.com>
	<CAMKF1sraQqZvTL3imQecXjwx5xQpS6EiiBmKp8+B0cb9Y7KSmw@mail.gmail.com>
	<CAJ86T=Xxw__E-+8Zf0PZnOAe1SeMB2ayMZZu-Gb=19ckh8=TtQ@mail.gmail.com>
	<CAHUNapQ0Ywt2-xtp0==FozFhsPSnbBTEDReckkE1TVaxdtCn3g@mail.gmail.com>
	<3f41b911-4fde-1ed1-76f7-650dab5dbb20@gmail.com>
	<c7fbbf37e1ff4631a0aa3b45c07544a9@XBOX02.axis.com>
	<CAHUNapR44Bg55=N60PC1-qKKMjag4eVD7a_YoO3b-CDrJm5XOg@mail.gmail.com>
	<CAJ86T=U5THX1tOFnTzBwr1sMoRvLqFiwqNbn0HT==fv5o9Mo-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=U5THX1tOFnTzBwr1sMoRvLqFiwqNbn0HT==fv5o9Mo-A@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 01/17] libwebsockets: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 17:30:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon 2018-05-21 @ 11:10:59 AM, Andre McCurdy wrote:
> It hasn't been updated to give ordering for PACKAGECONFIG or
> BBCLASSEXTEND but the conventions for those (based on recipes in
> oe-core) seem to be:
> 
>  - PACKAGECONFIG lines go between "inherit ..." and EXTRA_OECONF
>  - BBCLASSEXTEND goes at the end of the recipe

Done.

Thanks for the pointers/tips :-)

