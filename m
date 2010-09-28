Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P0c70-0007ah-D5
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 17:29:03 +0200
Received: by yxg6 with SMTP id 6so2070828yxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Sep 2010 08:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=YOkQT2FHD6pU4RkDA/VTOWVP+DbUGi8fPHoKP2vLSf8=;
	b=T7bTZEhZR848J/DcZpYpbLHWQpJdgmHYH4wfMbRhoY+ICq3N2jcR6imnA7Q9CvCneD
	2r82saMHUpSFGjyWNu/RspquMLSEFBSeSEZd29h9dvztW7esFF7gUm3h5fbpmiyHlkyx
	HEBLc0tUT9mhLhkkdllC3Lc83VctH0uTcf5s8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=ChGG16mPTHTXB3I4x6wTC1gbhahi0vCRwNVAF+a/DQnVtkNi5ByvT+Tiw+WwjBEh/u
	lW7dCqjTEB1YI7qCcPxGL4IV5p5xO4ECE5DNqZUTaMIaqA7YTQRv6fsFUQRHcq3D0nIx
	f7RmgLpbjEXY0R2TZjGeblrpJj3dTe7Z0rLrc=
Received: by 10.231.157.135 with SMTP id b7mr51879ibx.164.1285687720494; Tue,
	28 Sep 2010 08:28:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Tue, 28 Sep 2010 08:28:18 -0700 (PDT)
In-Reply-To: <lyocbim147.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1285456630-27680-1-git-send-email-raj.khem@gmail.com>
	<lyocbim147.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Sep 2010 08:28:18 -0700
Message-ID: <AANLkTi=2mwe+NZrT3+467doaHoc44Vaot2Q+a7M7xnku@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sane-toolchain.inc: Make gcc 4.5 & eglibc 2.12 as default sane versions
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
X-List-Received-Date: Tue, 28 Sep 2010 15:29:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 28, 2010 at 6:47 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Khem Raj <raj.khem@gmail.com> writes:
>
>> GCC 4.5 has been tested quite a bit
>
> Probably not on ARMv5 ;) There 5/3 == 3 holds and ld.so crashes due to
> related errors.
>
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=45817

yes there are few other bugs open against gcc 4.5 Interestingly I did
not hit this bug while building images for qemuarm which is armv5. Is
it common enough occurring problem that we should not use gcc 4.5 ?

>
>
> Enrico
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


