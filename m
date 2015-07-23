Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE9A75791
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 12:42:14 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so156725001pdr.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 05:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=5BvTZzSHY1j3dFzLUBtgDJkPLhX/HCUBFWKCZwosJ+s=;
	b=Z1pcV2XdNnz5yW1gdwgH1BA/3H7lpcHzAXpOdAvmuxkX3chkLmMHSLZ6KdLujbM3Ro
	J7wM6RhlMFTQTeSFcz3KWci1zYKS90W4AWNf5zcWVqKK61rU97mxY1dcHbUkDrUMQAw8
	ceQGOTp4pyLQ2fHsW7cq7p5paA2CTcW7Gb9RS+ekuRW1bx2Opps2JUrqXmljaKTqp+Ns
	1LegQ5uCgadr1jAIyc0x4hAZ4RHcdpu6okSi0KWulMzX9zFCWUwd4zmoHlhRgqapyTkx
	Kv4tjsAqlp5yIg+tRA1mgOKtU4qvPM4MFuu4JNbCynPUvLuhL1wg0cCVV19xx/hRLfHP
	nTQA==
X-Gm-Message-State: ALoCoQkHgNZdFckDgndGQGrlz039m+CI1oJuNiK7jVHwED5XM0sFKxozhhHXMUdtG9Dl1XS9MGCJ
X-Received: by 10.70.130.3 with SMTP id oa3mr18074430pdb.51.1437655334266;
	Thu, 23 Jul 2015 05:42:14 -0700 (PDT)
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com.
	[209.85.220.45]) by smtp.gmail.com with ESMTPSA id
	de2sm8884877pdb.15.2015.07.23.05.42.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 05:42:13 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by padck2 with SMTP id ck2so156610430pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 05:42:11 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.20.196 with SMTP id p4mr18277245pde.58.1437655331390;
	Thu, 23 Jul 2015 05:42:11 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Thu, 23 Jul 2015 05:42:11 -0700 (PDT)
In-Reply-To: <55B0CECA.4050909@mlbassoc.com>
References: <1437594429-21142-1-git-send-email-otavio@ossystems.com.br>
	<1437594429-21142-2-git-send-email-otavio@ossystems.com.br>
	<55B0CECA.4050909@mlbassoc.com>
Date: Thu, 23 Jul 2015 09:42:11 -0300
Message-ID: <CAP9ODKo2g+miZbmctxfaAo4edUbNR-dhY6eaBMqoVUvstnLz+Q@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3 2/4] opencv: Add 'libv4l' PACKAGECONFIG
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
X-List-Received-Date: Thu, 23 Jul 2015 12:42:16 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 23, 2015 at 8:23 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2015-07-22 13:47, Otavio Salvador wrote:
>>
>> The i.MX SoCs need to allow the removal of libv4l support so a new
>> PACKAGECONFIG option has been included.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
>
> Acked-by: Gary Thomas <gary@mlbassoc.com>
>
>
> BTW, this change allows all my cameras on my i.MX6 (TVIN, OV5640_mipi,
> Webcam)
> to work with OpenCV :-)

\o/

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

