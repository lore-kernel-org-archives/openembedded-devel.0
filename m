Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LwyZZ-0005pN-6a
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 15:02:37 +0200
Received: by qw-out-1920.google.com with SMTP id 9so488955qwj.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2009 05:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=G+ve7qiSNdAax90YofSgOUz68i8PirWOepmWyK0bZkg=;
	b=MGidqBJwJ4ub4vHTor38a9Doz3yCcuGD0vmrfcDWHoeaH8rB2I4hD22vG4PwkZdoBT
	IMYyLG+7TnJd0h5Jyx/N0TAbHXYXNY7Ura3c4I/GaAu3cqcyW5wBfTPwEbr8DWDj5ZSQ
	xGW9BSLbXYJ1O9iSOYLKkulu4fD132S40KMIk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type
	:content-transfer-encoding;
	b=UQ9I4nI9W6mNDhPuHAD7rDKH+YTJoIGsdUfXGCIOc3TdbY2b8DbN4gVNUv81SUZDyP
	+Pjrrx8jdZzaMg+eGX6V3TYoZsXIcRMRbzKilRGLVu/JEczQ2QXNEpb2+Mh9ATOI/xth
	wFItBXQLGXg7y8Jmq/pPxCbsdRXSvyzzt25Bc=
Received: by 10.224.45.129 with SMTP id e1mr1190274qaf.15.1240491479062;
	Thu, 23 Apr 2009 05:57:59 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 8sm1473091ywg.33.2009.04.23.05.57.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Apr 2009 05:57:58 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 0424161006D; Thu, 23 Apr 2009 09:57:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1240449461-26116-1-git-send-email-otavio@debian.org>
	<1240449461-26116-3-git-send-email-otavio@debian.org>
	<1240449461-26116-4-git-send-email-otavio@debian.org>
	<200904231201.38503.marcin@juszkiewicz.com.pl>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.92 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Thu, 23 Apr 2009 09:57:51 -0300
In-Reply-To: <200904231201.38503.marcin@juszkiewicz.com.pl> (Marcin
	Juszkiewicz's message of "Thu, 23 Apr 2009 12:01:33 +0200")
Message-ID: <87y6trcysw.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: Re: [PATCH 3/6] machine/geode[gl]x: use more optimization while compiling
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
X-List-Received-Date: Thu, 23 Apr 2009 13:02:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz <marcin@juszkiewicz.com.pl> writes:

> Dnia czwartek, 23 kwietnia 2009 o 03:17:38 Otavio Salvador napisa=C5=82(a=
):
>> From: Otavio Salvador <otavio@ossystems.com.br>
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  conf/machine/geodegx.conf             |    2 +-
>>  conf/machine/geodelx.conf             |   15 ++++++++-------
>>  conf/machine/include/tune-geodegx.inc |    3 +--
>>  conf/machine/include/tune-geodelx.inc |    6 +-----
>>  4 files changed, 11 insertions(+), 15 deletions(-)
>
> Looks like after those changes both tune files are same. What about=20
> creating tune-geode.inc which will be used instead of both?

I plan to do that in next step.

> And if you use any of those two machines consider moving them to linux=20
> recipe as GeodeLX is working nicely with recent kernels (I have Debian=20
> on alix 1c (geodelx 800) with 2.6.29-debian kernel).

Yes, I use it but with a customized kernel. I can move it to linux
recipe for sure.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


