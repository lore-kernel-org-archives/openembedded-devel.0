Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PqSiN-0006v0-RQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 16:57:52 +0100
Received: by fxm17 with SMTP id 17so3713041fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 07:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=jzHIQWgJqLHuF1fkK1ytTfow6uYw7+3DLc5G043bOzs=;
	b=tEvXYycovFBlYeRDF+w9aiXevfL+ZuMTC1wkZ//LJtJytGkeuzXUk8zxzm66QhRPs+
	zNDojhSUHHuFM5hOMksIgwoXF3C9XKmFqjL6Va8uZqrWjqX8lkh8rmKDJArYT+NrLLao
	ew0TYALXqhGXP63ytVBb9zqzqda1hhSMEKi48=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=OVdULNSE5kkjralskUjI0VrYBnu98RE0lO1cQUST7QkignumhaLb5kHWsNen+ftKJA
	O2Cp0fs19IkeAWIu05HLuslQlw+BCZy2lyTAEaACfF7hgtAFzDP9Jt/IdT3FGiIvSptp
	s3zaWpCN4c3C9MGNHlJxTQjTGc1YUdOW4avEU=
Received: by 10.223.53.68 with SMTP id l4mr1166243fag.44.1298044007648; Fri,
	18 Feb 2011 07:46:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Fri, 18 Feb 2011 07:46:01 -0800 (PST)
In-Reply-To: <4D5E90B0.2020006@mentor.com>
References: <4D51566B.9060603@mentor.com>
	<20110208145355.GF2050@xora-build.xora.org.uk>
	<4D515A17.3060203@mentor.com> <4D523623.7030509@opensimpad.org>
	<4D59543B.50506@mentor.com> <4D5D9706.80504@opensimpad.org>
	<4D5E90B0.2020006@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Feb 2011 07:46:01 -0800
Message-ID: <AANLkTinx+zH=e+XJmceXo1DiR4mCSSx7rB=mmT5yApMX@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Fri, 18 Feb 2011 15:57:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 18, 2011 at 7:30 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 02/17/2011 02:45 PM, Bernhard Guillon wrote:
>>
>> On 14.02.2011 17:11, Tom Rini wrote:
>>>
>>> On 02/08/2011 11:37 PM, Bernhard Guillon wrote:
>>>>
>>>>
>>>> I have access to such a device and can test booting of console-image
>>>
>>> Fails to build with: http://pastebin.com/rjsmt0M9
>>>
>>
>> Hi,
>> I just build a console-image and it booted fine on my atngw100.
>
> Hmm. =C2=A0How do you force it to linux-uclibc? =C2=A0I had assumed I jus=
t needed to
> say MACHINE=3Datngw100 DISTRO=3Dansgtrom-2010.x and it would work, but I =
get a
> linux not linux-uclibc build and binutils can't configure.

in angstrom you would need ANGSTROMLIBC=3D"uclibc" also to be defined along
since default is eglibc

>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


