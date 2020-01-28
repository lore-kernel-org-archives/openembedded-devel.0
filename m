Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id E0F106C3B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 04:37:27 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id f10so9524376ils.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 20:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lqFOiG7YBz3yt/R2aFOUCmMrdXLbDuWKnE3BI9s4jUM=;
	b=Y+7pUovqdq3Omz/SiD21zYONfwru5Dp+Rq3Ob1XLnDLjNwJHgju406Ojruv2PA5m6u
	nSutPyCkZRNfPdDHOeNEM70UtrjxGGhfngazpPT2vXDMrM2BNvS1qe8oYcSSF239ZMMT
	UCvoz+lCMOCRvq7CVomS8kgiQjDwKpcm8TWwMYaAw1J+h6qUxw85Fbau/a+U6pFkVeP8
	+AFFiWud2IhYgFbut6Jw2zMEPCzFTQxNwPg9vqhETWJGTk0fE9GMryOLRS70YpTVxjN/
	pwqAc9S5ox7KPNnxE7w7RZfwe9dKABc+AOHlplXl8YvBCKLc1dfA5OyVaG/bENd/yvqJ
	Rbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lqFOiG7YBz3yt/R2aFOUCmMrdXLbDuWKnE3BI9s4jUM=;
	b=hgMGuDNSUOw1OQWGKU8PKUBt09J8SzQlXsba9YxnDhStbZZzx4U8jbRIcJ24Ji3bG2
	SDask41PU1cptH3NDZy2+a407zi5sPMP9PAavEtLYMtl6HSVkjn4b6pCzs3nmqF9JzOY
	SwxJ2PXNFSyEQcIBqxkprxofkFnRadCgRP2F0xXxP0bfaK1tctxerQjqd0f4tg1GOg3U
	rWlEw1IGtL4AlnDmj+xV6El3G5CS1XyrmQW7yAZv5+HcR8wewkXfktJCy7DnmUgLEDED
	MQug2q1P4zyNro/M0MB8yhA6+MUTf+mXhRxbWVmrwE+PQqvfllXpAwVpBa9PPMl0Wvm+
	CxIQ==
X-Gm-Message-State: APjAAAUJMIeNgF8RhrDF8OwNJzOcghIshejWrvxBp1m1hsrUdE9UTq/F
	6ZtP18nirEF6pPsNcNbzKmyUMN638ovgOWMHY2Y=
X-Google-Smtp-Source: APXvYqxZe7WoGtvfgM38/kBogYjYrXLZvciBbcIQ+PS25mnblisOgu60GDanHjbOz0+/JXQOUT9E3UVKksihz1xX7X4=
X-Received: by 2002:a92:8686:: with SMTP id l6mr14853892ilh.170.1580186248363; 
	Mon, 27 Jan 2020 20:37:28 -0800 (PST)
MIME-Version: 1.0
References: <20200127231234.26090-1-andrey.z@gmail.com>
	<CANx9H-CFuV6qACC8avZQUzLLCiDx3iiKWzpFqxSS9mxtnrG_aw@mail.gmail.com>
In-Reply-To: <CANx9H-CFuV6qACC8avZQUzLLCiDx3iiKWzpFqxSS9mxtnrG_aw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 27 Jan 2020 20:37:16 -0800
Message-ID: <CANx9H-Aqfjqk+DHEKU6i=cqfwhxrKYxvXj0+iePDxw6LCeBfoA@mail.gmail.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python2][PATCH] dnssec-conf: move recipe from oe-core to meta-python2
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
X-List-Received-Date: Tue, 28 Jan 2020 04:37:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 6:47 PM Tim Orling <ticotimo@gmail.com> wrote:

> It's moving from meta-networking, not oe-core. I'll simply change the
> commit log locally before merging.
>
> On Mon, Jan 27, 2020 at 3:12 PM Andrey Zhizhikin <andrey.z@gmail.com>
> wrote:
>
>> dnssec-conf did not receive any updates since 2010 and relies heavily on
>> python2 code base.
>>
>> Move recipe to this layer, since python2 support has been dropped in
>> oe-core.
>>
>>
There were missing RDEPENDS which I have fixed and sent to ML (already
merged). While I was at it I sent the version of this patch that was
actually merged. Obviously nobody has been using this since it could not
have worked without the RDEPENDS.


Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
>> ---
>>  .../dnssec-conf/dnssec-conf_2.02.bb           | 35 +++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>  create mode 100644 recipes-support/dnssec-conf/dnssec-conf_2.02.bb
>>
>> diff --git a/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
>> b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
>> new file mode 100644
>> index 0000000..ca59bd2
>> --- /dev/null
>> +++ b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
>> @@ -0,0 +1,35 @@
>> +SUMMARY = "DNSSEC and DLV configuration and priming tool"
>> +DESCRIPTION = "\
>> +DNSSEC configuration and priming tool. Keys are required until the root \
>> +is signed, as well as for local unpublished DNSSEC keys to be preloaded \
>> +into the recursive nameserver. These DNSSEC configuration files can be \
>> +directly included in the bind or unbound nameserver configuration files.
>> \
>> +dnssec-conf includes a commandline configuration client for Bind and \
>> +Unbound, known DNSSEC keys, URL's to official publication pages of keys,
>> \
>> +and harvested keys, as well a script to harvest DNSKEY's from DNS. \
>> +See also: system-config-dnssec"
>> +HOMEPAGE = "https://github.com/xelerance/dnssec-conf"
>> +SECTION = "net"
>> +LICENSE = "GPLv2+"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
>> +DEPENDS += "xmlto-native docbook-xml-dtd4-native \
>> +            docbook-xsl-stylesheets-native libxslt-native"
>> +
>> +SRC_URI = "git://github.com/xelerance/dnssec-conf.git"
>> +SRCREV = "8e799683736b4a7b5e5e78f98fba0a6f48393537"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +do_install () {
>> +    rm -rf ${D}
>> +    make PREFIX=${prefix} DESTDIR=${D} ETCDIR=${D}${sysconfdir} install
>> +    # We no longer ship trust anchors. Most of these are in the DLV
>> Registry now.
>> +    # and it prevents the problem of shipping outdated trust anchors.
>> +    # For DLV, we ship the ISC DLV Registry key
>> +    rm -rf ${D}${sysconfdir}/pki/dnssec-keys/harvest/*
>> +    rm -rf ${D}${sysconfdir}/pki/dnssec-keys/production/reverse/*
>> +    install -d -m 0755 ${D}${sysconfdir}/sysconfig
>> +    install -m 0644 packaging/fedora/dnssec.sysconfig
>> ${D}${sysconfdir}/sysconfig/dnssec
>> +}
>> +
>> +RDEPENDS_${PN} = "python"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

