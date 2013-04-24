Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UV460-0004Px-I5
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Apr 2013 20:07:11 +0200
Received: by mail-vc0-f175.google.com with SMTP id lf10so2068557vcb.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2013 10:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=fUFYQx7rSVBjsgHeoFXeCz6BHDNnvCMNzqA/P0K1aMc=;
	b=Pr1n7vGq8PhqsVQM7Au5OgqFEr/LN/iBjjSegn3q6Sg71/JJ0lUC+QoYfE7SsvVGZp
	sewRC6iVQANhDWDNJRFdfJ1XfnhcuSd/4JJpEjZNOJGFDBWjsFWQ9+zaYSwJD7+Fj7d0
	GD3WDcidlt6/H0SdjhW41XqL7HSnPbpHFQCsztIc/wzMFuIISHuJn+fM2YN3WHAWHL/q
	uNbR+YdA+LlX5+ZAN8pny4IMEqLzlaiSMpzV/e2wbDjKIj7y4TVYM2TE1wgNy1WcFjy1
	/i/G1PuTbNIUalNa4KI5VO+oNij5UA0fe6np3TRcAcIFr/A9bgNqWOWpUgl6Gyo+CC/N
	D8dw==
X-Received: by 10.58.188.48 with SMTP id fx16mr25615106vec.22.1366825766036;
	Wed, 24 Apr 2013 10:49:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 24 Apr 2013 10:49:04 -0700 (PDT)
In-Reply-To: <1522401.Xi5ZNlSlZv@helios>
References: <cover.1366821077.git.ross.burton@intel.com>
	<83aca51e5e0866d965d4d9f621cacb29c84a6875.1366821077.git.ross.burton@intel.com>
	<1522401.Xi5ZNlSlZv@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Apr 2013 18:49:04 +0100
Message-ID: <CAJTo0LZjn0dDMJO8b1FwtCXjoBEH-Ck8qzOQEHMRxhcCsHuaLw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQketV4WB+GluskaEk0FuGBJ+Ur8jqMkzrNQlvFAR8J0/RDzuCe9l9/WvN7TzQPwg59/13LH
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] libgnome-keyring: add (from oe-core)
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
X-List-Received-Date: Wed, 24 Apr 2013 18:07:14 -0000
Content-Type: text/plain; charset=UTF-8

On 24 April 2013 17:42, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Wednesday 24 April 2013 17:32:42 Ross Burton wrote:
>> This was in oe-core previously but it's not actually used by anything:
>> webkit-gtk claimed a false dependency and the new libsoup has removed all
>> use of gnome-keyring.
>
> libgnome-keyring is already in meta-gnome (under recipes-
> gnome/libgnome/libgnome-keyring_2.32.0.bb - perhaps not the best location).
> gnome-keyring isn't though.

Whoops, so it is.  There's quite a massive delta between the two, I'll
check that this is due to the oe-core version having better
maintenance and not something subtle that I'm missing.

Ross


