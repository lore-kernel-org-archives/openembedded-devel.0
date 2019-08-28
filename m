Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1153F7F168
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 18:06:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46JYZy69S3z3J;
	Wed, 28 Aug 2019 20:06:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567015580;
	bh=Jkz4vpW83ICAHoV2BDdBxyf7HR6ply/a2r2oR7q/76Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OL0Vb51z1ZHZc+Cudg1ZUfFSSpIVWbq4e3c/7bcP6hxv7Q9M/U/sAcNZURKRd58VM
	UfcDjJoSx/jckYxi3rxssOSCsAEbivzFqs8z4L3apFCtIzI8EHsp+Yl19yrqCyWzUY
	fOTZiG4ZlNmVWoPZQFiBmh9hvS7pVTTebb/0h1uPff4wKjgIzhRnB7C3dn4TW/jk2e
	uodr5vV++5nOd01EVu1fE/I/Mjb+jEnbSLYDlp18wemCjSdS6XXfXEMhdMUku5plwU
	PHRwQqDKHQXwkUolusEalbsLx4c2rkhXZZ9yHXPJ6qDbJSw5TqvylGOFvh0HgNb33L
	w2LLMuLUWfy+tUKEKi3NOOeAR0i9asGUgsmV2Mpw/T3TFk+BOuD9NgC94FUqqL0kh5
	2K0IrPK5FhyO/W/l7vLtv+w0D1viWYhmfhW4IZdP7X6lWjK+thY+P+Osza7na3UtCX
	vnU+s8+SYmo+SDx/e3qzDIIm/W5tlbp5R9J6InbmHcpmPys36QcAkoCmhadWQ+kp8P
	I9VxO+1BQbgGg5+3JRC8ZUkW1XOl2FQCl4NwEPdaB2KH97yHPvpuLoLtfL2dSS3Gqh
	Ng9IQEianaymOlbKjohgDLXUK6HS8sOLkrQDmMyvzRQbdRwQPUE0bQbqWXDStUtGOm
	koKx8eXVgwzooNdS12J2gm5Q=
Date: Wed, 28 Aug 2019 21:06:16 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190828180616.GA3044@localhost>
References: <20190828034307.182169-1-kai.kang@windriver.com>
	<CAMKF1sroS6zWjdRmh2GLbCF62Hnmifzdr282t8JZBB-ONzd82Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sroS6zWjdRmh2GLbCF62Hnmifzdr282t8JZBB-ONzd82Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][RFC PATCH 0/1] Failed to compile networkmanager with musl
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
X-List-Received-Date: Wed, 28 Aug 2019 18:06:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

What about marking networkmanager as incompatible with musl instead of 
maintaining an ever-growing mess?

Networkmanager uses parts of systemd as a library and also has own
glibc-only usages.

Both systemd and networkmanager are fundamentally Linux-only,
and for systemd it is known that upstream has made the design
decision to not compromise their software for rare usecases
with C libraries other than glibc.

AFAIK OE is the only distribution trying to build either of these
with musl, other musl-using distributions are using less heavyweight
solutions.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


