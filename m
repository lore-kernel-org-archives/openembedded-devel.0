Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q5f1U-0005P4-F2
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 16:08:25 +0200
Received: by wye20 with SMTP id 20so3250814wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 07:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=2lQQqNyoczLWQa+md5YHKl3xCsLzUn4zQfN/+LK3uA8=;
	b=crjwGSgeHrnWn2NLJMntErcpYOrWnVPzmABzqTNLtZ2rMlQ7pv8JQK9oidCVAv61nu
	2NL1hxfKQMFGho1GCKBiLBzITDkw/Yd4m1vvrEUipgLl177Pa0ygwB5J7ABvN5k7mmUW
	c88WydVzISjrfegE5APwF8g5nRL58OzL3xf2I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=Z3KJOt2JG8mYLxptv+4wC5YKp6R/nfvLwYRd8OypnfPkN+lowE9SwpagpcuezCLaLP
	N1N4xr46cMzDMJAipCt5om/ck3Kpjb4EEonV8zRZdPpAoMtZN8QSxzwWVD34rBpudDiR
	dOJICCtKoQoyL0ODLMy0S+/cc67yFW3h29+MI=
MIME-Version: 1.0
Received: by 10.216.122.149 with SMTP id t21mr918753weh.10.1301666781486; Fri,
	01 Apr 2011 07:06:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.15.67 with HTTP; Fri, 1 Apr 2011 07:06:21 -0700 (PDT)
In-Reply-To: <in4lhs$326$1@dough.gmane.org>
References: <1301660208-31105-1-git-send-email-otavio@ossystems.com.br>
	<1301660208-31105-3-git-send-email-otavio@ossystems.com.br>
	<in4lhs$326$1@dough.gmane.org>
Date: Fri, 1 Apr 2011 11:06:21 -0300
X-Google-Sender-Auth: bh-RJ7d13GJ24ZFuBxPDbFjeoWE
Message-ID: <AANLkTimRF7Q3=XeF1EOHgPNAGfJwnp5PmjHGyjUhTyef@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 3/6] xorg-xserver-common.inc: drop .la files from packages
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
X-List-Received-Date: Fri, 01 Apr 2011 14:08:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 1, 2011 at 10:56, Koen Kooi <koen@dominion.thruhere.net> wrote:
> On 01-04-11 14:16, Otavio Salvador wrote:
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
>> + =A0 =A0 find ${D}/${libdir} -name '*.la' -exec rm '{}' ';'
>
> Why is that needed?

To avoid .la files on the package.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


