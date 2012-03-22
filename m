Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SAf9Q-0008Vi-3I
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 11:21:48 +0100
Received: by wibhj13 with SMTP id hj13so465202wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 03:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=CqsoRoTzI/+4/j+aX5+fMWzEkYPUTWD7wFIUa5scJVU=;
	b=QLu6sqnaZEK7VKuI4+dLgHPcSJI4UP3ArPfPms439e4kBQqkL+l5sb3GU9aBUqEwb6
	OFA2J+ohllIvRbDwWj74Cw4xGWewgMVMKowWM8R+FzIIgxdCkemhTPd5ZZhocHiTLBn8
	RSDay+SMC2auAUUaOzPuUqgbvClY20z/dvgt/sI5HwDo6G2CC6lbYa8+5Z9chq9S7Zzo
	bCIg6655Y4k9cydb9F/JGe0ZFlhTpkp1WabCIIopcGyN9MzeS32mT49Vh5hqJ36cC0zk
	mR9CHAdJE98EPLcsSpCJRdVraLmc51sSopo5xgFjxMN88ED4FQJl4ql87rJ4rHYef7Ae
	njfw==
MIME-Version: 1.0
Received: by 10.180.100.2 with SMTP id eu2mr3788993wib.1.1332411173535; Thu,
	22 Mar 2012 03:12:53 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Thu, 22 Mar 2012 03:12:53 -0700 (PDT)
In-Reply-To: <20120322104009.6a4ed04e@eb-e6520>
References: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
	<jkdg34$om0$1@dough.gmane.org>
	<CAGiJk9cG0mySg454zxYS8VJLc9etr2jAAxxtBSMbN9boq0EnRg@mail.gmail.com>
	<20120322092859.GE4010@jama.jama.net>
	<CAGiJk9ex0qxUQrxyCSjH33dpH_sg40MmLj+Gq5SSgW2AkyoL_w@mail.gmail.com>
	<20120322104009.6a4ed04e@eb-e6520>
Date: Thu, 22 Mar 2012 11:12:53 +0100
Message-ID: <CAGiJk9cUPhrLHQicRsDfa-e_vn=0OdmE=BuyXxvi7cJX1XUfrw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] [meta-oe] giflib: Move to OE-Core
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
X-List-Received-Date: Thu, 22 Mar 2012 10:21:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/3/22 Eric B=C3=A9nard <eric@eukrea.com>:
> Le Thu, 22 Mar 2012 10:35:31 +0100,
> Samuel Stirtzel <s.stirtzel@googlemail.com> a =C3=A9crit :
>> 2012/3/22 Martin Jansa <martin.jansa@gmail.com>:
>> > why not add meta-oe dependency to meta-kde/README?
>>
>> It is already listed as dependency [1].
>> But somehow it seems like that there are users, interested in testing
>> this layer, with an use case which excludes the meta-oe layer.
>>
>>
> can you describe this use case so that meta-oe gets a chance to adapt.

Since I have the common use case of the installation provided from the
setup-scripts and I don't know the exact use case,
I cannot provide this information myself right now.


This "only" involves me as I was requested to add a copy of the giflib
recipe to meta-kde,
to support the testing of meta-kde with a non meta-oe use case.

Since I don't think that recipe redundancy will be of any use, I
suggested to move giflib to oe-core.

>
> One problem I can see with meta-oe is the fact that it makes changes to
> the oe-core toolchain : that would be great to put all the toolchain
> changes in a meta-toolchain (but I think that's what is scheduled with
> meta-linaro).
>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--=20
Regards
Samuel


