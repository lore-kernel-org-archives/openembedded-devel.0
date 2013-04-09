Received: from mail-vb0-f53.google.com ([209.85.212.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPVfm-0000Ir-Ar
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 12:21:15 +0200
Received: by mail-vb0-f53.google.com with SMTP id i3so4491499vbh.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2013 03:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=qq4o5sCcXpHn1MMpMH2M6dfNsjH8eS/HFSvp3G+ho/0=;
	b=lvONcJ8OrTtHVpcaNeEyxI2T/RpDdgM5tzd4h8Z6/rv/u6z4Fxsy4paioZj4oxQ7zX
	7uOM4MpnyqNATXUUCtKK01CAr3efD4RDJWzHU+UAxcf/Ek9C22zhkxwQWXw0ATjnoNTh
	CQ+fdzf1S9rCQq8wiDmIpwXFzbr5ajTNwJy8g7yk7pLCdKhjesaxztyH4P/YNECDp4pC
	Zg41tvg8RSoiGzGLi/pX8kl0YNWywcxNjXSgSLuiomJPIk3viuWT4jtENLYWZrQDFD66
	1cllvTyR78BFfxRQpvIawIkNYs7Hvzww+6Jkzba0fJR01TQKA48epUt/ixeSxYTqcx0m
	3cCw==
X-Received: by 10.52.23.115 with SMTP id l19mr15993490vdf.55.1365501825994;
	Tue, 09 Apr 2013 03:03:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 9 Apr 2013 03:03:25 -0700 (PDT)
In-Reply-To: <5163E52F.9000206@pseudoterminal.org>
References: <1365463467-5893-1-git-send-email-dv@pseudoterminal.org>
	<kk0d9f$qip$1@ger.gmane.org> <5163E52F.9000206@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Apr 2013 11:03:25 +0100
Message-ID: <CAJTo0LY+3C3kEJYS_FAtKvz9Pw-oJhfM90brVwfFngO-_6gyGg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnn3MQ1g4VJsyizuaccRYZ2SHnjQgWeEGDCRMBGm9VIaJtLBbOUq2KZXAym/+Zfzffuk8zc
Subject: Re: [meta-oe][PATCH v2] add recipe for mpg123, a decoder for MPEG-1 layer 1, 2, and 3
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
X-List-Received-Date: Tue, 09 Apr 2013 10:21:16 -0000
Content-Type: text/plain; charset=UTF-8

On 9 April 2013 10:53, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> Hmm, perhaps I should change it. mpg123 tries to autodetect the machine then
> anyway. I just added these options to ensure it picks the right ones without
> having to autodetect anything.

How does it detect?  Traditional "what am I running on?" tests won't
work as it's being cross-compiled...

Ross


