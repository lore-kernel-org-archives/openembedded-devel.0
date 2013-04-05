Received: from mail-ve0-f176.google.com ([209.85.128.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UOAG0-0001qr-NG
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Apr 2013 19:16:56 +0200
Received: by mail-ve0-f176.google.com with SMTP id ox1so3771167veb.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 09:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=DMtfnpVD7pgNcVQAiZ4ZwtzLaBk/OAg4c3T9ELg0uBg=;
	b=nAJNXfzndjaXXPkDR8sfSVFE0UU7HY5lvF7Yn1iUzTX6OnkuT9VO+44m5C20mjogSX
	LN8M3GODpJL8wxbiHSbM98FfuR3ANyuwnn/LvVrFI4zQmUn4ytz1Xl1SXcg4LJB+RZjQ
	YZpdPJBheSnS0ydmbZsDqvZU2qfjPym7F392QN9BiAumlhQ2p2by88O6fmBwexQHOI3T
	y0i+pl1hkrrUVorIgV02FjfdM/VSiMGiVOA7ofoSz32cggACmSdAEGEjeSUW9Rc5Woaa
	3dLpE5ktsnFKynNEXYr1d51lt90U1kLxR739bavvSa6I1GVK2Hn4jOH2uWEaJIoUwoD2
	3pyw==
X-Received: by 10.52.67.75 with SMTP id l11mr7534471vdt.29.1365181181741; Fri,
	05 Apr 2013 09:59:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 5 Apr 2013 09:59:21 -0700 (PDT)
In-Reply-To: <CAP8YevqRwF9BY_i+=yNCU_hv0bC7EW9kXb7bGBBj0pkbjHiVbA@mail.gmail.com>
References: <CAP8YevqRwF9BY_i+=yNCU_hv0bC7EW9kXb7bGBBj0pkbjHiVbA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Apr 2013 17:59:21 +0100
Message-ID: <CAJTo0LZ_-_q5=r6pGiyNkPYBorWWEE=owGQzdkzB6Cdk9xpESQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlfKg+tG2EL17gv82uBNhtFHcBv6XlRZcI8I42AzFJbZpZxQGJpqNqcXJcXt5K8k9N41SH9
Subject: Re: libproxy glib.h build error
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
X-List-Received-Date: Fri, 05 Apr 2013 17:16:56 -0000
Content-Type: text/plain; charset=UTF-8

On 5 April 2013 16:54, hobbesc7@gmail.com <hobbesc7@gmail.com> wrote:
> Has anyone else had the following build error with libproxy?
>
> /work/yocto/poky/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libproxy-0.4.
> 7-r4/libproxy-0.4.7/libproxy/modules/pxgsettings.cpp:26:18: fatal error:
> glib.h:     No such file or directory

This was fixed in oe-core literally yesterday, there's a missing
dependency on glib-2.0 in the libproxy recipe.

Ross


