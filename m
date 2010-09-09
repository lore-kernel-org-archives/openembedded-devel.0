Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <captain.deadly@gmail.com>) id 1Othqs-0008FD-Lu
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 16:11:47 +0200
Received: by wwi14 with SMTP id 14so1685601wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 07:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:x-enigmail-version:content-type:content-transfer-encoding;
	bh=EBSnl3M6W4OEDD3ZJpEOzM/n2BZ7q+oX1aIljN+4DCc=;
	b=v7Lx30kOk4TADnlmiFNLlWhT2AlANyQR6VMjOTTKaUDoZYeARVhmU3jKy5cTS/Rxls
	A2k9JJ4nnMEwTvWSGaaOy2RPs046EYwVO57rvFNCu9kuPuD0B6Al85M3pP/kM/EwR9Cz
	juYiHAUwvSG2IjG1UYSxFXlGgj9hPFouKPO2Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	b=xB9dyNzBgc8oyppOVC6at7HT2J8z8Q1xXW4rZ0F8xwHc+hJPEVY/WiYpPROr0taiaZ
	+cqvKX+D51QpGSYI6Ie2osCX9Oo1lDyfHH/oboziGWPwC4Mt/x74C2PNsfLONmuZ2GLh
	Do1yWdsb3igwfbsb7+zmX46h+YZG+eArVHseE=
Received: by 10.227.138.147 with SMTP id a19mr88945wbu.93.1284041460516;
	Thu, 09 Sep 2010 07:11:00 -0700 (PDT)
Received: from [192.168.1.134] (dsl-51-41.dsl.netsource.ie [213.79.51.41])
	by mx.google.com with ESMTPS id m25sm1161909wbc.19.2010.09.09.07.10.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 09 Sep 2010 07:10:59 -0700 (PDT)
Message-ID: <4C88EAF2.7010208@gmail.com>
Date: Thu, 09 Sep 2010 15:10:58 +0100
From: Arigead <captain.deadly@gmail.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C85058D.8070506@gmail.com>	<1283996027.3036.1.camel@gnutoo-laptop>	<AANLkTimz=Q1KsMrMUfwvSEueq1a3kEcgWFoVZDvFqzqK@mail.gmail.com>	<4C88E7C2.1030500@gmail.com>
	<4C88E9BC.9040603@eukrea.com>
In-Reply-To: <4C88E9BC.9040603@eukrea.com>
X-Enigmail-Version: 0.96.0
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: captain.deadly@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
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
X-List-Received-Date: Thu, 09 Sep 2010 14:11:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Eric Bénard wrote:
> Le 09/09/2010 15:57, Arigead a écrit :
>> Frans Meulenbroeks wrote:
>>> 2010/9/9 Denis 'GNUtoo' Carikli<GNUtoo@no-log.org>:
>>>> On Mon, 2010-09-06 at 16:15 +0100, Arigead wrote:
>>>>> was trying to build Asterisk for the OpenMoko Free runner and it
>>>>> failed
>>>>> on a dependency on termcap so I tried to bitbake termcap first and
>>>>> that
>>>>> failed. The termcap compile stage is working but it's when it tries to
>>>>> install that the recipe seems to fail but I'm new to this.
>>>>>
>>>>> I'm off to read the openembedded documentation again but in the mean
>>>>> time if anybody can give me a hit that would be great.
>>>> We can't help you if you don't post some logs or console output.
>>>> Copy-pasting the part where it fails, if it's small, could be enough
>>>> for
>>>> a start.
>>>> Denis.
>>>>
>>>>
>>> Denis, the message from Arigead is 3 days old and has already been
>>> dealt with.
>>> There is a patch for asterisk from Eric that makes it build fine for me.
>>>
>>> Frans.
>>>
>>
>> Yes sorry if my original post was too vague, but it was a known issue at
>> the time anyhow. As Frans says the patch was added and is in the feeds
>> and Asterisk is now building for my target device. Thanks for you help
>> and pointing out where the problem was.
>>
> OK so it means the patch solves your problem. Does asterisk runs fine on
> the target ?
> 
> Eric
> 

Sorry I'll have to get back to you on that one. I left my OpenMoko (The
Target) at home this morning so can't install the ipk :-(

Actually thinking about it I'd not be too sure if Asterisk was ever
running fine on a mobile phone. Simply wanted to play with it and see
what it could do. There is an OpenMoko wiki page on messing with it so
thought I'd have a look.

Anyhow I'll get back to you when I test it later today or tomorrow if
that's any help.



