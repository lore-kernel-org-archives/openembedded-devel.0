Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SKnWE-0002f4-QH
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2012 11:19:14 +0200
Received: by wera1 with SMTP id a1so5330076wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2012 02:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=B6WH8VVQckYe4lQm/M0YTEGWR9nlzNP8d7CIVbpyLg4=;
	b=f41TtG9skkJz8R2j9x1kqIFW+oebDyTJdtlfhipUmgHsktOcjPNMonZN9ppkM5YrY0
	+r83ydNlqtC1aOYrCzkh8n3/bfux8YP52BrCH8we0ZEBP3LFKr5fmHTewKYNnu9maXyI
	cOCynZqGBNqPZd6qyqg7oV/J4yRzs6LcqgjXTsYw4yfurdsOZ4yMa3vcASO9q8YU366x
	69YC4lZaNJCMe5OwSlCXbbCUUyJZ0yAI1njOwL9bwaHzUtB0oQPp3pmvtSUOlcRIc+GV
	HZeV+ZHtKhI3fAkE+9F58vfIOvXOoi2CurDY7CX2BhKqESLfYDFBlOa+OtV/dewMePnV
	EuTQ==
MIME-Version: 1.0
Received: by 10.216.134.24 with SMTP id r24mr796654wei.84.1334826586608; Thu,
	19 Apr 2012 02:09:46 -0700 (PDT)
Received: by 10.223.14.149 with HTTP; Thu, 19 Apr 2012 02:09:46 -0700 (PDT)
In-Reply-To: <jmmst9$r5o$1@dough.gmane.org>
References: <CAGiJk9c8ThXrLqsrgYQb03hShObTJynt+fxsRxG9VzYOkOsyUg@mail.gmail.com>
	<jmmst9$r5o$1@dough.gmane.org>
Date: Thu, 19 Apr 2012 11:09:46 +0200
Message-ID: <CAGiJk9e4vZoO1d1cCbh8Lq26m6h3M5rrOOe40CS1ov2VHqh9eQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-kde] Test images (was: Re: [OE-core] RFC: Porting KDE Plasma Active (WIP))
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
X-List-Received-Date: Thu, 19 Apr 2012 09:19:14 -0000
Content-Type: text/plain; charset=UTF-8

>> Feel free to comment on the images.
>
> Giving them a spin now :)

Thanks.

Just to let you know: Yesterday I accidentally added "inherit allarch"
to kde-wallpapers,
this will produce an error, I want to push my patch for this but
Gitorious seems to be down.

Removing allarch from kde-wallpapers will do the trick.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iQIcBAEBAgAGBQJPjvbrAAoJEHZqAkdh1vT6H+EP/3+am7AdZK5y1smlgtApcMm+
> Gh7ruIoJwedSICKp6rqRyM1lUssIrC/7QKri+5Ae0Cjw7h5aglEPIYXCoB39NRqw
> o2aOUyTjVDxk4nbv+z/3WFxwHHx0053GYztJUWPBNVL77HPn+8rq5ALaMydCCheR
> jjdS/+/2tuD+DxAeFOsFMj3zoh9CrKR605+AkxjTAtMNRZl7QjCdP9J1wjrXrDQ0
> ZnSnTEIH8ycZPjCL3b5LvGxfjRdah1y9uCjlaRu9rjMXY/UHA3Nzr84TjvCW3iiN
> s3R21ggaSPKINZ3irigViXOeKPDhr3FThNhsLVkLY41JBe0xXqt9LCs1GxYIMGfC
> phP7wpsiFLLtePwcBPn5X3lL3JFBXVXqwgqo8Eb0W9u3tLypiV50C6+0L7XwZNVW
> ERNmxw0fdd1UN9wzRxpOcKofmxwO2ZW4BfkS8xbxfXLIXz4AktCHb7IDtXJCr5nT
> 7rrH2iMvbDyzNnVssYS3Yl2GGNlbG6jwwyd6/09kDo4OJdMWFs1soAw2QiEEWY5A
> jc7lW9o7Z3rlwtUiUIktLF2rkGv63IDuN9+xXNyKwBHoTqwjcGFG/8M7EPGc2hTQ
> HmNxTdEiLTdEjsvjzTqwFP5hjtFznMGmFl1BtDfEb3/aw4GSbcCbrkU/LylXqkGs
> Jcu04IswcM3pi2RcaaVX
> =tuC9
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



-- 
Regards
Samuel


