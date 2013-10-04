Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 52A5860FA6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 11:57:26 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so3005282wes.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 04:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pS1q9F0SeLZG2QfzJALGPx3RSvdu+W/Wq3fEpgw6Bzs=;
	b=DYwD6Z106VYP3Xz/JPRZZodMFoLhgjOZpSJT4HkfBZynT59ZKnO6RiUxGad4+fvrG4
	CgTCC3vitsD9JLQl0QOjuZgpyidLHMojWFT3tKPkOKY0GeV8Fefsgk+uX68pUXXpn+Zv
	bSDCyW+3Fz4GibzZYHO0IHRtk/n4eZDQigH28lk4JDQUsRqthTuCyiEeNWygX8xL4l9o
	9DeZyfZPasR/2amz5xCnaU3dVVdsHWRPqtJ8TprPTWl0+Nl3KstUzwb0FTrj0L7jnOuQ
	ZOSpksefekaQbMoCvnZWMax2ahd1PC06ViyACUEewxauZ5GGiL9V5HSBiSDGgm0GnJAp
	eVfQ==
X-Gm-Message-State: ALoCoQkNcFdmfO4OIJdzu/IbQAzgZIZeIVB9TmHvOHbYnrVxWw2HpREoMmL1cEJNHS7EgxyW4oQt
X-Received: by 10.180.74.164 with SMTP id u4mr7075267wiv.17.1380887846832;
	Fri, 04 Oct 2013 04:57:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.180.74.46 with HTTP; Fri, 4 Oct 2013 04:57:06 -0700 (PDT)
In-Reply-To: <20131004100904.GC6240@jama>
References: <CAP71WjxknZx_g_1zgCgebb8_PnDW3Ry9NdtLPuDay-7ZgWp4CA@mail.gmail.com>
	<20131004100904.GC6240@jama>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 4 Oct 2013 13:57:06 +0200
Message-ID: <CAP71WjyKDm_NYTbA_DRLxcK8nkfsURca0UgRHPkoO+O5bzso7Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: ruby-native problem (on dylan)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Oct 2013 11:57:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 4, 2013 at 12:09 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Try to add this in qtwebkit.inc:
>
> # make sure rb files are used from sysroot, not from host
> # ruby-1.9.3-always-use-i386.patch is doing target_cpu=`echo $target_cpu | sed s/i.86/i386/`
> # we need to replace it too (a bit longer version without importing re)
> RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
> export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
>
> if you can confirm it works for you I'll push it to meta-qt5.

yes, it is working fine with this change.

however, don't you think that this is just a workaround? the real
issue being that ruby has hard coded paths?

thanks

