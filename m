Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PbCfk-0001rD-3Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 14:48:04 +0100
Received: by bwz10 with SMTP id 10so16614665bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 05:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=dewh/+y1PDzGFi37Gk7WuJtp0Y3270Af6ZXldr4VSzw=;
	b=hu1GnvRP7Z/3RFxDUztGc931LhqQ21ZJRqBGlk8Pe3xntRyGf9YtYomuAXIN7lTwDY
	C9xD+d77HtZ4jp0UdO7KJu3LRh9r2Gco9534CkWA0zZa0SVm9wfITyu+lvog2f7wocQ9
	lOKNL1gXub7JBV9/4qx9WdzP8W703xHPY9O2M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=iS3pMvshHH2ddDagXsHyeaA5w2CkSBzvIKvVVdl9jRXmVGWJTb4qLntc7wepC8CxPr
	4R7w83UYzAz/0QEAC4gKgOR4vPrtW6l1A0TYLFGA+iMzfLcyojPrc9A6kStRIikNvEQI
	A4kML2NxXichNyyAVX/PWVWY7oLW/BIYu3GDM=
MIME-Version: 1.0
Received: by 10.204.122.68 with SMTP id k4mr7845415bkr.153.1294408057689; Fri,
	07 Jan 2011 05:47:37 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Fri, 7 Jan 2011 05:47:37 -0800 (PST)
In-Reply-To: <1294392497-24747-1-git-send-email-raj.khem@gmail.com>
References: <1294392497-24747-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 7 Jan 2011 11:47:37 -0200
X-Google-Sender-Auth: 8ToSzFgdlWVP5XJnxzBjI_2dTxI
Message-ID: <AANLkTi=UUDxkTNDoWBoOxaCPDyupG8BazYtt6nGs3-7E@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Make it configurable by tuning eglibc options
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
X-List-Received-Date: Fri, 07 Jan 2011 13:48:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 7, 2011 at 07:28, Khem Raj <raj.khem@gmail.com> wrote:
> * Look for disabled features in DISTRO_FEATURES and disable them while bu=
ilding eglibc
> * By default all features are built
> * One can disable a feature by specifying DISTRO_FEATURES +=3D "noinet6 n=
obsd ...." e.g.

Awesome.

Do you think we could do something similar to busybox to avoid having
many defconfigs?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


