Received: from mail-iw0-f197.google.com ([209.85.223.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NfM48-0003r4-Le
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 00:33:55 +0100
Received: by iwn35 with SMTP id 35so656547iwn.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 15:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=8Y0TP7wL+HpRGLFeTi+caf3o7DAIMC14qhf9jzBfajI=;
	b=g6xcTzoZSSZ1uAg/OBRrNkqxqtNVUp0/cwQbuwdz0aqwhDAeMNLdcNd80DwcYubdiu
	nfvPjfniMHzRJOWWihupMTNslSYe8jHbK1pIMlA3bbIV7ehos9hEtWqZ0kN9KaN//3S/
	osy7T2/8OZrIot9UY5qrnyLhyfITl4X66OLaU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Sypli4JvZ51jxUdPhq7bfMZm4+w5efi3LDykr95KyuDfiedPgze+IovoEeKuT7rtAB
	cAg208I+E9nbn6KbEkmwC+jyynxEZCCtUYKdKRGF4Lqj0623FTG7I4cgyefrQr2Pep7n
	XDy6yAoMRwcCSP375QZplReHycg2aAGQRZLFQ=
MIME-Version: 1.0
Received: by 10.231.147.199 with SMTP id m7mr1580741ibv.87.1265844677995; Wed, 
	10 Feb 2010 15:31:17 -0800 (PST)
In-Reply-To: <19c1b8a91002101504g4a35ef13w50eb66548d8188b@mail.gmail.com>
References: <alpine.LFD.2.00.1002101712580.4390@localhost>
	<19c1b8a91002101504g4a35ef13w50eb66548d8188b@mail.gmail.com>
Date: Wed, 10 Feb 2010 15:31:17 -0800
Message-ID: <19c1b8a91002101531v17e4421cp76126722c3f09f97@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.197
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: freshly updated u-boot has malformed patch
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
X-List-Received-Date: Wed, 10 Feb 2010 23:33:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2010 at 3:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Feb 10, 2010 at 2:22 PM, Robert P. J. Day <rpjday@crashcourse.ca>=
 wrote:
>>
>> =A0beagleboard image as usual:

hmm I guess I should have read this line. Seems like beagle is using a
revision which already has
this patch applied. I will fix it.

>>
>> Applying patch u-boot-remove-inline-of-weak-functions.patch
>> patching file lib_arm/board.c
>> Hunk #1 FAILED at 123.
>> 1 out of 1 hunk FAILED -- rejects in file lib_arm/board.c
>> patching file common/main.c
>> Hunk #1 FAILED at 48.
>> 1 out of 1 hunk FAILED -- rejects in file common/main.c
>> Patch u-boot-remove-inline-of-weak-functions.patch does not apply
>> (enforce with -f)
>> ERROR: Task 151
>> (/home/rpjday/oe/openembedded/recipes/u-boot/u-boot_git.bb, do_patch)
>> failed
>> NOTE: Tasks Summary: Attempted 10399 tasks of which 10399 didn't need
>> to be rerun and 1 failed.
>> ERROR: '/home/rpjday/oe/openembedded/recipes/u-boot/u-boot_git.bb'
>> failed
>>
>> =A0i'd be more informative but i'm massively sick at the moment.
>
> which machine ?
>


