Received: from [209.85.198.243] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M2RxT-0004Lg-2h
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 17:25:55 +0200
Received: by rv-out-0708.google.com with SMTP id f25so1160114rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 08:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3nEYj3zC5pIPtuz87VXmoMRK/szwoZf62ThGBCoohrA=;
	b=Hb23HJSKpDR+6RZ2husw4xAj7q3fORML9akBFXcQQNszu645PAexHOpqNrZ6mR9leu
	zwdfvIIlwyMKtHlvpCkqiJ376KcWn4SAK1BXU0y/g7x0zSq47HTN/cVP00y6pPXMNZC5
	EZvv/vOyFWzjYhPU/SXgXYyhctBkKsmJZksnU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=W8Sbs49f9Voi72e7C+gkeoPc/gEYQuRA8GQnnx0cFD+JUIENlvgxei09cBP8tpOhOx
	CYYjxGLEWSx0nBI/wyKYo5hXdFHFsfqEF6g2jO8Ko7peB3q/uoWb9y9OZpZk7uUY/alc
	jrq/EOllAxH6i/uqeBnMzSP80ErlIvBLng/84=
MIME-Version: 1.0
Received: by 10.141.36.17 with SMTP id o17mr1670468rvj.261.1241795978614; Fri, 
	08 May 2009 08:19:38 -0700 (PDT)
In-Reply-To: <200905080911.10487.khimov@altell.ru>
References: <be7a9f3d0904270832j4832bc6fqcf058fdfc3d8479@mail.gmail.com>
	<1241079609-5912-4-git-send-email-khimov@altell.ru>
	<f96d234e0905071458l22022a9gd5b7e77a4607c3c0@mail.gmail.com>
	<200905080911.10487.khimov@altell.ru>
Date: Fri, 8 May 2009 11:19:38 -0400
Message-ID: <f96d234e0905080819t46478d85xa1eb2233f826ea97@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/4] remove install-native package
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
X-List-Received-Date: Fri, 08 May 2009 15:25:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Fri, May 8, 2009 at 1:11 AM, Roman I Khimov <khimov@altell.ru> wrote:
> On Friday 08 May 2009 01:58:24 Cliff Brake wrote:
>> We have run into several problems that may be related to this patch.
>>
>> bitbake libart-lgpl fails on a clean build with following message:
>
> Please try either removing
>
> export INSTALL = "${STAGING_BINDIR_NATIVE}/install-sh"
>
> from recipe (recipes/gnome/libart-lgpl.inc), or setting it like this
>
> export INSTALL = "${STAGING_BINDIR_NATIVE}/install"

Thanks!  The above works, but after a bit of discussion on IRC, a more
correct solution is to remove the INSTALL variable from this recipe.

09:49 < kergoth> install-sh/install.sh is not that complex.  any
autotools package that uses AC_PROG_INSTALL should be including
install-sh/install.sh in its build tree under
                 ./ or AC_CONFIG_AUXDIR, for the case where the build
system doesn't have its own bsd install.  we, of course, have install,
so that install-sh/install.sh
                 won't actually be used
09:50 < kergoth> if any packages hardcode INSTALL like that one in the
email, they're broken
09:50 < kergoth> the 'install' tool is often used to install files
from one place to another
09:50 < kergoth> autotools comes with a shell script called install-sh
for its makefiles to use if your machine has no 'install'
09:51 < kergoth> thats all there is to this

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


