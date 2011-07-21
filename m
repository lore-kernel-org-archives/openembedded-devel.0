Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lynn.xin.lin@gmail.com>) id 1QjrSo-0006jP-JR
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 13:30:54 +0200
Received: by vxh2 with SMTP id 2so891058vxh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 04:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ARHeyJkerrWWHLzZlANiMywaj8rJRdPdVPircO2CMDM=;
	b=aRjYDLttT4+8T7OgCvVJDs/Qa4Y8vYp9D4A940BXmm3YalVpZCEm4HnHeLw8U3ab2W
	R3xMi4iJywS4OOGZ8IlUM/oSoZpYxCkKIERvm2WyaeVhlp0kN+GRlRTWFptPESd7YMX6
	mtAd0RbR6Pwf1hVWdjMKPjFbxTgvMrH6Vjve8=
MIME-Version: 1.0
Received: by 10.52.22.177 with SMTP id e17mr113482vdf.215.1311247595669; Thu,
	21 Jul 2011 04:26:35 -0700 (PDT)
Received: by 10.52.166.200 with HTTP; Thu, 21 Jul 2011 04:26:35 -0700 (PDT)
Received: by 10.52.166.200 with HTTP; Thu, 21 Jul 2011 04:26:35 -0700 (PDT)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C06CA7F@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C06CA55@post.tritech.se>
	<ED3E0BCACD909541BA94A34C4A164D4C06CA7F@post.tritech.se>
Date: Thu, 21 Jul 2011 19:26:35 +0800
Message-ID: <CAPgpnMT50=cABZYTDeCbD7MuPBqaXGfZnZE9B2MQQdZdWw9C9w@mail.gmail.com>
From: Lynn Lin <lynn.xin.lin@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Added header file to linux kernel - how to export
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
X-List-Received-Date: Thu, 21 Jul 2011 11:30:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E5=9C=A8 2011-7-19 =E4=B8=8B=E5=8D=889:58=EF=BC=8C"Mats K=C3=A4rrman" <Mat=
s.Karrman@tritech.se>=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> I have made a patch to the linux kernel, involving adding some ioctl's.
Relevant definitions are in a .h file. Now I need to access this .h file
from another recipe (that builds a utility using those ioctl's) but the
headers in sysroots/xxx-linux/usr/include are put there (by
linux-libc-headers?) long before the target Linux kernel is patched and
built.
>
> I'm thinking about adding a do_install_append to the linux recipe but tha=
t
doesn't feel right. Neither does adding a path from the util recipe build t=
o
the work folder of linux kernel. Third alternative would be to build the
driver as an LKM but I really like to have it built into the kernel...
>
> If any of you have some good advice here I would be very happy!
>
> Best Regards,
> Mats
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

