Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 94A4F78274
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 21:46:42 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id d124so2932106vkf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 14:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=voOYfbTP7d7VzmnW9R/1HGE2tPXXduUzfg67MxpKRGE=;
	b=OsB0GXAeXy2OgjZuK7/8IbLMxzr2DUxy/G3fmMzG8lxEHxj3GpqzzT1UqTEg8/xJmL
	s+uRoc+a71uhSGWlsFwYT/XIWMDa/jDDUQwW4+0ye/C4oKlDBIifHdRokiCroX5RmmLJ
	NN/U5Zf3UsCZ+L0Tl8TP9VJgGIU8U5wg+9oco1CzxJyWTXprb0UELh5/8FXx1vj4NRe/
	7XDA3Sg8KsYqbu0K65JIFWpMwf28Gzbr80mQKy/26FIp5RIECn/8ImQQvBiEr8nPfSyM
	APmgUGdtqeXcVGXHKr+nX9ZoXTjmkyMOEM/sy+ISQZRwQ8osxnkkPTJpOPiHWoA5M0AL
	RVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=voOYfbTP7d7VzmnW9R/1HGE2tPXXduUzfg67MxpKRGE=;
	b=l4viLw4JQAQnk/MhaEtvrIn4YXDbug2kTZJ1zVd83AavMHWM1TvuLJTs1iDNoXH64y
	8KbIk99/U5KbaLQzeE/8QPvNOpdCedRTqDagsXNiHYPEH/sAajY6rXyJOR75eEUfngnk
	uHjULjSnSftBfOtJVKWZaevuZueaRg1fmtV8sZGB5nGm63CxAaglKOmGVDH4ijpY4jqD
	drowT53Q+HfAiEJDLeKuLB/vgBimhi4bSL+j6VDVEK8Xb9zEiJvepnXnelUD0gkihFGF
	OkPUW0YUpqO3/zrpX3JPZSG3i+yCSYRh4nQOBO2kzA93QpRssg8eKQBMDlog/RAUhSbc
	lcjA==
X-Gm-Message-State: AHYfb5gMKXsooxfRqn4PkSKOTsfiHuFVQkc1kBG/Bx9MYJ5oLqv99Y6Y
	E3ZhkFI9b9lYunmpQ36TfuhVrTYcjQ==
X-Received: by 10.31.222.130 with SMTP id v124mr1948147vkg.56.1504129603763;
	Wed, 30 Aug 2017 14:46:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Wed, 30 Aug 2017 14:46:43 -0700 (PDT)
In-Reply-To: <CA+chaQcJzL_P1wiMWZ9xzpUNQVhPNzgVfQjAszBpfbXRMLJQ2A@mail.gmail.com>
References: <20170828163937.29460-1-adrian.ratiu@ni.com>
	<20170828163937.29460-3-adrian.ratiu@ni.com>
	<CAMKF1soDqjV2xP1-+XyC23okmZaGPgXV+Z08tH1k9gi2hXd7+A@mail.gmail.com>
	<CA+chaQcJzL_P1wiMWZ9xzpUNQVhPNzgVfQjAszBpfbXRMLJQ2A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2017 23:46:43 +0200
Message-ID: <CA+chaQdNVnJg=VU7yFDzg8qNDNM0UM8oXMfFwCck-4+eFyzeag@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] smbnetfs: unblacklist recipe
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
X-List-Received-Date: Wed, 30 Aug 2017 21:46:43 -0000
Content-Type: text/plain; charset="UTF-8"

I've fixed the missing files in master-next, but it still fails to build
(at least with gold):
http://errors.yoctoproject.org/Errors/Details/154437/

On Tue, Aug 29, 2017 at 5:47 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> That's probably caused by my change in master-next to remove blacklisted
> recipes (and their patch files), I've removed smbfs from that commit, but
> forgot to restore the .patch file
>
> On Tue, Aug 29, 2017 at 5:45 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mon, Aug 28, 2017 at 9:39 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> wrote:
>> > All its dependencies have been fixed and it builds correctly.
>> >
>>
>> I see
>> ERROR: smbnetfs-git-r0 do_fetch: Fetcher failure for URL:
>> 'file://configure.patch'. Unable to fetch URL from any source.
>>
>> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> > ---
>> >  meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb | 2 --
>> >  1 file changed, 2 deletions(-)
>> >
>> > diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git
>> .bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
>> > index 6995ad3f5..f1420fbed 100644
>> > --- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
>> > +++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
>> > @@ -24,5 +24,3 @@ PACKAGECONFIG ??= ""
>> >  PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--wi
>> th-gnome-keyring=no,libgnome-keyring"
>> >
>> >  S = "${WORKDIR}/git"
>> > -
>> > -PNBLACKLIST[smbnetfs] ?= "Fails to build with RSS
>> http://errors.yoctoproject.org/Errors/Details/132827/ - the recipe will
>> be removed on 2017-09-01 unless the issue is fixed"
>> > --
>> > 2.14.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

