Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjUE9-0004Es-E4
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 13:18:53 +0100
Received: by mail-wg0-f45.google.com with SMTP id dq12so1337347wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 04:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=X4kL21TZib3O1jm2AYasIZm8dGZ2ZXeHxHKs1ujjDqw=;
	b=RO1fFD23Mvqx7zORnqa1Gwl/fOGRnYRSceZtUBQv+hM9Uy/wm8Lq+nGgBQ84ATfYXt
	+ZY/tL6k/1Ev2h1z24fKmBk1yn0NAk+M+bP+lyzC6XLh1fGwfGJDfrFHq/NHCnzgtghL
	P41zxXizg/vVQozakEosTWjBqxv0zvhSkB5W/z+IeD67BGv6P6setL5pApyuWdmbYBLp
	cICXf0HQwfnfeFvvYGcOohZFh0EBXyxupjB39ouHqRsSwRwcGHBT2XIEREwgbeKGvbK5
	peGX/20mEnGikIoDbQ1Pt3BIA7+NLl09igtcK+/UxbGqU9yXj1joCZmcq7SviILBjBto
	ry/g==
MIME-Version: 1.0
Received: by 10.180.81.39 with SMTP id w7mr2173786wix.15.1355486656446; Fri,
	14 Dec 2012 04:04:16 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Fri, 14 Dec 2012 04:04:16 -0800 (PST)
In-Reply-To: <CAP9ODKqOCGj+xGjXaKcU3tG-W1umUpn4dnAuih=6DEWARHGegQ@mail.gmail.com>
References: <1355482437-30298-1-git-send-email-johan.hovold@lundinova.se>
	<CA+chaQd45pxo_RPGWpaU-_XDZRbm7NLO=rYzfDwQvqboyVWNHg@mail.gmail.com>
	<CAP9ODKqOCGj+xGjXaKcU3tG-W1umUpn4dnAuih=6DEWARHGegQ@mail.gmail.com>
Date: Fri, 14 Dec 2012 13:04:16 +0100
Message-ID: <CA+chaQdAkFUa_7wm2hLCRevcLHJG5cEFdGv52euZUx3D6+U1dw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] udev-173: fix file checksums
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
X-List-Received-Date: Fri, 14 Dec 2012 12:18:55 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 14, 2012 at 12:36 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Fri, Dec 14, 2012 at 9:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Fri, Dec 14, 2012 at 11:53 AM, Johan Hovold
>> <johan.hovold@lundinova.se> wrote:
>>> Commit 7895ab08270d9 ("udev-173: Fix SRC_URI to fetch bz2 archive")
>>> changed to source file to bz2-compressed tarball but did not update the
>>> checksums.
>>>
>>> Signed-off-by: Johan Hovold <johan.hovold@lundinova.se>
>>
>> This change looks correct, but why are you using this older udev version?
>>
>> see http://patchwork.openembedded.org/patch/39873/
>
> Martin,
>
> Please send a v2 without a RFC so I can ack it; I will post them the
> changes for danny branch (which I have in my tree) to backport 182
> from oe-core to danny (so we don't have a downgrade if someone is
> using udev from meta-oe there).

I'll send it together in pull-request with in-test patches from patchwork.


