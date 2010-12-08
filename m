Received: from mail-ew0-f44.google.com ([209.85.215.44])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chris.spehn@gmail.com>) id 1PQ9rn-0001Eq-Ps
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 03:34:52 +0100
Received: by ewy8 with SMTP id 8so584115ewy.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 18:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=jLaM3NBuTrGbjPeiAn2Ey2bOPS/0oET+hwmD2FuA+AM=;
	b=NuXX3ZZQvu0XlAkcW5833mRHADcg2WbV4d3d/FvALQvuaWq1YF7t7iVwvMicHFLP4a
	TRDF6t9kIngXGlwsfSuDfh94ce9LmYM5wRfsKf7i1dEI+Voikuq+xOKOWxOmMrqPzgSm
	pdV28gky6L1t4XMEs2Qq19mRYLWkvw0yh5Udc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OCwW7WRm1Re5gsb1DJPw8N2hTTBR19tLZhnab7HK80q5tXA6SW5x6UvrL7CyFjn+DT
	N1Sv9kiDWvDn/JT1gDezVNssrWY/RwfN/MFH+Bsi1Kl1xhuzkhi++RvET60uYanYYFVN
	ivoXk/OdX6WDGFiSZsy6Xb79/Em0tR43fWiZA=
MIME-Version: 1.0
Received: by 10.213.19.201 with SMTP id c9mr1581109ebb.89.1291775602842; Tue,
	07 Dec 2010 18:33:22 -0800 (PST)
Received: by 10.213.22.16 with HTTP; Tue, 7 Dec 2010 18:33:22 -0800 (PST)
In-Reply-To: <alpine.LNX.2.00.1012072206420.6290@asterix.crazy-teaparty.dyndns.org>
References: <1291732373-17953-1-git-send-email-GNUtoo@no-log.org>
	<alpine.LNX.2.00.1012072206420.6290@asterix.crazy-teaparty.dyndns.org>
Date: Tue, 7 Dec 2010 20:33:22 -0600
Message-ID: <AANLkTi=zRGNVxqeT9RgCkZBZbQZ9pNzF4Mzij95LKi1U@mail.gmail.com>
From: Chris Spehn <chris.spehn@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.44
X-SA-Exim-Mail-From: chris.spehn@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] add iphone3g support
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
X-List-Received-Date: Wed, 08 Dec 2010 02:34:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Another person pays for the website hosting and domain name. I asked
him if he would transfer the domain name to me, but he hasn't
responded yet via email. There are a few requirements to run SHR on
the iPhone:

1) The iPhone must be jailbroken. You must use redsn0w or any of the
pwn varietes (QuickPWN, PwnageTool, etc.) You can reverse this by
restoring with iTunes.
2) At the very least, you have to copy the SHR image to the iPhone.
3) You can load the bootloader, OpeniBoot, into ram without installing
it and boot the distribution manually.
4) You must extract the multi touch firmware, download the wifi
firmware, and place them inside the ramdisk.

However, it's much easier to use a Cydia application called "Bootlace"
to automatically install OpeniBoot, get the firmware files, and
download the android images to the phone. You can use the uninstall
feature in Bootlace to remove everything but the jailbreak. This
simplifies the process quite a bit. You would only be required to copy
the SHR image over via ssh or with a tool called ifuse on Linux as
well as copy the firmware files to your computer to place inside the
ramdisk. You could then manually boot the distribution with OpeniBoot
console. If he is already jailbroken you could return the device and
he would never know you did it. If you have any questions about the
process I can explain more in detail. I'm extremely tired so I
apologize in advance if I overlooked something or gave a poor
explanation.

Chris

On Tue, Dec 7, 2010 at 3:12 PM, Vitus Jensen <vjensen@gmx.de> wrote:
> On Tue, 7 Dec 2010, Denis 'GNUtoo' Carikli wrote:
>
>> Android was ported to the some apple devices(iphones,ipod etc...)
>> Fortunately the kernel is standard enough to be able to run some
>> =C2=A0GNU/Linux distributions such as SHR.
>
> ...
>>
>> Chris Spehn is part of the iX project ( http://www.ixproject.org )
>>
>> He did all the testing and the configurations files, I just helped to ma=
ke
>> =C2=A0the openembedded patches.
>>
>> Note that I didn't have an iphone3g for testing the changes.
>
> There is an iphone3g in this household... =C2=A0Is testing possible witho=
ut
> permanent modifications to the iphone? =C2=A0The above website is "suspen=
ded" and
> it's hard to imagine, given that there is no SDHC card in the iPhone.
>
> If it's possible I would like to talk the iphone owner into trying it :-D
>
> Vitus
>
> --
> Vitus Jensen, Hannover, Germany, Universe (current)
> pgp public key available from keyservers
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


