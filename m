Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 277506C5A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 13:20:41 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id a205-v6so14062279itd.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 05:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=izcqBeA9vUd28ephINDjPa0/ZeAXl6XXZK+DHw3GBRE=;
	b=YkC7mbER/Ojo53nR1nMOuEIWGzxd582qEEUXnfYxBDWb/TpDNnOnknrFD2puyua1zs
	qkkUuIdGcJFJ/nznV8oLhGLnmDM/W/n2NO6rEWxge5ecn9SbhpbkqX4jKEirdF4Aph2N
	RDDXjwxP3OX+CqQ8yj/owOd9yD3l10nYiVxK7IzQDfCexfuVqi0H2juAszXx1ImDrzqk
	+eDRWcc8A3NK/VZZLKO2SHGfjH+yJyjRc/8M1qUm+5RLPcaRt8PgXXoF1zNN48AtN/9h
	+yZ4cqcvCcrNoFOLI5oWkVhggg7mIrDeJi6YHX1XEwtL0A29aALJHkXWj4Zeg2hQSaEE
	nsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=izcqBeA9vUd28ephINDjPa0/ZeAXl6XXZK+DHw3GBRE=;
	b=Gm/3fHEM4N09f5iP70cW8RcBYPaY8TGaRQU1/zbJ0SiETZAkfDWwHfZ6WAQCn+gs7j
	kCehajd8WTE+G6KtuxqavuVF8B3j+pqWuk9j3F8k2F3Db84kdDw74gWgsz3M3j/ye+Yz
	MiyizOXYAbBQT9QJTAh/Gzw9QlgoGUIsbZz3eBC2UeLLrCwqG3U9XOYfa+fo+MMLL9La
	xX5nWrtuQzZHG/RNx2NSb5+reXMY4eVkfQiUiW9atn7RUD4shW2AFRFECB7NcLESzo1S
	2ndm8RDUYirKq0rlq8LnJHiBN8thuiRkvmj9xE9ezMTG3KfEtPEvewVmyciBFlYS1LEc
	oSBw==
X-Gm-Message-State: AGRZ1gLUYwytM4fqGVs+k24dCcfrvnmAUN01nCPzv2Fdj9IEKLnxZ3DQ
	LK4C4RdFyQoFRtoC4kslAeUSUPbUWYnJjxsbyQM87fPz
X-Google-Smtp-Source: AJdET5dFRLK8+BwZB/l/qOO2BmNSTyOKXqjvoo55olOM5WiyO17KsLcTtFUR3e7E1D66NF1iVgSXoy8b3idDvt6GQ8E=
X-Received: by 2002:a24:ce45:: with SMTP id
	v66-v6mr8992283itg.26.1542892842202; 
	Thu, 22 Nov 2018 05:20:42 -0800 (PST)
MIME-Version: 1.0
References: <20181121081012.118414-3-martin@geanix.com>
	<20181122124817.26024-1-martin@geanix.com>
In-Reply-To: <20181122124817.26024-1-martin@geanix.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Nov 2018 13:20:30 +0000
Message-ID: <CAJTo0La1uEh7kW05jh3uTgv7Xd99YpB=aHkV_YiVGZAxHY7WsA@mail.gmail.com>
To: martin@geanix.com
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv2] iwd: add version 0.12
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
X-List-Received-Date: Thu, 22 Nov 2018 13:20:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Nov 2018 at 12:48, Martin Hundeb=C3=B8ll <martin@geanix.com> wro=
te:
> +DEPENDS +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'readline', '',=
 d)}"

Better to fix the makefile so it doesn't build the client test if the
client is disabled?

> +SRC_URI =3D " \
> +    git://git.kernel.org/pub/scm/network/wireless/iwd.git \
> +    file://0001-configure.ac-enable-serial-tests-in-automake-to-supp.pat=
ch \

Oh, I've a patch to automake to make this redundant.  I'll dig it out
and post to oe-core.

> +HAVE_SYSTEMD =3D "${@bb.utils.contains('PACKAGECONFIG', 'systemd', True,=
 False, d)}"
> +
> +# iwd service
> +SYSTEMD_SERVICE_${PN} =3D "${@'iwd.service' if bb.utils.to_boolean(d.get=
Var('HAVE_SYSTEMD')) else ''}"
> +FILES_${PN} +=3D " \
> +    ${datadir}/dbus-1/system.d/iwd-dbus.conf \
> +    ${datadir}/dbus-1/system-services/net.connman.iwd.service \
> +"

No need, if systemd is disabled then the class won't do anything.

> +# iwctl tool
> +PN_CLIENT =3D "${@bb.utils.contains('PACKAGECONFIG', 'client', '${PN}-cl=
ient', '', d)}"
> +RRECOMMENDS_${PN} +=3D "${PN_CLIENT}"
> +PACKAGE_BEFORE_PN +=3D "${PN_CLIENT}"
> +FILES_${PN}-client +=3D "${bindir}/iwctl"

I'm generally against massively splitting up recipes in the name of
modularity as it just complicates recipes.  Unless there's a good
reason I'd say just put the daemon, the client, and the extra parts
(such as EAD) in the same package.  It's not like anyone would want to
install the client but not the daemon, or installing the client
alongside the daemon would be a huge waste of space.

Ross

