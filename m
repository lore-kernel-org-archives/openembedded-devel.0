Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P1Cfk-0000UV-9q
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 08:31:46 +0200
Received: by iwn2 with SMTP id 2so2076887iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 23:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=phJKYshGYaGrQ55eDgsvVLrxBFfrgljsRzvt/fNXNxc=;
	b=qzKBUmLPgUliYePqCwdRvg4QAwhynrXSXkMyjRB8H0BbEEAhPsDQDDDr/jOn/GzRAB
	NX4f4Z6f6RiTbBvqjtvT8zcvDuZjNLb4SClU4W/Qqmq7tbUR3RIm9mPz7kDgYAHU/DMM
	X7+iXtVd93vAz5mZpRoMwpyaUb4UaLKkoeRXY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=besfF/hHtSpx7nRTL3+COzyYhcyXevSlXPpWD8MGLpdO86LpfCPA4yrUwlX3cauGs1
	NijD/AcM6YY0o+TJYIjJtPclRNk5Xq4SueqvC9dXsPZtzHkGoP01G5mM+WPQwfAa6n2G
	4C/qnudBLmbIitbdXdgcnJO6nEZi02St19ZGQ=
MIME-Version: 1.0
Received: by 10.231.31.135 with SMTP id y7mr3133080ibc.139.1285828259780; Wed,
	29 Sep 2010 23:30:59 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 29 Sep 2010 23:30:59 -0700 (PDT)
In-Reply-To: <1285796123.27605.4.camel@mattotaupa>
References: <1285792798-6529-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1285796123.27605.4.camel@mattotaupa>
Date: Thu, 30 Sep 2010 08:30:59 +0200
Message-ID: <AANLkTimvzxaKE3d=oEYAA7BnX3XZLb9btL36qJ2Bhxwn@mail.gmail.com>
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
Subject: Re: [PATCH] kernel.bbclass: avoid NOTE messages for files that are staged but not packaged
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
X-List-Received-Date: Thu, 30 Sep 2010 06:31:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/29 Paul Menzel <paulepanter@users.sourceforge.net>:
> Dear Frans,
>
>
> Am Mittwoch, den 29.09.2010, 22:39 +0200 schrieb Frans Meulenbroeks:
>> copy the files directly from the work area to staging. That way
>> there are no unpackaged files in image/ so no NOTE messages.
>> Additional advantage is that it is faster as we save the copy to the ima=
ge dir.
>>
>> See also http://thread.gmane.org/gmane.comp.handhelds.openembedded/37487
>>
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>> Acked-by: Roman I Khimov <khimov@altell.ru>
>> Tested-by: Petr ?tetiar <ynezz@true.cz>
>> Acked-by: Eric B?nard <eric@eukrea.com>
>
> please fix the special characters when you commit this.

Will do, I have just cut'n'pasted the lines. but I agree I was lazy
and it was better to fix this.
>
> I tried to apply your patch using `pwam.sh 3097` and saw that you
> already accidentally had commited this patch in
> 9a5382aad4e5a3e52fa52722cf5587fdba958e9f [1].
>
> =A0 =A0 =A0 =A0wpa-supplicant : moved unused files to obsolete dir
>
> Please revert that commit and commit appropriately.

Thanks for spotting this. I have already reverted the commit.
Will make a new patch for it.
Guess this accidently got picked up by the wpa-supplicant commit and
went unnoticed.
I'll try to take some more care next time.
apologies for any inconvenience.

Frans


