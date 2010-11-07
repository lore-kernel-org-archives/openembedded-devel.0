Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pixdamix@gmail.com>) id 1PF2LT-0006Bq-VA
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 11:19:32 +0100
Received: by ewy2 with SMTP id 2so2297183ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Nov 2010 02:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:date:from:to:cc
	:subject:message-id:in-reply-to:references:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=mxx2b4rF5+//dyhgupiw/Kccl5655I8hYeV2xiMKoG8=;
	b=nmQ7zwu6tkVMzmNWVf9KOxZbutAh1pO3YuiyZIbRhZVBvhI3RFL0P6fEKtVtCIzGSL
	u/EJRjaZOd8irqSVvkpvHlLK3NZ6mipOiE9OE66bDPfR/Ir1zUbweebh27qvWNY4EQ3b
	0slZQfw1HLbdsEg4P5UFpwlPcPV2s44OlhoWU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
	:x-mailer:mime-version:content-type:content-transfer-encoding;
	b=Vn3W0BCyZ5Xqk+hBVKqvH582Tu+cG+im8J7pnprTYqwAkatGfC2GKO0EXZwY1obnWv
	DiHL2sLFN9VucMCc3B/C3CfmWKS7+4Pg7ESvpvft4nbbhKnD/XyAZd56z0m/OqBD8sW4
	yI/f0wEDw2VxHbCNRdBydldV8xkWFs0adrUfw=
Received: by 10.213.19.7 with SMTP id y7mr1353543eba.14.1289125115258;
	Sun, 07 Nov 2010 02:18:35 -0800 (PST)
Received: from cortex (mal35-3-82-240-201-90.fbx.proxad.net [82.240.201.90])
	by mx.google.com with ESMTPS id w20sm3007420eeh.0.2010.11.07.02.18.33
	(version=SSLv3 cipher=RC4-MD5); Sun, 07 Nov 2010 02:18:34 -0800 (PST)
Sender: Camille Moncelier <pixdamix@gmail.com>
Date: Sun, 7 Nov 2010 11:18:25 +0100
From: Camille Moncelier <moncelier@devlife.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101107111825.2e8a8e88@cortex>
In-Reply-To: <AANLkTi=c6EsH_dYsZnyNPijJNT5wDqbTCTBjFt-ztVt=@mail.gmail.com>
References: <1289061084-19901-1-git-send-email-moncelier@devlife.org>
	<AANLkTi=L6r1i9yayoo9=j_JNx5Yd+bGhgQYotEp=SJ-s@mail.gmail.com>
	<AANLkTi=i3bg7VdTKhEX4oAkXzX4m3y58F+8+qSfq1qsb@mail.gmail.com>
	<AANLkTi=c6EsH_dYsZnyNPijJNT5wDqbTCTBjFt-ztVt=@mail.gmail.com>
X-Mailer: Claws Mail 3.7.6cvs62 (GTK+ 2.22.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: pixdamix@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 01/11] parted: Added parted-native
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
X-List-Received-Date: Sun, 07 Nov 2010 10:19:32 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 7 Nov 2010 01:57:50 -0800
Khem Raj <raj.khem@gmail.com> wrote:

> >
> > Are you saying this for DEPENDS_virtclass-native are for the whole
> > recipe ?
> >
> 
> Just  DEPENDS_virtclass-native
> other parts look ok
> 
So we would need to add a lvm2-native, device-mapper-native etc... No
such a good idea imho...

--
Camille Moncelier
http://devlife.org/


