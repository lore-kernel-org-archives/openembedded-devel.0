Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsAEw-0003yB-6E
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 11:47:35 +0100
Received: from mail-gh0-f197.google.com ([209.85.160.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 07 Jan 2013 02:32:23 -0800
Received: by mail-gh0-f197.google.com with SMTP id f15so26197665ghb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jan 2013 02:32:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=1njirVsGg9D+n24TuaOZjUxpAw4Brf4v10ZcVoBSMcA=;
	b=iVLpmuT+m2tNjN3tSpGw5FaSSxfciegoq0jO8MZylHMr84orDUbehha9sWHZCvT+vJ
	Ou1R10P1QBQEPO2rKRxtMhamGrGKk+y2mJx34OU0ibBBwL1f4mnYfr073bLLHshxF5Dk
	v7x2fLFHG1Ab8LHTecND+YOKbYvQ3kdjl6ap6lCQyPLNwY3MKA3D8M4ybPJVKYYsrbhe
	1hJ+zDhcVHcEk85RwftF8meScjkOf/Y4kaaOU1smyEH7zxievW8hiHClD0qsnZovTcsS
	XFtWUfO/yt+PZt9Am6xsuruRx39cubsNelI+SMjw3XNPGYnkQJvjjcS4EbxDeRMS7dAm
	oewQ==
X-Received: by 10.220.151.83 with SMTP id b19mr81229631vcw.25.1357554742977;
	Mon, 07 Jan 2013 02:32:22 -0800 (PST)
Received: by 10.220.151.83 with SMTP id b19mr81229629vcw.25.1357554742877;
	Mon, 07 Jan 2013 02:32:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Mon, 7 Jan 2013 02:32:02 -0800 (PST)
In-Reply-To: <1357440504-13057-1-git-send-email-cazfi74@gmail.com>
References: <1357440504-13057-1-git-send-email-cazfi74@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Jan 2013 10:32:02 +0000
Message-ID: <CAJTo0LbUGt==rBJSrqT-_x=w3=ddh+vvr=okxJ8qf_7z=acooQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlcixJXAuskuN5/g4kd7tafq/SO/u8UvUJusQb6H7ltrtYknL2gygSBjMNlEAc4S7KD/Jp6clOc8qqP2yhVPmvNAZ+9PLox8l2Sf6Os9sBGlGEjVOoqb3LB4yVocG0S3eRpdzBGaBosZ+OP4Rt2YJfWZ37T+dFnSum0/uIEhgkzSGwi2uSLmYxWlWy8pPP9OI4/XjOM
Subject: Re: gtk+3 update
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
X-List-Received-Date: Mon, 07 Jan 2013 10:47:36 -0000
Content-Type: text/plain; charset=UTF-8

On 6 January 2013 02:48, Marko Lindqvist <cazfi74@gmail.com> wrote:
> We now have all the depencies of gtk+3-3.4. Latest version of gtk+3 is 3.6,
> but for that we still lack dependencies (at least atk-bridge from at-spi).
> As I'm working on software that has 3.4 as minimum gtk+3 requirement,
> it's more important for me to update to 3.4 now than to 3.6 a bit later.

My ross/gtk3 branch is capable of building 3.6.x as it includes the
new at-spi2 packages, but there are plans forming upstream for GTK+
3.4.x to be a "long term support" branch that they recommend
distributions adopt.

Considering we don't have the resources for a dedicated GTK+
maintainer, sticking with 3.4 is a wise move IMHO.

Ross


