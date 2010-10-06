Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3ceg-0001zm-9O
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 00:40:12 +0200
Received: by iwn4 with SMTP id 4so1242iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 15:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=tu/w5Knmho0HFTzE4PdjP5xyQPP2YDJIUPeU7qKAuTE=;
	b=lfykX8thm2wzT2IRapE7cWdrJtpupYK7Potg69RxiKuEqX8aLwMcmxCz+yIMgdXxLC
	aB/LaYirAqN88svZZP3N4IvXbbo+aEMt/Xiiq19L+IqU6Qtu8XWgdkoP4aZzdwfTkkbO
	3Mh4o1khIRBVCs805xaRTKTZ/J7qNH1MVAB4c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Fn1tIle0PIDTr3lPW61JSSHUwsOuqbre3oOgJY0grS2FdYc5h8yndF3Y6bAujp3Iq0
	ymVmxV/IadkXaWf7FWVP0/gfgq0L4lfIfwxrkBj8SBtifEJOjWe6WJMoZzFPbRqcB3au
	TvTcSnxcXa1U0TBtmuJYhUx5IQ5mX1ljc1vRo=
Received: by 10.231.31.196 with SMTP id z4mr14662708ibc.111.1286404613530;
	Wed, 06 Oct 2010 15:36:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Wed, 6 Oct 2010 15:36:33 -0700 (PDT)
In-Reply-To: <AANLkTi=mh5OKhwL8qE7ZNwqwh5abjP3=w==oDNHrRbai@mail.gmail.com>
References: <4CA97897.4020001@nedap.com> <4CA97EBC.4040406@eukrea.com>
	<4CA98CEF.3090604@nedap.com>
	<AANLkTik2_YEL-dhKLr9LuJQ78W4WXS4WvUbxDfXeJk8U@mail.gmail.com>
	<4CA99206.5060001@eukrea.com>
	<AANLkTikEpu0yxUXYZvfiRbgiFjnjc+GEAJ=-_x_Mszkp@mail.gmail.com>
	<AANLkTi=wjXOWSjoiY0FqUQKU3Y+1hxWFQcvtD7HimFiv@mail.gmail.com>
	<4CAA29ED.9000501@eukrea.com>
	<AANLkTi=mh5OKhwL8qE7ZNwqwh5abjP3=w==oDNHrRbai@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Oct 2010 15:36:33 -0700
Message-ID: <AANLkTim-ZeFpYmCU+tseSGo77AH+D5V_DBLC1MyCAy4Y@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: trouble compiling udev
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
X-List-Received-Date: Wed, 06 Oct 2010 22:40:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 4, 2010 at 12:29 PM, J. L. <vwyodapink@gmail.com> wrote:
> On Mon, Oct 4, 2010 at 12:24 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote=
:
>> Le 04/10/2010 20:34, J. L. a =C3=A9crit :
>>>
>>> udev151 builds for me without this fix and I am building with gcc
>>> 4.5.. Just thought I would let you know
>>>
>> which machine / arch / distro are you building for ?
>>
>> Eric
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> gumstix overo angstrom 2010.x gcc 4.5

and how old is your OE snapshot.

-k


