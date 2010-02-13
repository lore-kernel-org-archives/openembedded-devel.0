Received: from mail-bw0-f224.google.com ([209.85.218.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NgJox-0001mD-RT
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 16:22:14 +0100
Received: by bwz24 with SMTP id 24so1470244bwz.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 07:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=QV+eWSVs1oHrqhiCL70I8iTdRDBn/uLhbKtlwrqvu/U=;
	b=sbb0fYWzsr1+mfg7IC6rl3zTat8GGe2bWtpqAQ1gmyIhgEJycA2ZT+TCGhWBk2eP3O
	0M2XEV1pE5QL8aJcO/g9vILEogBm2NGuQOO4lT6t+Y2Id5wabXr56DCviNttWZGL3ArX
	EMXneiWxjBxpB13G3BuOVfOwqhqEIpOYXuO2M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=W9kYJGIOx5wUyfSA2pQDm72SOQwkhEK3B5VoZ4/0yGYb3qVE7kDHiQEPJRC2qI0X8t
	V/j8L8a9Zm7tY0/WBxpPobP4PWP1Sx8r2Oymgbxqy/F7mKxBfS31ZWcBXODEE4ua5AMw
	Fuh/wz4bdsW+Tq6LntrIXNav9cH+EbCpVM9R0=
Received: by 10.204.16.83 with SMTP id n19mr1813174bka.96.1266074374722;
	Sat, 13 Feb 2010 07:19:34 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 15sm1955263bwz.0.2010.02.13.07.19.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 13 Feb 2010 07:19:33 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NgJp8-0007qc-Sz; Sat, 13 Feb 2010 16:22:22 +0100
Date: Sat, 13 Feb 2010 16:22:22 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100213152222.GA30029@mx.loc>
References: <b8e1ecc81002111744u4e9c2d84xc5cc1e3d2d1b3a0d@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <b8e1ecc81002111744u4e9c2d84xc5cc1e3d2d1b3a0d@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.224
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: busybox* Fix URI
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
X-List-Received-Date: Sat, 13 Feb 2010 15:22:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 11, 2010 at 11:44:04PM -0200, Marcos Amorim wrote:
>Hi All,
>
>I suggest move SRC_URI from all busybox_${PV}.bb for busybox.inc, but i dont
>really if is possible.

The patch posted here:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-February/017232.html
uses tar.bz2 and switches to new-style checksums. Please use that one
and
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-February/017231.html
instead.


