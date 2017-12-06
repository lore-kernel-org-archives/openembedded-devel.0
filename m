Return-Path: <bill.randle@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id B852A786A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Dec 2017 02:16:31 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id r63so1613015oia.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Dec 2017 18:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Muvhri56ws8ZMM9kiWmMvvPWUC/hJQNRL1TcoWgaPJw=;
	b=ke/Idde3J1TSG26CXxMABUXfn6ohnikagWP5ZQIw23dlENgB+No3WxSdVYRI0mU/8I
	/762RKP45oxc9bNwVTbpk8alTGciVwNDzmFYO0zwbrhyPgmb+f1l/xzfWUOfcR3d4DSP
	7Z4Dc5oUgV6a8QYxak6bjw3Q5+8Vsj1MV1Xrd8SK8r3xfS96bOtwqCOR/w1XKqT/THFf
	sFk2zvU1N0ZdtsdTdZP3uJg6QGSRh7DrWiYqtS5KhpJU7XZakQuJ6tcQMf+jQdkPYZk9
	oRWvxTlfC7J/ox9aVjGhFXT9D6ieEfTIo8uXFVkxuc8RIOGbxsQJOUn3LC6ouFG0umIW
	35gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Muvhri56ws8ZMM9kiWmMvvPWUC/hJQNRL1TcoWgaPJw=;
	b=IbKFfAYIRq6ymbgRuf6fKMh2XS8dWxHrYW9c2Qv4tMbjFYfGMpKEWQprO/dnbe/8pX
	CXP7WFb3+bqvXqZ6iLPYe/mQgsZMO/hEm9N15UuY678N8LZEEFzkFhYgnhzQHMaIi2Lo
	EgMB6HxZVy5hQLiJG5ZlfnGTeX2/AVTVATpeqW1Sy7+VVYQyDy8EdY2EGyydoICdLVSL
	CZIflBibjo9nbbFQfUljC2Q7BSkHf3MINfJFa5SVUGdjVYi7fNgy5XB/If0L6tACkj9h
	XGKvCsyHlBB3PEu5SYowIITl2CrHVXmrxpHfRjICCGZp7aFikjydpEebzXYfYEdjXxaF
	Tlhg==
X-Gm-Message-State: AJaThX4tVteRd9r2zZfgBCmAHOadQcMT+R0SGYkKjsd69RvXwoXrQPmB
	QQ2Jm//ggRPECYKS+Eh7lDZzlDrct19nZvY/R38=
X-Google-Smtp-Source: AGs4zMZTuI6B1A5M47de8Sg8kSVkA7r6JzWeQPFZBSXjfFpwpplsTonJBEBl8+USNxT4EbaIx38tsiHno8lMi/SoLv4=
X-Received: by 10.202.253.73 with SMTP id b70mr19353111oii.279.1512526592476; 
	Tue, 05 Dec 2017 18:16:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.221.194 with HTTP; Tue, 5 Dec 2017 18:16:31 -0800 (PST)
In-Reply-To: <dca337bb-7a95-8161-f238-e4afa7113c10@gmail.com>
References: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
	<1512191576-2302-4-git-send-email-bill.randle@gmail.com>
	<dca337bb-7a95-8161-f238-e4afa7113c10@gmail.com>
From: Bill Randle <bill.randle@gmail.com>
Date: Tue, 5 Dec 2017 18:16:31 -0800
Message-ID: <CA+n--H9KGsCpNOuJ49JUtEBZAVwg6HceCDA4vcxFU1UDzNPWMg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Tim Smart <ticotim@gmail.com>, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH 03/13] python[3]-fask-migrate: new recipes
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
X-List-Received-Date: Wed, 06 Dec 2017 02:16:31 -0000
Content-Type: text/plain; charset="UTF-8"

Ouch! Good find. I'll issue a revised patch.

    -Bill

On Tue, Dec 5, 2017 at 6:13 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 12/01/2017 09:12 PM, Bill Randle wrote:
>> Signed-off-by: Bill Randle <bill.randle@gmail.com>
>> ---
>>  .../recipes-devtools/python/python-flask-migrate.inc       | 14 ++++++++++++++
>>  .../recipes-devtools/python/python-flask-migrate_2.1.1.bb  |  2 ++
>>  .../recipes-devtools/python/python3-flask-migrate_2.1.1.bb |  2 ++
>>  3 files changed, 18 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python-flask-migrate.inc
>>  create mode 100644 meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb
>>  create mode 100644 meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-flask-migrate.inc b/meta-python/recipes-devtools/python/python-flask-migrate.inc
>> new file mode 100644
>> index 0000000..7af4fe1
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-flask-migrate.inc
>> @@ -0,0 +1,14 @@
>> +DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alembic"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
>> +
>> +SRC_URI[md5sum] = "def4106c80897b7fad2afb3bc05360e4"
>> +SRC_URI[sha256sum] = "b709ca8642559c3c5a81a33ab10839fa052177accd5ba821047a99db635255ed"
>> +
>> +PYPI_PACKAGE = "Flask-Migrate"
>> +
>> +RDEPENDS_${PN} += "\
>> +    ${PYTHON_PN}-flask-sqlalchemy \
>> +    ${PYTHON_PN}-alembic \
>> +    ${PYTHON_PN}-flask \
>> +    "
>> diff --git a/meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb b/meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb
>> new file mode 100644
>> index 0000000..af79997
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb
>> @@ -0,0 +1,2 @@
>> +inherit pypi setuptools
>> +require python-flask-migrate
>> diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb
>> new file mode 100644
>> index 0000000..94abbf3
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb
>> @@ -0,0 +1,2 @@
>> +inherit pypi setuptools3
> Found issue
>> +require python-flask-migrate  <<<-- missing .inc
>
> - armin
>

