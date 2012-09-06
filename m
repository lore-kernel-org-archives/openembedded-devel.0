Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T9iFJ-0004sd-Ie
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 22:00:13 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 06 Sep 2012 12:47:47 -0700
Received: by obblz20 with SMTP id lz20so3453148obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 12:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=1ZqB7L8p8tmqB4cYMyMW9aheyOHc7MZFMJ3tY4JfD58=;
	b=P3YDX5KsDRmp30OEG/RS/hj7xbFkcKEHv9zJ0KdRwjtowZUdObUbkK3zC1ttcaDHcO
	UndtT+8valVHF7/iP5ra+5a3Yk46az+U0EDz09YJvIUYo26WZUG3xEhIvmIxxqPlKcaI
	2yvWl0r8QMHDXgoEBDH92ry0VWjKUN5mczN9zPA3VBQNS1NPNCM7xr9jYrgN09LUV4D9
	70FS+9TQvUDWO8J6u/nWv4BJ1D1Ngpwb6LhQDnVR6rcCQsgzD1u/eKmF5X6DjEp3Dlvz
	3QIdGQqEcpShvG+dT3lW9Ao7sSVTEe4dlP/j6M9EUU5gUbugZpOR/aSJqQRSItUNRMk5
	ijkQ==
Received: by 10.60.171.174 with SMTP id av14mr3675237oec.61.1346960866894;
	Thu, 06 Sep 2012 12:47:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Thu, 6 Sep 2012 12:47:26 -0700 (PDT)
In-Reply-To: <1346949867.2673.204.camel@phil-desktop>
References: <5048B901.3060103@communistcode.co.uk>
	<1346943545.2673.198.camel@phil-desktop>
	<5048BC6D.8080904@communistcode.co.uk>
	<1346944157.2673.199.camel@phil-desktop>
	<5048BE25.2070004@communistcode.co.uk>
	<1346944624.2673.200.camel@phil-desktop>
	<5048BF04.2000904@communistcode.co.uk>
	<5048C7D5.70301@communistcode.co.uk>
	<1346947708.2673.201.camel@phil-desktop>
	<5048CC32.30705@communistcode.co.uk>
	<1346948364.2673.203.camel@phil-desktop>
	<5048D11C.9050108@communistcode.co.uk>
	<1346949867.2673.204.camel@phil-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Sep 2012 20:47:26 +0100
Message-ID: <CAJTo0La26CyvfEmmwWHfJZVNtZ-DxkFejv9tvScqYwb-3n0bzA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnb+giYxedRTKRUsU3e69IOJZMiE2KNpK35GSuMdM7Kuj2XRaKS9esqFAMTCQxjVN3FSsQf
Subject: Re: Issues building tinyXML
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
X-List-Received-Date: Thu, 06 Sep 2012 20:00:13 -0000
Content-Type: text/plain; charset=UTF-8

On 6 September 2012 17:44, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2012-09-06 at 17:36 +0100, Jack Mitchell wrote:
>> One last thing though, should the libtinyxml.so be in the -dbg package?
>
> No, -dev is correct.
>
> I think you're still missing -fpic in C(XX)FLAGS.

And people wonder why I give disapproving looks at people who say that
automake is too complex and they prefer to roll their own makefiles...

Ross


