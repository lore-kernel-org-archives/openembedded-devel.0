Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1Ksb8j-00043F-H4
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Oct 2008 12:40:33 +0200
Received: by an-out-0708.google.com with SMTP id b38so160530ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2008 03:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=vxMkf12MlFZmlWxNcgin2JCukeQyo5nYkHZQMdNe3VU=;
	b=h+WxSP82J8/5B5nRfdDT70OFRiOe+2Ik2YVmpiDXqYDfDBembH2+iCyM73/1OFVB+8
	A75LlUBrGSi4Ix17GTbOgRbGrlHM2KAUFTRxurBibaSPVcT5xoX8jil9+UxIZvoNiOEW
	isbQxYpsfYVY/UX0EVC/xWsj29RhtbNdtqjV0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=OS4ecb51H3ufJoyJyTjb7uaRroa8+MdngRba3xeZhsEzg0My7npdFSGGGB106TBZEb
	fElFSdIlKQpqKzs9UUKQAbWqXwKSdNjD9ZvCR/5WSFysoboP1rXrY3HaE4mbvp7Cbb2E
	NMeb50dH82B6qjJya7TtUjGSqQjWlh5BVo8TM=
Received: by 10.100.119.17 with SMTP id r17mr4529407anc.130.1224672007339;
	Wed, 22 Oct 2008 03:40:07 -0700 (PDT)
Received: by 10.100.139.7 with HTTP; Wed, 22 Oct 2008 03:40:07 -0700 (PDT)
Message-ID: <5c5e5c350810220340k4b41b491n66c78559f1055bfd@mail.gmail.com>
Date: Wed, 22 Oct 2008 12:40:07 +0200
From: "Elena of Valhalla" <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081022083006.GA23378@mi.fu-berlin.de>
MIME-Version: 1.0
References: <5c5e5c350810140623t33258c83i6f945b8212b44eb6@mail.gmail.com>
	<5c5e5c350810220026o1adcbd70vad18af00ada90793@mail.gmail.com>
	<20081022083006.GA23378@mi.fu-berlin.de>
Subject: Re: ctorrent recipes, a mistake of mine in the bugtracker and problems with autotools versions
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
X-List-Received-Date: Wed, 22 Oct 2008 10:40:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Oct 22, 2008 at 10:30 AM, Henning Heinold
<heinold@inf.fu-berlin.de> wrote:
> [...]
>> ctorrent dies in the do_configure task with the error:
>>
>> aclocal.m4:14: error: this file was generated for autoconf dnh3.3.1.
>> You have another version of autoconf.  If you want to use that,
>> you should regenerate the build system entirely.
>>[...]
> normaly aclocal.m4 is overwritten by autoreconf. I do not know why it
> yields here. So I would test to remove aclocal.m4 and try the build
> again.

I've tried to remove aclocal.m4 as suggested, but it does not help

it seems that autoreconf does overwrite aclocal.m4, and the resulting
file is not accepted in the next step

in the generated aclocal.m4 the following lines look suspicious:

m4_if(m4_PACKAGE_VERSION, [dnh3.3.1],,
[m4_fatal([this file was generated for autoconf dnh3.3.1.
You have another version of autoconf.  If you want to use that,
you should regenerate the build system entirely.], [63])])

could this help finding the problem? dnh3.3.1 is the version of the
ctorrent package

thanks

-- 
Elena ``of Valhalla''

email: elena.valhalla@gmail.com


