Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4496079E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 13:05:34 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id h81so175684oib.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 05:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=rh7xNLBZ0qPt+ccU1gfzUtaS9tGh1Dde3fh4qG4EHb8=;
	b=CqFcYmy+VNYaT25r+jiBJTX9iu9uZLgty4jtfNnAAk8eD6isi3NJH+heCSr9R7fF+M
	rpofueadvIVc/XCOny2Z1vtV1K7ou4TPefYKaSsNxRGunrUV58hqdIkp0j9LjrbVLO5x
	l1TGEg3m+PidyeSvZgkzhop9PlZVOwg1xqKafDGU7LTpzXfC9nThXLiXw93Ij4debflm
	rNcRrL9nVKd3MjNZfNz1H7ssWoTouRA9tBsV+om/uTjZ7YutKMmEEvIfpbdYk+N78NHn
	OPg1iO4Rrm6/2temA9XxKWvJvhbwswYHp59ZrZoZdaFOIOCJfziJkVuMTnPVkpuGWjuJ
	tozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=rh7xNLBZ0qPt+ccU1gfzUtaS9tGh1Dde3fh4qG4EHb8=;
	b=YvCINoMDeBigAAR9DLJ9Tm9XzMqpyNTS0JWzTNggLeEJAtu1AVL/Qzng9dMiiPlOaQ
	NKoGGVkTSEj+FkzuI7jipIGNHMfu5nMm3LCPZWExx6qBFRc3EpQLORp9yxgXk6rsf6Zx
	sp9hBVOSmyQSAbvFZb3qQrF3tuiCuRDH8K++efqqzrnigib5z24/cLYEK7I5ojZeSyWz
	Ymcguhrg/Vy7QrIyXYhGvylWjwtmPnMaDyhrRDfljXphRykDW3cyxsRVVN+4IYawpQHo
	O9uQPA9+j7CVpRyD20ndPblzjqatm3HirUIp3jlFs4INykaGpNlssI+bn6TieG7eUebW
	JODw==
X-Gm-Message-State: AJaThX76lbXWUzYx2g7IaSUccGIMOBF4gCLEk434jfD+nrYNuAPsDD9+
	JRbxn56iglkNeF/Ir2Yynn9V7DqD
X-Google-Smtp-Source: AGs4zMbS6PDv7NFW+LPeIhIR+jImz6H6f5eYfUS3K3IuGlPT0yQmjL7FnWV3hH+oY1UCZrKCwkNrIQ==
X-Received: by 10.202.72.74 with SMTP id v71mr19573244oia.34.1511874335772;
	Tue, 28 Nov 2017 05:05:35 -0800 (PST)
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com.
	[209.85.218.53]) by smtp.gmail.com with ESMTPSA id
	q33sm13289949ota.14.2017.11.28.05.05.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Nov 2017 05:05:34 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f53.google.com with SMTP id p23so174392oie.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 05:05:34 -0800 (PST)
X-Received: by 10.202.67.65 with SMTP id q62mr11074256oia.37.1511874333906;
	Tue, 28 Nov 2017 05:05:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Tue, 28 Nov 2017 05:05:32 -0800 (PST)
In-Reply-To: <CA+-BmJbzMoPd2bEyzJkrHN=+RvUmJu0F0XVFmPSSCJcKcUPe7A@mail.gmail.com>
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<87h8tv21fw.fsf@rkubodac-desk.ger.corp.intel.com>
	<CA+chaQd9i+Hn_7E0F5zVxP4AY5d3s5gaEJcnBUGF4+y_ghkxYQ@mail.gmail.com>
	<877eur1nby.fsf@rkubodac-desk.ger.corp.intel.com>
	<20171115174136.GA4530@jama>
	<CAMKF1soYSpfBApFPmBa1zj1U6nkqJ9+nqPckRser8Y3eWPmRmg@mail.gmail.com>
	<CA+-BmJYi0W7whu3T5BneZGdt2me2J7iJBDXMy9FsoaKrnJvF3A@mail.gmail.com>
	<CADseiPmvSsqCQqjbU-VwGMhp=y97d0AFx5R2Yrnmw5zf_kji_g@mail.gmail.com>
	<CA+-BmJaRAePpM1UfwLOTPS0NPuViq5mQGD51BNwZrtES5XgzOA@mail.gmail.com>
	<CAP9ODKqei-6juaQQOZ04mpF5Er8n1Op8s_Q6NfR9J2STY8fqsg@mail.gmail.com>
	<CA+-BmJbzMoPd2bEyzJkrHN=+RvUmJu0F0XVFmPSSCJcKcUPe7A@mail.gmail.com>
Date: Tue, 28 Nov 2017 11:05:32 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqWJAzn4o_=MwJfMNN6+MY4cMP+q068Rs80H9YKJpUA6A@mail.gmail.com>
Message-ID: <CAP9ODKqWJAzn4o_=MwJfMNN6+MY4cMP+q068Rs80H9YKJpUA6A@mail.gmail.com>
To: Ayoub Zaki <ayoub.zaki@googlemail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Tue, 28 Nov 2017 13:05:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 28, 2017 at 10:47 AM, Ayoub Zaki <ayoub.zaki@googlemail.com> wrote:
> Hi Otavio,
>
> that's a shame :-( thanks for the information.
> are they other browsers that are well supported with GPU acceleration on
> iMX6 ?
> what about Firefox ?

GPU works, VPU does not. You need to pass some params to ignore
gpu-blacklist and like.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

