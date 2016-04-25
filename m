Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 600C673176
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 16:27:09 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id c6so88595823qga.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=BsDD09tSKAOtlv0IaLokctIfeOAOy4VwmI4ePrpEhAs=;
	b=zkKa5lvU7O3S84alTygfaWqCdBhoUv8c497yU1dU6ocBFwXqn2ynLp/Q618mz4wyYO
	RGCbGt1G034s050sauZPD75FaDiW7/5qf65Q83vZPLdiJKQgZyK8UwcTKlMPjFiaV0Eu
	c3jXWD2DgvWK8Zi0huwTeBTTHAmFEqKvUNYvFNMDYXd1D2S55O/TcuSMM5F1rt83Q1aJ
	QeV75uld+8bgQb7AWtDI85IRX1JOx9DtmrpGGZ4GuZMYJvpxpQtzh50FEPpaUgh0ASSL
	3QQuBrFCRoyFLxfUJ8zksP83pWKsdq4dAYjuRCq/ljneQgYBITCc5/9mDuAPul6OWitn
	78rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=BsDD09tSKAOtlv0IaLokctIfeOAOy4VwmI4ePrpEhAs=;
	b=aj16KpiiruUZ1oqta9dlnXQjpkne81PftsUok+mERKQbN6fQ6Ht0TEzPtCRm8Q8Lfw
	SLzrvr4eVxqXsxwJ36duoovaLDTOUDKD4bqFBhlf9Lu16KOVOnLDw7aYCT/lRCdkdlMI
	yBwERcYXKjSuYiQVBiUEq/QvAjW13wGRj949gkn6HTt/veFSV6YwVcYs46Bms17CL91X
	9yw3H0A5cau8EUTH14Ok8L4IY92kQOb9aLDbgGboGgWgi0UYnMuNDWnZnaz/bZeeoEwm
	WWn5sD74X4bsUmHRZjGBGb4aLCMosa2WsEoJU3uYjF0TURHs3jaqFUGBWOal5s8h0gO1
	+MbA==
X-Gm-Message-State: AOPr4FV6TONakMvkg8tqTG4I/gatreo6KoaYyasA/PPQaeEJ3N4SLMFTmeFRPL3euwbOHQNp9W+4V1hPsdr4uA==
X-Received: by 10.140.41.203 with SMTP id z69mr35698603qgz.57.1461601629668;
	Mon, 25 Apr 2016 09:27:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 25 Apr 2016 09:26:40 -0700 (PDT)
In-Reply-To: <20160425154425.GA2558@jama>
References: <1461543138-25293-1-git-send-email-raj.khem@gmail.com>
	<20160425154425.GA2558@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Apr 2016 09:26:40 -0700
Message-ID: <CAMKF1sppDHvUh2+ekdgWGXrmj9QXEJJ6cXXsG5Z27Jf7=GbJtA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ltrace: Remove deprecated readdir_r()
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
X-List-Received-Date: Mon, 25 Apr 2016 16:27:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 25, 2016 at 8:44 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, Apr 24, 2016 at 05:12:18PM -0700, Khem Raj wrote:
>> New glibc >= 2.24 will remove it
>
> Is this still needed with:
> http://patchwork.openembedded.org/patch/120317/
> ?

yes. Sent a v2

>
> If so please rebase on top of master-next and resend.
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../0001-replace-readdir_r-with-readdir.patch      | 33 ++++++++++++++++++++++
>>  meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |  1 +
>>  2 files changed, 34 insertions(+)
>>  create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-readdir.patch
>>
>> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-readdir.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-readdir.patch
>> new file mode 100644
>> index 0000000..8d2c264
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-readdir.patch
>> @@ -0,0 +1,33 @@
>> +From 64f98f84fd88797e219f9dde1ca387fee4b509f0 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sun, 24 Apr 2016 16:58:17 -0700
>> +Subject: [PATCH] replace readdir_r with readdir
>> +
>> +glibc 2.24 has deprecated readdir_r
>> +
>> +https://sourceware.org/ml/libc-alpha/2016-02/msg00093.html
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> +Upstream-Status: Submitted
>> +
>> + sysdeps/linux-gnu/proc.c | 5 +++--
>> + 1 file changed, 3 insertions(+), 2 deletions(-)
>> +
>> +Index: git/sysdeps/linux-gnu/proc.c
>> +===================================================================
>> +--- git.orig/sysdeps/linux-gnu/proc.c
>> ++++ git/sysdeps/linux-gnu/proc.c
>> +@@ -240,9 +240,10 @@ process_tasks(pid_t pid, pid_t **ret_tas
>> +     size_t alloc = 0;
>> +
>> +     while (1) {
>> +-            struct dirent entry;
>> +             struct dirent *result;
>> +-            if (readdir_r(d, &entry, &result) != 0) {
>> ++            errno = 0;
>> ++            result = readdir(d);
>> ++            if (errno != 0) {
>> +                     free(tasks);
>> +                     return -1;
>> +             }
>> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
>> index d8d037e..7a7174c 100644
>> --- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
>> +++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
>> @@ -19,6 +19,7 @@ SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=ltrace-0.7 \
>>             file://ltrace-0.7.2-unused-typedef.patch \
>>             file://configure-allow-to-disable-selinux-support.patch \
>>             file://0001-ltrace-fix-gcc-5-logical-not-parentheses.patch \
>> +           file://0001-replace-readdir_r-with-readdir.patch \
>>            "
>>  S = "${WORKDIR}/git"
>>
>> --
>> 2.8.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

