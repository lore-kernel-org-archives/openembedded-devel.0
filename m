Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9B1AE74F9D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 10:51:02 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id n84-v6so35003999oib.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 03:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/jP818rem2Fe9Z+en7ceyhqyYaxFu5Fp6bmPFFVSqSQ=;
	b=zZDejX4QwpF9aOydc7UjkQfLLhKcMue1sG622hIF3jwFP3zElDsScfldu99ouuEwzL
	RxqUIAXzEQVdG2S6wM8saChMzg0jDsT0q3ZtoPtTb7o34RfJP9rE5Hst97p0icRW0aFU
	L107wkrlR+3gDDQEnNzVQ9i4E8QZW04qKQTxTJz5xcR9HmxJ6kg+TBPzYHXYObAyMAL2
	ZErKvLn7vYHLThvk5+up/3bNLHP127F2098Mx1GXOqh6WELxmmQ27N0C+3pjwUXp7TZ3
	gkOlaMayKQici3F6LPH8KUUYVnA7aokjAB0LMXe+KI9/pBdTQvY5pWBpVHlyKOOhhG+C
	fVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/jP818rem2Fe9Z+en7ceyhqyYaxFu5Fp6bmPFFVSqSQ=;
	b=XsXOnHdwLj++cMydMuDJtNsCuWdo9hLsvR+EDQZVivL2jeZbzveQmRzN9h0gRN5vAb
	Fh5RIRQ3klG+GY47mVqFj6c+DQExtEM3HdPlBkDu5m7NHov3saAm4HclhUFPGpOYZbaI
	sMwJALGTjlEJC/i+GCeVE1zS1wdaK+zDYDCH11KzOY3Yu/Az2YLhMEgqEZWqfkWxwl51
	cR/ttT2W4fX7VWOQAadMHdieUb8Rw63CeIHXWFrBC5UYg0w+H5T/jET4xYVjLAgPfgUI
	PoUQW+jBqN6+V0wjBunfDXUJj0aRybjFGuTm6yUU3TPTD6VUd1wX4keGFRVUPjIBCwvF
	DJLA==
X-Gm-Message-State: APt69E2+aCEAyYHf8/CQLQlQ09PZfosRMxWYkk0ubeC7Aup2Bhe0PPqW
	8U+9kyubIHh4nGVXalpS6wmkqLSmtMyEPO71HETMZw==
X-Google-Smtp-Source: AAOMgpc6juPGGTkuwBbD2mwQjRAe8X38G5az6qsUf5uiEqi+UTmopALxB6neNIp4MXoH2Tz18pmspkrZN8EwIeic2Sg=
X-Received: by 2002:aca:e185:: with SMTP id
	y127-v6mr24173556oig.245.1531133463701; 
	Mon, 09 Jul 2018 03:51:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Mon, 9 Jul 2018 03:50:43 -0700 (PDT)
In-Reply-To: <CAJTo0LYmnfFkq6bVsQ47TCwvYgbE6OUnZRQUg5h5hR69tDht-w@mail.gmail.com>
References: <20180708080640.39121-1-raj.khem@gmail.com>
	<20180708080640.39121-2-raj.khem@gmail.com>
	<CAJTo0LYmnfFkq6bVsQ47TCwvYgbE6OUnZRQUg5h5hR69tDht-w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Jul 2018 11:50:43 +0100
Message-ID: <CAJTo0Lb=X_W_SXrFdZRgQjdnreGq5qSyTMHC9NQUh-uxBBQ29A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 2/2] python3-lxml, python3-pandas, python3-protobuf: Set CLEANBROKEN
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
X-List-Received-Date: Mon, 09 Jul 2018 10:51:03 -0000
Content-Type: text/plain; charset="UTF-8"

I've just sent a patch for oe-core to improve how it calls clean,
which fixes lxml.

Pandas can be fixed by depending on cython, patch sent.

protobuf is broken, we still need the cleanbroken but I plan to do the
same for python2 so I've just sent a patch to add it to the inc file.

Ross

On 9 July 2018 at 10:52, Burton, Ross <ross.burton@intel.com> wrote:
> The lxml failure can be fixed with a tweak to the class, so I'll run
> the tweak through all of meta-python to see if it regresses anything
> else.  Please hold this off until I report back.
>
> Ross
>
> On 8 July 2018 at 09:06, Khem Raj <raj.khem@gmail.com> wrote:
>> The distutils class got a clean via "setup.py clean", but these
>> recipes doesn't support this yet so disable clean target during
>> configure
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb     | 1 +
>>  meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb  | 1 +
>>  meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb | 1 +
>>  3 files changed, 3 insertions(+)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb b/meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb
>> index ff4bc7faad..b95d7bae71 100644
>> --- a/meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb
>> +++ b/meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb
>> @@ -1,2 +1,3 @@
>>  inherit setuptools3
>>  require python-lxml.inc
>> +CLEANBROKEN = "1"
>> diff --git a/meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb b/meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb
>> index b5dd5e0924..c1e57189cf 100644
>> --- a/meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb
>> @@ -1,2 +1,3 @@
>>  inherit setuptools3
>>  require python-pandas.inc
>> +CLEANBROKEN = "1"
>> diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb
>> index 781d1dc4da..53d5528c4b 100644
>> --- a/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb
>> @@ -1,2 +1,3 @@
>>  inherit setuptools3
>>  require python-protobuf.inc
>> +CLEANBROKEN = "1"
>> --
>> 2.18.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

