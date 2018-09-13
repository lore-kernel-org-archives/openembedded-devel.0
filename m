Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw1-f48.google.com (mail-yw1-f48.google.com
	[209.85.161.48])
	by mail.openembedded.org (Postfix) with ESMTP id 273356FF0E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 20:38:25 +0000 (UTC)
Received: by mail-yw1-f48.google.com with SMTP id j131-v6so1741943ywc.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 13:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=5TwmfXneDQvXVURQvEMF6Bv73wIonGe7lWWRIwLUlkQ=;
	b=e2tOA12Xua2u7CE7RPojFO5eHoOIz7FAYDwnfku2F4h4VNxPctBQzlZo23H/On+5mh
	LgdnsiOtMkl6tULMd2eSPjtPwvFS6d9QGaEl9+VKTuwAQRMamVl3dXS+6TnSQK1JUu+R
	Y3CqVAbGTgn5VFgdihbLfVjjXPGDikzWN9rC4ZNRwjHxO2f3Hl6vnOO2JBFTCJvvaBDu
	EzVwRIhhIZyGBo3ZMMzlAoWO3WkQfrp3iVE2d+3b8DmYg/7WouKdOFWg44MZmEqLxr98
	mCzaw2VbCrU4HlrgzlfC2zXi0j0Cijw08vVKKjWo5TbzaybBNoKzbTNFFk+wVXMhZG2g
	hnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=5TwmfXneDQvXVURQvEMF6Bv73wIonGe7lWWRIwLUlkQ=;
	b=mdPFH2AiOLIfTj+mTm8IESCsgiGpHMDLA+4pMASg4LjEr+9eJzy/h7PXtDB2jnxJED
	Qo9jYS/u1vQcuZAswSwykWewQfkHz0+W4ncqqz0PQzuZRKQNybRMH39r2Lgp8SYxeQG2
	mZ4f4Evdh/vChMJLKIgj+26ahQn6Gki7/xxL+kNhdi2JWnY7BASyTigB6PCeyXRrnAlL
	/xkJW4CNgOl6qvGyzPIdnOF7uHwReLZfWhpjqw7RC2qmTWeC0VCTp63RHgYcOTGLQ1bq
	uIgjJT8D5djAmhPGQlPhYoqXFmCo9FzzMXQC6lyZMyei2fHMoiDqoo3A8znCyNA9guLt
	UHMQ==
X-Gm-Message-State: APzg51Dm2rhPRfi0xYHDqfFeovNdhLp4YbYCEtIHyN5X2sgKhKzSJJ0H
	eXGjNbhDQ0zp5czuXzbU5uYRC2WvqXjHrt3jhYqhNA==
X-Google-Smtp-Source: ANB0VdajjRSYcDdFPVYcMNP0rd7pDnYEhFhTcwo7tTOJJmDPM3na9p1TuyaEV9C0lhUxi/HOXF5DmiiRJsnfqrwdJaA=
X-Received: by 2002:a81:63c2:: with SMTP id
	x185-v6mr4300925ywb.500.1536871106708; 
	Thu, 13 Sep 2018 13:38:26 -0700 (PDT)
MIME-Version: 1.0
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Thu, 13 Sep 2018 16:38:08 -0400
Message-ID: <CAFeBWL4q3Ug4jP6uj27jgh=A3y=NK1AeKt3cTnUmWj+Vy+Jewg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: UART keyboard as /dev/input?
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
X-List-Received-Date: Thu, 13 Sep 2018 20:38:26 -0000
Content-Type: text/plain; charset="UTF-8"

How can I get a UART keyboard to show up in `/dev/input/`? I believe
`inputattach` was the tool that was favored until some years ago, but it
appears that it no longer is being used in modern Linux systems. I can't
seem to find the replacement for it, however.

Apologies if this question isn't suitable for this list. Feel free to
suggest me another list.

Adam

