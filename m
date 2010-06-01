Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OJaSQ-0005YZ-9o
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 01:01:15 +0200
Received: by gwb20 with SMTP id 20so759316gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jun 2010 15:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=oC6Z1F7OoH3OygUmIgrPn5ApAVuJmxvBLkAwbBabYLo=;
	b=xjFtQnotm99dWme46fwMCDIeWTFuepwpAJ2ugCHGF79A33m8gshR7+V2tTsRq5tGV5
	sqsT1vUguiWqlYTZa7n7CjC/ZqOWW+nNxiMVgiFtg/4z8ee7fr3JdTusghG4e3Fl8Xq7
	mukdDfxLHvc06Oxs7AEB3VvTFFq82C+bKjqT0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DwGegX4tcXZfb7txkBG5IF1//xvil6+BwwBJ56/pByk7ocN4pCHCY33RMQE/mnRfgm
	1K0KC8rbqUoDaf1ovzLjREbch9/Gh1k1yRvVlPvRgwtqVbuk0bF1M3CzJk+lQ+b4On6o
	Ama37BPYe9c6Co7AIkbVxEjdQ0/dfX9XZezD8=
MIME-Version: 1.0
Received: by 10.101.5.18 with SMTP id h18mr7426900ani.120.1275433019181; Tue, 
	01 Jun 2010 15:56:59 -0700 (PDT)
Received: by 10.100.232.16 with HTTP; Tue, 1 Jun 2010 15:56:59 -0700 (PDT)
In-Reply-To: <1275428876-1406-1-git-send-email-Martin.Jansa@gmail.com>
References: <20100601195258.GF5446@jama>
	<1275428876-1406-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 2 Jun 2010 00:56:59 +0200
Message-ID: <AANLkTilJYN6cixv5BVF0X5rvh07ZyRtqdS3rEB2uJ4Ej@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] Revert "klibc: fix packaging"
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
X-List-Received-Date: Tue, 01 Jun 2010 23:01:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Martin,

apart the notes building klibc_1.5 [1], I think it is better to
package the version-specific bits separately, but don't have strong
opinion on this, being klibc_1.5 is very old (still the latest stable,
though).

Andrea

[1]
NOTE: Legacy staging mode for /oe/openembedded/recipes/klibc/klibc_1.5.bb
NOTE: the following files were installed but not shipped in any package:
NOTE:   /bin/insmod
...
NOTE: Not creating empty archive for klibc-utils-dmesg-1.5-r14.0.5
...
NOTE: Not creating empty archive for klibc-utils-sync-1.5-r14.0.5
...
NOTE: Not creating empty archive for klibc-utils-ls-1.5-r14.0.5
NOTE: package klibc-1.5-r14.0: task do_package_write_ipk: Succeeded


