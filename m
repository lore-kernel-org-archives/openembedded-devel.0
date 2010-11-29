Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PMtRL-00045x-Sv
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 03:26:04 +0100
Received: by yxd5 with SMTP id 5so1824480yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Nov 2010 18:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=/VXZmfLDMLp/UL66tCTwfqb1zQOJQffVO+pczvG4CG4=;
	b=aH2va98J2nWF9KUVvQNRH5kea44rZjDgmohFWuNjyahi4YecX15Febz9vdIoR5n/za
	9NtXB66wjwWeCYN7Gs/YLBtRQE4bAovp70wjn4qoa6Mk1Fe1fWY8/9jMZx2Q+zoE9IPl
	J0rH1TQCDUy8B/9jrB8p2dDMhYpOcJb+VSs50=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=FU8kEMzku40XTmycgy9cGADuJU4N+mokrtmgoUacPZC78MBfJEN5HFBHf84A/ndNsw
	JW+C3WJQ0qJjSeDlOwXHDKZMuQFFWMpYiZt0pqvJaI7CSFFfzBSYaNcrAoCz/KZooG6k
	KFpo2E1oWPEU/WUqLoLQJjiREQWTAM+K6ONbk=
Received: by 10.90.9.22 with SMTP id 22mr8274594agi.102.1290997484249; Sun, 28
	Nov 2010 18:24:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Sun, 28 Nov 2010 18:24:24 -0800 (PST)
In-Reply-To: <AANLkTi=CZBGsEXOAHT_eW54EQ2KMn1e4mCNcMK1GB7ga@mail.gmail.com>
References: <AANLkTi=CZBGsEXOAHT_eW54EQ2KMn1e4mCNcMK1GB7ga@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 28 Nov 2010 18:24:24 -0800
Message-ID: <AANLkTin=MAdG-Sr7=nVq_G587U6GFjMPtkkJ0G0kdHqF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: php build issue
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
X-List-Received-Date: Mon, 29 Nov 2010 02:26:04 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 28, 2010 at 12:04 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> I had a very weird issue today.
>
> php - 5.2.13 - r7.2 does build locally, but refuses to build on our
> autobuilder as configure says fork is not found!
>
> TInderbox log is at
> http://tinderbox.openembedded.net/public/logs/task/11550106.txt
>
> I'm especially confused/worried by some of the autotools messages in
> the log, but unfortunately my autoconf knowledge is not good enough to
> fix this.
>
> Anyone a suggestion?

Well, from the message it seems that autoconf tests for fork
are failing. So check the configure script and see how it is
trying to test for fork() my guess is its doing a runtime test
but if not check what is it trying to do.

>
> Thanks alot! Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


