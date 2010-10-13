Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P65b5-0007KO-N1
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 19:58:40 +0200
Received: by yxj4 with SMTP id 4so1967640yxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 10:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=uRkjI6vFGNpFkFQRCc64T/369Ku4QgXLsx88/q9hpMI=;
	b=lANBtVBrEq59n07M6MS+899E8QVNhETEObszjUDverezkO1l7nAXKj9G86YCYLrcMN
	K7Mcq7uLx1g75clqsSAYFu7pCn43n8MvEiK+cmKD2sl9bHzdqzOWNpI4CBoDcqjqfMMK
	CrzbjPjyqSu4OyOxQP94DDcTc1TizvLIVjdMs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=sX6c/xJyC6k4kKXEgyfCbE5jd2GKNP0UccWnjSwymuKfKReblpYhy/U6eImDz3Anl7
	c0HI+oVEr881JomDwPASytJhVhuRkxl2uaE3ew0crtOFhNaM256vadVZC8XmxQOcNzdz
	+rubwyfAJutfzMAgKB1bmGZHnUdC6u88w3mL8=
MIME-Version: 1.0
Received: by 10.42.244.197 with SMTP id lr5mr1049901icb.410.1286992690700;
	Wed, 13 Oct 2010 10:58:10 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 13 Oct 2010 10:58:10 -0700 (PDT)
In-Reply-To: <4CB5C1A3.6000506@mlbassoc.com>
References: <AANLkTimmoNWm5fDxSBvR7MSUDBH8w0FyiRMFoR5WXuuf@mail.gmail.com>
	<4CB5C1A3.6000506@mlbassoc.com>
Date: Wed, 13 Oct 2010 19:58:10 +0200
Message-ID: <AANLkTik3QW_KmzxyPF7VDhHpP52inEJgeMR3p62+yUXs@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: do we need patch-native ?
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
X-List-Received-Date: Wed, 13 Oct 2010 17:58:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/13 Gary Thomas <gary@mlbassoc.com>:
> On 10/13/2010 08:12 AM, Frans Meulenbroeks wrote:
>>

>
> Sounds like quilt's configure script is broken. =A0Such behaviour
> should not be catered to - it should be fixed.

Actually this was detected on an older version; just noticed it was
already fixed in july:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3De05f5e4e8f0=
23aea355943a1356dbb14226625e0

Guess the person who reported this to me needs a newer tree (or at
least a newer quilt recipe)

Frans.


