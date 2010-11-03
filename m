Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDZsa-0007TP-G5
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 10:43:48 +0100
Received: by iwn42 with SMTP id 42so524722iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 02:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=KFu0ZEcpyIXKS1PQRnKyOyL2L6HoI0TbPqhbdpDz/Ww=;
	b=lCZHnBJdQxGP/5u5y83QZ5bFHkjdg90xSuKKRY/Svh5+NbVmwaFJWzxKzoxKmiLVrd
	WJ/McwAvEEkRcS2lftzaW7wpwhsm3u0GjKKhUPbOAmqHfjuGrdDd1xcfz8C1NNwReTnS
	DIzGipgQpwBnT3Cwt2UO2od6JHwtpL7fBgkXA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=u9kTDvgRImpvmn0Urr6VhjZKDC7UF5Pqq194udrhFEO4Fcz6BJf8L5MNNxdntaaesl
	cUwtXbxymqmQjAaks5nqgSkHS0U2NI9giXKOuJt58dJpkSDx5KFdjkSW0b+H/wQtOwNP
	IFmp4t1arycm8icdksMWqLUha6CqFLBvZ5IkU=
MIME-Version: 1.0
Received: by 10.231.35.194 with SMTP id q2mr3005865ibd.26.1288777365801; Wed,
	03 Nov 2010 02:42:45 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Wed, 3 Nov 2010 02:42:45 -0700 (PDT)
In-Reply-To: <AANLkTiktvcs1HsktTWaFATVDR492tPCHb_d7JU1xm_uW@mail.gmail.com>
References: <4CCF64DD.9080709@gmail.com>
	<AANLkTin5-JTEH=Zk__6MWxY53t_WYufSX4x+w6sonE7t@mail.gmail.com>
	<AANLkTiktvcs1HsktTWaFATVDR492tPCHb_d7JU1xm_uW@mail.gmail.com>
Date: Wed, 3 Nov 2010 10:42:45 +0100
Message-ID: <AANLkTinjMC_Eou5Bt9FE07Vn-4xXD_2ugrgCGKgcPxvP@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gphoto2_2.4.8.bb: Stop configure from looking in /usr/local/include
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
X-List-Received-Date: Wed, 03 Nov 2010 09:43:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/2 Khem Raj <raj.khem@gmail.com>:
> On Mon, Nov 1, 2010 at 11:38 PM, Frans Meulenbroeks

>> I have some concerns here.
>> For configure it seems best to explicitly set and reset the flags in
>> it, otherwise you may just pick up whatever happened to be build
>> before.
>>
>
>
> this is the case with any package that uses configure tools. But assumption here
> is that when you are building you are not building stuff thats not
> meant to be in
> the given image.

True. However we should enforce that. If e.g. gphoto has no depends on
exif it autotools will still pick up exif if it happens to be there
because some other package build it.
Funtionally this is not necessarily bad (as your image has exif
anyway), but from a point of reproducability it is undesirable.
E.g. if you build the recipe the first time, you might not get exif
and if you rebuild you do get exif. (because the build system does not
know the dependency is there so it might not have build exif yet).

Actually the results might even differ for between builds of the same
image (especially if you build machines with different speeds etc
and/or use different flags for parallellism.
Therefore I feel it is highly desirable to have all optionals that you
have in configure either explicitly disabled or explicitly added to
depends.

Wrt exif & readline: I agree with koen.

Frans.


