Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TRSEq-0005dH-5u
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 20:33:04 +0200
Received: by mail-qa0-f54.google.com with SMTP id p27so2841466qat.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2012 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=U3v8mXeiRXIOcUYcFvQF2MU2Ix4yf6oOqZ1QnWROXTE=;
	b=cDWeDNHL4+nTfKWwbihQZvcDcw1DedLMVGnm1vgY3JBOPS2IjjfAcZzW+IF+KI2BpN
	kymDF7VNPMRT5WxUJDZbv8EAGewJ4MZgxmCJsmrfynDn8cH7tVR/37+0MlRz2soUpcWB
	zPKfOQ+NjWFbe2NKnez2+MfVwUr6w/PUMAylpNg6u1qyePhROQMoQsBFRdXoTMNJldoF
	UHLxlVcQ4o8EIj/SWvIuda7jlEClnhobM+XVjgwfLQpX4Zc1OQ7B2NbC7acmuavmaWaD
	z95x9F7ZlCa5MeX3v43LuDRDY206kAXtwKegfnTCkD9rYJEithxaQYWnSdSJwNiuZ+cx
	s6jQ==
Received: by 10.224.180.205 with SMTP id bv13mr7359090qab.7.1351189174836;
	Thu, 25 Oct 2012 11:19:34 -0700 (PDT)
Received: from cl-t066-141cl.privatedns.com.gmail.com (wkit.com.br.
	[67.205.85.241])
	by mx.google.com with ESMTPS id y17sm4044688qaa.6.2012.10.25.11.19.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 25 Oct 2012 11:19:31 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
References: <CABcZANmC_c-fZMBHH4tc7gvJdrs_UPoFhn19X+T1E7beqRbXLQ@mail.gmail.com>
Date: Thu, 25 Oct 2012 14:08:35 -0400
In-Reply-To: <CABcZANmC_c-fZMBHH4tc7gvJdrs_UPoFhn19X+T1E7beqRbXLQ@mail.gmail.com>
	(Chris Larson's message of "Thu, 25 Oct 2012 11:01:00 -0700")
Message-ID: <85ip9ywhjw.fsf@cl-t066-141cl.privatedns.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [meta-browser] Question regarding status of chromium recipes
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
X-List-Received-Date: Thu, 25 Oct 2012 18:33:04 -0000
Content-Type: text/plain

Hi Chris,

On Thu, 25 Oct 2012 11:01:00 -0700 Chris Larson <clarson@kergoth.com> wrote:

> I'm wondering if the chromium recipes in this layer have ever been
> build tested. As far as I can tell, both 19 and 20 are missing
> dependencies on udev (libudev), gtk+, and gconf, and 20 also wants the
> openssl headers. 19 also fails due to an attempt to build/link a
> native tool requiring libxi, so it seems it can't be built without x11
> headers on the build machine (along with the odd ld.gold requirement).
>  Given these issues, I figured I'd throw out a contact email and try
> to determine if perhaps the OSSystems folks have local changes that
> never made it into the public layer, or if the recipes just didn't get
> a great deal of testing.
>
> Thanks, I'd appreciate any input on their status :)

I haven't built chromium on OE.  I've been building firefox only.  Maybe
Otavio?

Best wishes.
Mario


