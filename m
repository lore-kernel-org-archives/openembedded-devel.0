Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OkAsw-000089-8g
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 09:10:44 +0200
Received: by gwb15 with SMTP id 15so1334253gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 00:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MjkAhiUTgA0ArQ+7xZNDD5a496NbD+Zq3rDc62HJ3VU=;
	b=sU31htfYVysoIX4ayOWstCL2Zfbdpad7W1Cn5+HgKXOaQmwuRbAWyoSEUpup1Zf4yr
	UXn/Iq8UOdm3enHhAXeGn6rQNIH6AmugO8yCJcTuTgu4nmB2WOaV7icu5aUeWHBvtg/2
	QPshK8wN0o/XE+PgHiOKWSv/6ZMtMb13XshIM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=m266/cWvplangKLHnvtNzRLowKb9AYgjWysXvtwLPrmQMe41ux4Ytw+LwQgPATUpSf
	hF+6toFzZ7Gv6h3lDFu3B+pURrRoQob7S9b+WWJIaA6J9DJ4jtJmuXd9Y7117DHaPFn5
	nxDSG2VA7USqZgW5nnDm/BYc7MzhLcmYZTz3A=
MIME-Version: 1.0
Received: by 10.231.39.69 with SMTP id f5mr2796349ibe.53.1281769805956; Sat,
	14 Aug 2010 00:10:05 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Sat, 14 Aug 2010 00:10:05 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1008132255040.11048@asterix.crazy-teaparty.dyndns.org>
References: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
	<alpine.LNX.2.00.1008131040070.11048@asterix.crazy-teaparty.dyndns.org>
	<AANLkTikQ5qGF4N1N0Ud11cdS7P4+HxfPEXSvWwMvm4YV@mail.gmail.com>
	<alpine.LNX.2.00.1008131154370.11048@asterix.crazy-teaparty.dyndns.org>
	<AANLkTinChtk+VTgQ4H3+sMfyTRUQks+=YQR9Agj8M7a_@mail.gmail.com>
	<alpine.LNX.2.00.1008132255040.11048@asterix.crazy-teaparty.dyndns.org>
Date: Sat, 14 Aug 2010 09:10:05 +0200
Message-ID: <AANLkTi=p-1uQCfor_cLn1A8hM5XUmZ96eFP5-6-+5=UE@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Sat, 14 Aug 2010 07:10:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/13 Vitus Jensen <vjensen@gmx.de>:
> On Fri, 13 Aug 2010, Khem Raj wrote:
>
>> On Fri, Aug 13, 2010 at 2:59 AM, Vitus Jensen <vjensen@gmx.de> wrote:
>>>
>>> On Fri, 13 Aug 2010, Frans Meulenbroeks wrote:
>>>>
>>>> 2010/8/13 Vitus Jensen <vjensen@gmx.de>:
>>>>>
>>>>> On Fri, 13 Aug 2010, Vitus Jensen wrote:
>>>>>
>>>>>> The following patches will update canutils to the current version
>>>>>> 4.0.6 and remove older 4.0.x versions. =A0Also only the latest
>>>>>> version of libsocketcan will be kept.
>>>>>
>>>>> Frans, thank you for the ACKs. =A0Could you please apply the patches,
>>>>> too? I have no right to do so.
>>>>
>>>> Applied. Thanks for the contribution
>>>>
>>>> System guru's: Vitus's patches did not show up in patchwork
>>>
>>> They did. =A0But after you posted you ACKs I changed their state to
>>> "Accepted"
>>> and then they are usually filtered by "Action Required". =A0I'm not rea=
lly
>>> sure I did the right thing but I don't believe they shouldn't remain in
>>> "New".
>>
>> If they got applied change the state to 'applied'
>
> Sure, already did! =A0Do I set the 'archive' bit, too?
>
>
> Frans got hit by the fact, that 'accepted' patches don't show up in the l=
ist
> by default.
>
> Vitus posts patches
> Frans acks patches
> Vitus changes state to 'accepted'
> Vitus asks Frans to apply
> Frans: where are those patches in patchwork???
> Frans forces his googlemail to produce usable mail and applies
> Vitus changes state to 'applied'
>
> Probably I should update the wiki to document the above procedure, right?
>

I saw a different thread from Paul on patchwork.
Let's discuss this  in that thread.


Frans


