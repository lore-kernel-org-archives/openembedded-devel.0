Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OY5JZ-0006Vm-5k
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 00:48:01 +0200
Received: by iwn34 with SMTP id 34so4115555iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 15:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=PZd1IOhNxkFXOUQjO7+SOMsmqfkGY3ghY4PM4DO0qFw=;
	b=xVqZRn5nD8At8+ZrCYSp2qeZdRpIdXt0DYmP77qhDVsNAZZ0ONt19yjSUI7w94egYR
	jWoSVgdR1naAqfFybLuVFgVze+QorsLgIohP1EirD4PXWmQs2TtDKa6DPyvcx8xrEPw2
	nGx2rEmXZ56h/caZHMrfZMnP/00iZYpQ3bPMk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=by524o6BAz5bTeoBZsYdH23gJEZlLR3a+WJ0KnTJ9jY3vU3OqddqBxMzaxwAAY49Ue
	f5cQ+vfeh+8nzoP8rdA9IpshOVoFanukjQiu16s3sRQYWgHpn20gK398blJsffs6/9xQ
	8kZN3g1249nHHdTyBXcj9cYzXAMCO6aCGNo3s=
Received: by 10.231.32.129 with SMTP id c1mr13102077ibd.112.1278888186208; 
	Sun, 11 Jul 2010 15:43:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.132 with HTTP; Sun, 11 Jul 2010 15:42:46 -0700 (PDT)
In-Reply-To: <1278887977.15825.280.camel@lenovo.internal.reciva.com>
References: <i1chst$tq5$1@dough.gmane.org>
	<1278867705.15825.94.camel@lenovo.internal.reciva.com> 
	<AANLkTilUqapROvKeecH8McrUjMsQaEaI1LASvXztXi-a@mail.gmail.com> 
	<1278887977.15825.280.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jul 2010 15:42:46 -0700
Message-ID: <AANLkTinsIEU8t1YT9eJjVxw1Ijj-KmwsPPWDL78rQcjS@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'LIBC' variable clashes with perl variable
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
X-List-Received-Date: Sun, 11 Jul 2010 22:48:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jul 11, 2010 at 3:39 PM, Phil Blundell <philb@gnu.org> wrote:
> On Sun, 2010-07-11 at 15:17 -0700, Khem Raj wrote:
>> uclibc is ok but glibc and eglibc will have same HOST_OS so it will be
>> hard to differentiate which system C library to choose.
>
> Are there any DISTROs which actually want to support both eglibc and
> glibc in parallel?

angstrom supports all 3 of them IIRC with defaults being glibc

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


