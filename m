Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	by mail.openembedded.org (Postfix) with ESMTP id E38FC60557
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 11:01:07 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id u82so135945340ywc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 04:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-transfer-encoding;
	bh=fLkbFoOU10sPQNocIiMl+pmnV0ZGBaIBvHPlhdaiVJ4=;
	b=Fhmi9NtSoZPocOsz7YcdEvSApzC3+eC8bx2Ad+CoW9iTIcgbR2bVsVahPR04/ol9J1
	Qlnmxs6UMDVmIak7Jx9tU+3P6/LcVB4s8F40jakzVk23fQCjW8rX87cO/YlUtEqx/Pzm
	bnkX639HhYb7jW8Fh3ucqrqFA8IxpQ2+pgif8kjopHsDGtIUyM1LLhUDMMLuSF+7eOVw
	6Eua+we+2uMredsgm5fUHxkbT1s+/rb3lZ0qhp9I9he1isWTEJKsKWLYnerDft7nRwQ2
	O1rv0sDiHDasxJ+aIcWxwbJjeHIMAErFm+M089WnLTWR+8HOxUSdyz6dJw8Lzhs1WxPS
	/wlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-transfer-encoding;
	bh=fLkbFoOU10sPQNocIiMl+pmnV0ZGBaIBvHPlhdaiVJ4=;
	b=Izvpi+e6r7hri7waipVX78wmOb8MYs8afuuUyBFRyriFBr7fpfEuPUsmvlBj90CbqJ
	a467GEEPg18vHgtIxPfgjJV0yt4O6+3z9H5oivY1pjCEsJKQXY9d2Qxs5mE8WDXV/Y3Z
	zAAjZsoYRpXRYK1srvgw4AW4uLi1mcsG4UvmaNUQn79Zht8TIBXL4meQvfgcOo5r4viq
	rPhdmVzZ+6DrZm1vbGyh7IlxX9sTAUFQFL5b4nsr1dbeWFzaFbT1+nbrVjbbu88boonv
	UGRFDOD0BvM4e5YdpeceRP7/Xi7MFTktfEltgk8DpcMyTt5yRA0qGhzEqVY6IvsXdohg
	YyGA==
X-Gm-Message-State: AE9vXwO7OKGXNV0gwF8VdDy0vTdCT7WXc6ESmtD/psPPNiotMV8WzjE8oUOMxX6sekvh9A==
X-Received: by 10.13.243.196 with SMTP id c187mr23563050ywf.137.1474282867672; 
	Mon, 19 Sep 2016 04:01:07 -0700 (PDT)
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com.
	[209.85.161.171]) by smtp.gmail.com with ESMTPSA id
	p71sm2778328ywe.40.2016.09.19.04.01.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Sep 2016 04:01:06 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yw0-f171.google.com with SMTP id t67so138033091ywg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 04:01:06 -0700 (PDT)
X-Received: by 10.129.146.196 with SMTP id j187mr3207725ywg.28.1474282865851; 
	Mon, 19 Sep 2016 04:01:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Mon, 19 Sep 2016 04:01:05 -0700 (PDT)
In-Reply-To: <CABcZANn79dEop66L+-zU7EOyv++T-AcH4Qsg=Z_vkQzShbo4LQ@mail.gmail.com>
References: <1474167179-6717-1-git-send-email-zhe.he@windriver.com>
	<CABcZANn79dEop66L+-zU7EOyv++T-AcH4Qsg=Z_vkQzShbo4LQ@mail.gmail.com>
Date: Mon, 19 Sep 2016 08:01:05 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp2+qfMO2Qx0nP=8ysOjWhUCeAmSPhjCNez1ddGjaNXkA@mail.gmail.com>
Message-ID: <CAP9ODKp2+qfMO2Qx0nP=8ysOjWhUCeAmSPhjCNez1ddGjaNXkA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] bash2dash conversion
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
X-List-Received-Date: Mon, 19 Sep 2016 11:01:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 18, 2016 at 12:36 AM, Christopher Larson
<clarson@kergoth.com> wrote:
> The purpose of =E2=80=98command=E2=80=99 is to *run* a command, not check=
 if it=E2=80=99s
> available, and =E2=80=98type=E2=80=99 is mandated in SuSv3/SuSv4/POSIX. I=
f dash doesn=E2=80=99t
> provide it, it=E2=80=99s broken.

It provides it and works:

% dash
$ if type dash; then echo "dash is found and working"; else echo "Error"; f=
i
dash is /bin/dash
dash is found and working
$

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

