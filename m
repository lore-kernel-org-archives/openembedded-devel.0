Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lazy.gopher@gmail.com>) id 1Onezx-0006i1-Pm
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 23:56:11 +0200
Received: by gxk2 with SMTP id 2so2444561gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 14:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=G2EZn18QvQLMIAig3UudSKxY4v+EAIb90gnhl9fYepI=;
	b=IJq7M9M7B/J0kbimpHuZsTbOnuMuiKn5T8XnqHvCgfJnjZmqZAMrSEKc1dLW6RW3Mi
	7MatYRiBC5mbyLgKhHKFppBpZGiFyxXhcBcOPFym1DtSp1SXCbUCnFEBj9iEBAP9DKMX
	0uoW+SWh/M++AjvfA8fGEk/d5LAqYUhTEL6dE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=edu66iqm7uUnUFbhgPLhb2gpUaKAzdVwHgx86D3KlfTYBvLBVtsQLs+KyhNV7JTP70
	Q8o8o0QzeTr0JvV0wzN7HzWfQfge4iyGWzNZvkUwywjwgd861/+kTz5PoCG+Bi3NGtTU
	p3JBZYMpF6T2ixTlDq0yOrULg06bvdHJX1x6k=
MIME-Version: 1.0
Received: by 10.150.31.15 with SMTP id e15mr6280663ybe.216.1282600538429; Mon,
	23 Aug 2010 14:55:38 -0700 (PDT)
Received: by 10.231.178.197 with HTTP; Mon, 23 Aug 2010 14:55:38 -0700 (PDT)
In-Reply-To: <4C72C920.7080709@tycoelectronics.com>
References: <4C72C920.7080709@tycoelectronics.com>
Date: Mon, 23 Aug 2010 23:55:38 +0200
Message-ID: <AANLkTi=pOtSXKNpruof7EmiZZzGAYA430O1q-jXPBg49@mail.gmail.com>
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: lazy.gopher@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: several recipes give a link error: libc.so, needed by libgcc_s.so, not found
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
X-List-Received-Date: Mon, 23 Aug 2010 21:56:11 -0000
Content-Type: text/plain; charset=UTF-8

Hi Jay,

> ./rxvt-unicode-7.9-r1/temp/log.do_compile.9530:44:/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/lib/gcc/i686-angstrom-linux/4.3.3/../../../../i686-angstrom-linux/bin/ld:
> warning: libc.so, needed by
> /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/lib/gcc/i686-angstrom-linux/4.3.3/../../../../i686-angstrom-linux/lib/libgcc_s.so,
> not found (try using -rpath or -rpath-link)
>

If I remember correctly, you need to put the

TARGET_CC_ARCH += "${LDFLAGS}"

in the offending bb.

Hope this helps,
Maksym Parkachov.


