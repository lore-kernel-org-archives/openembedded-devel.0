Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 941B477143
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 16:44:34 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x130so12509798vkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2016 09:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=aXFfVp4ew9yUdk6hidfbq/uVvfiP6V/+MWlvaclf2bs=;
	b=r9eKMqOBZc+emhxDAw1sE1h0hgAxOvNwbdWZhHOujruqsBr9rtCgDMZF4Fddgln3Bo
	hx/v7lV3ju2X5B+Lig9bAb1APXa6IRnpTEcy9NN11B1AZY/AUrhlKd886QJpvIr967e+
	UDiM8cKbnody8K3ooF4zihSiqirFWfztKUO99SBCmBhVQVkRIEi0KfwbPg5oDLh6CH9L
	n2uBMaEJCgIsrVC0hxbRqChX6Dw/BLhRzsUqAIAK/6JZMejEusIbNca4g7TWDv89mHbp
	URCjiWvK0aGxaqpZzhQWxnlbYzwibokQNGykvNwgXgAEwYTRwXox8ufOlVpmF6ANRYnA
	PL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=aXFfVp4ew9yUdk6hidfbq/uVvfiP6V/+MWlvaclf2bs=;
	b=mtGvONnbXvmmxVm3pr7iwx6zbFdAsrTCAJR7QEpFUq9ugUXC3cKg0ph2nzANUSh/Lk
	Ik8KrNZ3KBx2nwc4J22eymEY+SvVZ/9xuMiuNltm+t1RpRc2u440ZEyGXUNqI7Z8Whva
	nl8naiRrXo8EirwtHlkXKdNx7+z71oSXWBc8yJO21nJYecukXwJ4UxL5zwq6oYx5c2V1
	x7DYPYLBBgl55Sb6dQR8exRBdgOo5oN2PQTQGDcJRtvoFdLtSIBKOpYgBB2E27MATNvj
	p1mlGD9aTv4y+IyZf2yLXGAwGwfbxPbTCtHJKcRWRRYPvdhAhUtJ4MFo2IiaYbImhsl4
	r33w==
X-Gm-Message-State: AEkoousmyE8sDP9HR3HIEGR7A+8qukNv7vsaEeC6b5IsXAUXiEug2c+RcLGuiMyreL7ofA==
X-Received: by 10.31.131.195 with SMTP id f186mr5676983vkd.147.1470415474261; 
	Fri, 05 Aug 2016 09:44:34 -0700 (PDT)
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com.
	[209.85.213.42])
	by smtp.gmail.com with ESMTPSA id 5sm1643563vkc.13.2016.08.05.09.44.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Aug 2016 09:44:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f42.google.com with SMTP id w127so196105532vkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2016 09:44:32 -0700 (PDT)
X-Received: by 10.31.94.73 with SMTP id s70mr1939133vkb.78.1470415472070; Fri,
	05 Aug 2016 09:44:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.138.78 with HTTP; Fri, 5 Aug 2016 09:44:31 -0700 (PDT)
In-Reply-To: <1470415127-13908-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1470415127-13908-1-git-send-email-ricardo.ribalda@gmail.com>
Date: Fri, 5 Aug 2016 13:44:31 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpOJY8Nq73idC0g+dN_BK=+Yk5=Tm15hYtuCgbE5sz_nA@mail.gmail.com>
Message-ID: <CAP9ODKpOJY8Nq73idC0g+dN_BK=+Yk5=Tm15hYtuCgbE5sz_nA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] opencv: Fix build with gcc 6.0
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
X-List-Received-Date: Fri, 05 Aug 2016 16:44:34 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 5, 2016 at 1:38 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> It seems like gcc 6.0 does not have the same behaviour as previous 5.x
> with regards isystem flag.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Did you check if there is a new release? it may fix this error as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

