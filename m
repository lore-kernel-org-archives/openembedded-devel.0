Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KU4BC-0000Ks-KD
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Aug 2008 20:37:42 +0200
Received: by yx-out-1718.google.com with SMTP id 4so713146yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2008 11:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=xi6AyQyxqicuxLIA8XVWgMURPiP0ybhvOZopkBjUVUU=;
	b=hncV4lZOQ+jt95WUlkPzhS6eQFEHsYOdLzZU9Xuk3Q7OO8LmzuWO0uO8w5oV5SrO3D
	6j+y3H7KW4ldz1nk2Le/o+jllk4x2dhi/G3BEDzO7m+NFFKEc3HvxH5E+oSR7enOgI/m
	FzmPxdv8pqLjVHAAljSzLER0CgdZ9XH+wTMoo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=NwVG3PULTgYMjh8tYa9y88c8HHD0pXWvZ0hpYyejfawCQXOWvD44HWYj3jKX2CO0c4
	L2T3Vju48Sm9uHUr1ve4XVQw1aCPcKWd9ZI5OBpeA3qCeIWEELjedUA7CPpzQXszZwTW
	QOiCQa+zOITo5yAm8oyT5Qk5SS+As/RtyP0pI=
Received: by 10.115.76.1 with SMTP id d1mr3002511wal.196.1218825416730;
	Fri, 15 Aug 2008 11:36:56 -0700 (PDT)
Received: by 10.114.241.11 with HTTP; Fri, 15 Aug 2008 11:36:56 -0700 (PDT)
Message-ID: <19c1b8a90808151136h4c547845ua31b1a14bc9bf7c2@mail.gmail.com>
Date: Fri, 15 Aug 2008 11:36:56 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1218786973.10360.43.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
References: <19c1b8a90808150041s52abeb55m4bad75bcb03abd75@mail.gmail.com>
	<1218786973.10360.43.camel@lenovo.internal.reciva.com>
Cc: openembedded-devel@openembedded.org
Subject: Re: Disable objc for arm uclibc
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
X-List-Received-Date: Fri, 15 Aug 2008 18:37:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Aug 15, 2008 at 12:56 AM, Phil Blundell <pb@reciva.com> wrote:
> On Fri, 2008-08-15 at 00:41 -0700, Khem Raj wrote:
>> Hi
>>
>> I am hitting a build issue while building gcc 4.2.4 for arm uclibc.
>> This patch disables objc selectively only for arm uclibc and avr
>> change is also merged in.
>
> What's the issue?  I can't think of any fundamental reason why ObjC
> shouldn't be able to work with uclibc.  It would be nice to fix it
> rather than just turning it off.

Its hitting
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=32332

I would be happy if this is fixed.

Thx

-Khem


