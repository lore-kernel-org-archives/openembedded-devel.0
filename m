Received: from mail-ia0-f173.google.com ([209.85.210.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UAUCe-0006lw-Fl
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Feb 2013 00:44:56 +0100
Received: by mail-ia0-f173.google.com with SMTP id h37so3983829iak.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2013 15:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=W7c86e4DuTXg/qRbbPbzHTls5l2fCyNVe1zgIaPc8Rw=;
	b=xSMKg8q4rWXARgSqr5Khp7m6wHy3xlGKGUQiqGbt5Ciw6CJ0q/wvWk7OqUywag/A7m
	PENIMc/nzxB8Yzr0GCozgqn9f9xMxGBFKSpDhtJUiTFa0NIs9PwVhAoHaUetWFd+2faU
	o7+x85kh0ze9wfSHuXs5zcB9VkPyoGevQyhwGhZ+R0Hv4/N3cFi+5f4AKXjbUiq793ZI
	mqv5drTRcuIqyb99jMbH08+ft5kYb0O6ZcYnnxwLI99J0A676bF7yLKJ8+O/wWJlv1DP
	tfJHbI1LAXvsfDQmX97d3ao3tRbFnszm/q/vHsqKyb/bANXL8TVIgTt9CpfqIkgmL2M4
	+/BQ==
X-Received: by 10.50.17.131 with SMTP id o3mr11580igd.112.1361921316071; Tue,
	26 Feb 2013 15:28:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.74.163 with HTTP; Tue, 26 Feb 2013 15:28:04 -0800 (PST)
In-Reply-To: <10163036.J0OQEGjt9t@helios>
References: <1361432524-26238-1-git-send-email-raj.khem@gmail.com>
	<10163036.J0OQEGjt9t@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2013 15:28:04 -0800
Message-ID: <CAMKF1spvgucpsYJs9q16_o7Qz5+WeXmgDFFaF_-uJzx_BLbvdQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie][PATCH] kdepimpi: Fix multiline comments
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
X-List-Received-Date: Tue, 26 Feb 2013 23:44:57 -0000
Content-Type: text/plain; charset=UTF-8

hmmm in angstrom we have been using git://github.com/bluelightning/meta-opie.git
for fetching meta-opie and thats the problem here. I guess above link
is not true mirror
therefore we should use git.oe.org ?

On Thu, Feb 21, 2013 at 1:55 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 20 February 2013 23:42:04 Khem Raj wrote:
>> Makes parsing go through
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  recipes-qtopia/kdepimpi/kdepimpi-base.inc |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-qtopia/kdepimpi/kdepimpi-base.inc
>> b/recipes-qtopia/kdepimpi/kdepimpi-base.inc index 27cc237..5d6bb0d 100644
>> --- a/recipes-qtopia/kdepimpi/kdepimpi-base.inc
>> +++ b/recipes-qtopia/kdepimpi/kdepimpi-base.inc
>> @@ -33,7 +33,7 @@ LIBS+=-lz \
>>  # That changes will be needed for KMicroMail/PI to get it build with OE
>> libs #
>>  #             LIBS-=-lkmicromailwrapper LIBS+=-lmailwrapper
>> LIBS+=-lopiecore2 \ -
>> +#
>>  QMAKE_PROFILES= "all.pro"
>>
>>  SUBDIRS="qtcompat libical/src/libical libical/src/libicalss microkde
>> libkcal libkdepim \ @@ -47,7 +47,7 @@ SUBDIRS="qtcompat libical/src/libical
>> libical/src/libicalss microkde libkcal lib #
>> pwmanager/libcrypt/cipher  \
>>  #        pwmanager/libcrypt/zlib \
>>  #        pwmanager/pwmanager \
>> -
>> +#
>>  inherit palmtop
>>
>>  do_configure_prepend() {
>
> Thanks, but you already sent a patch for this and I already merged it:
>
> http://cgit.openembedded.org/meta-opie/commit/?id=93df88a1cc88c4db2616b9e31aa13477f2c7f63e
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre


