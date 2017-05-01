Return-Path: <andrei@gherzan.ro>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2157971DEF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 May 2017 12:03:12 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id r16so115071604ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 May 2017 05:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eBr7lfbki1g4Zbj9k+uK1mmwp+Z7jiNDWen2TXnuOU8=;
	b=mVCx8pc4GQOQ0xnKTrH2KSyOMj/F2mOusuHUIEXVeYx8hayWRA/BrBooq1Ekna2qVP
	E4wRXWgS2U2/h7436cyp2n/e6wia9xEpKHerGTa5W0vvXpQFYAEHCiMF2B+etKhKpstp
	1g+I3t7C5zio4cEAg9xt92rfcN+VSvPHtHabwYJUIDzYJDgb4bDDLOS65Qzr1pJ2UR3B
	zXZaSZaTOy1ZNC8KHP+K1JQcCBnbZEPgnvRmA7gwa6hQwtnFydgY6JtrJDv5fLbjVAx6
	j7xPboOX5EUnte7/auyVsGIpv18kFl2Kpimjs5VCaCFW3+/R2lOu+pmwkE9KRHuUhIFw
	bchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eBr7lfbki1g4Zbj9k+uK1mmwp+Z7jiNDWen2TXnuOU8=;
	b=a68mcxU0ykOCDDln8YtWkhU9UFJMpXkgzpsNASvmkAaHXg2EISNT2HM9oDcbnNEyPG
	vMuTPfBY+b4BgnmWjQKgj1UYPwdJEmptc9tIlsroVOsMdiv0s8f0Nkc8fTkcSeHiRRav
	dQtmiXEDrh7yHYELwzak+EMPyr+8nv2pBEHJ5TrvlLVF+bJBIH4NxT1lhfZi6Y9apbX7
	5bdrCSxn4U9gMOVAu/QTET5kcUxxIqNTetjJEk4GscHV/FaPkbGW/jl6MkVA1xU7trpe
	6xk9N1RMSzKylnC3yTmkzcHRvKDqV/DKsgobsEb0dGdWdHGQOLonf0wIywhcGlWH+VPu
	lAtQ==
X-Gm-Message-State: AN3rC/7i2A9EMw9zIAmHebL0Lu2aTipLIqNTpuAdVdqMyBqEjJBfxbr3
	Tnvkqlj3u+2Tkdf59fee7voZyHjMpA==
X-Received: by 10.107.167.19 with SMTP id q19mr6787063ioe.110.1493640194191;
	Mon, 01 May 2017 05:03:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.27.207 with HTTP; Mon, 1 May 2017 05:02:33 -0700 (PDT)
X-Originating-IP: [31.52.113.35]
In-Reply-To: <CA+chaQfvm5xdNEhF=v05VnUPiLZFea2pZkZakgmAF_mCF4v07w@mail.gmail.com>
References: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
	<CAK18fxHF1dPOAXSwFwtS0s_vaMo5--t4QS2dq8pBwbDPdFDmbw@mail.gmail.com>
	<CAC+thW0rVtEFKKoJChwLjK-2=aMmZuW5vRufJ9iaFXJt6JiEAg@mail.gmail.com>
	<1493635218.23535.34.camel@linuxfoundation.org>
	<CAP71Wjwwp9ca=4_V-U1NpnX+=5x1V82DS18FkxPAaL9qYknVow@mail.gmail.com>
	<1493638943.23535.36.camel@linuxfoundation.org>
	<2b56f841-8c90-64b7-b6d3-cf0c157451be@balister.org>
	<CA+chaQfvm5xdNEhF=v05VnUPiLZFea2pZkZakgmAF_mCF4v07w@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 1 May 2017 13:02:33 +0100
Message-ID: <CAK18fxHA0p6x7pwU_WAnpv7bvOCX6XXFP-QWLkAJhxQfVuKczQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-members@lists.openembedded.org, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [Openembedded-architecture] OpenEmbedded 2017 General Meeting
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
X-List-Received-Date: Mon, 01 May 2017 12:03:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 1, 2017 at 12:59 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I had to change the password on the login, but then it worked for me.
>
> I've added Andrea and Andrei to the list.

Thanks Martin.

--
Andrei Gherzan

