Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 69674609B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 16:58:50 +0000 (UTC)
Received: by qkgw4 with SMTP id w4so73072575qkg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 09:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=ZFDiFW+JJadn+Dh+lWP8/FcKcaITe9212SZ1LSMLCmQ=;
	b=TXivYPnYTTjJiG+xI6WZe24Ws/OHCPLJt3pw+TU+3ty029ldDmx/K1mY49HIYut+pP
	w/SfsjkeNXXD/9+ZLJikOK6panjqZtT0kgth688Hekj3IisKcS/UaRRzGz7Sd7AFJIDW
	sLQgBteYiEN/sP82I1c9Qp6i/j93LroDXbOOzSXIs3sfpUWf8lbJNzjr8+2D4+8P3byA
	X5hkBNjOc+RviitiCK8cYa3rk7hQM19Bm/cFzO+4ejoa5DVErFu3/eW7cAhF7rJFwOpK
	nODDa6Lwq91HK0nG80MvMchsjvzqARDsy9bDK3Vl3zrkt6NZPzUUWVbVM7Nvt/oS03Wq
	ffew==
X-Gm-Message-State: ALoCoQm09m9SMpfXk2gf7xAwUVICMNRS8kVjZ+Nglw3khdbFjvK/SwH+72LHCaho+8EUDJ2IUEuo
X-Received: by 10.140.43.228 with SMTP id e91mr29522681qga.80.1431968331093;
	Mon, 18 May 2015 09:58:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 18 May 2015 09:58:30 -0700 (PDT)
In-Reply-To: <5559F424.3060607@pseudoterminal.org>
References: <1431958369-14668-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1431958369-14668-5-git-send-email-alexander.kanavin@linux.intel.com>
	<5559F424.3060607@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 May 2015 17:58:30 +0100
Message-ID: <CAJTo0La2VPoDJCoOZoH2Zvmv8b9=fnq7NqBdUHe3tW3q9deTBg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 4/4] Rename gstreamer directory to gstreamer-0.10
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
X-List-Received-Date: Mon, 18 May 2015 16:58:50 -0000
Content-Type: text/plain; charset=UTF-8

On 18 May 2015 at 15:16, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:

> Would it be possible to rename the recipes to match the naming convention
> of the 1.0 ones?
> For example, instead of "gst-plugins-bad", it would be
> "gstreamer0.10-plugins-bad".
> Is such a backwards compatibility break tolerable between major OE
> releases?
>

I agree with Alex - renaming the recipes is massively invasive and you'd
need to set up a lot of RPROVIDES/RCONFLICTS to provide a migration path
for very little gain.

Ross

