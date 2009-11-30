Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NFBak-0006Iv-Aj
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2009 20:07:25 +0100
Received: by iwn32 with SMTP id 32so2269988iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2009 11:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7HRObH7DC8JNtMrQjamaI9Nself5SKme0nwDHveALVw=;
	b=ILfl1aotRjxoKdvkX5YQfML4AjlfYopX+QEX7bxy0D+6ZdhiA7Ztwaj/T6g9w7/T1R
	k0cBi95OyxbF3Lc/qCE+4MUd88fj8PN6PvA1TUXYDycqjI0OvqzdsrnJZy5Xe224g2Wl
	iuoM5rEnI8bIesPv3m51W3X2uZ8GKcEBSc2KY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Cv1FllRgG7LwWajuZILVhe1wB6YYlVJ2mJruxyHv1o6iwqRVMvSiA4XuMcAB4Rvtxb
	h5et7Bv00s6i4XcrtPG4UGo2b39k3Db47rMc8ZvuzMeucOVNelm3zObTme9OZ5AAUFx+
	VghWVzf9KAIvluh2g9ng5kPkj3196QMpTeGy4=
MIME-Version: 1.0
Received: by 10.231.153.69 with SMTP id j5mr232550ibw.33.1259607947781; Mon, 
	30 Nov 2009 11:05:47 -0800 (PST)
In-Reply-To: <200911260929.02079.sgh@sgh.dk>
References: <200911241045.20901.sgh@sgh.dk>
	<19c1b8a90911250951v40fd87cas91f027e748a4a8c@mail.gmail.com>
	<200911260929.02079.sgh@sgh.dk>
Date: Mon, 30 Nov 2009 11:05:47 -0800
Message-ID: <19c1b8a90911301105m2053c527o5a751cea02dca9d@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: gcc-cross build failure
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
X-List-Received-Date: Mon, 30 Nov 2009 19:07:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2009 at 12:29 AM, S=C3=B8ren Holm <sgh@sgh.dk> wrote:
> Onsdag 25 november 2009 18:51:03 skrev Khem Raj:
>> you need to post full log.
>> -Khem
>>
>
> Sorry =C2=A0Here it is.
>
> Apparently this is the error :
> /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4=
.3.3-
> r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before 'G'
> /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4=
.3.3-
> r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' to=
ken
> /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4=
.3.3-
> r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' to=
ken
> /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4=
.3.3-
> r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' to=
ken
> /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4=
.3.3-
> r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' to=
ken
> /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4=
.3.3-
> r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' to=
ken
> /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4=
.3.3-
> r9.1/gcc-4.3.3/libobjc/exception.c:51: error: expected ')' before '<<' to=
ken
> /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4=
.3.3-
> r9.1/gcc-4.3.3/libobjc/exception.c: In function 'objc_exception_throw':
> /home/sgh/svn/OpenEmbedded/build/tmp/work/i686-angstrom-linux/gcc-cross-4=
.3.3-
> r9.1/gcc-4.3.3/libobjc/exception.c:487: error: lvalue required as unary '=
&'
> operand


is this still a problem after this commit

commit 1eac4dda40a4e1c542e4a6fd32ad3b86cce92653
Author: Koen Kooi <koen@openembedded.org>
Date:   Tue Nov 24 10:15:00 2009 +0100

    gcc 4.3.3: fix patch and packaging

>
>
> --
> S=C3=B8ren Holm
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


