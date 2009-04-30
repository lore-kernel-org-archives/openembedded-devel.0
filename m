Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LzTRF-0003vl-4U
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Apr 2009 12:24:21 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1088671yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Apr 2009 03:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=CGmNTjUooipiv/SVE/SUiFrmBU0jFnxtpooCFCdrFfk=;
	b=q94hUVyv2Xlu6AdZj4DMMup4vOLFR0oim3tkQypSZe2c7ANdhH8wnrPTkdHXat7Pe6
	4JFrQ+s1r/cIPZrsHf1YLGN70aEKsiDQzM9klV4CeokMTS9/NpkylBmAHdiowSLFxo04
	oHdqf7sU4n2lUdGzXdQub+SV+Q4NtfkPnMNtY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=noTORUCFMfoQ7V5M/b0vZl+K1x0uZAbx2c6Skpce2lgoTwjt+jq1kd24syi8xhCoIf
	5c2sOgLiNAxZHk6IvJ2FC4/7w0WmClAuWmYoNtlMgpo8fdKlnjryAbW0m9+jtKZ3mGMY
	haIZzEQu6RDVdXYblBzFCClTSt9dD1P+T48BY=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.231.30.198 with SMTP id v6mr1198497ibc.26.1241086739626; Thu, 
	30 Apr 2009 03:18:59 -0700 (PDT)
In-Reply-To: <1241079609-5912-1-git-send-email-khimov@altell.ru>
References: <be7a9f3d0904270832j4832bc6fqcf058fdfc3d8479@mail.gmail.com>
	<1241079609-5912-1-git-send-email-khimov@altell.ru>
Date: Thu, 30 Apr 2009 07:18:59 -0300
X-Google-Sender-Auth: b7cd59e76f1f9722
Message-ID: <be7a9f3d0904300318m4916cf61vc0fd0d099f69f3fe@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/4] coreutils: add version 7.2
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
X-List-Received-Date: Thu, 30 Apr 2009 10:24:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Roman,

On Thu, Apr 30, 2009 at 5:20 AM, Roman I Khimov <khimov@altell.ru> wrote:
> ---
> =A0conf/checksums.ini =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 =A04 +
> =A0.../coreutils/coreutils-7.2/automake-version.patch | =A0 13 +++
> =A0recipes/coreutils/coreutils-7.2/man.patch =A0 =A0 =A0 =A0 =A0| =A0 47 =
+++++++++++
> =A0recipes/coreutils/coreutils-7.2/onceonly.m4 =A0 =A0 =A0 =A0| =A0 63 ++=
++++++++++++
> =A0recipes/coreutils/coreutils-native_7.2.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
5 +
> =A0recipes/coreutils/coreutils_7.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 88 ++++++++++++++++++++
> =A06 files changed, 220 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/coreutils/coreutils-7.2/automake-version.pa=
tch
> =A0create mode 100644 recipes/coreutils/coreutils-7.2/man.patch
> =A0create mode 100644 recipes/coreutils/coreutils-7.2/onceonly.m4
> =A0create mode 100644 recipes/coreutils/coreutils-native_7.2.bb
> =A0create mode 100644 recipes/coreutils/coreutils_7.2.bb
[...]

Please take a look at #525048 Debian's bug about sort segfault. It
should be included on this to avoid problems.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


