Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QMGyU-0007L2-Tu
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 11:53:58 +0200
Received: by fxm19 with SMTP id 19so418197fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 02:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=HP7ogQCkCkjfFBOnTKYUKPTzTJzQf7ItPYnm8nu8Ly0=;
	b=dhJT5LOMD7mHtPIqeslR6cdrWP5SekKs11BXY9PHGsnVPq1otjyrQVRkDykiHIaA4E
	ZXx4RVS0Y6DmLVB/pRBTHtUO0M7o0vtKU1w0NuiceSEbuQEhl5hCGBUB7eq8YxnhCd58
	lSiJy25RAqA1JyaMBdiacHEIv6E9CWivq2t6M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PQPhSkQKaIwxtLXXdl43REv8Gfa+V2s6ikFo8achwglbdcqViYsob0HGvlRLuScsRS
	gRN7A+63UVhnZlY3Q7JUlB1Meb/w/wfHd7v/0EVL9SAd5+6yOcSEdi06b1XxlIaFJ9fD
	cIs6Y0ujtsSaan91ENr7WpyxPzLdEOdC82V9Q=
MIME-Version: 1.0
Received: by 10.223.7.8 with SMTP id b8mr581330fab.19.1305625865505; Tue, 17
	May 2011 02:51:05 -0700 (PDT)
Received: by 10.223.93.206 with HTTP; Tue, 17 May 2011 02:51:05 -0700 (PDT)
In-Reply-To: <201105171033.16751.sgh@sgh.dk>
References: <201105051150.06842.sgh@sgh.dk> <4DCFD20A.9090907@atmel.com>
	<4DD01047.6000007@mlbassoc.com> <201105171033.16751.sgh@sgh.dk>
Date: Tue, 17 May 2011 11:51:05 +0200
Message-ID: <BANLkTimne2DeFtaBd0AzPHRHUa740_WR-A@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: perl-native fails on Ubuntu 11.04
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
X-List-Received-Date: Tue, 17 May 2011 09:53:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2011 at 10:33, S=F8ren Holm <sgh@sgh.dk> wrote:
> S=F8ndag 15 maj 2011 19:41:27 skrev Gary Thomas:
>> No, the glob will be expanded in the assignment (globs inside of "" stri=
ngs
>> are expanded by the shell)
> This is still not fixed. I have the change from =A0https://gist.github.co=
m/raw/925006/4217f358fb00b5b7f1dfbd1ce5f4afa4f64b0bb0/0001-perl-native-mult=
ilib-patch-for-ubuntu-11.04.patch
> running and it works great. Why do we not apply that?

Good question.
Although we should use the glob-version from oe-core, as there were
some problems using `uname -m`.

Regards,
Anders


