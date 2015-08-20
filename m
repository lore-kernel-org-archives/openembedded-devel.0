Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8032E7689C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 21:51:18 +0000 (UTC)
Received: by paom9 with SMTP id m9so3102842pao.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 14:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=8y6NpqB6g9+XQ3TD4cShQVl88Y8QK5Nk4IJkuISEAQM=;
	b=x/KNFgJ2bL/uL9ngwfE8pbQzVIQsi6HfUA9mFXRt3NrZ3wfbKHhbV57Dhjg3ZCBtl3
	hee+ngHbINUE8IF56LUUL4hTEok2nEjftodmsSAoVFzxNgZiPS2e0L83bL4BSSd1dUcE
	8CZ1tCInCWN+Uiy1nlhmXHyOC/TG9ERECtK2bmjE+bGXVWEPzkiJ2Lae1KvnR0NmxpfW
	5+pyBNup/mpnETevFKC9+wpn+L35If6DSgqOm840Ut6A+2jnEJ4CM4NSs/0uJ+J2AqFG
	GHPbKYLpzXwLdF8WZV6X+0GfaBZPyw2XwiKwz8XDtFnMuBn50z9XLq1cdh8pbtyb370+
	9aEw==
X-Received: by 10.68.136.234 with SMTP id qd10mr10629554pbb.162.1440107479069; 
	Thu, 20 Aug 2015 14:51:19 -0700 (PDT)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	de2sm5432413pdb.15.2015.08.20.14.51.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Aug 2015 14:51:18 -0700 (PDT)
Message-ID: <55D64BD5.2080203@gmail.com>
Date: Thu, 20 Aug 2015 14:51:17 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Mark Asselstine <mark.asselstine@windriver.com>, 
	Martin.Jansa@gmail.com, openembedded-devel@lists.openembedded.org
References: <1440102538-1561-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1440102538-1561-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [[meta-ruby][PATCH 1/2] ruby.bbclass: handle new installation directories
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Aug 2015 21:51:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Thanks

- Armin

On 08/20/2015 01:28 PM, Mark Asselstine wrote:
> It appears that newer versions of ruby produce additional directories
> which were not previously handled by the ruby bbclass, specifically
> 'build_info' and 'extensions'. This is currently resulting in QA
> errors/warnings such as:
>
> ERROR: QA Issue: puppet: Files/directories were installed but not shipped in any package:
>    /usr/lib64/ruby/gems/2.2.0/build_info
>    /usr/lib64/ruby/gems/2.2.0/extensions
> Please set FILES such that these items are packaged. Alternatively if they are unneeded,
> avoid installing them or delete them within do_install. [installed-vs-shipped]
>
> Add these to our FILES in the bbclass such that they will packaged.
>
> NOTE: several files may exist in the extensions directory such as
> gem.build_complete and mkmf.log that we can most likely remove during
> do_install. Since ruby installs these by default they have been left
> in case their existence is used as some type of stampfile or similar.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   meta-ruby/classes/ruby.bbclass | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta-ruby/classes/ruby.bbclass b/meta-ruby/classes/ruby.bbclass
> index 9c4fcf9..ef844f2 100644
> --- a/meta-ruby/classes/ruby.bbclass
> +++ b/meta-ruby/classes/ruby.bbclass
> @@ -111,6 +111,10 @@ FILES_${PN}-dbg += " \
>           ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/.debug \
>           ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/.debug \
>           ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/*/.debug \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/.debug \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/*/.debug \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/*/*/.debug \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/*/*/*/.debug \
>           "
>
>   FILES_${PN} += " \
> @@ -118,6 +122,8 @@ FILES_${PN} += " \
>           ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/cache \
>           ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin \
>           ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/specifications \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/build_info \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions \
>           "
>
>   FILES_${PN}-doc += " \
>

