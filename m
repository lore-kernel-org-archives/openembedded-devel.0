Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TAjhy-0007Yl-HX
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Sep 2012 17:46:02 +0200
Received: by eekb57 with SMTP id b57so545376eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2012 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=OVQVF4f9ykC8urI9owBlkeRTl6ig/yoEYM58xJh0EJ8=;
	b=qjq3KqsnZAKKy2QlcymssnRJusfUnxHGwMOYPU35JZputbGS0mDE5qjKVLynxiuGNZ
	YS0TpDj/aclMaroiTxJRn6FxjmZMWlzQe/M0JdVqTILvRG9aCLLUSHtfG7a1tqoNd8Wd
	f3WVrY9FOCTM7sM21WZKRQIjm9ej0lGm+34dHbtpJb/SOxf9w6VKu4qkUiVbY0+zsVPL
	LexjT+2W6VUB9YbizX1vOo2FtvXJOUkwmPZA0j5XZ0q9erDuh5vyspV2C0EpdW5dY/w5
	tr8B1i9JG/ovKQo0Pll3M+iGXOCJVXXMcvD2R48pWccu/pac6VWQgXzVQ1QTXCqtkDOi
	ZlhQ==
Received: by 10.14.202.131 with SMTP id d3mr15883760eeo.32.1347204805192; Sun,
	09 Sep 2012 08:33:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Sun, 9 Sep 2012 08:32:55 -0700 (PDT)
In-Reply-To: <6071251.PkDIszpbs0@helios>
References: <1347171642-22926-1-git-send-email-raj.khem@gmail.com>
	<6071251.PkDIszpbs0@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Sep 2012 08:32:55 -0700
Message-ID: <CAMKF1sp7cBBaXX8JDjPLDbfcKNOe-4aHWSv3HcuzP+2qhOpMWA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie][PATCH] task-opie: Adjust for nativesdk renaming
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
X-List-Received-Date: Sun, 09 Sep 2012 15:46:02 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Sep 9, 2012 at 3:43 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Saturday 08 September 2012 23:20:42 Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../tasks/task-opie-toolchain-host-nativesdk.bb    |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
>> b/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb index
>> 5ca80e6..42138f1 100644
>> --- a/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
>> +++ b/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
>> @@ -1,8 +1,8 @@
>> -require recipes-core/tasks/task-sdk-host-nativesdk.bb
>> +require recipes-core/tasks/nativesdk-task-sdk-host.bb
>>
>>  DESCRIPTION = "Host packages for Opie SDK"
>>  PR = "r2"
>>  LICENSE = "MIT"
>>  ALLOW_EMPTY = "1"
>>
>> -RDEPENDS_${PN} += "qmake-nativesdk uicmoc-nativesdk"
>> +RDEPENDS_${PN} += "nativesdk-qmake nativesdk-uicmoc"
>
> This patch got merged to meta-opie master 5 days ago as
> 180d4b32d553baf4de152c601f6ccc72a84aee73. Did you mean to send a different
> patch?
>

yes. This was not meant to be sent. I have now sent the one I intended to.

> FYI I have some packagegroup renaming fixes queued, should be pushing today.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre


