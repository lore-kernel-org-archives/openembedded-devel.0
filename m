Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PqSMF-0006Ua-95
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 16:34:59 +0100
Received: by bwz10 with SMTP id 10so3573045bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 07:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=J6RFpzLxSLbaO18u+4leRbWsqfQRoIlKaNCjJK64nFg=;
	b=ThkAJ230IA3VkhUh1YqMCSVI44dJVhjFtRYi4VXNcNSi513FUDEkDwtTCDj/OoYYVa
	7c5y+l9xiXwdgpRqlet6eob3mzc/ooPgvXW+YptUtLLAgfuEOihPExLZvJUUy4TmR/TR
	GqYlrxcIyHwbjtRMMSOHz0LIXdZF9CHcw+Abg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=lWrzecBUboSHY7as9Egb/ryo5G9kst0HJGB0JcB7u4rrDXSUrfw7eK8WSei8t3uz5U
	u7c1HyaunNn2nzJvS/p5fcaje37J6eygkqEWnYjQxemceb7y7yEpAr0OLVYLotYUmf59
	exF9TRDr2Q3PCEoMWYUe9h0nDTGwknhq98H8g=
Received: by 10.223.101.129 with SMTP id c1mr124309fao.25.1298043225262; Fri,
	18 Feb 2011 07:33:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Fri, 18 Feb 2011 07:33:07 -0800 (PST)
In-Reply-To: <4D5E856C.5080301@eukrea.com>
References: <1298032254-26236-1-git-send-email-eric@eukrea.com>
	<4D5E8268.901@mentor.com> <4D5E856C.5080301@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Feb 2011 07:33:07 -0800
Message-ID: <AANLkTinAMmhHVq9_ZpZhSHyOGqmuN3g0atAEoXpDJ+0O@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Subject: Re: [PATCH] shadow: fix rpath issues
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
X-List-Received-Date: Fri, 18 Feb 2011 15:34:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 18, 2011 at 6:42 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> On 18/02/2011 15:30, Tom Rini wrote:
>>
>> The equiv I found in poky is:
>> do_configure_append() {
>> # Fix RPATH issues.
>> sed -i ${S}/config.status -e s,^\\\(hardcode_into_libs=3D\\\).*$,\\1\'no=
\',
>> ${S}/config.status
>> }
>>
>> Any preference? Aside from I think we should be internally consistent in
>> these
>> fixes, so long as it's fixed...


poky one is better IMO since its not hacking into generated libtool script
>>
> yes, in fact I copied the fix from Henning's fix in flac so it can be see=
n
> as consistent ;-)
>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


