Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Oulpa-0007VR-Uh
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 14:38:51 +0200
Received: by qwa26 with SMTP id 26so2312136qwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 05:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ryaELWFH+Uq3ldst4ZyJM5CZOFdTig5ulCHEzEnvARA=;
	b=am+P5ONOvf1Uxhuh9bL02OCB07M5eGow+FmQIqovIJgWxbkaiH5vNR0tcix5X3+QQk
	xXPX+/VV6jYKVjCxxQSlFZ+OaBcvV46TIoUtN2LddQK/mPHzti5dRng1K+kAzLH9JEFz
	SsIF9NrR7vOuiR72BA5zVAg2FDQFrL9eZAlhg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=M4yxelz2PtzDGeouPMnxocVHz4D8It30hY7ZAvpuQh3//9DdKcECeC6JfB6xT8L3a9
	s0EMoDArnZW5vESXLA2b1BL4VE01q9MIgv5rFPW4VAt1LBIvNavWpi75gtjN3JKjzRd3
	E075buAAU/DUTGv/biLZRyQqzQDH7bwgKBtvo=
MIME-Version: 1.0
Received: by 10.224.20.9 with SMTP id d9mr29983qab.364.1284295084517; Sun, 12
	Sep 2010 05:38:04 -0700 (PDT)
Received: by 10.229.250.211 with HTTP; Sun, 12 Sep 2010 05:38:04 -0700 (PDT)
In-Reply-To: <AANLkTi=EALsQWTorEsz19dyJFX-AnStXdaHYJUy4iZXn@mail.gmail.com>
References: <4C8CA2DC.40707@freyther.de>
	<AANLkTi=EALsQWTorEsz19dyJFX-AnStXdaHYJUy4iZXn@mail.gmail.com>
Date: Sun, 12 Sep 2010 14:38:04 +0200
Message-ID: <AANLkTik6vgHKfdtL4tJYww_7MhcNEb7hq=c3eMi7xaP+@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] insane.bbclass: Enable the insane.bbclass for everyone in a warning mode
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
X-List-Received-Date: Sun, 12 Sep 2010 12:38:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Sun, Sep 12, 2010 at 2:32 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/9/12 Holger Freyther <holger+oe@freyther.de>:
>>
>> Make conf/bitbake.conf load conf/insane.conf that will INHERIT the
>> insane.bbclass. Remove the INHERIT from the distros currently using
>> insane.bbclass. Change insane.bbclass to check QA_FATAL to see if errors
>> are allowed to be fatal, make SHR/Kaelios and Angstrom use that new
>> flag to continue having fatal QA Errors.
>>
>> Signed-off-by: Holger Hans Peter Freyther <zecke@selfish.org>
>
> I am not really in favour of this.
>
> One of the disadvantages of insane.bbclass is that it has:
> PACKAGE_DEPENDS += "pax-utils-native desktop-file-utils-native"
> This drags in several packages (e.g. sqlite3-native glib-2.0-native)
> only to check if the .desktop file is valid.
>
Good point.

Could the insane class be more configurable to what it has to check,
and have it's dependency generated from that configuration?

Regards,
-- 
Leon


