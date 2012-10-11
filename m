Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TMR22-0006D2-EA
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Oct 2012 00:15:06 +0200
Received: by mail-da0-f47.google.com with SMTP id s35so865800dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2012 15:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=voPnXPBtmZZlGaCzjhXjcFoRLqoKXgSWgi443D5D9to=;
	b=sJwePfxeK/UDW78tqhAOlR3zoKEtSUPCJDfaMfXCQRknHYTan/V19yPoBnDyoosffI
	LnGDCkBQTg2YKgBpHl5Ihungoo7fYx4zcvNYE+r08wb9H+9FsFZ1DzSL7XvzqdDnK2e8
	7krpIp4rrRCYa11fXqzmBh/iMJtELlgHrlVztCx1J+8SY+qRxRCzApuFYpRaKNjWlMAS
	VDJsmjfwihGD8bJQ/pqv7PYfxhBMfPlTqIuBmoS09890iUKrE9UVaiZy45WhZ+WwyGWC
	D/NSm09H1e4sJiUb2JXfUijTd8WSO3o0uq3upnfThVqfUee4XyLP59iaGcgLarjy8ws4
	obmw==
MIME-Version: 1.0
Received: by 10.68.129.233 with SMTP id nz9mr7556386pbb.136.1349992915061;
	Thu, 11 Oct 2012 15:01:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Thu, 11 Oct 2012 15:01:55 -0700 (PDT)
In-Reply-To: <k50p99$558$3@ger.gmane.org>
References: <1349580035-28194-1-git-send-email-otavio@ossystems.com.br>
	<k50p99$558$3@ger.gmane.org>
Date: Thu, 11 Oct 2012 19:01:55 -0300
X-Google-Sender-Auth: c38nlcOFZUk3_S6eHHzxuwzOOOw
Message-ID: <CAP9ODKr2OMxKPm_sYSN2Y93b2gTvzYzaM7XtodknvWBN047NXQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] xbmc: Fix serveral build errors and install missing dependencies
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
X-List-Received-Date: Thu, 11 Oct 2012 22:15:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 9, 2012 at 6:03 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 07-10-12 05:20, Otavio Salvador schreef:
>> This allow the package to build fine. On the test board it didn't show
>> anything in display but it seems to be hardware specific issue.
>
>> @@ -71,7 +79,7 @@ RRECOMMENDS_${PN}_append = " libcec \ python \
>> python-lang \ python-re \ +                             python--netclient
>> \ +                             libcurl \
>
> I suspect things like curl-certs will be needed as well. Do you know why the
> shlib code doesn't pick up the curl dep?

curl-certs is recommended by libcurl so it will get in. shlib did not
handle libcurl because it seems dlopened.

I mailed the fixed patch but forgot the v2 suffix, sorry.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


