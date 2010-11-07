Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pixdamix@gmail.com>) id 1PF063-0005FA-GL
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 08:55:29 +0100
Received: by eya28 with SMTP id 28so2392931eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Nov 2010 00:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:date:from:to:cc
	:subject:message-id:in-reply-to:references:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=WIiC2idEUrfwkmCzFUEMIL8YCER3dSZZlIXVD8Nlh2c=;
	b=vvZWKJ3Sm72OTcYusLNpNPOyTrOKI1REulLtNE9JlJgMnuQVLgros16tyNm2bau4Jq
	2FbjMcWRF+nL6+pj4AK9DTbIWemLHi0xURWuuEpM7fevwlYJ2YIMHLsCm1xdA2nItX4/
	XvC8xkNt1oO/bhWZsJKxxojalmwPRc3uT3xWg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
	:x-mailer:mime-version:content-type:content-transfer-encoding;
	b=Mj9uEC6l99ZNuvTqpN0xd2cpefXxfPaIzHtzo6ffm6QgXK+ubSWWGJKN0+QRMd04Tg
	UqC4eyiB3v3eE15FJVHDIatz1h5fW8q2o9R7a+IR657ReOFN/HMr/SfPXWsZA7LQ+4Gt
	sg2sK+IjLgZdgrA21KCU452f+1INNgMt5V2og=
Received: by 10.213.19.19 with SMTP id y19mr2807421eba.52.1289116474157;
	Sun, 07 Nov 2010 00:54:34 -0700 (PDT)
Received: from cortex (mal35-3-82-240-201-90.fbx.proxad.net [82.240.201.90])
	by mx.google.com with ESMTPS id w20sm2894630eeh.0.2010.11.07.00.54.31
	(version=SSLv3 cipher=RC4-MD5); Sun, 07 Nov 2010 00:54:32 -0700 (PDT)
Sender: Camille Moncelier <pixdamix@gmail.com>
Date: Sun, 7 Nov 2010 08:54:21 +0100
From: Camille Moncelier <moncelier@devlife.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101107085421.3c0fea23@cortex>
In-Reply-To: <20101107012026.GB3843@jama>
References: <1289061084-19901-1-git-send-email-moncelier@devlife.org>
	<AANLkTi=L6r1i9yayoo9=j_JNx5Yd+bGhgQYotEp=SJ-s@mail.gmail.com>
	<20101107012026.GB3843@jama>
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.22.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: pixdamix@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Sun, 07 Nov 2010 07:55:29 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 7 Nov 2010 02:20:26 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:
> 
> should not.. but now it is, because it's broken by autotools/base/vala
> bbclass (in this case is maybe even intentional to remove lvm2
> dependency?).

It is as lvm2-native doesn't exists, it seemed it didn't made sense,
(at least for me) to provide parted-native with lvm support.
> 
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/026188.html
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/026189.html
> 
> Regards,



