Return-Path: <cjp256@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3ACD26AC37
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Dec 2015 15:16:02 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id 186so119459687iow.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Dec 2015 07:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=i5XxbcaGvYBR7LC2fi5l+0mXfkNVjJxkZ/sy0L9hbHo=;
	b=wUux1HX/nb/dx9dqhFFxCe2iMSDqoc6Jygk5X+esWyFx0lQjqAQyOCWmnTPlYHQEk7
	PVXLkEudnSEhSkP9X8aMymso6BEKy3CRHXhJdLxdNt2kPZ5xf7mApbVOYDMfeHBj3cEf
	DWU5C5P+JEIeCEVtMB51qMinm5K5BWO1NQcrPujgcnZahB46n4/BYZe0/P0wY9ak5W34
	2WJB+LulNzhXN8Rgdcrte4n2OU/I0GlWZau0wcSylM1eTluTmly0tQlKYS0/M355Eq0z
	mvDkE930Qjz2bMfjy8pi2yp3qD+lM6Aif1fNzKLW5jfnZJhCHOeEtq/KUqCs1abplmf2
	+fNw==
MIME-Version: 1.0
X-Received: by 10.107.28.82 with SMTP id c79mr10296258ioc.86.1450538163232;
	Sat, 19 Dec 2015 07:16:03 -0800 (PST)
Received: by 10.79.95.6 with HTTP; Sat, 19 Dec 2015 07:16:03 -0800 (PST)
In-Reply-To: <CAMKF1spvhZi0v4Kw4r1KvmtO6qYyptZ45uuSOD8+BPrvPTDyWg@mail.gmail.com>
References: <1450471782-25731-1-git-send-email-cjp256@gmail.com>
	<CAMKF1spvhZi0v4Kw4r1KvmtO6qYyptZ45uuSOD8+BPrvPTDyWg@mail.gmail.com>
Date: Sat, 19 Dec 2015 10:16:03 -0500
Message-ID: <CABZSBQd9REH2oQA00JRaP7LVzxA=uC-BprcjKoSuH0GfNtnMAA@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: Re: [meta-networking][PATCH 1/3] strongswan: add additional PACKAGECONFIG flags
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
X-List-Received-Date: Sat, 19 Dec 2015 15:16:04 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 18, 2015 at 11:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Shouldnt openssl be a packageconfig too

Yes, I added PACKAGECONFIG[openssl] and openssl to the default
PACKAGECONFIG.  Or is there something else I am missing? :)

Cheers,
-Chris

>> -PACKAGECONFIG ??= "sqlite3 curl \
>> +PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
>> ...
>> +PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl,"

