Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PqcXC-0001T3-Cq
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Feb 2011 03:26:58 +0100
Received: by fxm17 with SMTP id 17so4182861fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 18:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=2+sS8UL8JvZXh9YVxR+f4iJYagdcdsJ5hsYvcqHVkvA=;
	b=axqNp7yIePYBzc3f5aWF1VLabpe2XdIEmoUGzow3SWKKmUT0b3Gl+ZG8lz/+aV+OKQ
	Zr09LbOjpcJuFqPnpubb3ANn1gA/fdU2D2R3yW5DJwS+YeQSiZ1P5hO0iDP5bkwrQ88z
	HxlohdX+d8XyVPPpG4VKdVLqZsxypp1qk+kXo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=c70SLFT3XZV/WGmyqGT9g2C7ArsUamyvSf/jtoCs2XY6ZyVLwJqYFwXGAJK4NhuzRJ
	25ZINBtzxzY3idKaH07XqftLVW9j4H7Rt6kmTT3x6f6XE92PKiJwYm5BKPcf/MTBcdhO
	FUuQFXKcDtNO2RjSCw28vI5jMMmXlJPO6i+E8=
Received: by 10.223.53.68 with SMTP id l4mr1875769fag.44.1298082343087; Fri,
	18 Feb 2011 18:25:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Fri, 18 Feb 2011 18:25:23 -0800 (PST)
In-Reply-To: <AANLkTikybh5rueE=YwrG-RoOYgWo9XXGA9BnDJp8Kf2h@mail.gmail.com>
References: <AANLkTi=bPrL+J+sA6wR+BEK9GuLxbMJRohVAPie-_u_i@mail.gmail.com>
	<4D5A8FF2.2010200@mentor.com>
	<AANLkTikybh5rueE=YwrG-RoOYgWo9XXGA9BnDJp8Kf2h@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Feb 2011 18:25:23 -0800
Message-ID: <AANLkTi=J9T7s1LfqJG9PiOPNY9=q1=8=uDbk8+G5WP2o@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: git head: build of rpm-native fails
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
X-List-Received-Date: Sat, 19 Feb 2011 02:26:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2011 at 11:38 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/2/15 Tom Rini <tom_rini@mentor.com>:
>> On 02/14/2011 11:48 PM, Frans Meulenbroeks wrote:
>>>
>>> Hi,
>>>
>>> Yesterday I tried whether I could cross compile a helloworld.rpm to
>>> try on a fedora-arm box, but I failed in building rpm-native.
>>> This issue was verified by Jay. His log:
>>> http://tinderbox.openembedded.net/public/logs/task/25555153.txt
>>>
>>> apparently this is the failing part is:
>>>
>>> file -C -m ./magic.mime
>>> ./magic.mime, 187: Warning: string extension `B' invalid
>>> ./magic.mime, 401: Warning: string extension `B' invalid
>>> ./magic.mime, 618: Warning: string extension `B' invalid
>>> ./magic.mime, 623: Warning: string extension `B' invalid
>>> ./magic.mime, 627: Warning: string extension `B' invalid
>>> ./magic.mime, 628: Warning: string extension `B' invalid
>>> ./magic.mime, 672: Warning: no need to escape `#'
>>> ./magic.mime, 674: Warning: no need to escape `#'
>>> file: could not find any magic files!
>>> make[4]: *** [magic.mime.mgc] =C3=90=C5=BE=C3=91=CB=86=C3=90=C2=B8=C3=
=90=C2=B1=C3=90=C2=BA=C3=90=C2=B0 1
>>> make[4]: *** =C3=90=C5=BE=C3=90=C2=B6=C3=90=C2=B8=C3=90=C2=B4=C3=90=C2=
=B0=C3=90=C2=BD=C3=90=C2=B8=C3=90=C2=B5 =C3=90=C2=B7=C3=90=C2=B0=C3=90=C2=
=B2=C3=90=C2=B5=C3=91=E2=82=AC=C3=91=CB=86=C3=90=C2=B5=C3=90=C2=BD=C3=90=C2=
=B8=C3=91 =C2=A0=C3=90=C2=B7=C3=90=C2=B0=C3=90=C2=B4=C3=90=C2=B0=C3=90=C2=
=BD=C3=90=C2=B8=C3=90=C2=B9..
>>>
>>> I tried the command in a devshell and there it also fails, but I have
>>> not really an idea what is wrong (and I don't know too much about RPM
>>> anyway)
>>> Suggestions? Fixes ?
>>
>> rpm depends on having a specific version of file around and there's prob=
ably
>> a mis-match.
>
> Guess so.
> Note that this is not host related as the file used is build by OE (file-=
native)
>
> Actually maybe we should move to a newer version of rpm. Ours is at
> 4.4.2.3, latest stable is 4.8.1
> and file on oe is 5.04, mainstream is 5.05, but I guess that will have
> less impact.

Good idea. Care to do the patches ?


