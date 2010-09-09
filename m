Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OtlIW-0006FT-4U
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 19:52:36 +0200
Received: by wye20 with SMTP id 20so1718331wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 10:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XIYT3rtVkzgYRKZz/CoOTlfnwqOJ6Ptp+tkW1Wy4Y1g=;
	b=am1/iMUEul8kY8JypJ1tUK2VKHoDb/QtOr40ElwuTBBgjOR5ZrXj1FdWXjn8bkN9Fr
	HZykznRoXxeag77qLAXC9chqH5PqkyAgVe0hPetutIKu6bbIaoz6rGSQCGPmB/+KC73D
	3Lhih5D11L0VNGb8QuPjxlSvRUfqwmCMQawB0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=bd/hqMKVYMvZw6cp5u7z2U0BnvsfqpuqJt71/I+40yA7MCf+gq2lrDNtI7vGrkOSTt
	hp8qBMwleN10LB+muLzginsXe6g2wlRFrvt2Akxn6rmNbWTgAsQUYfGn6IvVrCT8wYOn
	GKP501tETh1gbg6b9IpNlFDWXyw5c71hD/Nuk=
MIME-Version: 1.0
Received: by 10.227.157.70 with SMTP id a6mr189363wbx.163.1284054709172; Thu,
	09 Sep 2010 10:51:49 -0700 (PDT)
Received: by 10.216.58.197 with HTTP; Thu, 9 Sep 2010 10:51:49 -0700 (PDT)
In-Reply-To: <4C891E0C.1050400@eukrea.com>
References: <AANLkTi=KDR=mtuVUiQE-5_-FL4oR+meQssfeUgz6bBLq@mail.gmail.com>
	<1284048433-20991-1-git-send-email-eric@eukrea.com>
	<AANLkTike7kmRPU9iw8wyC3v5=rLrr+DqiyskkoGC5H30@mail.gmail.com>
	<4C891E0C.1050400@eukrea.com>
Date: Thu, 9 Sep 2010 10:51:49 -0700
Message-ID: <AANLkTinXAi_vfWGN=eWhPjT5nrOT4up7nPeK2=BYWtqJ@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] generate-manifest-2.6.py: tune python-modules' RDEPENDS
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
X-List-Received-Date: Thu, 09 Sep 2010 17:52:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 9, 2010 at 10:49 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> Le 09/09/2010 19:34, J. L. a =E9crit :
>>
>> Dumb comment time: Wouldnt it be better to make maybe a few different
>> python module packages installs instead of thining out the
>> python-module? I know I personally use all the modules for python
>> available here plus some other modules as well. I know not everyone is
>> concerned with making their images as small as possible. Probably just
>> not getting the reasoning or point but just thought I would make the
>> statement there are those that use python-dev as is
>>
> this change doesn't prevent you from using python-dev, you will just have=
 to
> install it manually. This change only allow to install python-modules
> without installing all the dev files they actually pull.
>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Thanks Eric that makes total sense to me now, appreciate the response
and clarification.

JL


