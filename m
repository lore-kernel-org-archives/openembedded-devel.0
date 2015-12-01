Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id AA0C9605B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 08:05:29 +0000 (UTC)
Received: by iofh3 with SMTP id h3so1082017iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2015 00:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Xi2N/7bbAjqnqQw4sg5Xcu08tzKBD6rhxP7I3kZbZp8=;
	b=Zf0GnJQPCtZpexsOodnPyttAE8bc/F5TYzakXYuR0Qy9NDcYIXPN8xndfWFL3bhZXk
	y6xNC3MIzqdKJeHE4bdwkIp3LJvrH/lSg1i14HuY1hdN+hqDH3ZhN+cwMxWR9jzy/tb3
	LgBb1UTmm/XYNYFklfVz/r5kv8V/WApT/DiDBgEm8/DYsKtU6TT7fcX8w1/7IYhuPzTw
	K9eZOdDTqjxNP0ikomCuYhw6Uw44iTX0kuADNtBwwD8oElBAbvQfXVSUWWirprgpfryt
	W++qemLupvpBL2RVpSZGVMFIStQ+IT6lzovumhrrbTt63CyEu3VviW2WTN34Q9sNDtL2
	cPLQ==
X-Received: by 10.107.162.137 with SMTP id l131mr57660025ioe.49.1448957129718; 
	Tue, 01 Dec 2015 00:05:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Tue, 1 Dec 2015 00:05:00 -0800 (PST)
In-Reply-To: <CADseiPmXNcnsCaYsEi_oW-ujY3Q6EWVE1iz5tm=WYt0wULt5NA@mail.gmail.com>
References: <1446673803-2310-1-git-send-email-max.oss.09@gmail.com>
	<1E07998C-81FF-476F-A066-63266FFDDC1B@gmail.com>
	<CAAzKXnh3cJ7cLT4a48NUs7L0B-dYAfav3ckvwMds8aT=3PN+Gw@mail.gmail.com>
	<CAEHkU3WR6yyGb80CGF9vFBVaYnzOJy8fih6zU5zf755pL7bvNg@mail.gmail.com>
	<20151106171738.GF2550@jama> <1446839474.2527.7.camel@Saturn.local.all>
	<CAP9ODKqR8SHDGvqUs4v82mTpPbFSSm_wd_mvE5H9QiCg23ScpA@mail.gmail.com>
	<CADseiPmXNcnsCaYsEi_oW-ujY3Q6EWVE1iz5tm=WYt0wULt5NA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Dec 2015 00:05:00 -0800
Message-ID: <CAMKF1soK_A0ymhcBKzoi8eP4rGpct5i4pAh5jhiLbBuA1TQyrA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium: fix gcc5 compile issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Dec 2015 08:05:29 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 30, 2015 at 11:17 PM, Ian Coolidge <ian@boundarydevices.com> wrote:
> I'm getting segfaults when I run google-chrome on my nitrogen6x after the
> new updates. Compiles great, just segfaults. Anyone else noticing similar
> problems? I'll be digging into it more, thought I'd reach out first though.

are you using gcc5 ?

>
> Thanks,
> -Ian
>
> On Fri, Nov 6, 2015 at 11:58 AM, Otavio Salvador <
> otavio.salvador@ossystems.com.br> wrote:
>
>> On Fri, Nov 6, 2015 at 5:51 PM, Max Krummenacher <max.oss.09@gmail.com>
>> wrote:
>> > Hi
>> > Am Freitag, den 06.11.2015, 18:17 +0100 schrieb Martin Jansa:
>> >
>> >> After long time first successful chromium build in bitbake world..
>> >> Thanks!
>> >>
>> >> Can you apply the same fix for cef3 recipes?
>> >> http://errors.yoctoproject.org/Errors/Details/21442/
>> >>
>> >> cef3 for qemux86-64 doesn't even configure:
>> >> http://errors.yoctoproject.org/Errors/Details/21501/
>> >>
>> > I'll try to fix this.
>> >
>> > It looks like this never worked for x86-64 because of a missing config
>> > file.
>> > One probably can reuse the i568 one.
>> >
>> > There seem to be additional errors to the one fixed with the packages.
>> > So
>> > maybe I won't be able to fix it.
>>
>> Send a complete patchset and we apply them all ;-)
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

