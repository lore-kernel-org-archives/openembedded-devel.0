Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id A2624729F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Apr 2015 00:30:59 +0000 (UTC)
Received: by pdea3 with SMTP id a3so4317731pde.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Apr 2015 17:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=iBQHY7kgy96wSISYXFDohVKLMCVVqyy561ztyM4Yvig=;
	b=Vpr3tOaw7qTq+f2AzuCNgo8xDB7mW/zQ4MzWP7fJLfCVqIMfYucy4zdIIYo/PuQrTq
	6D5YDr0D1uWwLvcjTHpA/xBdRwciJBpOSeAnrKMGUwMyycoJ9rNp4KbB4ZnA4bpOkS4h
	SrBc3MGVT14V2DrvNXxthO4iyXAliyUsMiPA/4nOYMqtEA4ZQn6prr6tDy+NXY+3aoX+
	4lE1VskzyH50hq7OZD8PX4jrPJU+FC+ka9OvKAUxiyYbiwa8GvgomVno/vE2926dSiQp
	Z65xg9W8ze0MdSBkh5zLqqo7VdXirZveuM3x++S4DsHTO3Cs1+auXqAZYQtjQu9McXKD
	dXhA==
X-Received: by 10.70.44.3 with SMTP id a3mr60841605pdm.93.1428625861547;
	Thu, 09 Apr 2015 17:31:01 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id kq3sm197652pbc.74.2015.04.09.17.31.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 Apr 2015 17:31:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1428624150-7753-1-git-send-email-akuster808@gmail.com>
Date: Thu, 9 Apr 2015 17:30:59 -0700
Message-Id: <7F311B04-E1D6-4FA8-8218-A754DB918102@gmail.com>
References: <1428624150-7753-1-git-send-email-akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-ruby][PATCH] bundler: Fix QA new Error
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
X-List-Received-Date: Fri, 10 Apr 2015 00:31:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Apr 9, 2015, at 5:02 PM, Armin Kuster <akuster808@gmail.com> wrote:
>=20
> +FILES_${PN} +=3D "${libdir}/ruby/gems/2.2.0"

2.2.0 could we use something else so we don=E2=80=99t have to revisit it =
when git recipe moves to say 2.3.0=

