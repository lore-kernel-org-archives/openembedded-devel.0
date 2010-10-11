Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5DSS-0001GH-W2
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 10:11:18 +0200
Received: by iwn7 with SMTP id 7so2367026iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 01:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bCSfweB74+6IqWx/EgmOtL+6z9rjEzekK5jG7AV4X2Q=;
	b=VsoEWsRMwsmG6kMOzVZ402rZrANgB0GifuGHkK/bS1ioLkxMMU5m43smq5zJloQ5Y8
	+qU6VtmY1StIciYh5NHtRy5JFkE9EJ7HkQo7OPLA0bAiTLVBaQizqjp+CV14ZOy/wUe0
	6dgCOCE3vsic2u/GICFyRWhXFZ2JwiZZp8VYk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XynkTOl/edx+27+uWUWcmnYpjMiyVbg1nje4RxEyC6et2SXlFZmJYK49NpIFm8Srmo
	Vjc16B2D0D505ktYatVuQNkHZjhTQD8d8DR+MHjRs8n/nF22vxxX6cnvv1Zy4dYxUjbL
	YtnWAjn6fJjbTuNc7SaivySGucP14zhYuuM5U=
MIME-Version: 1.0
Received: by 10.231.150.139 with SMTP id y11mr4393997ibv.80.1286784583976;
	Mon, 11 Oct 2010 01:09:43 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 11 Oct 2010 01:09:43 -0700 (PDT)
In-Reply-To: <i8ufek$27r$2@dough.gmane.org>
References: <F34D057F-F640-4BB6-841B-2B66AFE37A99@mac.com>
	<AANLkTin8xbEBR=mVr3PHN9cjwqtUoM9BxpYkgBE7p_UY@mail.gmail.com>
	<i8ufek$27r$2@dough.gmane.org>
Date: Mon, 11 Oct 2010 10:09:43 +0200
Message-ID: <AANLkTi=-_fDQ2dOg9xrio0kHh1RmnmXJhAgoKe8OLs1Q@mail.gmail.com>
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
Subject: Re: Building for multiple machines
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
X-List-Received-Date: Mon, 11 Oct 2010 08:12:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/11 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 11-10-10 08:27, Frans Meulenbroeks wrote:
>> 2010/10/11 Elvis Dowson <elvis.dowson@mac.com>:
>>> Hi,
>>> =A0 =A0 =A0 =A0What should I do build for multiple machines ?
>>>
>>> I have an overo-oe repository, but I need to temporarily build u-boot f=
or a different board.
>>>
>>> In my auto.conf, the entry is MACHINE=3D"overo"
>>>
>>> u-boot board definitions for say beagleboard, have named the board "bea=
gle"
>>>
>>> So, would an appropriate command be
>>>
>>> bitbake u-boot-omap3 MACHINE=3D"beagle"
>>>
>>>
>>> Elvis Dowson
>>
>> I guess trying this would ahve been much faster than waiting for an answ=
er here.
>>
>> And OE does not have an auto.conf
>
> OE *does* have an auto.conf, pretty much since the start:
>
> koen@dominion:/OE/org.openembedded.dev/conf$ git blame bitbake.conf |
> grep auto.conf
> 00f6a165 (Chris Larson 2004-12-09 01:08:40 +0000 695) include conf/auto.c=
onf

Yeah, that line is there. What I wanted to say is that if you pull
from git there is no auto.conf file

frans@frans-desktop:~/workspace/openembedded.git$ find | grep auto.conf
frans@frans-desktop:~/workspace/openembedded.git$

So I still feel we do not have an auto.conf (but the user can provide
an auto.conf if (s)he wishes)

Frans

PS: I normally set MACHINE in either the environment (as a bash env
var) or in local.conf


