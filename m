Received: from [209.85.217.206] (helo=mail-gx0-f206.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MDy4I-00089E-OC
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jun 2009 11:56:34 +0200
Received: by gxk2 with SMTP id 2so3542815gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jun 2009 02:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0MXxaPxdDocNnhtt2EO0o/pagneCL+febaZwnnqJmls=;
	b=aXxo5cOb8CUt6ODsonvhXVc07+72OyjRhGouUiMp3VTD8Yc4CVGUcfzunFGvNnHOAz
	6D8ZmC2hOGyzChd1j3QJxoMGbvyQhdwjs2G0jwjFAyiLaPeBB28HunsoYnnv5pKd2BDM
	O86zp/AWCLsjj8VD1n8j45Emq8k6dbprGFGjY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nxGd8U2snN0FbXf9WjsvA+R/bJMnexbIloZmO1vdVfUmQZx54w52giIlwhHSxqK+9U
	N9Q/VLGXg6NIV5X0iynwTY2A5maySL39AQpfY3zyLzyFf0RehNEX8I2ozsmYdT9xwlJj
	ScY/uZiZFSShD3P6v18KhIOfgbntyi6Yn32ck=
MIME-Version: 1.0
Received: by 10.231.13.198 with SMTP id d6mr2161009iba.32.1244540818118; Tue, 
	09 Jun 2009 02:46:58 -0700 (PDT)
In-Reply-To: <F006973C7BA4F048BE0A9AF40B69189C23DA61@susmnrex004.na.colfaxcorporation.net>
References: <AcnjJBNDtAeqOJaUTYiV9+VVWZtdqA==>
	<F006973C7BA4F048BE0A9AF40B69189C23DA61@susmnrex004.na.colfaxcorporation.net>
Date: Tue, 9 Jun 2009 11:46:58 +0200
Message-ID: <c384c5ea0906090246u53c678a2jc537012e5893834b@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: How do you add libstdc++ to the micro-image distro?
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
X-List-Received-Date: Tue, 09 Jun 2009 09:56:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello James,

On Tue, Jun 2, 2009 at 3:47 AM, Newell, James
C.<James.Newell@colfaxcorp.com> wrote:
> I am fairly new to the openembedded project. =A0I'm attempting to add a
> c++ application to the micro-image distro for experimenting with oe,
> but it doesn't include a stdc++. =A0 How would one add libstdc++ to the
> micro image distro? =A0Adding libstdc++ and a few other attempts to the
> IMAGE_INSTALL variable in recipes/images/micro-image.bb doesn't seem to
> work. =A0Any help is appreciated.
>
Add a recipe for your C++ application.

Add the application package to your IMAGE_INSTALL.

OpenEmbedded will then automatically find out about the shared library
dependencies and will include
libstdc++ in the image.

Regards,
--=20
Leon


