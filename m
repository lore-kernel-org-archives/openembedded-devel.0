Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pczw6-0003lW-KE
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 13:36:22 +0100
Received: by iyj18 with SMTP id 18so458128iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 04:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=g0AEJnxFJpA50CC27ww0+1dMYcibAHyocutEhXiBYIc=;
	b=mEiqNMjuDwWr13aQrvujLjSLPlcSmpn4VDjZIJNs7NxKiB27L06aAL2nY2DHc+ehqr
	a+T6bKdMtv5aGzt4QywfoOCn24kFPCoKr1fcoT8qSHW/4VOcOf/U+xg8l8iGVPqQpB27
	yz6WJtzdMWW7f4YIepUE4fbHHNqArfSwzwXZY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GPxAugqtnqQY3hKiUgqKmHj+PdkI0Jg45MpW11GpfAcVI/DLDOt75N7s5Ix3Q0v+y4
	aAG9EbTMjAj7AMWaQwrmXRX58ieTNKigTwbJ5VwBoH1zUWdUGsox0vxel5cOnDFganuK
	bHrKHv/MEhvN6LkutAWopIABdzi498JAD7OF0=
MIME-Version: 1.0
Received: by 10.231.11.204 with SMTP id u12mr892043ibu.109.1294835749633; Wed,
	12 Jan 2011 04:35:49 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Wed, 12 Jan 2011 04:35:49 -0800 (PST)
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819ED6681865@DEMCHP99E35MSX.ww902.siemens.net>
References: <1293905677.17519.16909.camel@rex> <1293952586.18787.373.camel@eha>
	<09D9BE2AC4AA764DABAA8C91E48D819ED6681865@DEMCHP99E35MSX.ww902.siemens.net>
Date: Wed, 12 Jan 2011 13:35:49 +0100
Message-ID: <AANLkTik7vYb9cUvj+rcx9uBC-xxL0XZSUZ0efdf3Bxpd@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Bitbake task logging
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
X-List-Received-Date: Wed, 12 Jan 2011 12:36:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/12 Aeschbacher, Fabrice <Fabrice.Aeschbacher@siemens.com>:
>> > e) I'm not 100% on this yet but I'm wondering if we should scrap
>> > stdout/stderr output to the UI console in debug mode, just
>> make it clear
>> > where the output went on the console? If you ever have two
>> tasks running
>> > the output is unreadable anyway.
>>
>> Yes, stdout/stderr from two (or more) concurrent tasks are pretty
>> unreadable at best. =A0But it could make sense to have a debug mode whic=
h
>> does output stdout/stderr to console, while disabling concurrent task
>> execution.
>>
>> /Esben
>
> For now, oe_note() outputs in the logfile, which is quite far away from w=
here bitbake is invoked - moreover, in a directory which gets deleted at ev=
ery 'bitbake -c clean'
>
> It would be really nice to make it possible (which is very frequent when =
debugging a recipe) to just write debug output to the console.

Probably not exactly what you want, but if you put
BBINCLUDELOGS =3D "yes"
in your local.conf you at least get the log displayed of a failing bake.
This will still hide the log if there is a warning but the bake succeeds.

Frans


