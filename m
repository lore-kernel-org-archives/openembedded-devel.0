Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id B163575791
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 20:09:03 +0000 (UTC)
Received: by pachj5 with SMTP id hj5so143744903pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 13:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=idI6xBcqQqLbae/M7NLdHZXWUZNySsNZoEFE/nYw3cU=;
	b=HU9GsYooOD039VGVxDvNXoRp4FPfQyB1KsVh7/CtJxMKrTwfJXCbyo+F51RZj+z3eP
	DIWmwZxG2RIC6S4U8tm7iG6g1iChkyxvMzoOzwO0+tmbwFweduEbCd2NxAFg9boRMOk7
	NuZKBipDmlfdxyga7c1F8uQPGSNemZk+l6mxFT3j7nZMPWOOZ7AWwI62bbGEJX7V7IgI
	TBzfc6Y8+VYLpMySO95TeleEtwti7OAN8LorvlRVUnnpm/PHiheMO7dspw2y1eNEyeFU
	lLLlaOVWZP+luxY4OAzeurtwYsaXXJa7hp6zMVDR4g/i6Xy79lVZJ8QQxFvDAgGFY/hK
	DXsA==
X-Gm-Message-State: ALoCoQl3ILtsS1bxATPNzGvKmW0Wn0AUrEKhpfqPwgopvh7lrwU5miU0GfHvp2YQ06PnORzA0bNz
X-Received: by 10.70.54.7 with SMTP id f7mr9309574pdp.75.1437595743236;
	Wed, 22 Jul 2015 13:09:03 -0700 (PDT)
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com.
	[209.85.220.48]) by smtp.gmail.com with ESMTPSA id
	ij17sm4899886pac.4.2015.07.22.13.09.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jul 2015 13:09:02 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pacan13 with SMTP id an13so145275544pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 13:09:00 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.100.105 with SMTP id ex9mr9683618pdb.115.1437595740760;
	Wed, 22 Jul 2015 13:09:00 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 22 Jul 2015 13:09:00 -0700 (PDT)
In-Reply-To: <CALbNGRRH3QtFSPRNxRb+z0TOkxL-o7G7z1Lzcy61WMz-Q_X-pg@mail.gmail.com>
References: <1437594429-21142-1-git-send-email-otavio@ossystems.com.br>
	<CALbNGRRH3QtFSPRNxRb+z0TOkxL-o7G7z1Lzcy61WMz-Q_X-pg@mail.gmail.com>
Date: Wed, 22 Jul 2015 17:09:00 -0300
Message-ID: <CAP9ODKpK8COYBrwwvZc2CKRYfibYYLsswyv2ZfCSE1E68=5piw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH v3 1/4] opencv: Only enable 'libav' support if commercial license is whitelisted
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
X-List-Received-Date: Wed, 22 Jul 2015 20:09:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2015 at 4:52 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
...
> Same for all patches of this series: What changes were made v1/v2/v3?

The only one changed in v3 has been the glmark2 for other flavor support.

The v2 the change was to make libv4l removable in opencv.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

