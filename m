Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PiQ1Z-00066z-Hz
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 12:28:25 +0100
Received: by iwn8 with SMTP id 8so1959154iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 03:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=5uKbbLWad2KBrBLMvXy1d4PlOS1RS14us1UFj4VX8Ns=;
	b=LEWaS792hq86E8zuQ7VlyqAkHzEYcxa2iHmtF/k2rONjji5ehMReBbdFphgOvew1h+
	wKddezZRVnar+HshoAwuC8GPsXpwhLVvXhxlcpM4wcMApbB9B3iojMEZQMful77WxHSu
	tNW/7IxJEgLH4ad+tyMQfrp/HX2fRqk4jD7s0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ZzaG2rdllxKWshy/OK5rXf7FWcWJS7lvVt+8vQWTzlJCAI1VCz6XL/tADgJkPfXTnF
	DnFhE0k1kypJHuY9XEO13EDLmHToUZwtqKfgLYXBDuy64bNYFCEfdzVN72ltYxT0Zcn5
	3dmXtNzI6iTuj8BjIxqi2aaTaIurr7TFp069w=
MIME-Version: 1.0
Received: by 10.231.37.12 with SMTP id v12mr766661ibd.83.1296127648281; Thu,
	27 Jan 2011 03:27:28 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Thu, 27 Jan 2011 03:27:28 -0800 (PST)
In-Reply-To: <201101271038.18945.ml@vdm-design.de>
References: <131E5DFBE7373E4C8D813795A6AA7F08032A16A440@dlee06.ent.ti.com>
	<131E5DFBE7373E4C8D813795A6AA7F08032A16A5BE@dlee06.ent.ti.com>
	<4D403D6F.3040800@mentor.com> <201101271038.18945.ml@vdm-design.de>
Date: Thu, 27 Jan 2011 12:27:28 +0100
Message-ID: <AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Thu, 27 Jan 2011 11:28:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/27 Thomas Zimmermann <ml@vdm-design.de>:
> On Wednesday 26 January 2011 16:27:43 Tom Rini wrote:
>> I believe, from talking with Chris Larson about this before, in 1.8.x
>> the error wasn't being populated upwards, but that got fixed. =A0At hear=
t
>> the problem is that QA errors aren't throwing a "kill the build" type
>> error. =A0This should be changeable (and would cause 1.8.x to fail too, =
if
>> someone backported this change to a 1.8.x using OE) to insane.bbclass.
>
> I don't think that a QA error should "kill the build" because then no bui=
ld
> from scratch would be possible.
> We have a QA error in coreutils-native because it doesn't inherit gettext=
. But
> adding this inherit would result in a dependencie loop.
>
> So if a QA error would stop build we would need something for those
> situations.
>
> And additionally i think that most QA errors aren't fatal because most of=
 them
> are for non-standard .desktop files.

If it is not a fatal it should probably be given as a warning
(especially the non-std .desktop things)
If corutils-native has a problem becuase it does not inherit gettext,
then maybe (if possible) it should be added or alternately if this is
not a problem it definitely should not be an error but a warning.

For me an error indicates something is broken and needs fixing.
Reverting that: if a condition does not break things it is not an
error (and yes, I know this is quite a black and white view, and that
there are situations this is not true).

Generally masking errors does not make them go away.

Frans


