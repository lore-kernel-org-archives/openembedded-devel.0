Received: from [66.249.82.226] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1KtMSF-0001iI-4l
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Oct 2008 15:11:58 +0200
Received: by wx-out-0506.google.com with SMTP id s10so403214wxc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Oct 2008 06:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=p1+bFmOliJQBgywXeUjY0I1UDZeAoWKfkBPJjA+q7EQ=;
	b=fGGvJeJGgfDnPlu6/Fyk5T1dFuHkwMzv+T89J6JKS8RO+DTYwckyc4yV6RvPZjd1bC
	RRlJ7wRuK3sgN7M7JjQC9bScDFcCZooJ+VFFm1k4FYXNP9j6PXnj4WSLkACigf/nvM22
	/U/vUqS7vKi094JqMeO7WztDZxTizoflMePaU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=kCn0UG0k1hg6kLfshnlPNG1lojY53mvfuknydoAyWCyDNYZ7KCgGPr+s5CtWcsyTCo
	IkwegiPwYnvH8oPKTyWuw3qTV0YPgC7lSYm+AfNYgWdWQxyWEY5A+a0d8yKe/PSD2Dz6
	gYw3uoIPZHnCqwwwD08DpM1Q29Xs8lBeblkPs=
Received: by 10.151.114.6 with SMTP id r6mr729875ybm.11.1224853875432;
	Fri, 24 Oct 2008 06:11:15 -0700 (PDT)
Received: by 10.150.212.20 with HTTP; Fri, 24 Oct 2008 06:11:15 -0700 (PDT)
Message-ID: <48239d390810240611i60e4acaaybf75b00f241d2c93@mail.gmail.com>
Date: Fri, 24 Oct 2008 17:11:15 +0400
From: "Sergey Lapin" <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: busybox start-stop-daemon problems with recent kernels
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
X-List-Received-Date: Fri, 24 Oct 2008 13:12:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi, all!
How do you people overcome problems with start-stop-daemon
of busybox with recent kernels (seek error)?

Is there any solution to this? I use vanilla git kernel with my images
(I use out-of-tree .bb's for that) and have problems. This
does not occur with kernels which are built by OE.

Any ideas?

S.


