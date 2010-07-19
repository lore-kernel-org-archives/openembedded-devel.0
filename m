Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Oawc1-0005lM-N1
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 22:06:55 +0200
Received: by gxk3 with SMTP id 3so2092025gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 13:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KWudW8c93Kf3IT6KoW3cgMlQ0SL6OG3caVb4Be/tL/U=;
	b=VYWTnFyarnePiu9lxrt3hjTR0tLyjGeNOkdd12xHC7dzcVz0kGMA5ZLncCvg4mNatS
	niPLyKg/0uOA1mn3TGGMWg7cjhWM7I+k3o9m+q1a0ENoT+6rg3gRzrefS+YlNkmownZ1
	dpkBe/4sCZyifwlZ/EK+x9RcLYP5pl+FVpS+4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CqxXKSZzF+HSQAza7xfHy12eKXV68ecbwVx5FDAEDg+s47+0z5W4gvwejVvMlOiFIb
	LwFOgY+eNOQXdqZEJJlYEECkw4xfuyN3e0RUanWehVMo9TX7pYIOehxnv7vTj56kDTwz
	h3cOZj2cApFgeVl1MOSvpBMv5Ev0xJJH+pA8g=
MIME-Version: 1.0
Received: by 10.100.23.2 with SMTP id 2mr5302698anw.119.1279569999348; Mon, 19 
	Jul 2010 13:06:39 -0700 (PDT)
Received: by 10.100.42.4 with HTTP; Mon, 19 Jul 2010 13:06:39 -0700 (PDT)
In-Reply-To: <AANLkTilEVlCDZYYMFrjKI0xL2Yq-uOL1YED9CR5I2e5s@mail.gmail.com>
References: <AANLkTimwFjLODTbT6WEEhthhjwYMiMQ4nt5RtXniNgZb@mail.gmail.com>
	<4C417DA8.8050101@freyther.de>
	<AANLkTilEVlCDZYYMFrjKI0xL2Yq-uOL1YED9CR5I2e5s@mail.gmail.com>
Date: Mon, 19 Jul 2010 13:06:39 -0700
Message-ID: <AANLkTikBF8GEgVO58Sj81J5lcolOEQKHVFfjXd9GMDyN@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: spca5xx does not build
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
X-List-Received-Date: Mon, 19 Jul 2010 20:06:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Can anyone else help me out with this for building? I am at a loss as
to whats up with this.

Thanks



On Sat, Jul 17, 2010 at 1:51 PM, J. L. <vwyodapink@gmail.com> wrote:
> I just tried adding EXTRA_CFLAGS in the bb file and still errors in
> the same way. I also cleaned it to make sure before building.
>
> Also there is an error stating an implasibly old time stamp from 1964?
>
>
>
> On Sat, Jul 17, 2010 at 2:53 AM, Holger Freyther <holger+oe@freyther.de> =
wrote:
>>
>>> | make[1]: Entering directory
>>> `/home/vdubhack/overo-oe/tmp/sysroots/overo-angstrom-linux-gnueabi/kern=
el'
>>> | scripts/Makefile.build:49: *** CFLAGS was changed in
>>> "/home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/spca5xx-=
20060501-r81/spca5xx-20060501/Makefile".
>>> Fix it to use EXTRA_CFLAGS. =A0Stop.
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>


