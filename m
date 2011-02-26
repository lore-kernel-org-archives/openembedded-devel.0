Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PtKSG-0002PZ-QR
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 14:45:05 +0100
Received: by bwz10 with SMTP id 10so2700537bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Feb 2011 05:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=tEynZ3eRjpLreIr41+sOqRqOP4dUwkVuIHF31HBCQgc=;
	b=Ec4dGAG+zMpBhMsBpzDK7Ns8/SAObKhXPZxyaJL66LfSbrwZ+5ESusnAnBSQ3r/XI7
	/dNDii1jgC8e4OnBfe4cgGgjs69874QHZ9+X0QAIeJzVv9HhQnjxMLk3OYLlej5nzcEF
	pVJhW4+vfncBSNUkor6rCzqPbBESPdBHcT+58=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=ETsrJ8yO2eOZL/W6RxMPrM3fw1feBFu/NTUGzFxm/bWBrapPN/wG52LMGHkLp2zCPx
	9XCDRWzdfYLehNAI4brhvre1FiEgQ8mTY7h3znG4GUKdTk/wqFASL4LjENVXGpStJGrm
	F/0TQOnxh00adZHu2T30IbSPvDQKJ+KZJ2TUM=
MIME-Version: 1.0
Received: by 10.204.12.84 with SMTP id w20mr3129105bkw.43.1298727817452; Sat,
	26 Feb 2011 05:43:37 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Sat, 26 Feb 2011 05:43:37 -0800 (PST)
In-Reply-To: <1298669695.3818.5.camel@lenovo.internal.reciva.com>
References: <AANLkTiknqQ6xLj8LFv4=17ymwSbVhD3C9kVe2qkviXhX@mail.gmail.com>
	<1298664057.3818.0.camel@lenovo.internal.reciva.com>
	<AANLkTin2WuKF=f_aOzi=28FmVTaxFVJa0uNb9TjfL2SB@mail.gmail.com>
	<1298666406.3818.4.camel@lenovo.internal.reciva.com>
	<AANLkTinUjtis22ZnLaP7uc0fa9nzxvhWod2uv43ZcJH=@mail.gmail.com>
	<1298669695.3818.5.camel@lenovo.internal.reciva.com>
Date: Sat, 26 Feb 2011 13:43:37 +0000
X-Google-Sender-Auth: h2Mp5tlIkPOzzq-QM5wP8o0W2kM
Message-ID: <AANLkTi=afktV1HC4Jdq_ammNdA+h4iMAWdJT809s+LMv@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Missing GLIBC_<version> tags on binaries
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
X-List-Received-Date: Sat, 26 Feb 2011 13:45:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2011 at 21:34, Phil Blundell <philb@gnu.org> wrote:
> Is it actually including -lpthread during final link? =A0Failing to do
> that is the most obvious reason for not getting the right version
> information.

It does -pthread that supposelly does it plus -D_REENTRANT IIRC.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


