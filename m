Received: from [209.85.217.20] (helo=mail-gx0-f20.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1Knh6g-0007bT-1M
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Oct 2008 00:02:10 +0200
Received: by gxk13 with SMTP id 13so8760498gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Oct 2008 14:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=EWkbkIhqYhGCfUU1PYey1U7HyHazgcdREKighGB9ZFc=;
	b=mJ7h37aNVK6k/zvKORxcBsAemeKPXC0ftilncJiH3K7IKa56N2269Rwrqsth9yQXMW
	OFFqxTTUAJVTBKux5pYypJTFrlzsRvXV2kUqJ327ZdZL5XP9Cslr2rg00Z9xvG3guLie
	6Ir1hskpU6nMdKTBBEVR6NeKflI9UNe/oyJNw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=VlJOSVGli3iiSCDRJEq3+DW5fM5swzVutnCaPV68Dytrce+aN11MQfgUrqn0GDQAyi
	FqYswRF3pT2tHoV+88JJXjxgK+U+2jl0nZyPqW/klvsKX4b2zHNnj7bWoiGhBxxy+s1L
	l53NLbhYh8kn/ZV8gRhoW0+c3yGk0S5PLsHTQ=
Received: by 10.150.154.6 with SMTP id b6mr7142501ybe.226.1223503048248;
	Wed, 08 Oct 2008 14:57:28 -0700 (PDT)
Received: by 10.150.212.20 with HTTP; Wed, 8 Oct 2008 14:57:28 -0700 (PDT)
Message-ID: <48239d390810081457o5d5a088cuda8c927871e30153@mail.gmail.com>
Date: Thu, 9 Oct 2008 01:57:28 +0400
From: "Sergey Lapin" <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1223501660.4426.376.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
References: <48239d390810080715l700d1ce4i46c1e1cc97279b3@mail.gmail.com>
	<1223501660.4426.376.camel@lenovo.internal.reciva.com>
Subject: Re: Locale support.
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
X-List-Received-Date: Wed, 08 Oct 2008 22:02:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Oct 9, 2008 at 1:34 AM, Phil Blundell <pb@reciva.com> wrote:
> On Wed, 2008-10-08 at 18:15 +0400, Sergey Lapin wrote:
>> But I have problems with lots of UTF-8 characters on file system
>> and applications. 'date' command works properly reporting according to locale.
>> wget, however have problems, inventing names which contain junk.
>> However, using scp, I'm able to store normal UTF-8-named files
>> from my desktop Debian. ASCII characters in names are always OK.
>> both wget and ls are stand-alone in my configuration.
>
> Can you give some specific examples of what is going wrong for you?  Is
> it just wget that has this issue, or is it all applications?
I don't want to polute mailing list with garbled Russian strings.
I just need to mention that some characters get garbled (some replaced
with trash,
some with %xx, which is weird. This is with GNU wget. I don't use busybox one.
Other affected program is rtorrent (FTBFS at the moment, btw). LANG is
set properly in both cases.
date and bash work as expected. Most other apps work perfectly. I don't use
any GUI at the moment though.

S.


