Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TP93X-0000A5-2D
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2012 11:39:51 +0200
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Oct 2012 02:26:28 -0700
Received: by mail-ob0-f197.google.com with SMTP id tb18so759140obb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2012 02:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=iWekY/dtjQnp31Ytjy/imWivwS4uD9o+IWnEeXkQU4E=;
	b=RzMkqUmF7PAEaXaGvuYHdnFDx2dWYcLLtCHwZuYlfj7RwsDd75mwVadoc10TFp4QIC
	fcIgz4+4JTkIP2ch2vKMwQW4gTVks1xG1hFEUWoq+wN51iDLG8spGfdNQ06wjkYyLNnB
	C1Wh0z7MYoEbNuBFg2Dk3bzcSgJ3ia9BW0Eu9/CwNvcc4qNMVTWbTtLBBgKMwxnME2ic
	r7dVVMQICdJqWbWtt6oymJxyouHI/+ysa27bUvUK+loFnLsxIbtIiKs07EDRxl+aHNN6
	QEs66fvpEaS4R7hBM6dM2Y+IdXS/q3Gn/4Q5EniXIun5HYBoH2sAInr0r3wAsHYm46D+
	wWcw==
Received: by 10.60.171.134 with SMTP id au6mr891447oec.69.1350638787946;
	Fri, 19 Oct 2012 02:26:27 -0700 (PDT)
Received: by 10.60.171.134 with SMTP id au6mr891440oec.69.1350638787865; Fri,
	19 Oct 2012 02:26:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Fri, 19 Oct 2012 02:26:07 -0700 (PDT)
In-Reply-To: <ba8a3e71ad6e1ca180e2998525129b907948a0db.1350589969.git.Martin.Jansa@gmail.com>
References: <cover.1350589969.git.Martin.Jansa@gmail.com>
	<ba8a3e71ad6e1ca180e2998525129b907948a0db.1350589969.git.Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Oct 2012 10:26:07 +0100
Message-ID: <CAJTo0LZ-2=f3bHO8a0aM2BJFXfGnF+s8tEBDK7ehjHK3Zfi71g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkIakyXTUzyPxmTLKk/FtAp1dxU+JUUV1gylcsM8/xIeLJ02mmw0f18L18GJhJ8DmDsPv3Phj8Ds7Fyf4/vRK4WCkr7nJNWyfG/r0g9b77gzslqf/4LIyslXn62w1GKHYJvtEYQliIeJN1a6w9KvR0kaqk41WGPGMVR9P1nU1PZNzVx8yOtLNGK/geBaWmuf4q+FPOb
Subject: Re: [meta-oe][PATCH 3/5] ecore: drop libxputil from DEPENDS
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
X-List-Received-Date: Fri, 19 Oct 2012 09:39:51 -0000
Content-Type: text/plain; charset=UTF-8

On 18 October 2012 20:54, Martin Jansa <martin.jansa@gmail.com> wrote:
> * it was removed from oe-core
>   http://git.openembedded.org/openembedded-core/commit/?id=5b3748d463a6666c0d8e2624092619da8d8e6328
> * it needs to be explicitly disabled now, because recipe was removed in
>   oe-core, but files still stay in sysroot and we cannot even
>   cleansstate it now without recipes around.

To be honest you'll probably want to tell upstream to just remove
Xprint.  It was removed from oe-core because support in the server was
removed in 2008.  Since 2008 the Xprint code in any client application
has been unable to work.

Ross


