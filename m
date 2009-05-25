Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M8dDR-0004s7-Ke
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 18:39:57 +0200
Received: by an-out-0708.google.com with SMTP id b6so1862813ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 09:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=1/zda4AhOiUx9DgWyFFJ9tXrH4j2GyXQ6zlDQrlMovA=;
	b=xrZEcfFiopsjHPGptXAFp0jTvy04O8RjEif6KMiIj6PchvqXPCOAZOAnVf+fzkGLzC
	sT0hv1MV9eXvBFVi/eYryxmBEi/CxIAVNqroWa0il703hB9vu7Uooaap2/dTsz+jmD+7
	32OY1KfznUFTLA+Bfm34Yycgxjh754SXFkIXU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=hFj9Oa4hBJUKps1mDE4aJCegq4IKG42E6szukOjZ9l6OVPjWufp3nLmpXQoKHXdBND
	xb64YDI1ee5ipFkkZ8+WOMmh4f1G1pNtxub3Tn8WsFG7FedQSpF3pvQetjZFSVNNV3JO
	ms181jf88Y/bwunM+5e49mFeZGXIoJPf2nkTs=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.207.15 with SMTP id e15mr12954331ang.30.1243269116590; 
	Mon, 25 May 2009 09:31:56 -0700 (PDT)
In-Reply-To: <fce2a370905250355h5edd949cq40bcb52882e1e623@mail.gmail.com>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243189985-19060-2-git-send-email-ihar.hrachyshka@gmail.com>
	<200905251125.45665.marcin@juszkiewicz.com.pl>
	<fce2a370905250254p4c51b706q399b14d9b0bb20e5@mail.gmail.com>
	<1243247426.4869.23.camel@lenovo.internal.reciva.com>
	<fce2a370905250355h5edd949cq40bcb52882e1e623@mail.gmail.com>
Date: Mon, 25 May 2009 13:31:56 -0300
X-Google-Sender-Auth: 4c6463ac322204ee
Message-ID: <be7a9f3d0905250931wbedccdfg9f8b0a0f562b6aab@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] udev: moved udevadm to the main udev package
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
X-List-Received-Date: Mon, 25 May 2009 16:39:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

Having it in mind

On Mon, May 25, 2009 at 7:55 AM, Ihar Hrachyshka
<ihar.hrachyshka@gmail.com> wrote:
[...]
>> It looks like udev used to Depend on udev-utils due to the existence
>> of /sbin/udevsettle in version 124. =A0But, in version 141, that symlink
>> has gone away and hence the dependency is no longer created. =A0The righ=
t
>> fix is probably to add an explicit RDEPENDS_${PN} +=3D "udev-utils" or
>> some such.
>
> Just sent the fix to ML.

I belive that the right way to fix it is add a binary package only for
udevadm and make udev depends on it and mdev suggests it.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


