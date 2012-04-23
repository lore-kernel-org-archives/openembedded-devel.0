Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SMF6V-0004Ma-3n
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 10:58:39 +0200
Received: by wibhj13 with SMTP id hj13so2247475wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Apr 2012 01:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=GfKLKULMHSuIE16T15ci8sx9LYfr1s1nDtKBPDZTGPk=;
	b=BYdaKCxWR01zuiCY6Z3mM7d/fEa1jyHxJ7cEvmvGaNcppYf4dx4tdDkdM8J6yYTnzd
	REQ+lBnsdVKKpX8Mo2q1hQi7veaIVwg+YEknW4zTIS4aPHRTscAalIA8Trown0Tn6D0j
	IhdKOeYQPATDm4TsvMtrs+XoaNYR2vdR2ysgDFfBsBzVuT8Y6WYmijHlLXVoS2xYb1o4
	aVGvsPBYN7DZUU2D/MQ7Mvab9HYZDs+Xg5F6ZlZa+ZSp34CoT3Ok1jKM/jTgFJ76CaDv
	p9pdm0nWK+hJ7XesFCb/c0Q82EDe6nRsBm5dN0L0Hz7vtrZJANyfx0FSBDotTuGER6HK
	19ow==
MIME-Version: 1.0
Received: by 10.180.83.72 with SMTP id o8mr19329312wiy.5.1335170939255; Mon,
	23 Apr 2012 01:48:59 -0700 (PDT)
Received: by 10.223.159.15 with HTTP; Mon, 23 Apr 2012 01:48:59 -0700 (PDT)
In-Reply-To: <jmrfmb$s29$1@dough.gmane.org>
References: <CAGiJk9eeDabHUuKAnHZtWw_ChX7jVEDvsN+LEpsZomvH_Ky94w@mail.gmail.com>
	<jmrfmb$s29$1@dough.gmane.org>
Date: Mon, 23 Apr 2012 10:48:59 +0200
Message-ID: <CAGiJk9cqTnLJKjTg1SVzioNQZypBmd13CURtWxmD1V8JDKeBmg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Some packages don't get deployed to the staging directory?
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
X-List-Received-Date: Mon, 23 Apr 2012 08:58:39 -0000
Content-Type: text/plain; charset=UTF-8

2012/4/20 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 20-04-12 12:15, Samuel Stirtzel schreef:
>> Hi, my observation shows that e.g. libphonon.so from the package
>> libqtphonon4-dev will not get installed to the staging sysroot.
>>
>> Is this intended or a bug?
>>
>>
>> The same happened with other non -dev packages like
>> meta-kde/recipes-base/kde-runtime_git.bb. The package
>> kde-runtime-declarative-scriptengine will get installed but it's content
>> is missing in the staging sysroot (not an issue but still confusing).
>>
>> I'm currently fixing race conditions in meta-kde and set strict explicit
>> behavior on search paths for libraries (not searching native/hosts
>> directories for libs). kdelibs4 obviously fails over this with
>> "libphonon.so no rule to make target", but that goes too much into the
>> details.
>
> AIUI OE uses a whitelist to stage directories (correct me if I'm wrong), so
> not everything ends up in sysroots. I have a similar problem with files in
> /lib/firmware that I'd like to have end up in sysroots.

In my case it is only a symlink that is missing.

Would adding
do_install_append() {
cp ${S}/lib/libphonon.so ${STAGING_LIBDIR}/libphonon.so
}
to my Qt .bbappend be a bad idea?


>
> regards,
>
> Koen



-- 
Regards
Samuel


