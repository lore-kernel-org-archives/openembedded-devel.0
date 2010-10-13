Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5voU-0003AJ-4y
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 09:31:54 +0200
Received: by iwn2 with SMTP id 2so2132675iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 00:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=X0HyOJAIC69m8WJWMWWo+CkV3CUkYtbOuU95A7oKJIg=;
	b=CNUkEYpiynOuVlnghq3Dbxg4t/rPOGpV1JaUUNGuouGzNnfeS102W+m76qdd0JD+mP
	P3hOsAnBPYFhsw10DVPS+B/E9PIxg11lmlXO6uRG7VTUVBQgIXUQFgxBXEAX/Gznz26T
	0HYts+T9vKh+Golxl4iprfn0EEwh/Fyw/RxnY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DxLd7Z+b3/zaevLYFVBgaAGLA0jumtUJgFFkyAH1uCVQ0NH0aHe3aqVuI6NUFDeXIF
	8PjFrxAS97l+SU0IgsOMcwetGV1zGIHlU8uqTmVIagAH9qpXLvVZ7AX7CQ7SMnt6V6dq
	HVubDs7f5prEtXK5iXtevoxQsMCXxwRUsmbHc=
MIME-Version: 1.0
Received: by 10.231.173.9 with SMTP id n9mr6675871ibz.146.1286955080210; Wed,
	13 Oct 2010 00:31:20 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 13 Oct 2010 00:31:20 -0700 (PDT)
In-Reply-To: <20101013071227.GD3549@jama>
References: <1286935114-4673-1-git-send-email-raj.khem@gmail.com>
	<AANLkTinMcWBJG3WprZVTw038rMfO4pjNcyre-Bg3ZhMi@mail.gmail.com>
	<20101013071227.GD3549@jama>
Date: Wed, 13 Oct 2010 09:31:20 +0200
Message-ID: <AANLkTimhsT1cxzs00coN1XPA5dok68rzn1Ue7gWY-6Yu@mail.gmail.com>
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
Subject: Re: [PATCH] distutils-common-base.bbclass: Prepend STAGING_LIBDIR to linker library search path.
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
X-List-Received-Date: Wed, 13 Oct 2010 07:31:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/13 Martin Jansa <martin.jansa@gmail.com>:
> On Wed, Oct 13, 2010 at 08:59:40AM +0200, Frans Meulenbroeks wrote:
>> 2010/10/13 Khem Raj <raj.khem@gmail.com>:
>> > * This was done generically in bitbake.conf this should be done on
>> > =A0demand and distutils based recipes seem to need it. So we define it
>> > =A0here.
>>
>> Based on your commit message I expected a change in bitbake.conf too.
>> Am I mssing something here?
>
> That changes was already commited and it's used only for
> LIBTOOL_HAS_SYSROOT.
>
> This is fixing build of all python recipes using distutils.
>
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Ah ok, thanks for the info.
guess the commit message could have been a teeny weeny bit clearer.
it now to me suggested a code/functionality move from bitbake.conf to
dustutils-common-base.bbclass.

Frans.


