Return-Path: <marek.belisko@gmail.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id C4ECC6006E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 20:21:32 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id h4so89886278lfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 13:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FMzC/G/bo4qCmY0+cCcVWB/HucEQmjPp8AZEuVontHo=;
	b=IPOhaTLrCq6vFKtCNdTW0q7b47xNAF4IE6FOv7U5zptdE2WaqJTTczeGUCjlKNKxNt
	aklAKAd4MyAa48hOjOtwFu6/OXteQBq1ybisaD/BXg0lIommX9CZZs0ISN3Qj2rfEbmn
	jYzZfDd1VU5jO/xyW0dA2CjXOjCRhhWWh/MB7AFMSjQsnUNxpSUI9lRWMwILuzntSo0/
	MpoAF+i8QpZnVsX+U260Vcl012aNZ1NMNMa48VqjHdPvucONizCJn/8d9SyOSwcAh4xR
	4BRfj76KlCJLOp+1NKjE4LToH+wCqKhZaj+CfeI7n3P24wXKEGmHFb4LAVpTNaYRnzFf
	cYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FMzC/G/bo4qCmY0+cCcVWB/HucEQmjPp8AZEuVontHo=;
	b=draViR1B7Hq2wd9/5cPDEGN4dunLKzWtjqGn6rCCFcTW6TqNdt3dRJMD8WIcS2NxcI
	IkZQOqwu2cMNtNhEclm5iv2Ee1LNAKgxDdXok5a8+lrrACbldtjKyWNutWPHk7nTMK0+
	n0ZZzVecf88N1y3pxzh/S9jMEgsaKsMoABJl74IJ3VU6kVRLEhUwkKHVFh19coZP844p
	wXNWRpkAhNg9wx+rRKtVZoQqGnNrYq5EnN52YQnSHYtwoXrT24nqezznpLXZLPEhAyHl
	VxdiCjOGtRpk2pNA/AIwJzYJNqgYU28s69C1NTHERpsfqxNDt2bXntGTRh63E4kbMm4D
	UsKA==
X-Gm-Message-State: AODbwcAiAZxbdtHQGs8AZuJTw9j/+ElLYraKqyKq5qOWC4ZzbENXIxFC
	SPw9icPbIZ9uawf6cqMAXBzz/QQk3BXi
X-Received: by 10.46.84.92 with SMTP id y28mr12510949ljd.63.1495743693087;
	Thu, 25 May 2017 13:21:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.141.202 with HTTP; Thu, 25 May 2017 13:21:32 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1705250847490.19265@localhost.localdomain>
References: <alpine.LFD.2.20.1705250847490.19265@localhost.localdomain>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 25 May 2017 22:21:32 +0200
Message-ID: <CAAfyv3517VgOHsPWRRHs2vdTr3hBt-dp+u=UGmwHZ+jdNh3sMw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: is there a reason meta-openembedded/meta contains a lonely libgpiod.bb recipe?
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
X-List-Received-Date: Thu, 25 May 2017 20:21:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 25, 2017 at 9:10 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   is there some rationale for libgpiod.bb to be the lone recipe under
> meta-openembedded/meta? would that recipe not fit into some other
> layer?
I posted few days ago recipe for libgpiod. Please look at:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-May/112810.html
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

