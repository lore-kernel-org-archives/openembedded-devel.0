Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P30QG-0001Xk-2g
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 07:50:45 +0200
Received: by gxk10 with SMTP id 10so1982818gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 22:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=l14Y++C/aFvQUd4/n7oO+q0RbtXMWmmO2YnLWKDdOUQ=;
	b=ksTPhzJXvNa+fXE4x1kp3sT+dj/fuHtFQTr7XUT07AngK6EKJOPJ71qSWKeJXRzXZd
	en1fiRz9ejh3hRKsIM4rZoC1C1zQ3tXtZxWmkcHUg22VcQrpnbwo2bSgle+j81voDKjN
	MEjfbzIZEZ7UUEvCukzlD5PTkcXpiEvHrQ24U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=xYCO/j7Wo+Cx8DuPyOzhjPuuLcAKD0n3I9VsH99sUvHTdRulGg5U5owDZLpLqcJ74r
	Eop4TUKeS8jdW83k5l94+1ftqBeQm7Cxixhn1e6vY2QK5kfEgdUo9yQ/A+5SGekHWPXf
	c/9x3U3LvxUi9WwL1xKiTTra5OCCi5vOV13Ok=
MIME-Version: 1.0
Received: by 10.90.53.14 with SMTP id b14mr5294612aga.122.1286257823548; Mon,
	04 Oct 2010 22:50:23 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Mon, 4 Oct 2010 22:50:23 -0700 (PDT)
Date: Mon, 4 Oct 2010 22:50:23 -0700
Message-ID: <AANLkTi=SdE6+k+79o2dMQcSUzSPuKDXq0bxbOYvvRST2@mail.gmail.com>
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
Subject: Re: libgcc-dev.ipk gcc 4.3.3
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
X-List-Received-Date: Tue, 05 Oct 2010 05:50:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2010 at 1:07 PM, J. L. <vwyodapink@gmail.com> wrote:
> On Wed, Sep 29, 2010 at 1:09 PM, J. L. <vwyodapink@gmail.com> wrote:
>> I originally posted this on the gumstix mailing list and was told I
>> should ask here. I was wondering how come there is no libgcc-dev.ipk
>> that gets created though its in the work directory? I was trying to
>> compile a program on my machine and was giving me complaints about
>> libgcc-dev missing. Is this suppose to happen or? Thanks for any info
>> or help on this.
>>
>> JL
>
> Is there an easy way to gcc to build the libgcc-dev package? I am
> honestly clueless as to how to even attempt to getting that to be
> added into the builds.
>
>
>>
>>
>> ---------- Forwarded message ----------
>> From: Steve Sakoman <sakoman@gmail.com>
>> Date: Wed, Sep 29, 2010 at 12:59 PM
>> Subject: Re: [Gumstix-users] question about libgcc-dev
>> To: "General mailing list for gumstix users."
>> <gumstix-users@lists.sourceforge.net>
>>
>>
>> On Wed, Sep 29, 2010 at 12:07 PM, J. L. <vwyodapink@gmail.com> wrote:
>>> On Wed, Sep 29, 2010 at 6:54 AM, Steve Sakoman <sakoman@gmail.com> wrot=
e:
>>>> On Wed, Sep 29, 2010 at 2:20 AM, J. L. <vwyodapink@gmail.com> wrote:
>>>>> I was trying to install libpcap-dev and libpcre-dev and when I did
>>>>> they both said that libgcc-dev was an unmet dependency. I have tried
>>>>> searching and can not seem to figure out what provides that? I am sur=
e
>>>>> this is a really basic one that I am missing. Thanks if you can let m=
e
>>>>> know what to build to get that.
>>>>
>>>> The gcc recipe provides libgcc-dev
>>>
>>> I checked in the tmp and it only builds a libgcc1_4.3.3 which I
>>> already had on the system when it gave that error. I also dont see
>>> anything saying its a dev for anything in the gcc tmp build. Am I
>>> still missing something obvious here?
>>
>> I found it by searching through the tmp directory:
>>
>> $ ls -l tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/packages-=
split/
>> | grep libgcc-dev
>>
>> drwxrwxr-x 2 sakoman sakoman 4096 2010-09-17 20:22 libgcc-dev
>>
>> But you are correct, the recipe doesn't seem to put an ipk in the
>> deploy directory. =A0Not sure why!
>>
>> Might be better to ask this question to the experts on the OE mailing li=
st.
>>
>> Steve
>>
>> ------------------------------------------------------------------------=
------
>> Start uncovering the many advantages of virtual appliances
>> and start using them to simplify application deployment and
>> accelerate your shift to cloud computing.
>> http://p.sf.net/sfu/novell-sfdev2dev
>> _______________________________________________
>> gumstix-users mailing list
>> gumstix-users@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/gumstix-users
>>
>

I have also noticed 4.5 does not produce the libgcc-dev.ipk ?


