Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvBoU-00051v-Bo
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 18:23:28 +0200
Received: by pxi11 with SMTP id 11so2312624pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 09:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=49zwlHcaTu85cIPjJuAXLgcBcvEVnrUGBCN7s7a0UXI=;
	b=Ylq11Qm0npBr5DDvZRFC60Iw17yZPA630WPtW9M520eZQTISqSe0VObeyLFj71+BmV
	H7rLn7EY6YxFqkh1buftg96pib7mtvErj+xwXX4DaTczUIKNpRL4PVvT0NeyUTPBriBs
	/YYOIH3NQlY8dfdp1ma0NG3kdBmwp4pvWkjQ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gYoaBmshUaeWY5OI+VdVgRGf2VXebc6JAgXKGWaOR/3gHXTY1AFYM2nx3toQPFMUOQ
	hoy6hGhWMVlcXCbgkPdHATk19GbRh3nCnSdpQfiO4qtP/PGMz+ac7IaBkX88S4dEjYvz
	b5Q0VcakefV9QrEZSoRMhBUk5wwHRwzJtMtcI=
MIME-Version: 1.0
Received: by 10.142.136.9 with SMTP id j9mr183318wfd.43.1284394958234; Mon, 13
	Sep 2010 09:22:38 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 13 Sep 2010 09:22:38 -0700 (PDT)
In-Reply-To: <4C8E4171.5080208@gmail.com>
References: <4C85058D.8070506@gmail.com>
	<1283996027.3036.1.camel@gnutoo-laptop>
	<AANLkTimz=Q1KsMrMUfwvSEueq1a3kEcgWFoVZDvFqzqK@mail.gmail.com>
	<4C88E7C2.1030500@gmail.com> <4C88E9BC.9040603@eukrea.com>
	<4C88EAF2.7010208@gmail.com> <4C88EC18.3020109@eukrea.com>
	<4C8E4171.5080208@gmail.com>
Date: Mon, 13 Sep 2010 18:22:38 +0200
Message-ID: <AANLkTi=RGhye15FnNKzuNHP2c41KXkdPS=qehLRXKyaE@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Asterisk and termcap
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
X-List-Received-Date: Mon, 13 Sep 2010 16:23:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/13 Arigead <captain.deadly@gmail.com>:
> Eric B=E9nard wrote:
>> Le 09/09/2010 16:10, Arigead a =E9crit :
>>> Sorry I'll have to get back to you on that one. I left my OpenMoko (The
>>> Target) at home this morning so can't install the ipk :-(
>>>
>>> Actually thinking about it I'd not be too sure if Asterisk was ever
>>> running fine on a mobile phone. Simply wanted to play with it and see
>>> what it could do. There is an OpenMoko wiki page on messing with it so
>>> thought I'd have a look.
>>>
>>> Anyhow I'll get back to you when I test it later today or tomorrow if
>>> that's any help.
>>>
>> thanks, before pushing it it would be great if you could test it runs
>> fine with the fix.
>>
>> Eric
>>
>>
> Asterisk builds and runs fine, but there is one minor problem. I don't
> think that it's to do with the recipe but Asterisk itself.
>
> Basically when I try to run asterisk its failing on:
>
> Unable to open pid file '/var/run/asterisk/asterisk.pid': No such file
> or directory
>
> Normally I'd expect the pid file to be saved directly into
> "/var/run/asterisk.pid" but asterisk seems to expect another directory.
> If I create the directory /var/run/asterisk then all works fine.
>
> Like I say that's not a problem with the recipe, well I'm no expert but
> /var is a temp directory so it gets created on boot, so there's no way a
> recipe should install there?
>
>

Arigaed, thanks for your report!

Either we can create the dir in the recipe (in do_install) or maybe we
can configure it.

Eric, can you peek into that (and if not, can you push your patch so I
can pick this up.


