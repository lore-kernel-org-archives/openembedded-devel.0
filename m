Return-Path: <max.oss.09@gmail.com>
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 57CF271999
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 08:36:47 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id 19so1520391oti.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 00:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+aMhXdnC2kj37z+7BbseQiml+Ncl9aBL4kM7m+mNSUc=;
	b=n+LDC94JM2KqMvA9bR1eEC7C8xzsRIZCzLyOMABKTifwD/pNve2QPnYek8aIOlehfM
	dEDW34x1A+URUFk+eY8TqM5VYcVP9YUP5w2Cf/6aIJuAnu+8sQTTBel+iNOKM6YeIovR
	cK34S27iZA2rzlR1/qAxXc1BVm3Nomhb1YoHTE5Ntgb9PcdlJAwQv+zr6LTjiFJpK7st
	hZ092iuX7vMxSC3IC1Gav08YAe083Ds0nlhXGa0t76PpZ09J18ftmset0li+LE4F6C61
	7m20G29gTcj4QrQRMMoEoILHnNwFj1/rb+5gWQocCaR/go1q8Eg+rkKkJI0oqcZgFyfg
	JgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+aMhXdnC2kj37z+7BbseQiml+Ncl9aBL4kM7m+mNSUc=;
	b=dAsbrm4wTqkNlz4PwTPoufQxBIyUaVKFAZariJOedqoOPVZiNytf+CuJUIYPKAczCy
	2vDs0d2E1sfx0bI0Zc684y540Y4O9a3kgakTQATcHHr/HLGeA4/zwte6qGCX6hUYCpqm
	Hy2os/fNVCSEQF0Y6dylQWJGgKmWmq6j/rsRMb29EhkG5TCgo0j1obeVK3umB3Avd4I/
	hNADsGan5CqNCIL4n4d5uRyutEiHWtdJo32Fx//UnKSlPTyRUiJe/bwcQeJ8jCz3g1eO
	bVh4pzl48m2dly8pUdoMVH+4PkBJEVkRhMk0b9RwU4uiSS2OW6ksAk3L/iLxJx1Wuyo1
	1jmg==
X-Gm-Message-State: AMke39kzgqz3R+XXB1h6nUIuwNPLiE2w6kKEqh2EnSYMPMVzMyI3FjwQUCXanpQ+DtBGa/VIiJJ/6LdORvNemQ==
X-Received: by 10.157.4.37 with SMTP id 34mr16767540otc.205.1487147807583;
	Wed, 15 Feb 2017 00:36:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.1.56 with HTTP; Wed, 15 Feb 2017 00:36:47 -0800 (PST)
In-Reply-To: <1487146060.13854.371.camel@intel.com>
References: <1487108941-20285-1-git-send-email-max.krummenacher@toradex.com>
	<1487146060.13854.371.camel@intel.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Wed, 15 Feb 2017 09:36:47 +0100
Message-ID: <CAEHkU3WxmhpQS4deyeJNCkDpDim1_TNgL6B7q0U7iG+q8WAWOA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-oe][PATCH v2][master-next 0/4] python-m2crypto now rdepend on python-typing
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
X-List-Received-Date: Wed, 15 Feb 2017 08:36:50 -0000
Content-Type: text/plain; charset=UTF-8

Hi

2017-02-15 9:07 GMT+01:00 Patrick Ohly <patrick.ohly@intel.com>:
> On Tue, 2017-02-14 at 22:48 +0100, Max Krummenacher wrote:
>> For native packages the rdepends do not get automatically installed in the recipe
>> specific sysroot.
>
> I'm still not certain whether that RDEPENDS problem is intentional or a
> bug which needs to be fixed - see "[OE-core] Does recipe specific
> sysrooot (or whatelse in current oe) break native dependencies?"

IMHO this is a bug.
If I need a tool at compile time I should only have to add that tool to DEPENDS,
this should take care of installing what ever else that tool needs to run.

However I understand Richard's comments that technically this is not easy
to achive so I don't expect a fix soon.

>
> I don't know how long it might take to resolve this, nor how urgent this
> problem is for you, therefore I don't have an opinion whether merging a
> (temporary?) workaround is better than waiting.

I guess that crda is sort of mandatory for images which use WiFi so having
that blacklisted is likely a showstopper for many users.
(pywbem got fixed because grep hinted that it has the identical issue, I don't
even know what it does)

Also the workaround will not hurt once RDEPENDS native are followed, at best
a package is installed in the sysroot because it is listed in two places,
at worst the RDEPENDS is no longer needed but gets still installed because
that change did not propagate to the user of the tool.

So I'm for fixing it with a workaround.

Max

>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

