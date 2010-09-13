Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OvD2K-0006Dt-RX
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 19:41:51 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id DD8931660922; Mon, 13 Sep 2010 11:41:01 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 5E66316608D0;
	Mon, 13 Sep 2010 11:41:01 -0600 (MDT)
Message-ID: <4C8E622D.1050902@mlbassoc.com>
Date: Mon, 13 Sep 2010 11:41:01 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C85058D.8070506@gmail.com>	<1283996027.3036.1.camel@gnutoo-laptop>	<AANLkTimz=Q1KsMrMUfwvSEueq1a3kEcgWFoVZDvFqzqK@mail.gmail.com>	<4C88E7C2.1030500@gmail.com>
	<4C88E9BC.9040603@eukrea.com>	<4C88EAF2.7010208@gmail.com>
	<4C88EC18.3020109@eukrea.com>	<4C8E4171.5080208@gmail.com>
	<AANLkTi=RGhye15FnNKzuNHP2c41KXkdPS=qehLRXKyaE@mail.gmail.com>
In-Reply-To: <AANLkTi=RGhye15FnNKzuNHP2c41KXkdPS=qehLRXKyaE@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Mon, 13 Sep 2010 17:41:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09/13/2010 10:22 AM, Frans Meulenbroeks wrote:
> 2010/9/13 Arigead<captain.deadly@gmail.com>:
>> Eric B=E9nard wrote:
>>> Le 09/09/2010 16:10, Arigead a =E9crit :
>>>> Sorry I'll have to get back to you on that one. I left my OpenMoko (=
The
>>>> Target) at home this morning so can't install the ipk :-(
>>>>
>>>> Actually thinking about it I'd not be too sure if Asterisk was ever
>>>> running fine on a mobile phone. Simply wanted to play with it and se=
e
>>>> what it could do. There is an OpenMoko wiki page on messing with it =
so
>>>> thought I'd have a look.
>>>>
>>>> Anyhow I'll get back to you when I test it later today or tomorrow i=
f
>>>> that's any help.
>>>>
>>> thanks, before pushing it it would be great if you could test it runs
>>> fine with the fix.
>>>
>>> Eric
>>>
>>>
>> Asterisk builds and runs fine, but there is one minor problem. I don't
>> think that it's to do with the recipe but Asterisk itself.
>>
>> Basically when I try to run asterisk its failing on:
>>
>> Unable to open pid file '/var/run/asterisk/asterisk.pid': No such file
>> or directory
>>
>> Normally I'd expect the pid file to be saved directly into
>> "/var/run/asterisk.pid" but asterisk seems to expect another directory=
.
>> If I create the directory /var/run/asterisk then all works fine.
>>
>> Like I say that's not a problem with the recipe, well I'm no expert bu=
t
>> /var is a temp directory so it gets created on boot, so there's no way=
 a
>> recipe should install there?
>>
>>
>
> Arigaed, thanks for your report!
>
> Either we can create the dir in the recipe (in do_install) or maybe we
> can configure it.
>
> Eric, can you peek into that (and if not, can you push your patch so I
> can pick this up.

Shouldn't the init script populate-volatiles.sh be handling this?

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


