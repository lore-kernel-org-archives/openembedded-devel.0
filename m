Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RvPGf-0007hX-P6
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 09:22:13 +0100
Received: by lahc1 with SMTP id c1so1287353lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 00:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ArzZHrxFs6d3JXNzTHci+8ExgkvqzbNtggwYX4LtD0Q=;
	b=daXWoHo9BIferT8cImH1IbvdZ+8Ba5vVqnZXHyVEN8XPFpZk3QbhPCsQ1IHpvJW5Tq
	YoKQlqnKfthIeFLiGFqlwnj2nlJSOYZ/sDQ9PdRm3+nAeJEoX12yP1raujRdZqIjL/zc
	pB6zpQcNQHjh0da/qDOFk+2jp7Udiqquld1Rw=
MIME-Version: 1.0
Received: by 10.112.84.170 with SMTP id a10mr268956lbz.22.1328775249126; Thu,
	09 Feb 2012 00:14:09 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Thu, 9 Feb 2012 00:14:09 -0800 (PST)
In-Reply-To: <1328627573-5217-2-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<1328627573-5217-2-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 9 Feb 2012 09:14:09 +0100
Message-ID: <CALbNGRQYcHYZDX+Vvnor0ij+_q_XTs+GRc=gia1TSQ3Tws2Lig@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][RFC 01/27] systemd.bbclass: rework
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
X-List-Received-Date: Thu, 09 Feb 2012 08:22:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2012 at 4:12 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
Apart from the NAKed distro setting and automatic DEPENDS - are there
comments on the other:

let systemd.bbclass do more for us
>
> * handle multiple entries in SYSTEMD_SERVICE. Currenly there are no use c=
ases
> =A0but networkmanager has potential requirements
> * handle multiple entries in SYSTEMD_PACKAGES. Possible use cases are
> =A0dhcp/dhcp-relay and ntp/ntpdate
> * enhance the checks for SYSTEMD_PACKAGES and SYSTEMD_SERVICE. For packag=
e
> =A0names only <name-of-an-existing-package>-systemd or ${PN} are allowed.=
 In
> =A0case of using ${PN} a warning is spitted. This was introduced to force=
 recipe
> =A0maintainers to separate out systemd to own package.
> * all systemd packages are automatically created based on SYSTEMD_PACKAGE=
S
* for systemd packets  automatically add RDEPENDS to base packages
> * all *.socket and *.service files included by SRC_URI are automatically
> =A0installed from WORKDIR.
would it make sense to split this up and resend?

Andreas


