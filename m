Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OgTH6-00075G-75
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 04:00:09 +0200
Received: by wyb38 with SMTP id 38so5244504wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 19:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=KmQBaBtE8Z/8SJ4xGCnkj5kQj09Y+2DvBrAR94dm6P8=;
	b=m+gBuq5izp9FsvUDzhVCwRQty1MMaMEFGL7U2b5oTAu1JRqR4ncd8aSqoSEcPA0d7f
	pifY5tMBfY4iTFAzXURf2Jrt+9/rBn0AgEZeUrNd19XJzU77gXoWW/YwoCj/zbSP1x5A
	FEPTlSqdT5zNALjo7qD6PSBJuLuRLgM4/O840=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=oNXk3JAZjhw3YjK6xHSDZU1mXpA8Ju3EZqChGCfRcp8sPAvGAA0nzKcpfd0gN9qKft
	rEt1NkvPaLk2h2QaI9M5I/qmVPX6VeIEEna6VMFEv+h7q/tg9YNVx+y4q/dGoL/GYq/0
	2Wmlvl4Wt4lfkEVU+p04Hg+G/qcNrTpiQ3mgM=
Received: by 10.216.30.21 with SMTP id j21mr1445191wea.37.1280887204419; Tue, 
	03 Aug 2010 19:00:04 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.16.204 with HTTP; Tue, 3 Aug 2010 18:59:44 -0700 (PDT)
In-Reply-To: <AANLkTinsG=odoSS3mTj-_cH9zvbb+JZdVOQyJvJ4M05z@mail.gmail.com>
References: <1280886048-6272-1-git-send-email-clarson@kergoth.com> 
	<AANLkTinsG=odoSS3mTj-_cH9zvbb+JZdVOQyJvJ4M05z@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 3 Aug 2010 18:59:44 -0700
X-Google-Sender-Auth: DtUb6KrGL1MY1Tc7jYHGXy3fQlg
Message-ID: <AANLkTi=uqEKO2KSouSn2vOe2x0yioc3J6pyoxm5UZJd+@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH (resend)] image.bbclass: implement IMAGE_FEATURES
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
X-List-Received-Date: Wed, 04 Aug 2010 02:00:09 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 3, 2010 at 6:45 PM, Chris Larson <clarson@kergoth.com> wrote:

>
>
> On Tue, Aug 3, 2010 at 6:40 PM, Chris Larson <clarson@kergoth.com> wrote:
>
>> From: Christopher Larson <clarson@mvista.com>
>>
>> This adds the ability to include groups of packages in an image.  It is
>> similar in concept to the IMAGE_FEATURES used in Poky, but here we use
>> IMAGE_FEATURE_<feature> and IMAGE_FEATURE_<feature>_OPTIONAL, rather than
>> base_contains calls.
>>
>> Initially defined groups:
>> base - the packages requested via IMAGE_INSTALL & IMAGE_BOOT
>> dbg - debug packages
>> dev - development packages
>> doc - documentation packages (of limited use at the moment due to
>> task.bbclass)
>> vmlinux - kernel debugging packages (just kernel-vmlinux at the moment)
>>
>> To add groups to your images:
>> IMAGE_FEATURES += "dbg dev"
>>
>> To add a new package group:
>> IMAGE_FEATURE_myfeature = "gstreamer python pulseaudio"
>>
>
> Note that using package_dbg.bbclass can be useful when using the "dbg"
> group/feature, as it switches to using one -dbg package per binary package,
> rather than per recipe.  INHERIT += "package_dbg".
>

Hmm, IMAGE_FEATURES is consistent, but conceptually this is more an
implementation of 'package groups' for root filesystem population than
anything to do with the "image" creation process.  Anyone have any
suggestions on better names for the variables?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

