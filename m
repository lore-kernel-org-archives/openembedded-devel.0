Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 58BE17E3F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2019 18:03:41 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id 16so13484489ljv.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2019 11:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=iSera7N57DAgoMgkuPh/loNY28VmHf0msQroln7RLu0=;
	b=uTL2axWq0jxd3WC8A1bkW4fua+DH3bGQpyI6wUFVM5+ltSWEZfNQNPOYe8FlENbDP8
	ic4HHwATgiO4O4tz5ENVjO9Q/KYY3VYDZjLGoCwq/TTkAVxTpxjx+yhmd9FYM41Otywf
	4pAQfss3lU/3IVHbx5H/kP2WSY5Em8rEWMGO3c7KgZF/w/YA6ULwllvw5CDe7I5iDzx7
	Uf0wxzwgbFu59QnTaYnyLi7+z+xgD74IJ6DqUIV4dcVVFabdFD87935SLwr3xwGuhOku
	FaIzs39wBF3X7v88jIgv4eyz+ubmhwrNElkKJnSXDUtfbHgaJ1il8dSLLsvuIrS9TAK2
	8U3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=iSera7N57DAgoMgkuPh/loNY28VmHf0msQroln7RLu0=;
	b=RmEm8WHsUn8ga7g798F3OAyNxXNUWkVvs2kZp5lTT3zHvPPINRYl35WdaCyaw5qFr3
	fZksiSkWMhzhQy4zCi+B69Qk4NgZlNGgnxE8lIPU0DSinl1ZWNb0bEt7c9phSOI8t+Yg
	/ho716CZH8AD+u9GIULkNvQCVGKAggj2VrNrMs/zup7PjQit0gillVefqF9ab1kSaedl
	5jAoEMbVHh+6qfWqf8O7yayejIlYzng3fyV4mWEsFitvx47q2tou21YJXHRF5gHrCxfb
	TlyqphHtPzN0Htchh4zD/Mump0l9rNkJgRj6pTvL0kj2Y6pbwA+Wt22J84clMYgmQ9+H
	u6gQ==
X-Gm-Message-State: APjAAAVwOwuC+EqYiVpXSxAlETk32pS54BJNumqi+Ne+CjrrzYvfISd4
	YM5FS/R37WRYhigs1LdGtez+cmhUTsY=
X-Google-Smtp-Source: APXvYqy0h+1A1AFYOvmTwhBiCYE4RT+cMc/hDI5vYzSIoi18oixvQBWBNzEEVDsNj+RPbYup4QIv7Q==
X-Received: by 2002:a2e:89c8:: with SMTP id c8mr31198258ljk.70.1561399421528; 
	Mon, 24 Jun 2019 11:03:41 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id u9sm1635623lfb.38.2019.06.24.11.03.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jun 2019 11:03:40 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20190623223554.13989-1-open.source@oleksandr-kravchuk.com>
	<CAMKF1soezey1nig9E+7ZGt_Lq=tycPfL0-OXMvdFaeRomai3+w@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <3e80014a-a5fa-ebf2-4617-29fd4dd67456@oleksandr-kravchuk.com>
Date: Mon, 24 Jun 2019 20:03:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soezey1nig9E+7ZGt_Lq=tycPfL0-OXMvdFaeRomai3+w@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] nuttcp: add systemd unit file
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
X-List-Received-Date: Mon, 24 Jun 2019 18:03:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I thought the same. I am not sure how this is supposed to work, but when
I add `inherit systemd`, unit files do not end up in the package.

On 24/06/2019 02:54, Khem Raj wrote:
> On Sun, Jun 23, 2019 at 3:36 PM Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  .../recipes-support/nuttcp/nuttcp/nuttcp.socket      |  9 +++++++++
>>  .../recipes-support/nuttcp/nuttcp/nuttcp@.service    |  8 ++++++++
>>  .../recipes-support/nuttcp/nuttcp_8.2.2.bb           | 12 +++++++++++-
>>  3 files changed, 28 insertions(+), 1 deletion(-)
>>  create mode 100644 meta-networking/recipes-support/nuttcp/nuttcp/nuttcp.socket
>>  create mode 100644 meta-networking/recipes-support/nuttcp/nuttcp/nuttcp@.service
>>
>> diff --git a/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp.socket b/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp.socket
>> new file mode 100644
>> index 000000000..a8ae74fb8
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp.socket
>> @@ -0,0 +1,9 @@
>> +[Unit]
>> +Description=Network Performance Testing Server Activation Socket
>> +
>> +[Socket]
>> +ListenStream=5000
>> +Accept=true
>> +
>> +[Install]
>> +WantedBy=sockets.target
>> diff --git a/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp@.service b/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp@.service
>> new file mode 100644
>> index 000000000..b778e8552
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp@.service
>> @@ -0,0 +1,8 @@
>> +[Unit]
>> +Description=Network Performance Testing Server
>> +After=local-fs.target
>> +
>> +[Service]
>> +User=nobody
>> +ExecStart=/usr/bin/nuttcp -S
>> +StandardInput=socket
>> diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
>> index 2fd563123..193caf3cf 100644
>> --- a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
>> +++ b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
>> @@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://${BP}.c;beginline=4;endline=30;md5=496a7c0bb83c07ff52
>>
>>  UPSTREAM_CHECK_URI = "https://www.nuttcp.net/nuttcp/beta/"
>>
>> -SRC_URI = "http://nuttcp.net/${BPN}/beta/${BP}.c"
>> +SRC_URI = "http://nuttcp.net/${BPN}/beta/${BP}.c \
>> +           file://nuttcp@.service \
>> +           file://nuttcp.socket"
>>  SRC_URI[md5sum] = "d3c92c4d2f261221193c3726c1b9a42f"
>>  SRC_URI[sha256sum] = "8c5595bcd27c2fd66831be74c390df078cfb1870aa427f2511ac2586d236c8a1"
>>
> I think we also need to inherit systemd bbclass,
>
>> @@ -24,5 +26,13 @@ do_compile () {
>>
>>  do_install () {
>>      install -d ${D}${bindir}
>> +    install -d ${D}${systemd_system_unitdir}
>>      install -m 0755 nuttcp ${D}${bindir}
>> +    install -m 0644 ${WORKDIR}/nuttcp@.service ${D}${systemd_system_unitdir}
>> +    install -m 0644 ${WORKDIR}/nuttcp.socket ${D}${systemd_system_unitdir}
>>  }
>> +
>> +FILES_${PN} += " \
>> +    ${bindir} \
>> +    ${systemd_system_unitdir} \
>> +"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

