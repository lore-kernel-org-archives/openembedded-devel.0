Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pl7mW-00068z-S1
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 23:36:05 +0100
Received: by iwn8 with SMTP id 8so1605718iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Feb 2011 14:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=7pD76fmLW51jWC2/YloSJFdREkjEy00m+PtJzXMS2Vs=;
	b=e8YYuWM5Y9kq1aUy6qc0Hhq4TiuC6iYT7THwmFNesGOZfkVnnux8MewnRbKRG3Npv8
	NG4yKEErguRiD6MQIIHjU/IoLJXUc93CxQufalKDkdNDuQmXzmtQDhgcKHqaPwu4wqmO
	dtwtAwGFErz/gjHY4CZpTNqoh7HHZxuUYAS1M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=H2+3Giu2cyUxidENcoOsdkp+sYE6uZvxn/XMpipUJGYTlqKrUiH2kU0B5Tvwz7rT27
	nHHRDnZ8JgZIiPeC/9u9j4t9yr8nx8Yo+j/MKYgBVA1LfWIyngO/xjwxbjm+VwW1o3kC
	nLyTEHZO7fx+3kGDSjxEC5I75FNZkWwY3nXvE=
Received: by 10.42.174.71 with SMTP id u7mr105344icz.62.1296772507033; Thu, 03
	Feb 2011 14:35:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.173.193 with HTTP; Thu, 3 Feb 2011 14:34:46 -0800 (PST)
In-Reply-To: <1296743109.15389.1.camel@phil-desktop>
References: <4D4929CB.6040009@dresearch.de> <4D49552D.3010705@dresearch.de>
	<4D4A6796.1070006@dresearch.de>
	<AANLkTinyw5W+jaZVba1LyAn5h1c-1kCDt9vXPBERhzk2@mail.gmail.com>
	<4D4A88FC.3090706@dresearch.de> <4D4A91D9.2040406@freyther.de>
	<4D4A96A0.4080402@dresearch.de> <4D4A9739.6040909@freyther.de>
	<4D4A9A94.6030108@dresearch.de> <1296735116.2258.44.camel@phil-desktop>
	<1296743109.15389.1.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Feb 2011 14:34:46 -0800
Message-ID: <AANLkTi=y85hSPW5fLz0B6dDOR_eQ1_h94edkKTiZz-bF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: profiling howto?
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
X-List-Received-Date: Thu, 03 Feb 2011 22:36:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 3, 2011 at 6:25 AM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2011-02-03 at 12:11 +0000, Phil Blundell wrote:
>> On Thu, 2011-02-03 at 13:07 +0100, Steffen Sledz wrote:
>> > conftest.c:(.text+0xc): undefined reference to `mcount'
>>
>> That looks like your C library was either built without profiling
>> support, or is using a different profiling ABI. =C2=A0(I think there was=
 a
>> change in this area for ARM EABI sometime around gcc 4.4, and glibc
>> might not have caught up with it.)
>
> Oh, I just noticed that it's glibc itself you're trying to build with
> profiling on. =C2=A0You need to not do that, or at least not by the mecha=
nism
> you're trying to use. =C2=A0If you really want to profile glibc itself th=
en
> there is an --enable-profile configure option which will do the right
> thing. =C2=A0Otherwise, you need to suppress the PROFILE_OPTIMIZATION whe=
n
> building glibc.

in addition make sure that _p versions of libc (libc_p.a) are staged
so you get libc function into profile data

>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


