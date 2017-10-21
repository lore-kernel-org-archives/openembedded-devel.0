Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF9B7016E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Oct 2017 00:27:07 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f4so676815wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 17:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cvnu9VYeIH6ebJNxjp9pcffN/TXp/g1ymaiHJPZ8+fs=;
	b=DCGjZOtS7rtonLAJsy1Qx9+45LaN1jK4pP4C6AQeBQ5TB+47gAx8vjwTcUPTyZzR4i
	CADb08MhV4LUzJAahLfFRIQfpdKNoujKyt8IeBoXoOoZWmShkJSsh01vw+ez6cCpZRbE
	QUHx25xth+lLVM0l8vqRXmDwcgLd++5P3xcKoMPzsuZOPnRmKufphahxxKzGNoSDXOI0
	br9m4xOcoKVNcOQT9HP93r1w9kQd5IqdmH3iaTXNj1kK+onJPXUX/Hv5pp84CfrvFfc6
	8lORQ0/om1fMHxRP4sROZ6Hdz91JwMrEMPhA4NIUIHP+s2LfXOLUx8uqvU747/XNP3+3
	aAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cvnu9VYeIH6ebJNxjp9pcffN/TXp/g1ymaiHJPZ8+fs=;
	b=hfisGk2KVrnFBWkex87ofeNVpsV/so4QnTp5NdQ1EK5MyHwg7bHL8ZLWPNYJk9ojfY
	kx/iazlyTXgPhdpGnw6LbROGPGkVfjpZ6hn5xAV3DzAKl6ymWgitattLgR/HM8fTUDDK
	YwySh1dld64hYajPtdut1JC+w0+88tTvGAkIiwLVHewKABvgIusXzCvpIjrQce6YqtTH
	+vrwm9mIsMlV8aErfjIIMtyaH7D/lOzjIUv21NFnnyyx6ehVOSOTuon8Nc7K63sxxWPy
	VHyT2b4+ZZbDTc2zVWuDRe0DtJtXwQz3hWgVKJr1Pi+SBEgBUJzKjx4mdV+bJydzakxm
	9pwA==
X-Gm-Message-State: AMCzsaXpEtaarzi2jxEHsWE2L3tNGmu/XHnOP5sQvuTsMXdZLXSgUU0y
	bwKR+3j0rP0dMhI6A0SeptQGxeullqCfZcg2wmc=
X-Google-Smtp-Source: ABhQp+STGipGBzjeuuFWW81pYlhN6wiN2D0jIu/iAhe96DVNVx1MAPCXUdE89NeDt/CWLy5+auPRsbwc8mIuVn/4X54=
X-Received: by 10.28.19.73 with SMTP id 70mr307881wmt.87.1508545628803; Fri,
	20 Oct 2017 17:27:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Fri, 20 Oct 2017 17:27:08 -0700 (PDT)
In-Reply-To: <CAMKF1sqAdkRhgMhuh0JsYcFyGMmbz42WUEDwM8coowqW8qQynQ@mail.gmail.com>
References: <1508538555-12051-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sqAdkRhgMhuh0JsYcFyGMmbz42WUEDwM8coowqW8qQynQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 20 Oct 2017 17:27:08 -0700
Message-ID: <CAJ86T=UPOCnjPbeR3Kg_Tn-bYKy=Zoze=x9eaANdv_qFZbhwcQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] ssmtp: misc recipe updates + add Debian "partial loss of message body" fix
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
X-List-Received-Date: Sat, 21 Oct 2017 00:27:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 20, 2017 at 5:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Oct 20, 2017 at 3:29 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>  - Backport Debian fix for "partial loss of message body, sending
>>    message to wrong recipicients" issue:
>>
>>      https://sources.debian.net/patches/ssmtp/2.64-8/ssmtp-bug584162-fix.patch/
>>
>>  - Control ipv6 support based on ipv6 DISTRO feature.
>>  - Enable ssl support by default (and add PACKAGECONFIG option to
>>    control it).
>>  - Drop inetutils dependency (inetutils provides only applications,
>>    not libraries or header files, so a build dependency on it doesn't
>>    make sense).
>>  - Drop pkgconfig class (the ssmtp configure script etc doesn't make
>>    any use of pkg-config).
>>
>> ...
>>
>> -inherit autotools pkgconfig
>> +inherit autotools
>
> Is this intentional to drop pkgconfig ?

Yes, see commit message.

