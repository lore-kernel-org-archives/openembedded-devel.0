Received: from [74.125.46.156] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lpidy-0004J4-J8
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 14:37:12 +0200
Received: by yw-out-1718.google.com with SMTP id 9so730659ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2009 05:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=eDnUYoeqoY+Bc31TXsm6Qf0HYERZPxEBB4J2vGX5+/8=;
	b=F02WUVJC6HUAztI3en5ROwx8XJeEhne6stE3banIOx0/tx2TBH8PYZu2wOnQLW1PHN
	uWpxx9wxUvbMhJzmqjp0C12VJENpW0F6M0SKO5C7gq/I8tDw9tfPulOLQMFrdO4agx/i
	3Ve2hcEEMK/PdSzxzMAckSvdTeVhrzud7aix8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=WfC1s1J8aSaIG3SDvuKZspAi6SEj0LM+kDsZRjwbinB6XI9ZMkQG5VYdf/8dhOLSb2
	zVa9ib2CAr0O9JIXXYJ468rcwUncyK+nWjr6LAGxaWxyCmiWUhRfAPy6kQmXTwxFAb4w
	SUSuq8MUivF/r8lKyAumsrKAStr4sKMHl8CxA=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.151.8 with SMTP id y8mr2588201and.106.1238762078596; Fri, 
	03 Apr 2009 05:34:38 -0700 (PDT)
In-Reply-To: <200904022154.03611.raj.khem@gmail.com>
References: <1238532011-2963-1-git-send-email-k.kooi@student.utwente.nl>
	<19c1b8a90903311458k56ee153fkb6977ce7349b78fc@mail.gmail.com>
	<gr2vdb$k2v$2@ger.gmane.org> <200904022154.03611.raj.khem@gmail.com>
Date: Fri, 3 Apr 2009 09:34:38 -0300
X-Google-Sender-Auth: a4c7c1c29bd65f05
Message-ID: <be7a9f3d0904030534i7d9ea46ar8833a5b83f641d65@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.46.156
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_20,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org, Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [STABLE][PATCH] gcc 4.3.x: disable thumb mode for now, glibc 	builds don't like it
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
X-List-Received-Date: Fri, 03 Apr 2009 12:37:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2009 at 1:53 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thursday 02 April 2009 11:16:10 Koen Kooi wrote:
>> On 31-03-09 23:58, Khem Raj wrote:
>> > can you post the error message and commandline or better preprocessed
>> > file of the error thats happening when compiling libgcc in thumb mode
>> > plz.
>> >
>> > We could try to fix the libgcc problem.
>>
>> Any objections to this going into the stable branch till the real bug is
>> fixed?
>
> Not from me.
>
> Acked-by: Khem Raj =A0<raj.khem@gmail.com>

From my POV if it is going to stable it needs to go to dev too; even
if we'll provide a better fix for it later on dev.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


