Received: from mail-vb0-f53.google.com ([209.85.212.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5NmG-0004uf-PU
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Feb 2013 22:52:37 +0100
Received: by mail-vb0-f53.google.com with SMTP id fj18so359582vbb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2013 13:36:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=H996F0ARmxdqoM00VdY53lVGfzKOLGRaTWMnsGLh2Vg=;
	b=nrrWNHvYTPy8l2zslY3zqNPiJw630MrbkyvpeH5VFJSaicyWtfX/8GaYynxFaZjthu
	kTMFevwBslmYtZW7CcHEFhwbeMVpDBPYrK5gRhO0gJjTN4UGUnkb9qgZpQOQa0XAwr37
	HBkuVKP7xQaXomRAB/WRzHIUdwU/cEnmrc1PCZBAauJTcbsyCPd35C3WQpVITgK5WR7m
	iuFUAmW3kZPSX2mXxR5LpDkD5A12+fM/kuBK25B6LPoYgZLJSTiQgZ3BiDVzFHEy9z+d
	k2KSz+segTv4cjbAuI0DyJ4UmBqJ6wcY/gifoPjqEiPjNkvzOg8Rf1QI4CODG5qkX/Ze
	vBcw==
X-Received: by 10.52.21.175 with SMTP id w15mr22154977vde.100.1360704996579;
	Tue, 12 Feb 2013 13:36:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Tue, 12 Feb 2013 13:36:16 -0800 (PST)
In-Reply-To: <20130212212255.GF3300@jama>
References: <2760168.9kFd94gL1F@helios>
	<CAJTo0LaJNDB6XjK0M4rsS9+z7AZ6K_n0TAX8+7KH2GuAADgCZw@mail.gmail.com>
	<1906630.s5um26QAQj@helios>
	<CAP9ODKrOM9bh-MnzQvU29iVwYdRvw4m7DMYZUcMV=wKYJ5Q4bg@mail.gmail.com>
	<CAJTo0LYFcT5P=p62Nn2kBak33LCfBXQ_KFL-oF2bHFKhguk1rg@mail.gmail.com>
	<20130212212255.GF3300@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Feb 2013 21:36:16 +0000
Message-ID: <CAJTo0LZREeVX7cWLttEvzxSK_VMNPQyZuQqReEMTH-zbHObdLw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmkrqAul+DkCQTPdCa7/3ifGZbrCopGHVBTHoM8EHmaV+0y/RzHq8LF85+AzONAY6n451ul
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] RFC: meta-oe appends and overlayed recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 21:52:38 -0000
Content-Type: text/plain; charset=UTF-8

On 12 February 2013 21:22, Martin Jansa <martin.jansa@gmail.com> wrote:
> Yes, xf86-input-tslib works
> http://git.openembedded.org/meta-openembedded/commit/?id=506d5f781f5ee93e3c9b8ca51a7fb65f40d4a8b8

[ surprised face ]

You totally should push those tarballs to a git repo on fd.o,
pengutronix has clearly abandoned it.

In a harsh mood (its 2130 and I'm working) I'm leaning towards making
tslib a packageconfig for qte, and moving tslib into meta-oe...

Ross


