Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 78EB560079
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 23:20:39 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id q22-v6so9493816pff.11
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 16:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=6eMP2fGFKJN3jiDWxIHs3KD8B5s8pdENg9cYs16SW0A=;
	b=HO7M56vX1QCRjEv2EqdvXQhJ+NhLCArTr5gYOGzDIi0TALtlP8erw1q47YcTyix6Px
	TxKqFI/XQnqtxNFEl0IXGqgdSyIqjvmQCNcOJFBySIY1dQUs/9SM8cqIEsQXCUjmSht5
	zDo6YWcXMF3KhMDAVp0BTL/7PSbRSsKhzXIe4SGEJNBqiOgw2MbGM5z4pfLGDJ4vpEtW
	xnOJtsaQ9TlybMhTRlzmHiOz8lUYasJnEIgEINHU/X1ksGcJo0sbTj3M5YCDZYWmV7KS
	R3NY8yWWDQk+boj608vnHMHM8UUDZF+LxAH11nEQ3yNzrdILFF34oMit7vp/18XHJm3c
	tZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=6eMP2fGFKJN3jiDWxIHs3KD8B5s8pdENg9cYs16SW0A=;
	b=sVDcgjHmBb6SgGwqbGFX9g8bMMFEVBMjxhj3yubquZpB8KQjAH4X5t2Ei/X+VkHxBy
	tt82IHNRyXRP0akRwm8hp+8NZBGzs7SD1tv0iEzrrgHwnts1BceaU4rpO2UNvZ7KXvHZ
	Kk9mwM6rxc1m85+1kWU9s+pY3I0HKproaLkkCusaex6ofA8VOditXeCr5XuswQhKpMIR
	7Mhs1ZFhEU92yb4VOSE96773oWhg1U8ozCHHA+A731H+Ch2UBwz4Onxq2u2sWEmfU5Ql
	ozthZj0RjNs550N7TM9KOYhJpwoxVVsr5SC5LYWOr+t2e4GOvwy5HdR4LDZ2pkFeY7eL
	qhFA==
X-Gm-Message-State: ALKqPwecktmGV1k3EihGiuxluwxpVA1wJ8qhr0CLEBa6KrbPxHjyVmil
	vJgFplOy83HFXpGdrm2LiPpb2n3ATkZTtzQ7iOQBlg==
X-Google-Smtp-Source: AB8JxZrec5cf3lgbGg3OyYM81odCFK1Lx7lzieZMuwmxTssZl52Es0mJPKRjo6jfpnIPHtTd3vkXeCzNZqnXqQ5jlFE=
X-Received: by 2002:a65:4a46:: with SMTP id a6-v6mr354710pgu.227.1527031240802;
	Tue, 22 May 2018 16:20:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Tue, 22 May 2018 16:20:10
	-0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 May 2018 19:20:10 -0400
Message-ID: <CAMKF1spo+S9+NF7W6dkEnBBLDxWQfvrg3L93Rz1jdZ68UL182g@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: meta-openembedded patch flow
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
X-List-Received-Date: Tue, 22 May 2018 23:20:40 -0000
Content-Type: text/plain; charset="UTF-8"

Hi All,

I am writing this to just paraphrase the patch flight process that is
in place more or less
and I am going to follow.

We have patchwork instance where all patches from mailing list are captured

https://patchwork.openembedded.org/project/oe/patches/

I am going to watch this and cherry pick patches from patchwork into
master-next branch
master-next then will be run through CI loop on my own system as well as on

http://jenkins.nas-admin.org/

tasks - oe_world_qemuarm oe_world_qemuarm64 oe_world_qemux86 oe_world_qemux86-64

For layer maintainers

Please review and provide your ACK/NACK based upon your own testing
and judgement. If
you want to rely on the jenkins jobs above thats fine too. If you want
to test your bundle separately
and send a separate approved patchlist via a pull thats fine too.
Usually we do not give explicit
ACKs and provide feedback if a patch needs to be changed. It would be
good if you start providing
ACKs if you think patch is good to signal. If a patch is not
ACKED/NACKED and its passing the
jenkins builds, I will assume you are OK with the patch for master.

Submitters, please watch the patchwork for progress on your submission
Hopefully patchwork will reflect the current state
more accurately, if its stuck in same state for a long time (1+ weeks
) send the pings to maintainers.
you can also check master-next branch if its still there and not
dropped then its in queue for merge

Since we all have limited resources and time, I would invite all of
you to test master-next for machines/distros you are interested in
(keep in mind master-next will get rebased) and provide
feedback/review so we can include it in decision
to accept the patch, any help will be appreciated.

If you have suggestions, feel free to share here

Thanks
-Khem

