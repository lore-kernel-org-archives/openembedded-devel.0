Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OjrQN-0007cH-IC
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 12:23:44 +0200
Received: by ywe9 with SMTP id 9so882715ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GyFc4Hb+ICoQBRpwRPnJaV+2Jic/IEhIEBJhscuy9eY=;
	b=lYXmlxTkAtvpHTMFMOqSlPtZuHZAsrA1wo4b/9KRv5i5TN7xUsqt46kkb7laH8HryQ
	R5AP4kEL/pHlLYOymYDONUpWzv8UP2xpHLN8NG77JR+wKIO87piB6W2LXrzQz20mieds
	k046CIeCvJqGv9Nfy6OJ/B/TV53nwC9dxyols=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jYQF++aCBAOo9mKcPZs8ddLwHj7lE1R8g1tUBwgHygsBH5FKac886KVXGFBkGqKdf+
	sZWBMQvv6iswGhVhESBG8/CQpm101pLkJgXOff0mCLSmUJC6kojaNSegei4Ze5qZ+TYn
	KFVsQUDkOCeYyc6k3fDsk2r4innKHFAHmBhGU=
MIME-Version: 1.0
Received: by 10.231.14.69 with SMTP id f5mr1403689iba.116.1281695006126; Fri,
	13 Aug 2010 03:23:26 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Fri, 13 Aug 2010 03:23:26 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1008131154370.11048@asterix.crazy-teaparty.dyndns.org>
References: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
	<alpine.LNX.2.00.1008131040070.11048@asterix.crazy-teaparty.dyndns.org>
	<AANLkTikQ5qGF4N1N0Ud11cdS7P4+HxfPEXSvWwMvm4YV@mail.gmail.com>
	<alpine.LNX.2.00.1008131154370.11048@asterix.crazy-teaparty.dyndns.org>
Date: Fri, 13 Aug 2010 12:23:26 +0200
Message-ID: <AANLkTikwc_QMdf-LzkAwO+dFeT9uw7hRgx+R=woUN_0c@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: update canutils to current version
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
X-List-Received-Date: Fri, 13 Aug 2010 10:23:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/13 Vitus Jensen <vjensen@gmx.de>:
> On Fri, 13 Aug 2010, Frans Meulenbroeks wrote:
>
>> 2010/8/13 Vitus Jensen <vjensen@gmx.de>:
>>>
>>> On Fri, 13 Aug 2010, Vitus Jensen wrote:
>>>
>>>> The following patches will update canutils to the current version
>>>> 4.0.6 and remove older 4.0.x versions. =A0Also only the latest
>>>> version of libsocketcan will be kept.
>>>
>>> Frans, thank you for the ACKs. =A0Could you please apply the patches, t=
oo?
>>> I
>>> have no right to do so.
>>
>> Applied. Thanks for the contribution
>>
>> System guru's: Vitus's patches did not show up in patchwork
>
> They did. =A0But after you posted you ACKs I changed their state to "Acce=
pted"
> and then they are usually filtered by "Action Required". =A0I'm not reall=
y
> sure I did the right thing but I don't believe they shouldn't remain in
> "New".
>
> http://wiki.openembedded.net/index.php/Patchwork doesn't describe states,
> only that you should change them :(
>
> Vitus
>
Ah ok. Actually I only peeked at the new ones.
Most people tend not to change the patchwork values so I didn't think
of looking at the other states
and I use patchwork to download the patches, much simpler than getting
them from gmail.

Wrt the states: that is indeed not too clear. I always have doubts
what I should to with the archived checkbox.

Anyway, your changes are in, so please change the state in patchwork
from Accepted to Applied.

Frans


