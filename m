Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Pd1b8-0005qA-GI
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 15:22:50 +0100
Received: by wyb40 with SMTP id 40so599421wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 06:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=oOp4QeiCZPp8Eqo2IfoxedDfJ0YRE+SivQ+P6NhuWMc=;
	b=GMMViGJkN6pin/H0fDfJsJ5YBER0kjZioTDfW2HBVNdLBOWyuqmaMxUjXa/nGugmGl
	iuorEhKJ6BzK9Kw6CybZwrv8k4R2R5GtIpvpTwEkk+cmBRfJxk2pZr0zlTbsSfVJyshN
	+ujI3cXGjrsumr3ADw5qCpYvGlamt2aTOTl5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=Eg1DzYmVhU5H+ANwb18cR5ranZxSQgveV+B/1k6Onz+ZhphfaHj/7B7xKT11lJRH13
	G+m/fDDWQzrK6XlypH2hHDm31UNvNymejEFfjFc3AlQiheYGhVarAXcq/B1dLhNcp6m0
	tob6uhjCZzO5Es110d/jDuHPCFGtT1jLOUA5M=
Received: by 10.216.154.8 with SMTP id g8mr2035768wek.12.1294842138613; Wed,
	12 Jan 2011 06:22:18 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Wed, 12 Jan 2011 06:21:58 -0800 (PST)
In-Reply-To: <4D2D593C.1010601@gmail.com>
References: <1294796586-24723-1-git-send-email-kergoth@gmail.com>
	<4D2D593C.1010601@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 12 Jan 2011 07:21:58 -0700
X-Google-Sender-Auth: Q9z-ywppRCv7azhSoNTTny8HdUs
Message-ID: <AANLkTi=Mo6oZ+sHk9qiPkpuWWLvrZO2CnULKGnXnKfFF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] busybox: move syslog config to /etc/default
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
X-List-Received-Date: Wed, 12 Jan 2011 14:22:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 12, 2011 at 12:33 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On 1/11/2011 5:43 PM, Chris Larson wrote:
>>
>> From: Chris Larson<chris_larson@mentor.com>
>>
>> The busybox syslog syslog.conf is parsed by the /etc/init.d script, not =
by
>> the
>> syslog process itself, so it belongs in /etc/default. =C2=A0In addition,=
 the
>> file
>> format is *completely* different from the standard sysklogd configuratio=
n,
>> so
>> while we should resolve the file conflict between busybox-syslog and
>> sysklogd,
>> we should not use update-alternatives for it, so this is a cleaner
>> solution.
>>
>> Signed-off-by: Chris Larson<chris_larson@mentor.com>
>
> looks ok will upgrade paths work ok after this change
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Hmm, I suspect that if the user modified the busybox /etc/syslog.conf,
opkg would leave their version behind with a different filename,
rather than blindly removing a user edited conffile, but of course the
new one in /etc/default wouldn't include any of the old user
customizations.  I'll look into this a bit more closely.  Thanks.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


