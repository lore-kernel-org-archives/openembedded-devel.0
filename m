Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id CF46E60064
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Sep 2018 09:24:27 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id 13-v6so32545313ois.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Sep 2018 02:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WNT17oGkk4yTrzpToZNGpWuLfseVo2xQIDJsSKB9QkU=;
	b=ARiUuzjhqPLUyfYhK+DZOlTY84hz7OQUqgyUl6UKwwmKO4diBci8LvLNMdJminn15z
	JYmfVnhgDoBD1Fme95oWSMbfTVmyZ7EPA42XEpI/M61odNvAB8sSj6v3M3/MHYNq72ML
	JDYSYp01nQdo/6OQaNKg3RmeCpEgIZxQ8RH5bUunP2E/GAnQ7AXMOqjHlSeBWGT5mNZT
	HoX+/48bKgQNlqZv+br4Q5w6KZXPKsDhPaqURoDSGHlzfyxB379qpSqi7BFGZ4C5mHQu
	xP7arq6PRhddTUUAO3gnsAWJWdgBp9jLT3W3/n+O6rvwm9yaJtaOMtGpf0zSLUUWIX5t
	YiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WNT17oGkk4yTrzpToZNGpWuLfseVo2xQIDJsSKB9QkU=;
	b=uB5rF7oH9ajubAO858FjnrMnv+btC51L4aAC5K6MBBVXhHS4HbhZXell50WnpVBKFC
	hJ6mw6bQojO9AJ2sI94JEgaUzaHeE3ZtN1NnmCMPHfkJj7BIttsL50t3HVn9S0hzEFAD
	eZpz4j9BD53k4KvGZmEnsgNOa6Zfo8gD/jJdyyQHqNdslg/GegbE9oIayYs8+yWtyfC8
	iYDy/NWP84VCt5Nm2gq6S3AbOzqLA651XxAQgg4snNNS0BGLALUUwxiqKScdDgKmOzsO
	uERvXfigCh9lKA9xmcV36RUGLoZyTO1Ygg49j1nQ1HbVsaeleufGBtrOKqLJIKaksn75
	12sg==
X-Gm-Message-State: APzg51BA8WNhz4/gdHfqokCx5oPyqBmEknd+0zzXWQMPHXo0e51GU2u+
	5/KvkKCiREdMsf3UPhslaWkbx05y/pdySovEmkiXnQ==
X-Google-Smtp-Source: ANB0VdYHsjuCYg2vNN8njnzoThkExzKFr5hr0GnhlT+ZkD7eGkVijG3VolTq68quCxLA86wUd7jUBQyqsKH4Ic83kRU=
X-Received: by 2002:aca:3c02:: with SMTP id
	j2-v6mr19430686oia.50.1535966668740; 
	Mon, 03 Sep 2018 02:24:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:140d:0:0:0:0:0 with HTTP;
	Mon, 3 Sep 2018 02:24:08 -0700 (PDT)
In-Reply-To: <CAMKF1sqDUFO5L3QWqpqBARB+zb7WLHB8jopL3MVVCwraLpD7Vw@mail.gmail.com>
References: <20180831144201.5100-1-ross.burton@intel.com>
	<CAMKF1sqDUFO5L3QWqpqBARB+zb7WLHB8jopL3MVVCwraLpD7Vw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Sep 2018 10:24:08 +0100
Message-ID: <CAJTo0LbcUKkCefREE6bEG83gkjfGh33gvd-_fqdPnHWhMpftMg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] postgresql: use util-linux's uuid
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
X-List-Received-Date: Mon, 03 Sep 2018 09:24:28 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry!

On 31 August 2018 at 17:35, Khem Raj <raj.khem@gmail.com> wrote:
> its already in see
> http://git.openembedded.org/meta-openembedded/commit/?id=140bf68e37
>
> On Fri, Aug 31, 2018 at 7:42 AM Ross Burton <ross.burton@intel.com> wrote:
>>
>> Postgreqsql was configured to use ossp-uuid but ossp-uuid is dead and everyone
>> will be building util-linux anyway, so use the libuuid.so from there.
>>
>> Confusing the option is called e2fs because the library originated in e2fsprogs.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
>> index 1301060ee5..44a1b30fe0 100644
>> --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
>> +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
>> @@ -59,7 +59,7 @@ PACKAGECONFIG ??= "${enable_pam} openssl python uuid libxml tcl nls libxml perl"
>>  PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
>>  PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
>>  PACKAGECONFIG[python] = "--with-python,--without-python,python,python"
>> -PACKAGECONFIG[uuid] = "--with-ossp-uuid,--without-ossp-uuid,ossp-uuid,"
>> +PACKAGECONFIG[uuid] = "--with-uuid=e2fs,--without-uuid,util-linux,"
>>  PACKAGECONFIG[tcl] = "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl tcl-native,"
>>  PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
>>  PACKAGECONFIG[libxml] = "--with-libxml,--without-libxml,libxml2,libxml2"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

