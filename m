Received: from mail-vb0-f52.google.com ([209.85.212.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TlmqJ-0007K5-9b
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 21:35:47 +0100
Received: by mail-vb0-f52.google.com with SMTP id ez10so4304102vbb.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 12:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=J5wii73k3X8cAs5J3fWbCjDWIE26c2XzCLryv7P1CoI=;
	b=mB53TUlPAw6Tk1LJAjmA2rNo2+bwbbnil7OeOg9jc02JHUGzzeBI8LR1WMgfRO69D+
	PDkmVYbzVjzs1+q18NdoLcgHgwDE8i690p64Ffi1z/5uNG9G0Ljrc0hLIV+ONeKjuVcU
	NbvYiLdPRZMv5GdwtP3WJ4VzrVpWByXxKBCmBDYRkb1jlZVFdBX6C9YgDEeMzGflMuwp
	JO3j4qsngsZyRS4eZCAJzF6CAoczYvcHyW/n22DiEpfuv3+w9D+wRsf1sjyPp7asBiVW
	ylAHOlxmB1LZPtiOPiy5SEPWONZqx8sCANYHgaHaYoaHeOveh5/yvS5sDeLLYrKRpMNy
	oErA==
MIME-Version: 1.0
Received: by 10.52.94.113 with SMTP id db17mr14541362vdb.27.1356034861848;
	Thu, 20 Dec 2012 12:21:01 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Thu, 20 Dec 2012 12:21:01 -0800 (PST)
In-Reply-To: <20121220130323.GH14543@jama.palm1.palmone.com>
References: <1355312146-24370-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRT1HUF5RcEwRcCrT_XRJzHE+qA5HgeJO-smuymz90JxzQ@mail.gmail.com>
	<20121218153311.GB3331@jama.palm1.palmone.com>
	<CALbNGRSpX154UsyMo1G29G1nJ2qwvfyavO20qto5eT22YPEYnA@mail.gmail.com>
	<20121220130323.GH14543@jama.palm1.palmone.com>
Date: Thu, 20 Dec 2012 21:21:01 +0100
Message-ID: <CALbNGRR6PUw1ExKaL4RiwOj66mo2nfsdXj4fUxRiqYgiudXAzg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome] gvfs-gdu-volume-monitor: avoid double packaging gvfs locale
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
X-List-Received-Date: Thu, 20 Dec 2012 20:35:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 20, 2012 at 2:03 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Dec 20, 2012 at 01:00:47PM +0100, Andreas M=C3=BCller wrote:
>> > Btw meta-guacamayo is using newer gvfs-1.12.3 and maybe they also
>> > resolved
>> > http://patchwork.openembedded.org/patch/16755/
>> This one was fixed in 211c2ba382d921519761bc0d241942f927cf692e
>
> OK, thanks, I've updated status on patchwork.
>
>> > Can you check if such upgrade would be usefull for meta-gnome too?
>> > I'm not using gnome..
>> Will do that hopefully before Xmas..
>
FYI: I updated to latest stable (1.14.2) and had some tests.
Unfortunately this causes xfce/thunar automount fail. So this is not
as easy as expected.

Will try 1.12.3...

Andreas


