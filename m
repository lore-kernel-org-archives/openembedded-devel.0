Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kg4ysn@gmail.com>) id 1QkdtU-0005Pb-IP
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jul 2011 17:13:32 +0200
Received: by vws2 with SMTP id 2so2461608vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jul 2011 08:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=TJqboPWoKTw/8rdPau76Cf8IlcOmr0JEcCvlkvwUIr4=;
	b=Fh6C2yCV01RNMaJKrsW4GtqqGQK1up2jvvH+h9JXyBJQWHOTqnVrc/YLqJG6vtty86
	ZTMBAAk0neQJRC2ap17mWHo5hP0A2XviNl1zF2xvS8fNx9/9DGI3ksCsUcxG45Ygf+Na
	0U4ntwtby29De3eV/sul4+ItRpQlMb50wvw3Y=
MIME-Version: 1.0
Received: by 10.52.99.7 with SMTP id em7mr2720863vdb.131.1311433761309; Sat,
	23 Jul 2011 08:09:21 -0700 (PDT)
Received: by 10.220.63.3 with HTTP; Sat, 23 Jul 2011 08:09:21 -0700 (PDT)
In-Reply-To: <20110722202113.GA19631@sakrah.homelinux.org>
References: <1307648104-24260-1-git-send-email-raj.khem@gmail.com>
	<4E29B25D.8030503@balister.org>
	<20110722202113.GA19631@sakrah.homelinux.org>
Date: Sat, 23 Jul 2011 08:09:21 -0700
Message-ID: <CAG4_upTZ9cjZG-jrcj7NSWhwrb539yUqVm89HUCdxrk97JWi_A@mail.gmail.com>
From: Chris Verges <kg4ysn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gcc: Package libstdc++ gdb python helpers into dev package
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
X-List-Received-Date: Sat, 23 Jul 2011 15:13:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 22, 2011 at 1:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On (22/07/11 13:24), Philip Balister wrote:
>> On 06/09/2011 03:35 PM, Khem Raj wrote:
>> >People are seeing these errrors from ldconfig
>> >libstdc++.so.6.0.14-gdb.py is not an ELF file - it has the wrong magic
>> >bytes at the start.
>>
>> No more annoying message when I run ldconfig. Getting this fix in
>> will reduce my support emails by a small, but noticeable amount.
>
> thanks for testing it out. I have installed in in oe.dev/master

Would it be worth a cherry-pick of this into 2011.03-maintenance?
I've been seeing it there with gcc 4.4.4, too, and have the same issue
with questions that pop up about it.

Thanks,
Chris


