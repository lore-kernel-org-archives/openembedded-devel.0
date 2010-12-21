Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1PUvTc-0002OB-SK
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 07:13:36 +0100
Received: by wwi17 with SMTP id 17so3616600wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 22:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=AF8audN4uZOkiA3ouwKCy5PQe3tvZmssJ9v/LRRf3E4=;
	b=Ehz+084pOwl+YZ/dT3nS8BTzB9da3VpxVQ7SYaGnN0m/umobLQUrzdVCFFyvm+kgRl
	HzR6ntarDQe5DcC5sagqEIctDj9PJAH0yAizHdBY1LUKDytaOADRz4rHKKy91O0egCni
	5qHgWay7QGsMcgmWWu48Wa6jWY7fpeypLVokA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GwXDm52mfbMHy/dS+elBoLxTQ66pcdBRPWH2lfBZy0K3Xp6oAbFRS2hgJlMbkJIQ7s
	YclH6sIKa5IS+pgZ9avGs4uPk5ZXnJRFpL0BZkulgxtgnr+El5cWRefjTNFdEr+n6uEy
	L217QFMEArMzUcCjd4SIqN3DiiUlywKVG3uHY=
MIME-Version: 1.0
Received: by 10.227.196.78 with SMTP id ef14mr3150389wbb.165.1292912009502;
	Mon, 20 Dec 2010 22:13:29 -0800 (PST)
Received: by 10.227.155.208 with HTTP; Mon, 20 Dec 2010 22:13:29 -0800 (PST)
In-Reply-To: <AANLkTikKHwj7Y6xibT-M+gchRq_rHP=2OTkri4Py-iup@mail.gmail.com>
References: <4D103319.4080002@gmail.com>
	<AANLkTin=QemQV=Lbc5QC_9i22Bi5G88cJTJ8KxUUmD+D@mail.gmail.com>
	<AANLkTikKHwj7Y6xibT-M+gchRq_rHP=2OTkri4Py-iup@mail.gmail.com>
Date: Tue, 21 Dec 2010 16:43:29 +1030
Message-ID: <AANLkTimGVrOCZu7rsrm6sbgZDBwATPRLdNowPuOpg0TF@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] acl_2.2.49.bb: Fix build when DISTRO_FEATURES lacks largefile.
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
X-List-Received-Date: Tue, 21 Dec 2010 06:13:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 21 December 2010 16:34, Graham Gower <graham.gower@gmail.com> wrote:
> On 21 December 2010 16:21, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Dec 20, 2010 at 8:54 PM, Graham Gower <graham.gower@gmail.com> wrote:
>>>
>>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>>
>> Does it function correctly at runtime ?
>
> Can't test yet. I have problems with proxy-libintl conflicting with
> libintl8 during do_rootfs...
>

For what its worth, glibc dirent.h has

#ifndef __USE_FILE_OFFSET64
extern struct dirent *readdir (DIR *__dirp) __nonnull ((1));
#else
# ifdef __REDIRECT
extern struct dirent *__REDIRECT (readdir, (DIR *__dirp), readdir64)
     __nonnull ((1));
# else
#  define readdir readdir64
# endif
#endif


