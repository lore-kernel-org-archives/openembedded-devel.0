Received: from [74.125.44.153] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M29wl-0003M0-Vn
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 22:12:00 +0200
Received: by yx-out-1718.google.com with SMTP id 36so601381yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2009 13:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=fdh3zWgS/DXcW4QMaEKT2lNCHThzoHV+MN5yKJx9SPo=;
	b=uTVNr+J80QXo5BqR4Ec2+Xcyc3h6BbkNvc5JFErBAVRQzPDzPPFwg97zBpY86zStaa
	S2h8fRBv7yebgvfHbnQq14x2Pa1uEFMSjuTAXhqjRoKDlrjEY7Qvw6vPqYGBF9vGRxVW
	KVqsVnbXfwfzhcfzvUhLr1pQlNLSfNI62fJKo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=V7ueoMicd5ze70muQ9T+rhkc80nvN3wEUbMpxatJC6XRxSfmV4LqrvgihZSBBWDJxw
	It/5hSv8e+ZX4wLqqcvdeF+B6/7TUAw6ZAg2D8wXFeqN7f77NuXuqQA8kslSA7c8VKNC
	04K3GEPVY6lWyGxjTrpoqDwXALf2nfw6X9gTs=
MIME-Version: 1.0
Received: by 10.90.25.11 with SMTP id 11mr520502agy.60.1241726751956; Thu, 07 
	May 2009 13:05:51 -0700 (PDT)
In-Reply-To: <4A033D54.2000709@cbnco.com>
References: <4A03277B.1090402@cbnco.com>
	<1241720835-17998-1-git-send-email-msmith@cbnco.com>
	<1241720835-17998-2-git-send-email-msmith@cbnco.com>
	<c384c5ea0905071218v3978ea4cpe791a5283f05c2df@mail.gmail.com>
	<be7a9f3d0905071226m78b94d44u50a4e63c927200f5@mail.gmail.com>
	<4A033D54.2000709@cbnco.com>
Date: Thu, 7 May 2009 22:05:51 +0200
Message-ID: <c384c5ea0905071305s1b180deal8c5fd09b5d646308@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/3] grub: use ${libdir}, not /usr/lib
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
X-List-Received-Date: Thu, 07 May 2009 20:12:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello all,

On Thu, May 7, 2009 at 9:58 PM, Michael Smith <msmith@cbnco.com> wrote:
> Otavio Salvador wrote:
>>
>> On Thu, May 7, 2009 at 4:18 PM, Leon Woestenberg
>> <leon.woestenberg@gmail.com> wrote:
>>>
>>> Why do we install menu.cfg in ${libdir} anyway?
>>>
>>> All desktop distro's I have seen have the menu.lst in /boot/grub/ on the
>>> rootfs.
>>
>> I second this change; it makes easier for people to find it.
>
> All of the stage1/stage1_5/stage2 files are installed by grub into
> /usr/lib/grub/i386-oe/. I believe they're then copied to /boot during the
> grub install process.

I think we can agree that we do not install GRUB by and on the target itself.

Proposal: add a new package "grub-install" that contains
"grub-install" and the {libdir} stuff.

The usual embedded target would void this package.

> I think what the original 0.97 packager was going for
> was to avoid having duplicate copies of the files, so /boot/grub became a
> symlink to /usr/lib/grub/i386-oe, and then menu.lst needed to go there, too.
>
We can have both with the proposal. Thanks for the explanation, btw.

This might be desirable for more-PC like targets (think big iron Atom).

Regards.
-- 
Leon


