Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6B16E77225
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Feb 2016 11:19:56 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id o185so42159674pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2016 03:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=8lUeMkrkSPtzAKqEGfi6Vb7bNMtQCkzZLbsnLLUUAGI=;
	b=LZyV2FOncvfqMlXYvyBD//vUUMuQw635syuspx563sBU/26IMS4T2jETaChutzdaK9
	6aMLOi5EbvccBbNRnhaZFGyfcBBsMFCx+LrPvciEvgDqvhAZOuAmHKog8DCI09pvjMR6
	o9oRbQRoO/S7Ofl/xjsaSnd0lZo3WtzM/rtBWoKpNo7kJwajpsCr9LHWtLfdksWJl/Ib
	UhNw82BaAOsQMd95N395/Mi1m8IXpOhsOc/EY5Wnq6xUGCHmqrK+LHx4MFSiDHI0+nvl
	5GD4yvok0zwdfjr8caVyQHwZI2pSInhNOD7BtiOxP098x3URbLDRWSzCGlQ1kmtv/fKa
	RtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=8lUeMkrkSPtzAKqEGfi6Vb7bNMtQCkzZLbsnLLUUAGI=;
	b=FGASBkBwZYrhS6ma8n0UZx+Zn96GbTxWR4qUF+vh3QRqz30AsmhJynfLf6VNmYRtHW
	HahnDUdQyP6vaqSpj0VbzPnitLtHmXgvTwbskW/TMIcYKpNqRk6GhyMM3giQS3DgsHfi
	Vy+H+h8rJgcgSXY4KEG4fVgUZ733l72r76UgPnD67tgJkevwpGLSDoYi3c2Xnp1jRsjy
	ZSl60t5nQ2XvHHz0AojOmiGqd1MuncSD0ldtB2aiXS1MTw3NbuwyzGnLBjZTf7JjsYL2
	qwPLth4MKMojkNGYMk8IbAygIVPbBh9Y9bcg1n2MCNtBarTkivN7Q4SGhXBVtM39UMuz
	u8gA==
X-Gm-Message-State: AG10YOQRwpLVc2PHnGERtRUtLW7lDOfSOO6FcxZDmgzoMUaIEv7A11c5g4S60H6CLc9sYw==
X-Received: by 10.98.72.130 with SMTP id q2mr10181325pfi.154.1454584797924;
	Thu, 04 Feb 2016 03:19:57 -0800 (PST)
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com.
	[209.85.192.176]) by smtp.gmail.com with ESMTPSA id
	d8sm16461821pas.14.2016.02.04.03.19.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Feb 2016 03:19:56 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f176.google.com with SMTP id 65so42240638pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2016 03:19:55 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.124.164 with SMTP id mj4mr2390183pab.128.1454584795585;
	Thu, 04 Feb 2016 03:19:55 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Thu, 4 Feb 2016 03:19:55 -0800 (PST)
In-Reply-To: <1454512359-2140-1-git-send-email-samuli.piippo@theqtcompany.com>
References: <1454512359-2140-1-git-send-email-samuli.piippo@theqtcompany.com>
Date: Thu, 4 Feb 2016 09:19:55 -0200
X-Gmail-Original-Message-ID: <CAP9ODKo9D=V8w1-oJmz605VsDWGtFJ=1raD+35yeSJCkRt-TSw@mail.gmail.com>
Message-ID: <CAP9ODKo9D=V8w1-oJmz605VsDWGtFJ=1raD+35yeSJCkRt-TSw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: use common PACKAGECONFIG to build examples
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
X-List-Received-Date: Thu, 04 Feb 2016 11:19:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 3, 2016 at 1:12 PM, Samuli Piippo
<samuli.piippo@theqtcompany.com> wrote:
> Each Qt module's examples can now be enabled with PACKAGECONFIG.
> Replace the webkit patch with a PACKAGECONFIG option and follow
> common practice by not building QtWayland examples by default,
> those can be enabled in a .bbappend with PACKAGECONFIG += "examples"
>
> Enabling PACKAGECONFIG[examples] in qtbase, will still cause every
> Qt module to build their examples.
>
> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

I think in a subsequent patch, examples should all to be disabled by
default. What do you think?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

