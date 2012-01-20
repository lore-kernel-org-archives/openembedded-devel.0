Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1Ro9We-0005W9-L5
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 09:08:44 +0100
Received: by lags15 with SMTP id s15so149323lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2012 00:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4ykOVHk9lw+zCJAliIc4NLo5m7nITGtu+JKmfENSolc=;
	b=FYpY+JiFb7wUA0+dBF4MAd4E0/2nI6xB039IzORHfWCcR3yifckfj9erisGeAtO57Q
	88VNXIswiObXuVOhnEi7ZmYOZxEZUxOCU3Fe2TDmDdUHp5d0bxvb93w4SsXc+GMI35x6
	3FE1z/TVCYz2y2yBLRJ2fFKAqwqpgRTkRR59g=
MIME-Version: 1.0
Received: by 10.112.84.170 with SMTP id a10mr7311384lbz.22.1327046464268; Fri,
	20 Jan 2012 00:01:04 -0800 (PST)
Received: by 10.152.20.1 with HTTP; Fri, 20 Jan 2012 00:01:04 -0800 (PST)
In-Reply-To: <jfb56e$f67$1@dough.gmane.org>
References: <cover.1327002701.git.anders@chargestorm.se>
	<ba787e718994267f09ff11b8b4122d536175bffc.1327002701.git.anders@chargestorm.se>
	<jfa3vv$3ks$1@dough.gmane.org>
	<CAP9ODKoOkSrjWi27BT2Rv9v5oM37fP5fL5oLH8oDB54QJLdczg@mail.gmail.com>
	<jfb56e$f67$1@dough.gmane.org>
Date: Fri, 20 Jan 2012 09:01:04 +0100
Message-ID: <CAE4k23_pqVFr+VTtnVAqEQh0xqNfoF94py+p-4VkzwX7MCCiBA@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v4 2/2] systemd: conditionally RRECOMMENDS kbd*
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
X-List-Received-Date: Fri, 20 Jan 2012 08:08:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 20, 2012 at 08:30, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Op 20-01-12 04:33, Otavio Salvador schreef:
>> On Thu, Jan 19, 2012 at 20:03, Koen Kooi <koen@dominion.thruhere.net>
>> wrote:
>>> Op 19-01-12 20:53, Anders Darander schreef:
>>>> Let the distro define a keyboard distro feature, to conditionally
>>>> include kbd*. (Headless distros might not want to RRECOMMENDS kbd*).
>>>
>>> DISTRO_FEATURES is the wrong thing for that, so I'm going to NAK it.
>>>
>>
>> What would be your suggestion for this then? I see no other alternative
>> then distro feature.
>
> See what needs kbd and split it out, like we did with vconsole. Actually...
> git grep implies that vconsole is the bit that needs kbd :)

Ah, so the RRECOMMENDS were never moved to the systemd-vconsole
package when it was split? If that's the only thing depending on kbd,
then sure, I'll get you a new patch moving the RRECOMMENDS on kbd* to
systemd-vconsole. Again, it'll take a few days before I get the time
to do it.

Cheers,
/Anders


