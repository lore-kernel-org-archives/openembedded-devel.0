Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fat031c@gmail.com>) id 1OOOta-0000HF-5R
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 07:41:11 +0200
Received: by gyg10 with SMTP id 10so3196046gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jun 2010 22:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=SfYpktRH53Yt+bWtumsvSf3fgZS7jofGijEHgTEvgJY=;
	b=v8vU3ynEFlxS5S9rmKkXrUAWXp0fBzCj42SdOnE1b4XOJUkEh12g3BM+C2xY6PTUuE
	DJrwRjVkxRE+qQidMAE9xt67xEW2dw7jZlJ1jo/4J7y7wTgMomrn/n2ijYn2xr+bxznj
	nzGN27s0ppN2q39xfMwVobTzWgeebajZAT9xk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=SbKcOtEcyTY9hUAyIQqcn6CY9jJm3jMSZLby+VgF/w+29BCEREeGmKxp4KfBtTn5BB
	tjcXnBZQ81h+cVy1XiM4piyzX2Ed1ZmsLdk2GJVymAxQv78SGFznGM/ytYZJR5uCqWd+
	tGlzI4kvGAQqJdRSOAO+MZ2VRkYTIARFMhxXc=
MIME-Version: 1.0
Received: by 10.150.13.3 with SMTP id 3mr8022091ybm.128.1276580201638; Mon, 14 
	Jun 2010 22:36:41 -0700 (PDT)
Received: by 10.151.9.14 with HTTP; Mon, 14 Jun 2010 22:36:41 -0700 (PDT)
Date: Tue, 15 Jun 2010 16:36:41 +1100
Message-ID: <AANLkTilHhuvcQFQBwVWkW6_Nf7xQPd6xDQlZzv4kvnel@mail.gmail.com>
From: Andrew Tverdohlebov <fat031c@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fat031c@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: STAGING_KERNEL_DIR
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
X-List-Received-Date: Tue, 15 Jun 2010 05:41:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I am developing a recipe for a code that needs to obtain kernel
configuration parameters
in order to compile correctly.

According to the manual there is a variable STAGING_KERNEL_DIR that is
supposed to point to the kernel staging dir.
In my case it points to staging/mips-linux where I don't see '.config' file.
The '.config' file is located in staging/xls4lte-linux (xls4lte - is a
name assigned to MACHINE in local.conf)

My question: - what is a correct way to refer to a directory where
kerenel's config file is located.

The second question is - what is a point in several directories in staging dir ?

In my case I have:
i686-linux
i686-linux-sdk
mips-linux
xls4lte-linux

I thought that this might be a property of my distro and checked
angstrom for beagleboard and saw the same picture there:

while working on my custom linux distro based on openembedded if noticed.
armv7a-angstrom-linux-gnueabi
armv7a-linux
beagleboard-angstrom-linux-gnueabi
i686-linux

In both cases at least two separate dirs are created in staging. One
${MACHINE}-linux and another ${TARGET-ARCH}-linux.  What are they for
?
And how to properly refer to staging/${MACHINE}-linux ?

Any help will be hugely appreciated.
Andrew


