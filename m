Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtOnq-0003tD-UX
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 19:51:23 +0200
Received: by iwn2 with SMTP id 2so200537iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 10:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OWioKWao8apN8MLr0GT7fl0SGiTaRbTJXEmMoMf3DRM=;
	b=ShdE/bVqwHEClhC4/jI+noL+tqil4V/oRA1VtJpCAD7rvUmRlieSWOWcLW9U40m0f8
	2ronPJVChaH2V29kLW9jafbBjMTkqyfv9rukvddANFnVSpW+gEnNyXo8gImdEZuWYOu9
	7v/2ny3xUWAebI7uOoFuQZnZpuIRh1TMEwuKE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aFBstDQBOlVki6n/Pg8ko9K0M40vnZaHIdn0bbkf8P8px5u8bo31TQRnTXLJ+s+unX
	ThTeaBTQQAlSZWMHzzy6mW+dsNyXdjXX5vlG52pm6LgKSRqkElDuYD650dxm2ZMuR1WY
	rXRs0Y0aTpBSLa5TpUHDyepburzi4CAD87HwY=
MIME-Version: 1.0
Received: by 10.231.169.210 with SMTP id a18mr10174308ibz.5.1283968233792;
	Wed, 08 Sep 2010 10:50:33 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Wed, 8 Sep 2010 10:50:33 -0700 (PDT)
In-Reply-To: <AANLkTinGsnbP++GV+sLj3Q0g5R1HHHkq7NtBVWrhSmzh@mail.gmail.com>
References: <AANLkTikC4v+QEpYsos2=f4wtEUUCt8Q=VK9ByT56pn-L@mail.gmail.com>
	<AANLkTinGsnbP++GV+sLj3Q0g5R1HHHkq7NtBVWrhSmzh@mail.gmail.com>
Date: Wed, 8 Sep 2010 19:50:33 +0200
Message-ID: <AANLkTinbuOq_8bFSys6=b2pbEq6Gg7cssk+Fhhj2yYOy@mail.gmail.com>
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
Subject: Re: pulseaudio issue
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
X-List-Received-Date: Wed, 08 Sep 2010 17:51:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/7 Khem Raj <raj.khem@gmail.com>:
> On Sun, Sep 5, 2010 at 2:10 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> I have an issue with pulseaudio:
>>
>> | =A0 CC =A0 =A0 libpulsecore_0.9.21_la-svolume_arm.lo
>> | pulsecore/svolume_arm.c: In function 'pa_volume_s16ne_arm':
>> | pulsecore/svolume_arm.c:53: error: can't find a register in class
>> 'LO_REGS' while reloading 'asm'
>> | pulsecore/svolume_arm.c:53: error: 'asm' operand has impossible constr=
aints
>> | make[3]: *** [libpulsecore_0.9.21_la-svolume_arm.lo] Error 1
>>
>> From searching the irc log this is a longer standing issue.
>> Is there any suggested solution for this.
>> If I understand corrrectly it affects all our armv4 and armv5 machines.
>>
>
> well its not arm v4 or v5 but its thumb. If you use arm instruction
> set then it would
> work. set ARM_INSTRUCTION_SET =3D "arm" in the recipe and retry.
>
That seems to have helped a little bit but not enough.
Apparently there is armv6 asm or so in it:

|   CC     libpulsecore_0.9.21_la-svolume_arm.lo
| {standard input}: Assembler messages:
| {standard input}:33: Error: selected processor does not support
`ssat r0,#16,r0'
| {standard input}:47: Error: selected processor does not support
`ssat r2,#16,r2'
| {standard input}:48: Error: selected processor does not support
`ssat r3,#16,r3'
| {standard input}:49: Error: selected processor does not support
`pkhbt r0,r3,r2,LSL#16'
| {standard input}:65: Error: selected processor does not support
`ssat r2,#16,r2'
| {standard input}:66: Error: selected processor does not support
`ssat r3,#16,r3'
| {standard input}:67: Error: selected processor does not support
`ssat r4,#16,r4'
| {standard input}:68: Error: selected processor does not support
`ssat r5,#16,r5'
| {standard input}:69: Error: selected processor does not support
`pkhbt r0,r3,r2,LSL#16'
| {standard input}:70: Error: selected processor does not support
`pkhbt r1,r5,r4,LSL#16'
| make[3]: *** [libpulsecore_0.9.21_la-svolume_arm.lo] Error 1

see also: http://tinderbox.openembedded.net/public/logs/task/7634513.txt


