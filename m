Received: from [209.85.198.247] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1KMHzg-0002CR-38
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jul 2008 09:45:40 +0200
Received: by rv-out-0708.google.com with SMTP id f25so3381857rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2008 00:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=rn/7ZKyr9Ma+Bxda6UkEetrWqNR5oXJ/T1GqLyX4SpE=;
	b=k/3XyzKy/+icDGUQW7gCbwt31jzTX2l1Vtm4P7NO45dPDkHX/SnmIWzISpRQJwgmk/
	V8frWlZp7lUJi4pw36as4hjAvCEHqZ9NI3ZeXfn+uBq/mXAoQK9yDDYN0G6nwPbIYg0q
	RaI+muBPkKQPIi41H84M5HEL3DpSxnX5e8dv8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=OT5fFJONjSq/DrDIFhXYxugSEsrsX/KkromAU0GFoT2EVrzMt7JCdm5YwuXUDJrtq+
	7oADiiRVtdZ+6f3YOfibtqqno1QghiGygwg0MwkyS/OmW4HIBiMzu2cbkvkn9b09P/Ps
	E2YeKIB6oJwwCoJTbPoH/Ue11r1XBszgBsmQs=
Received: by 10.141.114.19 with SMTP id r19mr712967rvm.295.1216971860651;
	Fri, 25 Jul 2008 00:44:20 -0700 (PDT)
Received: by 10.141.41.9 with HTTP; Fri, 25 Jul 2008 00:44:20 -0700 (PDT)
Message-ID: <d1b08f940807250044k51c6b1f8h9d5f976d83069a54@mail.gmail.com>
Date: Fri, 25 Jul 2008 09:44:20 +0200
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080725030222.GC4715@smtp.west.cox.net>
MIME-Version: 1.0
References: <4889169C.7040108@gmx.de> <20080725030222.GC4715@smtp.west.cox.net>
Subject: Re: RFC: kernel.bbclass and collie changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 25 Jul 2008 07:45:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thomas,

> I've got a bug and patch (4450) to fix the other instance of this,
> please use ${KERNEL_OUTPUT} instead.


while you're there please weak-assign too:

 KERNEL_IMAGETYPE ?= "zImage"

Andrea


