Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBQsb-0004OT-Rc
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 15:51:54 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 06:39:14 -0700
Received: by obblz20 with SMTP id lz20so728902obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2012 06:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=qLonMoe7xnRmSh2f4Xx5WsbdGbxqPMBuJEZ2guxkGkU=;
	b=ksET+nqYcjMajGebAHafeI0CWkW/fAbFSPCIMjhwf6BYaCF6Q6ED+D0DGJUK31dOvo
	Rom4o7HirS2buoid8B0HNVoq9VPTwnT8Kq7sWi7Hr9DqEHRMDMfJeJBcHl7qo7rJ8572
	S7BNZGJGqXGC8uQS9vGsbL3HWDbZdku0iV3GzxR0/WKhDEWL+lUt1gNp1YougwmskHi7
	NfPR7A5ULaGTV2YnhuU8opIMAIWS/RMJhoyrp59mW276G+aXadBoWMDXhH7oZO5xMr5E
	dtq61MgolCxyBkH+hL83FZd6FroW6u6EYfw7J0M+mNaMNjNdImbC/lNRJiFibNoTt0Xe
	RKaw==
Received: by 10.60.30.168 with SMTP id t8mr18466773oeh.89.1347370760980; Tue,
	11 Sep 2012 06:39:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 11 Sep 2012 06:39:00 -0700 (PDT)
In-Reply-To: <2875794.FvkJFEeAV6@helios>
References: <504D81F8.9020702@dresearch-fe.de>
	<1347367374-10517-1-git-send-email-sledz@dresearch-fe.de>
	<CAJTo0Lahx_1K64aBhag10RN=jSE+fz=APC9HnCwp-zxyb0-qgw@mail.gmail.com>
	<2875794.FvkJFEeAV6@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Sep 2012 14:39:00 +0100
Message-ID: <CAJTo0LY5GyeesgKbsgjX8zRZSTrH=41UUey_9vGWg20A_fd-Gw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQlmjQuyjVBDUuZGRxhNF6sJoBGifk+jpOshbXj3XKqEcyG3nUX180D5ksbUcZALzQptT+6o
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance][PATCH] gdk-pixbuf: add missing dependencies
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
X-List-Received-Date: Tue, 11 Sep 2012 13:51:54 -0000
Content-Type: text/plain; charset=UTF-8

On 11 September 2012 14:03, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> oe-core master has 2.24.1 at the moment, is there a good reason why
>> meta-oe is hanging onto 2.10.14?
>
> This is the OE-Classic 2011.03-maintenance branch. I was surprised too until I
> realised where this was :)

Oh, wow.  In that case I recommend either patching out those
dependencies instead, or upgrading to a more modern version of
gdk-pixbuf.

Ross


