Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLKn8-0007WK-Kv
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 20:41:55 +0200
Received: by iwn6 with SMTP id 6so630634iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 11:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=VJ6jqcQWYNm/F1OIdlCqz9DQaD7COcKj3s5fUwYmYtg=;
	b=osxYDfkqF/f5EiqK4S1MWlWqjgOu5fDA94z7XYo3Jlo3b7ItOGcbQjaEdmoOc/Ffzr
	yNsxXLYGGTeUJo9vcZbS3GhqkmfrABziqbFVeAAjvDlHDSQm6Ev5uRLD/zv2Su5pJcaq
	SWt2shcrHqcw4fINE7oW0zYez3GTtdggcUM98=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=no69tcikltZF/oeL5tlVzei206a66em7kSUmiE+cHgxn+Y/as10MaI6ixKzmYYjiON
	QAPo+m+ixr1YmSXKVrbVMbmf8X9S9pCuiZksdGyvCB0QQqoSrTG40bCvGTrskQO40LtB
	b3mEKLc0svoUOKolF3HIXpfLXFtasJXgfvxj8=
Received: by 10.231.148.145 with SMTP id p17mr4226043ibv.28.1275849452119; 
	Sun, 06 Jun 2010 11:37:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.15.140 with HTTP; Sun, 6 Jun 2010 11:37:12 -0700 (PDT)
In-Reply-To: <AANLkTimwSHpzMzYefLJglvpwptOt9cdpEOWGSmeeK6uM@mail.gmail.com>
References: <20100604232423.GA9174@gmail.com>
	<AANLkTimwSHpzMzYefLJglvpwptOt9cdpEOWGSmeeK6uM@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 6 Jun 2010 11:37:12 -0700
Message-ID: <AANLkTinHDVWr6n5UYt0Il6JMhHhhSZN5c0JIE2D4vbdu@mail.gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: pcmciautils: fix build to use flex from sysroots, not from host
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
X-List-Received-Date: Sun, 06 Jun 2010 18:41:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 6, 2010 at 4:00 AM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> Hello,
>
> On Sat, Jun 5, 2010 at 3:24 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi
>>
>> This commit
>>
>> commit c65ee13298e8c22274b5bcabe06f2116b8b7ebf2
>> Author: =A0 =A0 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>> AuthorDate: Fri Jun 4 16:26:17 2010 +0400
>> Commit: =A0 =A0 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>> CommitDate: Fri Jun 4 16:44:18 2010 +0400
>>
>> =A0 =A0pcmciautils: fix build to use flex from sysroots, not from host
>>
>> =A0 =A0Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>>
>>
>> breaks the build when I have flex-native in ASSUME_PROVIDED.
>> It there any specific reason why one should use flex from hosted sysroot=
 ?
>> is the flex package on all distribution broken for some reason ?
>
> Then we either:
> 1) have to put flex in prerequisites, check it in sanity.bbclass (and
> drop flex-native)
> 2) have to fix pcmciautils to detect path to flex
> 3) expand some class to autodetect the flex/bison/etc. programs
>
> Because currently pcmciautils just failed for me because I was building t=
hem on
> the box where I had no flex installed, but build (via some other dependan=
cy)
> in OE sysroot.

Well then you only need it in DEPENDS of pcmciautils thats all and not
hardcode it


>
> --
> With best wishes
> Dmitry
>


