Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 87E517FD36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 06:42:50 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d16so14632130wre.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 22:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qm8ouff1jBgtRnFZgKS3CAaeuQfQiTEr5phst+H1R8o=;
	b=ltBaUC6lbPs3mDBD/CBkCfXTCqTiQlv5ZGXFf6A+OFFrsXC+bg/UhOhr6LOOzzXOEM
	wr/jKEHqIXs/+arxMOYavN4a5QNLjDtsKd/13dR8wOw1Ygbcuwd75Ja5EOr84tFfqMxK
	hUs58dulF0i/xIr5rSAHEWe6FsHJhNicjaXor/EmLXbk9VrYLTJd5Lt89NAFHJchlcMu
	yHvusmRUdicQXGQkQegvFMPzliMTkHZm1gmN8KCchCXph05Pu4zQFccxSNo/4q57NGP1
	EaDnrpPnhu4Lzlm6CmRTrIxtYZd8rKpkMTlC2MXLv/arx+XhfcnpSOV/iXc5eRT4A2We
	GMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qm8ouff1jBgtRnFZgKS3CAaeuQfQiTEr5phst+H1R8o=;
	b=nK9gI8KWq0F3yG861k1FU2I1YFUDJlyseCGCkOaKZn1xU4ieInPBTduCD5h2k7MPvD
	lRsulMge5drSc3SqhjfC36ZtGjnpf3Da5z2gTnufeX9iqySwiZn3KOoCUMp6s0wA/Prf
	nZge7q9LldoJZ5JdkJYSm4S0aWt2uSwtCXg7ipj0fZ0/JKEYRdvBJABoZnkUGjYHFKUH
	D1SOgnoidrYdPU2FjJ6qmIQZB1BwUEvO6YIcUozjabWMYJ93+La+4dMhoRhKR3YS1AAK
	RCZm1sNTXWauq57uJkrh6Ca+drNTwmiQd1LGbJajAiG+bamUWJDlpY+3LdVB1Iv2IvL7
	P9Wg==
X-Gm-Message-State: APjAAAXiDlsb2GZIw8BbIR5u5Jpgg/t8lMYEIeDGKTyDsetdzjVCPy7w
	/6eU2QxSBSZBIwbuADbsrk2YnBXhrz1hSdyMqvg=
X-Google-Smtp-Source: APXvYqwtdfqSoFVPBUbg25kncKOl6No62M4FSIBS8jsJ6c0/P8ovGM3ivYlL/sS3q8eWCbFNVMSjiBKrXnNh5hn8RnM=
X-Received: by 2002:adf:fe90:: with SMTP id l16mr26344293wrr.265.1580193771252;
	Mon, 27 Jan 2020 22:42:51 -0800 (PST)
MIME-Version: 1.0
References: <20200127231234.26090-1-andrey.z@gmail.com>
	<CANx9H-CFuV6qACC8avZQUzLLCiDx3iiKWzpFqxSS9mxtnrG_aw@mail.gmail.com>
	<CANx9H-Aqfjqk+DHEKU6i=cqfwhxrKYxvXj0+iePDxw6LCeBfoA@mail.gmail.com>
In-Reply-To: <CANx9H-Aqfjqk+DHEKU6i=cqfwhxrKYxvXj0+iePDxw6LCeBfoA@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Tue, 28 Jan 2020 07:42:40 +0100
Message-ID: <CAHtQpK7UsCX4--Zn60p_vGY2be4dbiDwLJZgcV2Sup25rG8UZA@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
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
X-List-Received-Date: Tue, 28 Jan 2020 06:42:50 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Tim,

On Tue, Jan 28, 2020 at 5:37 AM Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Mon, Jan 27, 2020 at 6:47 PM Tim Orling <ticotimo@gmail.com> wrote:
>>
>> It's moving from meta-networking, not oe-core. I'll simply change the commit log locally before merging.
>>
>> On Mon, Jan 27, 2020 at 3:12 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>>>
>>> dnssec-conf did not receive any updates since 2010 and relies heavily on
>>> python2 code base.
>>>
>>> Move recipe to this layer, since python2 support has been dropped in
>>> oe-core.
>>>
>
> There were missing RDEPENDS which I have fixed and sent to ML (already merged). While I was at it I sent the version of this patch that was actually merged. Obviously nobody has been using this since it could not have worked without the RDEPENDS.

Thanks for taking care of this! Sorry I've missed those RDEPENDS, I
had no possibility to test runtime of this package. But it looks like
it would not have worked even in the the [meta-networking] layer
before (other than people using it would have those packages pulled by
IMAGE_INSTALL).

>
>
>>> Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
>>> ---
>>>  .../dnssec-conf/dnssec-conf_2.02.bb           | 35 +++++++++++++++++++
>>>  1 file changed, 35 insertions(+)
>>>  create mode 100644 recipes-support/dnssec-conf/dnssec-conf_2.02.bb
>>>
>>> diff --git a/recipes-support/dnssec-conf/dnssec-conf_2.02.bb b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
>>> new file mode 100644
>>> index 0000000..ca59bd2
>>> --- /dev/null
>>> +++ b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
>>> @@ -0,0 +1,35 @@
>>> +SUMMARY = "DNSSEC and DLV configuration and priming tool"
>>> +DESCRIPTION = "\
>>> +DNSSEC configuration and priming tool. Keys are required until the root \
>>> +is signed, as well as for local unpublished DNSSEC keys to be preloaded \
>>> +into the recursive nameserver. These DNSSEC configuration files can be \
>>> +directly included in the bind or unbound nameserver configuration files. \
>>> +dnssec-conf includes a commandline configuration client for Bind and \
>>> +Unbound, known DNSSEC keys, URL's to official publication pages of keys, \
>>> +and harvested keys, as well a script to harvest DNSKEY's from DNS. \
>>> +See also: system-config-dnssec"
>>> +HOMEPAGE = "https://github.com/xelerance/dnssec-conf"
>>> +SECTION = "net"
>>> +LICENSE = "GPLv2+"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
>>> +DEPENDS += "xmlto-native docbook-xml-dtd4-native \
>>> +            docbook-xsl-stylesheets-native libxslt-native"
>>> +
>>> +SRC_URI = "git://github.com/xelerance/dnssec-conf.git"
>>> +SRCREV = "8e799683736b4a7b5e5e78f98fba0a6f48393537"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +do_install () {
>>> +    rm -rf ${D}
>>> +    make PREFIX=${prefix} DESTDIR=${D} ETCDIR=${D}${sysconfdir} install
>>> +    # We no longer ship trust anchors. Most of these are in the DLV Registry now.
>>> +    # and it prevents the problem of shipping outdated trust anchors.
>>> +    # For DLV, we ship the ISC DLV Registry key
>>> +    rm -rf ${D}${sysconfdir}/pki/dnssec-keys/harvest/*
>>> +    rm -rf ${D}${sysconfdir}/pki/dnssec-keys/production/reverse/*
>>> +    install -d -m 0755 ${D}${sysconfdir}/sysconfig
>>> +    install -m 0644 packaging/fedora/dnssec.sysconfig ${D}${sysconfdir}/sysconfig/dnssec
>>> +}
>>> +
>>> +RDEPENDS_${PN} = "python"
>>> --
>>> 2.17.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Regards,
Andrey.

