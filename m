Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1Ki9AR-0005MX-Mn
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 16:47:07 +0200
Received: by yw-out-1718.google.com with SMTP id 5so525016ywr.30
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Sep 2008 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=Yqnb0+SodUcnqQbmlbfU54xPJLqk+EFMUJ66lHje7cA=;
	b=OvEMw5cbQ1eE8Y8Y9Cu98vv6QqTr5zGa6cCYSa5dbcx9VMBhK2Co0aqkfg/TcQzP+q
	T1YSw12la1rTO1tpD61Q7qurUaT65FMIPmSJ3K0l67KExXltP3qgYucU6yRdO5wt877f
	pg3OphkR98WFU4KJo8ZRPI3Ns8wjVVHd5iFaE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=o3rSS6g7l3UEgJcJ5PEFBP7Y3FRalPQFYanJh3CvA/LsyJ0vxN3jPZxKHPkVlTgcAf
	oLGAYd6eyG97qONRhLwidEQKJnLwmqZzOxEcDQGKN1rGHse0w+ivN8BVDU6ymEO53A60
	p0TfJub49fZwph61tOBeMeyH5oa29tuSWKkm4=
Received: by 10.100.206.15 with SMTP id d15mr4442008ang.29.1222181014071;
	Tue, 23 Sep 2008 07:43:34 -0700 (PDT)
Received: by 10.100.105.13 with HTTP; Tue, 23 Sep 2008 07:43:33 -0700 (PDT)
Message-ID: <bdb0025f0809230743h425306bcu4b056aa9c4fc0097@mail.gmail.com>
Date: Tue, 23 Sep 2008 11:43:33 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Subject: do you have this error when building kernel module? (KERNEL_VERSION)
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
X-List-Received-Date: Tue, 23 Sep 2008 14:47:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi there,

I'm experiencing an strange error when building some kernel modules for Mamona.

That's the error message:
NOTE: Runtime target '()' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['()']

That's because we have on module.bbclass this:
RDEPENDS += "kernel (${KERNEL_VERSION}) update-modules"
but on the very begining $KERNEL_VERSION is null... After some builds
it comes from  module-base.bbclass:
export KERNEL_VERSION =
"${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
that gets from a already built kernel on STAGING_KERNEL_DIR.

I believe that this is an structure problem that we need to solve, but
I don't know what should be the best solution.
* export an hardcoded KERNEL_VERSION?
* remove KERNEL_VERSION from the rdepends?

I was wondering as well why did no one has experienced it before.... any idea?

Thanks

-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


