Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1US4Mp-0002L8-KZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 13:48:39 +0200
Received: by mail-ea0-f181.google.com with SMTP id z10so175952ead.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 04:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=2s6egGKqMJ1C7Fu45q5jEDB0nAa/WRmtphvL2c59k64=;
	b=gidRGMfMcjwypi41QvA2E9nxV8Ch6J0AsF0JNrkxUxi8kwJLhx1OdFZ4ZcdLR3Gc91
	sK9Yxp6iKqYNLtLdZIRUMGv96G90bQUrrhNCEvwWn1lSZo8teHkGbr3fqCx7N9RpQ9dB
	yZFh+QTx4bH4u7UUunBp8R1+jLnIbUXGfnp5KKCXMh0ARMXSvrBWNJ4FwhdnrLOF8xFL
	p2usz1N61nSqysPBsT9CymFnOSoo6pwUVuE0i/JDD6OELQxlFVlEvilGxZDTybawZGUZ
	7AfiR5+fC1ph7YQwqiUHoCM17BfScj93H3RM4VW7168ND/ESuCEsIZpOFizW5CAsYp9L
	52LQ==
X-Received: by 10.14.218.66 with SMTP id j42mr5312147eep.46.1366111830576;
	Tue, 16 Apr 2013 04:30:30 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id a41sm2363438eei.4.2013.04.16.04.30.29
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 04:30:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1561352.OujRcMfYWi@helios>
Date: Tue, 16 Apr 2013 13:30:29 +0200
Message-Id: <5C3F1A93-CC39-45E6-AF2B-FF29F50C67CD@dominion.thruhere.net>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
	<kkjbhk$h9r$1@ger.gmane.org> <1561352.OujRcMfYWi@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnhq9DUXedB+m4z2sWJTpzPeDMbnb3J6C7YHwgaSW5rrLb2JiMHlwYcrMqDmveJkVlDOe07
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking, meta-oe][PATCH 0/9] Move networking recipes to meta-networking
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
X-List-Received-Date: Tue, 16 Apr 2013 11:48:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 apr. 2013, om 13:19 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Tuesday 16 April 2013 13:09:46 Koen Kooi wrote:
>> These look good to me, but
>>=20
>>> iw: move to meta-networking and update
>>=20
>> This is receferenced by a packagegroup in meta-oe:
>>=20
>> 	meta-oe/recipes-core/packagegroups/packagegroup-basic.bb:
>> ${@base_contains("DISTRO_FEATURES", "wifi", "iw wpa-supplicant", "", =
d)} \
>>=20
>>=20
>> With the 'meta-oe shall only depend on oe-core' rule,=20
>=20
> Are you sure nothing in meta-oe depends on anything in other layers =
within=20
> meta-openembedded already?

I can't say for certain, but Martin and I have been very strict about it =
in the past. If there are such external dependencies they should be =
looked at and fixed.

regards,

Koen=


