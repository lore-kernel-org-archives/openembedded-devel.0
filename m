Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1SAFP3-0000vk-1m
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 07:52:13 +0100
Received: by bkcjg15 with SMTP id jg15so703393bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 23:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=resent-from:resent-to:resent-date:resent-message-id
	:resent-user-agent:received-spf:dkim-signature:mime-version
	:in-reply-to:references:date:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=+LI64VRR0OnRrF8a4f8CL8yI8r7UHbGcUS/9qk7jFVA=;
	b=dP1AOUIs+fP7sxghB0vS1rRyT6AS5UyD9ZiYxWPRWlfOIvErBeCx7qShYIZWj60pxK
	QdXd1KjRtVx7rXFDYx7IwQ0Tl7Ux6ilGPMsIFDLQHOspWYjHVc4wCyyhj7fQkBmxdea0
	XU7zJZakI6OqtugQRqLGm27KM8sGQjhG7Mvv4HbwitbWqpn3S456Ud0y+6vhk8Vg0X2R
	IgNQc3LK88B+E80Y21djwerCOUulxYccZC/WEAoBx4vUIKo7AODJOr6NE7bxzXNMQBlT
	iE3/EO5eBhuCw9vDzFD3FU5URYegw+9NNh5SrkvL224bpw6FkiKykbpzXoF3gnnnAw8J
	FYYg==
Received: by 10.205.129.137 with SMTP id hi9mr1003362bkc.131.1332312199541;
	Tue, 20 Mar 2012 23:43:19 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id fh5sm1394511bkc.1.2012.03.20.23.43.19
	(version=SSLv3 cipher=OTHER); Tue, 20 Mar 2012 23:43:19 -0700 (PDT)
Resent-From: Steffen Sledz <sledz@dresearch-fe.de>
Resent-To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Resent-Date: Wed, 21 Mar 2012 07:43:18 +0100
Resent-Message-Id: <4F697886.10500@dresearch-fe.de>
Resent-User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
Received: by 10.216.1.67 with SMTP id 45csp13641wec;
	Tue, 20 Mar 2012 07:22:48 -0700 (PDT)
Received: by 10.68.234.165 with SMTP id uf5mr1886953pbc.5.1332253367707;
	Tue, 20 Mar 2012 07:22:47 -0700 (PDT)
Received: from mail-pz0-f44.google.com (mail-pz0-f44.google.com
	[209.85.210.44])
	by mx.google.com with ESMTPS id c10si2072866pbd.326.2012.03.20.07.22.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 07:22:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of tom.rini@gmail.com designates
	209.85.210.44 as permitted sender) client-ip=209.85.210.44; 
Received: by dakl33 with SMTP id l33so93053dak.31
	for <sledz@dresearch-fe.de>; Tue, 20 Mar 2012 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=+LI64VRR0OnRrF8a4f8CL8yI8r7UHbGcUS/9qk7jFVA=;
	b=aioKy0bHLqScXvD29tqeYEI+UVwNX8T6vQIzkz7EMd5s8TWycSW0TWevWWcxbwb9ta
	A13y9xHtVb40mTT/Qtw0N1HeLKYWsryMEPU+lL++BOPhO1UL04m01PGUxjXT1S6FTcNB
	iao/pT8FNEAegCVdmINFECi3fD46qVzeWiEQoWZPG+ySSWP93DndlmOZrWd/Odg83ZO2
	QRzop+L6e0WEdWOmwnoZo/h8aMq+TjNI7zV8QFG4N61N5pRJR5PBgUTwjjHxUXDb6WlX
	Xma1oPvwl8t4BBZX0R3+2OR00sD+RosZ/pGLUVI7U+ljDK16D30JBaza8Z6ieUIQjh0s
	Lmsw==
MIME-Version: 1.0
Received: by 10.68.217.97 with SMTP id ox1mr1700382pbc.81.1332253365250; Tue,
	20 Mar 2012 07:22:45 -0700 (PDT)
Received: by 10.142.241.4 with HTTP; Tue, 20 Mar 2012 07:22:45 -0700 (PDT)
In-Reply-To: <CACW_hTZaNQSiUDPPC2VyDqzeBenFwyKXUT6uaqR96LooaNiDRg@mail.gmail.com>
References: <4F61C54B.1000609@dresearch-fe.de>
	<4F66E4F2.2000909@dresearch-fe.de>
	<CA+M6bXmpiegfSspYOwybxKSLf4Ukg5tjRL4VR1aq8T4EFyaaRg@mail.gmail.com>
	<CACW_hTbMZ5R6VB_BChH+3rxx-tqV3jqxioX8Q5ZWsoiHJWZ=7w@mail.gmail.com>
	<20120319162122.GA19810@bill-the-cat>
	<4F682E0C.4030101@dresearch-fe.de>
	<CACW_hTZaNQSiUDPPC2VyDqzeBenFwyKXUT6uaqR96LooaNiDRg@mail.gmail.com>
Date: Tue, 20 Mar 2012 07:22:45 -0700
Message-ID: <CA+M6bXnkir38b07V+w5A8szcHDvOaNzQV7pe-FOVGULOwG+wwg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
X-Gm-Message-State: ALoCoQkcHtnHcmiDf7R2xDwID9tx5j+CT9q2dPP58HibrA5Cu/vVy5n+qp0wMNL6U9lDMrwvygzw
Subject: Re: libmatthew-java-0.7.1.tar.gz not fetchable
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
X-List-Received-Date: Wed, 21 Mar 2012 06:52:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2012 at 12:42 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2012/3/20 Steffen Sledz <sledz@dresearch-fe.de>:
>> On 19.03.2012 17:21, Tom Rini wrote:
>>> On Mon, Mar 19, 2012 at 04:44:10PM +0100, Frans Meulenbroeks wrote:
>>>> 2012/3/19 Tom Rini <tom.rini@gmail.com>:
>>>>> On Mon, Mar 19, 2012 at 12:49 AM, Steffen Sledz <sledz@dresearch-fe.d=
e> wrote:
>>>>>> On 15.03.2012 11:32, Steffen Sledz wrote:
>>>>>>> libmatthew-java-0.7.1.tar.gz (used in 2011.03-maintenance branch) i=
s no longer fetchable from it's original location (the maintainer provides =
the latests version only). And i did not found another reliable source.
>>>>>>>
>>>>>>> Can someone put the tarball into the OE and/or Angstrom mirrors?
>>>>>>
>>>>>> Ping!
>>>>>
>>>>> If someone points Khem at a copy, this can happen...
>>>>>
>>>>> --
>>>> google is your friend
>>>>
>>>> http://pkgs.fedoraproject.org/repo/pkgs/libmatthew-java/libmatthew-jav=
a-0.7.1.tar.gz/6a4db221129f230c64a0f937d00bb703/libmatthew-java-0.7.1.tar.g=
z
>>>>
>>>> It might be useful to update the recipe itself as well.
>>>> Furthermore we might consider running a fetchall and put all fetched
>>>> on the mirror.
>>>
>>> Does pkgs.fedoraproject.org have a policy about forever, ala
>>> snapshot.debian.org? =A0Otherwise, we're just making a problem for
>>> ourselves in the future. =A0WRT an everything mirror, I think bandwidth
>>> usage is a concern there, ala what I think happened with the angstrom
>>> everything mirror.
>
> I don't know about the policy fedora has for retaining packages.
> There might also be a copy on debian. Google gave a fair number of hits.

I see one under
http://snapshot.debian.org/archive/debian/20110301/pool/main/libm/libmatthe=
w-java/
so a patch to switch to that would be good with me.

--=20
Tom


