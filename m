Received: from mail-oa0-f48.google.com ([209.85.219.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UIFdd-0002F8-KY
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Mar 2013 10:49:01 +0100
Received: by mail-oa0-f48.google.com with SMTP id j1so1493188oag.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2013 02:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=czX3cQNS3etBbxzhAS3kTA1lwYJDERi7KZSUHJXZLxY=;
	b=p2rE/xqHjFnKUCKqQaEKoSz62BZPs5oeH3hiZIYc5PC+U7hsBCnGtMElxVTd7MPxYL
	SCDSclf+4GcH5sFirRy5P8aWoZ9DFp8yWJhx93zaXf0kuwwoApsJSf7YADFX3La3wXNt
	p2ONf23lyHA9dDwdZ6YZPppdGg6GZ2S6jpC50SyQI23FL6LSFIFqZ3gs5KT44LqScJYJ
	uLWmAftZD0YP+pLIrntsl3ikyZ4TGDbuyGbkZ9Jf6PrsopF19VWmuAGUvPL5TDQgr6G/
	Zn847ghLldIWJ7akx5Q3TRa2ln5I4OjGblctmqhGVHFlZIymzoGbZsXLksPGoKLvQGBv
	zWgw==
MIME-Version: 1.0
X-Received: by 10.182.40.71 with SMTP id v7mr3462474obk.85.1363771922451; Wed,
	20 Mar 2013 02:32:02 -0700 (PDT)
Received: by 10.60.76.199 with HTTP; Wed, 20 Mar 2013 02:32:02 -0700 (PDT)
In-Reply-To: <51497DC8.5090006@linaro.org>
References: <1363769468-20321-1-git-send-email-raj.khem@gmail.com>
	<51497DC8.5090006@linaro.org>
Date: Wed, 20 Mar 2013 10:32:02 +0100
Message-ID: <CAGiJk9ejLAdb3LWpTDpbVaPaDMsGNsX26yB3gHOExA46XW5L1g@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-kde][PATCH] cyrus-sasl: Make pkg_postinst/rm package specfic
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
X-List-Received-Date: Wed, 20 Mar 2013 09:49:04 -0000
Content-Type: text/plain; charset=UTF-8

2013/3/20 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>:
> W dniu 20.03.2013 09:51, Khem Raj pisze:
>> ERROR: QA Issue:
>> /b/kraj/angstrom/sources/meta-kde/recipes-misc-support/cyrus-sasl_2.1.19.bb:
>> Variable pkg_postinst is set as not being package specific, please fix
>> this.
>
> meta-openembedded has 2.1.26 in meta-networking so meta-kde copy should
> be removed.
>

Hi, it seems there are some differences in the recipes, maybe we can
work through them.

Is BDB 5 working correctly with this version, without the patch [1]?


[1] https://gitorious.org/openembedded-core-layers/meta-kde/blobs/c9bac7d55796e0f88e6950dfff2adbb186b0df7a/recipes-misc-support/cyrus-sasl/Fix-for-berkeley-db-5.patch


--
Regards
Samuel


