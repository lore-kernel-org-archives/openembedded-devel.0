Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T4fDK-00025B-1N
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2012 23:45:18 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 23 Aug 2012 14:33:09 -0700
Received: by obceq6 with SMTP id eq6so2508885obc.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2012 14:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=3cHRVJLDZuA5uku+m+/8bd8Ia8IyH9CvkOUMELOGjVU=;
	b=fSP6wEgyxablsAXjJynuAEnIXEbQZdld4fvCx6ddTuxuR/9VkpzcFlhgjLbstTrMTY
	dd2a06GD5RwiubFqIeSTbyYKnskwbVIZy/YU1hBJehNUieqkGdEoFWrdmuDztSmdx0AE
	93I+7yq12kXHhieLMzrcSP5RbYT3pEUu784tDepBdGCfrg8LEf7gNpAircKrIdQXAFoE
	Mzk3h5DOL7L7yhXsw3lRyXG46DjHiyBORrQ0Clfy8v8UwWendMrSAp8/O3Yg9B2RH/8t
	vARshwov0TdS6YEvsawW7pDmH2Z/XLSom070XBa2VIa4U1jUGO1oITj0ibBGejkbPVxP
	6Y0w==
Received: by 10.182.145.8 with SMTP id sq8mr2355027obb.50.1345757588394; Thu,
	23 Aug 2012 14:33:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Thu, 23 Aug 2012 14:32:47 -0700 (PDT)
In-Reply-To: <20120823093511.GM3029@jama.jama.net>
References: <CALbNGRTC=AL5g+CPvHQzVijDf9AJj3dHmxs7H7MeY4y5VygYKQ@mail.gmail.com>
	<20120823093511.GM3029@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Aug 2012 22:32:47 +0100
Message-ID: <CAJTo0LbmhE+cLgJn2nxcdbj1dVH+5Y8xaT1tgP7FPtBspmLFtg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnt+4CetddzA8w6lumK5SrtDSHVAWZYGopp9FhZDkEb8QqzMhVQkH0hIruVl3aEZUttn3uz
Subject: Re: gnome.bbclass
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
X-List-Received-Date: Thu, 23 Aug 2012 21:45:18 -0000
Content-Type: text/plain; charset=UTF-8

On 23 August 2012 10:35, Martin Jansa <martin.jansa@gmail.com> wrote:
> git log says it was because of 'hicolor-icon-theme-native' and 'gnome-common-native'

Isn't that quite a sledgehammer approach, why couldn't BBCLASSEXTEND
+= "native" be added to just those two recipes?

Ross


