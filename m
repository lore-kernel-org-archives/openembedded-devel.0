Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P12ym-0000Qf-Ro
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:10:17 +0200
Received: by eyb7 with SMTP id 7so467131eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 13:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=73MhFbQyYcv6jD9WsJgP/I5dRZeMwowXUJG5L8rfxbQ=;
	b=fPUPf+0W/GgXDflCkPcowcznseXYE5w17hMjPufZ2+n/pERTbIiqZOSkjxwrgDrH9S
	E9/L6YW4DS1UAunOQUz5RVCABdIIO6TZuhEwbhjqXP2MtQYv4jvFi71JYzBDIv2xP5QK
	QrDbsHesDO8a0BqAbkH0ZTe7r0sovE5B1+oU8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=ai9w8wavuPFdTIaXGhmfkXz/BgU7Ca/3qJekGPkB961swdg+RE2IWVwb7jwEPQuQNw
	FMSZoGo/f1T9MZyNEI9nk7jTpw5m6QOIkdnnLURgW3wzrE8L1FcOZnZbxmmmVDA9PaIS
	vDlOVUclg2IGxxwKzUOaaoqI3XEJryQ4KE0vc=
MIME-Version: 1.0
Received: by 10.103.172.15 with SMTP id z15mr1255707muo.42.1285790999233; Wed,
	29 Sep 2010 13:09:59 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Wed, 29 Sep 2010 13:09:58 -0700 (PDT)
Date: Wed, 29 Sep 2010 13:09:58 -0700
Message-ID: <AANLkTikORoazgt01ok+x+1fmv_9U5Ui7okbbUOBb-6Ft@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: libgcc-dev.ipk not created Fwd: [Gumstix-users] question about libgcc-dev
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
X-List-Received-Date: Wed, 29 Sep 2010 20:10:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I originally posted this on the gumstix mailing list and was told I
should ask here. I was wondering how come there is no libgcc-dev.ipk
that gets created though its in the work directory? I was trying to
compile a program on my machine and was giving me complaints about
libgcc-dev missing. Is this suppose to happen or? Thanks for any info
or help on this.

JL


---------- Forwarded message ----------
From: Steve Sakoman <sakoman@gmail.com>
Date: Wed, Sep 29, 2010 at 12:59 PM
Subject: Re: [Gumstix-users] question about libgcc-dev
To: "General mailing list for gumstix users."
<gumstix-users@lists.sourceforge.net>


On Wed, Sep 29, 2010 at 12:07 PM, J. L. <vwyodapink@gmail.com> wrote:
> On Wed, Sep 29, 2010 at 6:54 AM, Steve Sakoman <sakoman@gmail.com> wrote:
>> On Wed, Sep 29, 2010 at 2:20 AM, J. L. <vwyodapink@gmail.com> wrote:
>>> I was trying to install libpcap-dev and libpcre-dev and when I did
>>> they both said that libgcc-dev was an unmet dependency. I have tried
>>> searching and can not seem to figure out what provides that? I am sure
>>> this is a really basic one that I am missing. Thanks if you can let me
>>> know what to build to get that.
>>
>> The gcc recipe provides libgcc-dev
>
> I checked in the tmp and it only builds a libgcc1_4.3.3 which I
> already had on the system when it gave that error. I also dont see
> anything saying its a dev for anything in the gcc tmp build. Am I
> still missing something obvious here?

I found it by searching through the tmp directory:

$ ls -l tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/packages-spl=
it/
| grep libgcc-dev

drwxrwxr-x 2 sakoman sakoman 4096 2010-09-17 20:22 libgcc-dev

But you are correct, the recipe doesn't seem to put an ipk in the
deploy directory. =A0Not sure why!

Might be better to ask this question to the experts on the OE mailing list.

Steve

---------------------------------------------------------------------------=
---
Start uncovering the many advantages of virtual appliances
and start using them to simplify application deployment and
accelerate your shift to cloud computing.
http://p.sf.net/sfu/novell-sfdev2dev
_______________________________________________
gumstix-users mailing list
gumstix-users@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/gumstix-users


