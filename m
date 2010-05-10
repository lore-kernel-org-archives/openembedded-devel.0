Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.moussaud@gmail.com>) id 1OBP87-0004oG-IE
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 11:18:28 +0200
Received: by bwz20 with SMTP id 20so1580881bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 May 2010 02:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=W/GIAZBw0gk78eCCahJrfx1XEnAKyPPSEj2GPZ/+SJ4=;
	b=u/FqnHsma8HEr3ib5/VOMEhDfHS43zAw9cvk0UJVqujKdaj5yx4vdYp3B0fDpJUSqP
	Tyh8VkhTC89HJZPiwoNSNupLhwEJNiaRnHlfaCeAnvf7XT7W4WJgQFDL76NZjziPUvGm
	t+ShtL5GHnBD3V6QS4RliZPU11zv/rhDr9faU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=XnL5RFx1W7X+HFEgvuwCcw0TALf9Cdjk7kaHjD/YswZpBatWYSKSPZkGXjCAZf0aL8
	ZHIZPzl+zadrQ7vSjlz1J4vZMn0XrplBN4hpEgsI/dpWIYSe82d7PM+OMpsGqql9JC/J
	UUJTmqWrbANzIgkr9eMDVQcLTVoz6zsogBp0w=
Received: by 10.204.155.87 with SMTP id r23mr2173544bkw.27.1273482875088; Mon, 
	10 May 2010 02:14:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.65.66 with HTTP; Mon, 10 May 2010 02:14:14 -0700 (PDT)
From: David MOUSSAUD <d.moussaud@gmail.com>
Date: Mon, 10 May 2010 11:14:14 +0200
Message-ID: <AANLkTikMZbhHtXqXqfLBSO0GY6Z6Tt8QuJPUMMBucAS_@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: d.moussaud@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: problem using meta-toolchain.bb and external-toolchain-generic.bb
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
X-List-Received-Date: Mon, 10 May 2010 09:18:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I'm trying to use an external toolchain with OE.
So I've build one using the recipe meta-toolchain.bb with an angstrom
distribution. I'm on the org.openembedded.dev branch (updated
recently).
I've extracted the 2 tar.gz provided in my root directory. So I have a
nice /usr/local/angstrom layout with my pre-built toochain.

Then I have changed my distro.conf file setting that 2 parameter:

# Set the toolchain type (internal, external) and brand (generic, csl etc.)
TOOLCHAIN_TYPE ?= "external"
TOOLCHAIN_BRAND ?= "generic"

I've cleaned my build/tmp directory.

Finally I've tried to build a minimalist image. Everything goes fine,
the toolchain is found by OE but it fails when it tries to create the
filesystem.
Here is the following log file : http://pastebin.com/YZmuzmtx

I can not understand what to do to tell OE how it could find the glibc !?

Thanks in advance for your tips and suggestions,

Regards,
David.


