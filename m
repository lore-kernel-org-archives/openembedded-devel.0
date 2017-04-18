Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7414C71A2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 12:20:34 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id 88so32915542lfr.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 05:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=mlv00Aa+IniYzFCC8EbcpYgZ4b2/YtOqyzJwOC1eUiI=;
	b=KyzN01TJad0IWUyUqmz2UvSZNjbv8sc4RliU5RkXTyVRckQl8uMWiVDaHeqllk7vj9
	6BVA5vnfPkSUr0lYJD33VShJwH9SI/+osKeE1DxfjScLip4Q++uqipz+r1z3S99ZFLCd
	EEI6Kj9NX/6fuwaySD8fKMf2eY8w51vgiDCLj9D1GRNgWbNG7xXvx9/DfDT23S8iGL9+
	qbukE66mUcthhHwwW+oxMOWgEToEX5lnSzysr3kxe/frtizwwbRrWbDKAJi+iXgAYUy5
	SIZXsEXohJrQ7EyzBNuJ82gBA8ay9PBH1ItoQkHISNFCbx44meUMhxCVtqH99DKRkhYx
	zAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=mlv00Aa+IniYzFCC8EbcpYgZ4b2/YtOqyzJwOC1eUiI=;
	b=mxhRTftWA+BgfLujfCpCE2MPKdxQiEVqEPlNUVX6FlFVe8wbgl12NLTebjmYRUO3RU
	a4dQyxol/yU0iaqzzan3g0CXExM0hw/HS8M2sMdXQ7J/hAZCDIiXDvRzV/bARU+HynKx
	rd59MFdrC44ob1xbSuVLRoB0fHtlTwo982VP8aMbx0mZkCleybUCeEKvpn7p+Kxr1cac
	r3ZT8aHU3Ua1HRHbDYWxlhAaHXEAOfrjtcjF5f+ELPp4s5AnTehYJXhXo1EfLY5JUshu
	9B1TT/8hvd1uLvaFdPno9qAr9Qx2FpFTNfVAxOkuu6jltH3SjnrZTL/3JET6W7RbO8hy
	vyoA==
X-Gm-Message-State: AN3rC/6luq9PgAcujc7Ux/vfV5kmFLkRsThAfm/2kNEVOhKPSk64N979
	9/TEX+Ea+fG5k/p344o=
X-Received: by 10.46.7.18 with SMTP id 18mr3712375ljh.5.1492518034534;
	Tue, 18 Apr 2017 05:20:34 -0700 (PDT)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	q123sm2414756ljb.18.2017.04.18.05.20.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 18 Apr 2017 05:20:33 -0700 (PDT)
Date: Tue, 18 Apr 2017 14:20:31 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170418122031.pizafzlv7zjy5p22@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1491975746-68414-1-git-send-email-dengke.du@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1491975746-68414-1-git-send-email-dengke.du@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170306 (1.8.0)
Subject: Re: [PATCH V2] crash: 7.1.5 -> 7.1.8
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
X-List-Received-Date: Tue, 18 Apr 2017 12:20:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Dengke Du <dengke.du@windriver.com> [170412 07:42]:

> 2. Add the "id" to HOSTTOOLS in meta-oe/layer.conf

Why do you need to add `id` to HOSTTOOLS?
We're normally trying to _increase_ determinism in builds, not reduce
it...

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

