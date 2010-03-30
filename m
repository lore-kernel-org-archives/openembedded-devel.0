Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nwg1V-0008T1-QB
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 20:18:46 +0200
Received: by pvc30 with SMTP id 30so1054404pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 11:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qrMqLXE+kyqrlF5BcimsCctbTpyWxbSsi7ttFsz2bDw=;
	b=ST355yjJ9yJQcDoPU4vzsP3tl3To2MkaoS/LMwyG7XwBWYE4fvsYU9w8SgEOKhqhnK
	mhLB7mzcUMp/rPDFt4qpyOIH///bVeRDpVePmnCa4OTtzouWlHaK4cFiGE6/8U5K3IjV
	5ax14dJmqb0M0h5GTCReqSDyTkAqM9n61uXyQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wKjnNSofkryBTQVvaUWVFgumuNbIpLiHe4tp6+cIZ4qE5P8H/j9VQdc6S0/ym9iLsc
	2oJdIOi/ZDKutJAoKrI8SQisJxVYzeAPtsxOJ6Rgl69i5ZcHtcYSvdw2/czosLE/UbSg
	RBeyPh4a8DwYFSjOGj6fexqgKUl9RCwfB5kGE=
MIME-Version: 1.0
Received: by 10.231.32.66 with HTTP; Tue, 30 Mar 2010 11:15:29 -0700 (PDT)
In-Reply-To: <1269953505.14554.2.camel@mill.internal.reciva.com>
References: <1269730499.4033.176.camel@mattotaupa>
	<hon5i2$8iq$1@dough.gmane.org> <1269797481.8018.80.camel@mattotaupa>
	<hooat6$p3d$1@dough.gmane.org> <1269949824.4103.38.camel@mattotaupa>
	<hosrca$7qu$1@dough.gmane.org>
	<1269953505.14554.2.camel@mill.internal.reciva.com>
Date: Tue, 30 Mar 2010 11:15:29 -0700
Received: by 10.141.23.14 with SMTP id a14mr1643399rvj.259.1269972929676; Tue, 
	30 Mar 2010 11:15:29 -0700 (PDT)
Message-ID: <19c1b8a91003301115t4cffdb27xef02307490473847@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] autotool.bbclass: Remove `EXTRA_AUTORECONF = "--exclude=autopoint"`.
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
X-List-Received-Date: Tue, 30 Mar 2010 18:18:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2010 at 5:51 AM, Phil Blundell <philb@gnu.org> wrote:
> On Tue, 2010-03-30 at 14:38 +0200, Koen Kooi wrote:
>> I wonder if we only should run autopoint if there are AM_GNU_GETTEXT*
>> macros in configure.{in,ac}, or does autopoint take care of that
>> automagically?
>
> Autoreconf has some (limited) logic to figure out whether autopoint is
> needed. =A0I think that ought to be sufficient.

It will check source timestamps. Is there something else that it will
do to decide on invoking autopoint (other than seeing AM_GNU_GETTEXT)

>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


