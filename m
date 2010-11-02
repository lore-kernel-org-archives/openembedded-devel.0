Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1PDOx1-0007vW-KD
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 23:03:31 +0100
Received: by eya28 with SMTP id 28so3763772eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 15:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=GlPw1ZLRr7HSTpG2jTp6vkOQPShBN9FcbzE4JADoxxg=;
	b=n939pCuUIML+r5nrvbs5KiZyNhF/AJdxvhCxnqYn2yVR8zpUZZZOa6ymFYG+tbhj6i
	ASF/8+JKBiqdO9nah0We5VpCrb4LK8mM8K3dJiW5NPBw8TJe/UcFvGkjoyHNWTDu/uZ1
	JEjNYn/c0sqZ5y73DZionyVOBPAAPE1wzUmbE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=UbCuWY3p164vcakDM9uVKNxgWK2pVkbdthQ1HGS01GNWiDLz1WpxHrqlQn9qJnHkhE
	h8khpY9XAuar1TK+WJj6851nPBGJA40zrAUM0jRjvXx0o+9wT6E8D4HyUOBD7nOWJ3o3
	4zbFwsD0UBWYSSUohyd+ZYvsuPdXX26Z5qWZQ=
Received: by 10.14.119.135 with SMTP id n7mr79939eeh.29.1288735363604;
	Tue, 02 Nov 2010 15:02:43 -0700 (PDT)
Received: from anarsoul-laptop.localnet ([80.249.90.154])
	by mx.google.com with ESMTPS id v51sm5878479eeh.4.2010.11.02.15.02.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 02 Nov 2010 15:02:42 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 3 Nov 2010 00:02:18 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.36-gentoo-anarsoul; KDE/4.5.2; i686; ; )
References: <1288732510-30545-1-git-send-email-anarsoul@gmail.com>
	<AANLkTin2CR7+C8zz1NtBmV0d2H=gEgNZrXCh5oATzqvz@mail.gmail.com>
In-Reply-To: <AANLkTin2CR7+C8zz1NtBmV0d2H=gEgNZrXCh5oATzqvz@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201011030002.19429.anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc: fix build with make-3.82
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
X-List-Received-Date: Tue, 02 Nov 2010 22:03:32 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Tuesday 02 November 2010 23:49:33 Khem Raj wrote:
> On Tue, Nov 2, 2010 at 2:15 PM, Vasily Khoruzhick <anarsoul@gmail.com> 
wrote:
> > Add patch to fix this error when building eglibc-2.12
> 
> > with make-3.82:
> thanks for the patch. while you are at it can you also patch other
> versions of eglibc
> that would be nice.

Would be 2.11 and 2.12 enough? Not sure that I can test other versions (even 
compile-test)

Regards
Vasily


