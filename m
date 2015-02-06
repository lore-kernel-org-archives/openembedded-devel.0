Return-Path: <ashcharles@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6DF72E3E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Feb 2015 16:05:57 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id b16so3707195igk.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Feb 2015 08:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HS+zv9B6VRYeLf8E+BrrEJUwqXh6sue2+AGPygD6nFQ=;
	b=rTOzTJLutUbQKKv6N4oihWMq8iJyVqTC+NkGGGINacvRJTno1EUnHEfZf+BokUcNH1
	RkvuEeegqVFzmApHdTrpc0oCQbTOurk4kdesvS2QJ7hBkxwAv4szV0hxI7oKTAkc9LwD
	ZA3V3N/WKD9sQaqzKRZDOw69/ylBk3CtSYlu+ENVGSe4bnhBi3laMiHpbnK7lO+4ZAVS
	+T92Co4YUW58QV6oDNbR+VOtEB7rgFlh0hPmpjeyAjkL4W97aa0ZoTnAErNUnU2ITajF
	w4DN2NHPhawvnLOF2a0Jr8ypSQAzn05XLPoS47KYcx926eEwEQpFW8YMJBsV6DZXrYjJ
	K1mw==
X-Received: by 10.43.54.4 with SMTP id vs4mr13029127icb.72.1423238758835; Fri,
	06 Feb 2015 08:05:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.8.166 with HTTP; Fri, 6 Feb 2015 08:05:28 -0800 (PST)
In-Reply-To: <CAK8F28nBxHXyCL3uXqRy0Hgp39Gpti08dt9-880=POigXLUSxg@mail.gmail.com>
References: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0D86B1@dor-sms-xch01.digi.com>
	<3777411.pG0mYOicST@peggleto-mobl5.ger.corp.intel.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB0D891E@dor-sms-xch01.digi.com>
	<3700387.1Q9y16bqhG@peggleto-mobl5.ger.corp.intel.com>
	<C89D77F8-3BC6-412A-B220-67AD52600F5F@gmail.com>
	<CAHQecY5gQE=3tgBfAUffiw=Q3wvY3x3wN07w4G_M+Hy83bQwqw@mail.gmail.com>
	<CAK8F28kB5SDdjm76_DgReMSFJuZ60-hpHjUhnAVkPw14eELpoA@mail.gmail.com>
	<CAHQecY68g7wjJMEV3ph3ZFqAH_tdQ0JcH1AkuJkgEwkW3rXu_A@mail.gmail.com>
	<CAK8F28nBxHXyCL3uXqRy0Hgp39Gpti08dt9-880=POigXLUSxg@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Fri, 6 Feb 2015 08:05:28 -0800
Message-ID: <CAK8F28=MORgj-MRwcMSQzuYuvH8rfjV2G52s9_Jbd0Og1qqXUw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, "Viguera,
	Javier" <Javier.Viguera@digi.com>
Subject: Re: [meta-networking] crda-1.1.3 broken in dylan, dora, daisy and dizzy
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
X-List-Received-Date: Fri, 06 Feb 2015 16:06:06 -0000
Content-Type: text/plain; charset=UTF-8

Gumstix can provide additional mirroring if that'd be useful (I've
been told I just have to keep tabs on the cost ;-)).

The mirror is found here: http://source-cache.gumstix.org.
It is a CDN+S3 so it should be reasonably quick worldwide (just got
~3MB/s down for wget
http://source-cache.gumstix.org/qt-everywhere-opensource-src-4.8.6.tar.gz).

Whenever Jenkins wants to sync, it'd need to call this:
$ s3cmd --rr --exclude="*.done" -P sync <path-to-dl-dir>/* s3://source-cache/

As well, the server would need 's3cmd' utility installed and some
magic credentials from me.

--Ash

On Thu, Feb 5, 2015 at 11:21 AM, Ash Charles <ashcharles@gmail.com> wrote:
> On Thu, Feb 5, 2015 at 11:03 AM, Tom King <ka6sox@gmail.com> wrote:
>> 150GB
> Estimate of monthly bandwidth?

